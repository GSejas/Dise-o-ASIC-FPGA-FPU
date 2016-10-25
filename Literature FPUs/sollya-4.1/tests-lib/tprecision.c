#include <sollya.h>

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  case SOLLYA_MSG_FAITHFUL_ROUNDING_FOR_EXPR_THAT_SHOULD_BE_CONST:
    sollya_lib_printf("An expression should have been a constant but it is just a constant expression.\n");
    break;
  default:
    sollya_lib_printf("Unexpected warning %d\n", message);
  }
  return 0;
}

#define A_DIM 8

int main(void) {
  sollya_obj_t a[A_DIM], b[A_DIM];
  int i;
  sollya_obj_t temp;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  sollya_lib_set_display(temp = sollya_lib_dyadic());
  sollya_lib_clear_obj(temp);

  a[0] = sollya_lib_parse_string("0");
  a[1] = sollya_lib_parse_string("NaN");
  a[2] = sollya_lib_parse_string("infty");
  a[3] = sollya_lib_parse_string("1");
  a[4] = sollya_lib_parse_string("1 + 2^(-5)");
  a[5] = sollya_lib_parse_string("1 + 2^(-100)");
  a[6] = sollya_lib_parse_string("1 + 2^(-500)");
  a[7] = sollya_lib_parse_string("pi");
  
  for (i=0;i<A_DIM;i++) {
    b[i] = sollya_lib_precision(a[i]);
    sollya_lib_printf("In order to store the (evaluation to current precision) of the constant %b in a binary floating-point format, %b bits of precision are necessary.\n",a[i],b[i]);
  }

  for (i=0;i<A_DIM;i++) {
    sollya_lib_clear_obj(a[i]);
    sollya_lib_clear_obj(b[i]);
  }

  sollya_lib_close();
  return 0;
}

