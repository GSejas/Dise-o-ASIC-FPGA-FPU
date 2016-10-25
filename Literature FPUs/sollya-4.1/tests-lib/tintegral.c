#include <sollya.h>

#define NB_OF_TESTS 8

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  case SOLLYA_MSG_DOMAIN_IS_NO_CLOSED_INTERVAL_ON_THE_REALS:
    sollya_lib_printf("Caught the message: the given domain is not a closed subset of the reals.\n");
    break;
  default:
    sollya_lib_printf("Unexpected warning %d.\n", message);
  }
  return 0;
}

int main(void) {
  sollya_obj_t a[NB_OF_TESTS], b[NB_OF_TESTS], c[NB_OF_TESTS];
  int i;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  a[0] = SOLLYA_X_;
  b[0] = sollya_lib_parse_string("[1;2]");

  a[1] = SOLLYA_X_;
  b[1] = sollya_lib_parse_string("[2;3]");
  
  a[2] = sollya_lib_parse_string("2/sqrt(pi) * exp(-_x_^2)");
  b[2] = sollya_lib_parse_string("[0;100]");
  
  a[3] = sollya_lib_parse_string("2/sqrt(pi) * exp(-_x_^2)");
  b[3] = sollya_lib_parse_string("[-5;5]");
  
  a[4] = SOLLYA_EXP(SOLLYA_X_);
  b[4] = sollya_lib_parse_string("[0;1]");
  
  a[5] = SOLLYA_EXP(SOLLYA_X_);
  b[5] = sollya_lib_parse_string("[-infty;1]");

  a[6] = SOLLYA_EXP(SOLLYA_X_);
  b[6] = sollya_lib_parse_string("[1;infty]");

  a[7] = sollya_lib_parse_string("1/sqrt(_x_)");
  b[7] = sollya_lib_parse_string("[0;1]");

  for (i=0;i<NB_OF_TESTS;i++) {
    c[i] = sollya_lib_integral(a[i],b[i]);
    sollya_lib_printf("The integral \"int %b d _x_ over %b\" is bounded with the integral command by %b\n",a[i],b[i],c[i]);
  }

  for (i=0;i<NB_OF_TESTS;i++) {
    sollya_lib_clear_obj(a[i]);
    sollya_lib_clear_obj(b[i]);
    sollya_lib_clear_obj(c[i]);
  }

  sollya_lib_close();
  return 0;
}

