#include <stdio.h>
#include <sollya.h>

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  if (message==SOLLYA_MSG_FAITHFUL_ROUNDING_FOR_EXPR_THAT_SHOULD_BE_CONST)
    sollya_lib_printf("Caught the message about the fact that faithful rounding has occurred.\n");
  else
    sollya_lib_printf("Unexpected message caught.\n");
  return 0;
}

int main(void) {
  sollya_obj_t a, a2, prec, tmp;
  mpfr_t b;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  tmp = sollya_lib_binary();
  sollya_lib_set_display(tmp);
  sollya_lib_clear_obj(tmp);

  mpfr_init2(b, 40);
  mpfr_const_pi(b, GMP_RNDN);

  a = sollya_lib_constant(b);
  a2 = sollya_lib_parse_string("round(pi, 40, RN)");
  sollya_lib_printf("%b\n%b (should be the same as above)\n", a, a2);
  mpfr_out_str(stdout, 2, 0, b, GMP_RNDN);
  sollya_lib_printf(" (should represent the same number as above)\n");
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(a2);

  prec = sollya_lib_constant_from_int(20);
  sollya_lib_set_prec(prec);
  sollya_lib_clear_obj(prec);

  a = sollya_lib_constant(b);
  sollya_lib_printf("%b (should be the same as above)\n", a);
  sollya_lib_clear_obj(a);

  mpfr_clear(b);
  sollya_lib_close();
  return 0;
}
