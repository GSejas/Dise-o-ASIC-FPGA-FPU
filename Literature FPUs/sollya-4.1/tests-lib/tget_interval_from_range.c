#include <sollya.h>

int callback(sollya_msg_t m, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int id = sollya_lib_get_msg_id(m);
  switch(id) {
  case SOLLYA_MSG_FAITHFUL_ROUNDING_FOR_EXPR_THAT_SHOULD_BE_CONST:
    return 0;
  default:
    printf("Unexpected warning message number %d\n", id);
    return 1;
  }
}

int main(void) {
  sollya_obj_t a;
  mpfi_t res;
  int s;

  mpfi_init2(res, 100);

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  a = SOLLYA_CONST(4);
  s = sollya_lib_get_interval_from_range(res, a);
  if (s==0) sollya_lib_printf("%b is not a range\n\n", a);
  else sollya_lib_printf("%b has been converted to %w.\n\n", a, res);
  sollya_lib_clear_obj(a);


  /* Exact conversion */
  a = sollya_lib_parse_string("[1, 3]");
  s = sollya_lib_get_interval_from_range(res, a);
  if (s==0) sollya_lib_printf("%b is not a range\n\n", a);
  else sollya_lib_printf("%b has been converted to %w.\n\n", a, res);
  sollya_lib_clear_obj(a);

  /* Another exact conversion */
  a = SOLLYA_CONST(100);
  sollya_lib_set_prec_and_print(a);
  sollya_lib_clear_obj(a);
  a = sollya_lib_powers();
  sollya_lib_set_display(a);
  sollya_lib_clear_obj(a);
  a = sollya_lib_parse_string("[exp(1), pi]");
  s = sollya_lib_get_interval_from_range(res, a);
  if (s==0) sollya_lib_printf("%b is not a range\n\n", a);
  else sollya_lib_printf("%b has been converted to\n%w (should be [430728948929449700355022696705 * 2^(-97), 995610453248924340922087778489 * 2^(-98)]).\n\n", a, res);
  sollya_lib_clear_obj(a);


  /* Inexact conversion */
  a = SOLLYA_CONST(165);
  sollya_lib_set_prec_and_print(a);
  sollya_lib_clear_obj(a);
  a = sollya_lib_decimal();
  sollya_lib_set_display(a);
  sollya_lib_clear_obj(a);
  a = sollya_lib_parse_string("[exp(1), pi]");
  s = sollya_lib_get_interval_from_range(res, a);
  if (s==0) sollya_lib_printf("%b is not a range\n\n", a);
  else sollya_lib_printf("%b has been converted to\n%w (the first one should be enclosed in the second one).\n\n", a, res);
  sollya_lib_clear_obj(a);


  mpfi_clear(res);
  sollya_lib_close();
  return 0;
}
