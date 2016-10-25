#include <sollya.h>

#define A_DIM 9

int callback(sollya_msg_t msg, void *data) {
  int message = sollya_lib_get_msg_id(msg);
  (void)data; /* Avoiding "unused parameter" warning */

  switch(message) {
  case SOLLYA_MSG_EXPR_NOT_CORRECTLY_TYPED:
    sollya_lib_printf("Caught the message that a certain expression is not correctly typed.\n");
    break;
  default:
    sollya_lib_printf("Unexpected warning %d.\n", message);
  }
  return 0;
}

int main(void) {
  sollya_obj_t a[A_DIM], b[A_DIM * A_DIM];
  int i, j;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  a[0] = sollya_lib_parse_string("[||]");
  a[1] = sollya_lib_parse_string("[|1|]");
  a[2] = sollya_lib_parse_string("[|1,2|]");
  a[3] = sollya_lib_parse_string("[|1,...,17...|]");
  a[4] = sollya_lib_parse_string("[|\"Hello\"|]");
  a[5] = sollya_lib_parse_string("[|\"Hello\",\"World\"|]");
  a[6] = sollya_lib_parse_string("[|\"land\",\"of\",\"milk\",\"and\",\"honey\"|]");
  a[7] = sollya_lib_string("Hello ");
  a[8] = SOLLYA_CONST(19.25);
  
  for (i=0;i<A_DIM;i++) {
    for (j=0;j<A_DIM;j++) {
      sollya_lib_printf("-----------------------------------------------------------------------------\n");
      b[i * A_DIM + j] = sollya_lib_append(a[i],a[j]);
      sollya_lib_printf("sollya_lib_append(\"%b\",\"%b\") yields to \"%b\"\n",a[i],a[j],b[i * A_DIM + j]);
    }
  }

  for (i=0;i<A_DIM;i++) {
    sollya_lib_clear_obj(a[i]);
  }

  for (i=0;i<A_DIM*A_DIM;i++) {
    sollya_lib_clear_obj(b[i]);
  }

  sollya_lib_close();
  return 0;
}

