#include <sollya.h>

#define A_DIM 11

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  case SOLLYA_MSG_EXPR_NOT_CORRECTLY_TYPED:
    sollya_lib_printf("The expected error message stating that the tail operation on an empty list cannot be performed has been caught.\n");
    break;
  default:
    sollya_lib_printf("Unexpected warning %d.\n", message);
  }
  return 0;
}

int main(void) {
  sollya_obj_t a[A_DIM], b[A_DIM];
  int i;

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

  for (i=0;i<A_DIM;i++) {
      b[i] = sollya_lib_tail(a[i]);
      sollya_lib_printf("The tail operation on %b yields to %b\n",a[i],b[i]);
  }

  for (i=0;i<A_DIM;i++) {
    sollya_lib_clear_obj(a[i]);
  }

  for (i=0;i<A_DIM;i++) {
    sollya_lib_clear_obj(b[i]);
  }

  sollya_lib_close();
  return 0;
}

