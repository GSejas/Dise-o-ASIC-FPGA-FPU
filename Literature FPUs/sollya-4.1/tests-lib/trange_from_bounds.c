#include <sollya.h>

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  if (message==SOLLYA_MSG_RANGE_BOUNDS_IN_INVERSE_ORDER)
    sollya_lib_printf("Caught the message about bounds in inverse order.\n");
  else if (message==SOLLYA_MSG_ONLY_ONE_ENDPOINT_OF_RANGE_IS_NAN)
    sollya_lib_printf("Caught the message indicating that only one bound is NaN.\n");
  else
    sollya_lib_printf("Unexpected message caught.\n");
  return 0;
}

int main(void) {
  sollya_obj_t a, prec, tmp, left, right;
  mpfr_t b1, b2;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  tmp = sollya_lib_binary();
  sollya_lib_set_display(tmp);
  sollya_lib_clear_obj(tmp);

  mpfr_init2(b1, 40);
  mpfr_init2(b2, 40);
  mpfr_set_d(b1, 0.1, GMP_RNDD);
  mpfr_set_d(b2, 0.2, GMP_RNDU);
  a = sollya_lib_range_from_bounds(b1, b2);
  left = sollya_lib_parse_string("round(D(1/10), 40, RD)");
  right = sollya_lib_parse_string("round(D(2/10), 40, RU)");
  sollya_lib_printf("%b\n[%b;%b] (should be the same as above)\n", a, left, right);
  sollya_lib_clear_obj(left);
  sollya_lib_clear_obj(right);
  sollya_lib_clear_obj(a);

  prec = sollya_lib_constant_from_int(20);
  sollya_lib_set_prec(prec);
  sollya_lib_clear_obj(prec);
  a = sollya_lib_range_from_bounds(b1, b2);
  sollya_lib_printf("%b (should be the same as above)\n", a);
  sollya_lib_clear_obj(a);

  a = sollya_lib_range_from_bounds(b2, b1);
  sollya_lib_printf("%b (should be the same as above)\n", a);
  sollya_lib_clear_obj(a);

  mpfr_set_nan(b1);
  mpfr_set_nan(b2);
  a = sollya_lib_range_from_bounds(b1, b2);
  sollya_lib_printf("%b (should be [NaN, NaN])\n", a);
  sollya_lib_clear_obj(a);

  mpfr_set_d(b1, 1., GMP_RNDN);
  a = sollya_lib_range_from_bounds(b1, b2);
  sollya_lib_printf("%b (should be [NaN, NaN])\n", a);
  sollya_lib_clear_obj(a);

  a = sollya_lib_range_from_bounds(b2, b1);
  sollya_lib_printf("%b (should be [NaN, NaN])\n", a);
  sollya_lib_clear_obj(a);

  mpfr_clear(b1);
  mpfr_clear(b2);

  sollya_lib_close();
  return 0;
}
