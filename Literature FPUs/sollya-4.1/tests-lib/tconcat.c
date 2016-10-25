#include <sollya.h>

#define A_DIM 17

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  case SOLLYA_MSG_EXPR_NOT_CORRECTLY_TYPED:
    sollya_lib_printf("Caught the message that a certain expression is not correctly typed.\n");
    break;
  case SOLLYA_MSG_EXPR_OR_COMMAND_COULD_NOT_BE_HANDLED:
    sollya_lib_printf("Caught the message that a certain command could not be executed.\n");
    break;    
  case SOLLYA_MSG_FOR_IN_LOOP_OVER_END_ELLIPTIC_LIST_NOT_ALLOWED:
    sollya_lib_printf("Caught the message that a loop over an end-elliptic list is not allowed.\n");
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
  a[3] = sollya_lib_parse_string("[|1,...,17|]");
  a[4] = sollya_lib_parse_string("[|1,...,17...|]");
  a[5] = sollya_lib_parse_string("[|\"Hello\"|]");
  a[6] = sollya_lib_parse_string("[|\"Hello\",\"World\"|]");
  a[7] = sollya_lib_parse_string("[|\"land\",\"of\",\"milk\",\"and\",\"honey\"|]");
  a[8] = sollya_lib_parse_string("[|\"land\",\"of\",\"milk\",\"and\",\"honey\"...|]");
  a[9] = sollya_lib_parse_string("[|17...|]");
  a[10] = sollya_lib_parse_string("[|\"Rudolph the red-nosed reindeer\"...|]");
  a[11] = sollya_lib_string("Hello ");
  a[12] = sollya_lib_string("world");
  a[13] = sollya_lib_string("");
  a[14] = sollya_lib_parse_string("proc(L = ...) { var r, i; r = 0; for i in L do r = r + i; return r; }");
  a[15] = sollya_lib_parse_string("proc(L = ...) { var i; for i in L do i; return exp(_x_); }");
  a[16] = sollya_lib_parse_string("proc(a,b) { return a + b; }");
  
  for (i=0;i<A_DIM;i++) {
    for (j=0;j<A_DIM;j++) {
      sollya_lib_printf("-----------------------------------------------------------------------------\n");
      b[i * A_DIM + j] = sollya_lib_concat(a[i],a[j]);
      if (!sollya_lib_obj_is_error(b[i * A_DIM + j])) sollya_lib_printf("sollya_lib_concat(\"%b\",\"%b\") yields to \"%b\"\n",a[i],a[j],b[i * A_DIM + j]);
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

