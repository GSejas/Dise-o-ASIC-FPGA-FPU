#include <sollya.h>

#define A_DIM 8

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  case SOLLYA_MSG_EXPR_SHOULD_BE_CONSTANT_AND_IS_NOT_FAITHFUL:
    sollya_lib_printf("The expected error message stating that the a certain expression should have been a constant and that faithful evaluation is not possible has been caught.\n");
    break;
  case SOLLYA_MSG_FAITHFUL_ROUNDING_FOR_EXPR_THAT_SHOULD_BE_CONST:
    sollya_lib_printf("The expected error message stating that the a certain expression should have been a constant and that faithful evaluation is possible has been caught.\n");
    break;
  case SOLLYA_MSG_EXPR_NOT_CORRECTLY_TYPED:
    sollya_lib_printf("The expected error message stating that the sort operation cannot be performed on list containing other objects but constant expressions or that are final-elliptic has been caught.\n");
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
  a[2] = sollya_lib_parse_string("[|1...|]");
  a[3] = sollya_lib_parse_string("[|2, 3, 9, 17, 0, 19, -190, 1664|]");
  a[4] = sollya_lib_parse_string("[|sin(pi/3) - sqrt(3)/2, -1, 0, log2(15)/log2(13) - log(15)/log(13), 17 + sin(pi/3) - sqrt(3)/2, 17 + log2(15)/log2(13) - log(15)/log(13)|]");
  a[5] = sollya_lib_parse_string("[|2, 3, 9, 17, 0, 19, -190, 1664 ...|]");
  a[6] = sollya_lib_parse_string("[|\"land\",\"of\",\"milk\",\"and\",\"honey\"|]");
  a[7] = sollya_lib_parse_string("[|\"land\",\"of\",\"milk\",\"and\",\"honey\"...|]");

  for (i=0;i<A_DIM;i++) {
      b[i] = sollya_lib_sort(a[i]);
      sollya_lib_printf("The sort operation on %b yields to %b\n",a[i],b[i]);
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

