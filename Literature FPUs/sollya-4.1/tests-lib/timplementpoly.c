#include <sollya.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>
#include <stdlib.h>


#define A_DIM 15
#define TEMP_IMPLEMENTATION_FILE "timplementpoly.implementation.c"
#define TEMP_PROOF_FILE "timplementpoly.implementation.gappa"
#define READBUFFERSIZE 1024

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */
  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  case SOLLYA_MSG_IMPLEMENTED_POLY_DIFFERS_FROM_ORIGINAL_ONE:
    sollya_lib_printf("Caught the message: the implemented polynomial is different from the original one.\n");
    break;
  case SOLLYA_MSG_INFERED_COEFF_PREC_HIGHER_THAN_REQUIRED:
    sollya_lib_printf("Caught the message: the infered precision of a coefficient is higher than what seems to be needed to meet the accuracy target.\n");
    break;    
  case SOLLYA_MSG_COEFF_NOT_TWICE_GREATER_THAN_SUBPOLY:
    sollya_lib_printf("Caught the message: a coefficient in a Horner scheme is not guaranteed to also be twice as large as the subpolynomial.\n");
    break;    
  case SOLLYA_MSG_ERROR_ON_DETERMINING_THE_REQUIRED_PRECISIONS:
    sollya_lib_printf("Caught the message: an error has occured during the determination of the required precisions.\n");
    break;    
  default:
    sollya_lib_printf("Unexpected warning %d.\n", message);
  }
  return 0;
}

void read_and_print_file(char *filename) {
  FILE *fd;
  char readBuffer[READBUFFERSIZE];
  int i;
  size_t readChars;

  if ((fd = fopen(filename,"r")) == NULL) {
    exit(1);
  }

  while (1) {
    for (i=0;i<READBUFFERSIZE;i++) {
      readBuffer[i] = '\0';
    }
    readChars = fread(readBuffer, sizeof(char), READBUFFERSIZE - 1, fd);
    for (i=0;(size_t)(i)<readChars;i++) {
      if (readBuffer[i] == '\0') readBuffer[i] = ' ';
    }
    printf("%s",readBuffer);
    if (readChars < (READBUFFERSIZE - 1) * sizeof(char)) break;
  }
  printf("\n");

  if (fclose(fd)) {
    exit(1);
  }

}

int main(void) {
  sollya_obj_t a[A_DIM];
  sollya_obj_t res, temp;
  int i;
  struct stat statBuffer;
  int status;
  int errornum;
  int toRemove;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  sollya_lib_set_display(temp = sollya_lib_dyadic());
  sollya_lib_clear_obj(temp);


  /* implementpoly(1b109 - 1b109 * DD(1/6) * x^2,[-1b-10;1b-10],1b-44,D,"p","implementation.c"); */
  for (i=0;i<A_DIM;i++) {
    a[i] = NULL;
  }

  toRemove = 1;
  status = stat(TEMP_IMPLEMENTATION_FILE, &statBuffer);
  if (status != 0) {
    errornum = errno;
    if (errornum != ENOENT) {
      sollya_lib_close();
      return 1;
    }
    toRemove = 0;
  }
  if (toRemove) {
    if (remove(TEMP_IMPLEMENTATION_FILE) != 0) {
      sollya_lib_close();
      return 1;
    }
  }

  a[0] = sollya_lib_parse_string("1b109 - 1b109 * DD(1/6) * x^2");
  a[1] = sollya_lib_parse_string("[-1b-10;1b-10]");
  a[2] = sollya_lib_parse_string("1b-44");
  a[3] = sollya_lib_double_obj();
  a[4] = sollya_lib_string("p");
  a[5] = sollya_lib_string(TEMP_IMPLEMENTATION_FILE);
  
  res = sollya_lib_implementpoly(a[0],a[1],a[2],a[3],a[4],a[5],NULL);

  sollya_lib_printf("implementpoly(%b,%b,%b,%b,%b,\"%b\") returns %b and produces the following code:\n\n",
		    a[0],a[1],a[2],a[3],a[4],a[5],res);

  read_and_print_file(TEMP_IMPLEMENTATION_FILE);
  
  for (i=0;i<A_DIM;i++) {
    if (a[i] != NULL) {
      sollya_lib_clear_obj(a[i]);
    }
  }
  sollya_lib_clear_obj(res);

  /* implementpoly(1b109 - 1b109 * DD(1/6) * x^2,[-1b-10;1b-10],1b-44,D,"p","implementation.c",honorcoeffprec); */
  for (i=0;i<A_DIM;i++) {
    a[i] = NULL;
  }

  toRemove = 1;
  status = stat(TEMP_IMPLEMENTATION_FILE, &statBuffer);
  if (status != 0) {
    errornum = errno;
    if (errornum != ENOENT) {
      sollya_lib_close();
      return 1;
    }
    toRemove = 0;
  }
  if (toRemove) {
    if (remove(TEMP_IMPLEMENTATION_FILE) != 0) {
      sollya_lib_close();
      return 1;
    }
  }

  a[0] = sollya_lib_parse_string("1b109 - 1b109 * DD(1/6) * x^2");
  a[1] = sollya_lib_parse_string("[-1b-10;1b-10]");
  a[2] = sollya_lib_parse_string("1b-44");
  a[3] = sollya_lib_double_obj();
  a[4] = sollya_lib_string("p");
  a[5] = sollya_lib_string(TEMP_IMPLEMENTATION_FILE);
  a[6] = sollya_lib_honorcoeffprec();
  
  res = sollya_lib_implementpoly(a[0],a[1],a[2],a[3],a[4],a[5],a[6],NULL);

  sollya_lib_printf("implementpoly(%b,%b,%b,%b,%b,\"%b\",%b) returns %b and produces the following code:\n\n",
		    a[0],a[1],a[2],a[3],a[4],a[5],a[6],res);

  read_and_print_file(TEMP_IMPLEMENTATION_FILE);
  
  for (i=0;i<A_DIM;i++) {
    if (a[i] != NULL) {
      sollya_lib_clear_obj(a[i]);
    }
  }
  sollya_lib_clear_obj(res);

  /* implementpoly(15 + x * (14 + x * (13 + x * (12 + x * (11 + x * (10 + x * (9 + x * (8 + x * (7 + x * (6 + x * (5 + x * (4 + x * (3 + x * (2 + x))))))))))))),[-1/2;1/2],1b-60,D,"p","implementation.c",honorcoeffprec,"implementation.gappa"); */
  for (i=0;i<A_DIM;i++) {
    a[i] = NULL;
  }

  toRemove = 1;
  status = stat(TEMP_IMPLEMENTATION_FILE, &statBuffer);
  if (status != 0) {
    errornum = errno;
    if (errornum != ENOENT) {
      sollya_lib_close();
      return 1;
    }
    toRemove = 0;
  }
  if (toRemove) {
    if (remove(TEMP_IMPLEMENTATION_FILE) != 0) {
      sollya_lib_close();
      return 1;
    }
  }

  toRemove = 1;
  status = stat(TEMP_PROOF_FILE, &statBuffer);
  if (status != 0) {
    errornum = errno;
    if (errornum != ENOENT) {
      sollya_lib_close();
      return 1;
    }
    toRemove = 0;
  }
  if (toRemove) {
    if (remove(TEMP_PROOF_FILE) != 0) {
      sollya_lib_close();
      return 1;
    }
  }

  a[0] = sollya_lib_parse_string("15 + x * (14 + x * (13 + x * (12 + x * (11 + x * (10 + x * (9 + x * (8 + x * (7 + x * (6 + x * (5 + x * (4 + x * (3 + x * (2 + x)))))))))))))");
  a[1] = sollya_lib_parse_string("[-1/2;1/2]");
  a[2] = sollya_lib_parse_string("1b-60");
  a[3] = sollya_lib_double_double_obj();
  a[4] = sollya_lib_string("p");
  a[5] = sollya_lib_string(TEMP_IMPLEMENTATION_FILE);
  a[6] = sollya_lib_honorcoeffprec();
  a[7] = sollya_lib_string(TEMP_PROOF_FILE);
  
  res = sollya_lib_implementpoly(a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],NULL);

  sollya_lib_printf("implementpoly(%b,%b,%b,%b,%b,\"%b\",%b,\"%b\") returns %b and produces the following code:\n\n",
		    a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],res);

  read_and_print_file(TEMP_IMPLEMENTATION_FILE);

  sollya_lib_printf("Additionnally, the following Gappa proof is produced:\n\n");

  read_and_print_file(TEMP_PROOF_FILE);
  
  for (i=0;i<A_DIM;i++) {
    if (a[i] != NULL) {
      sollya_lib_clear_obj(a[i]);
    }
  }
  sollya_lib_clear_obj(res);

  toRemove = 1;
  status = stat(TEMP_IMPLEMENTATION_FILE, &statBuffer);
  if (status != 0) {
    errornum = errno;
    if (errornum != ENOENT) {
      sollya_lib_close();
      return 1;
    }
    toRemove = 0;
  }
  if (toRemove) {
    if (remove(TEMP_IMPLEMENTATION_FILE) != 0) {
      sollya_lib_close();
      return 1;
    }
  }

  toRemove = 1;
  status = stat(TEMP_PROOF_FILE, &statBuffer);
  if (status != 0) {
    errornum = errno;
    if (errornum != ENOENT) {
      sollya_lib_close();
      return 1;
    }
    toRemove = 0;
  }
  if (toRemove) {
    if (remove(TEMP_PROOF_FILE) != 0) {
      sollya_lib_close();
      return 1;
    }
  }

  sollya_lib_close();
  return 0;
}

