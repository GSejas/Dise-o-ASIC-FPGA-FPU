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
  mpfr_t resleft, resright;
  int s;

  mpfr_init2(resleft, 100);
  mpfr_init2(resright, 120);

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  a = SOLLYA_CONST(4);
  s = sollya_lib_get_bounds_from_range(resleft, resright, a);
  if (s==0) sollya_lib_printf("%b is not a range\n\n", a);
  else sollya_lib_printf("%b has been converted to\n[%v, %v].\n\n", a, resleft, resright);
  sollya_lib_clear_obj(a);


  /* Exact conversion */
  a = sollya_lib_parse_string("[1, 3]");
  s = sollya_lib_get_bounds_from_range(resleft, resright, a);
  if (s==0) sollya_lib_printf("%b is not a range\n\n", a);
  else sollya_lib_printf("%b has been converted to\n[%v, %v] (should be the same).\n\n", a, resleft, resright);
  sollya_lib_clear_obj(a);

  /* Another exact conversion */
  a = SOLLYA_CONST(100);
  sollya_lib_set_prec_and_print(a);
  sollya_lib_clear_obj(a);
  a = sollya_lib_powers();
  sollya_lib_set_display(a);
  sollya_lib_clear_obj(a);
  a = sollya_lib_parse_string("[exp(1), pi]");
  s = sollya_lib_get_bounds_from_range(resleft, resright, a);
  if (s==0) sollya_lib_printf("%b is not a range\n\n", a);
  else sollya_lib_printf("%b has been converted to\n[%v, %v] (should be [430728948929449700355022696705 * 2^(-97), 995610453248924340922087778489 * 2^(-98)]).\n\n", a, resleft, resright);
  sollya_lib_clear_obj(a);

  /* Inexact conversion at one side only */
  a = SOLLYA_CONST(110);
  sollya_lib_set_prec_and_print(a);
  sollya_lib_clear_obj(a);
  a = sollya_lib_decimal();
  sollya_lib_set_display(a);
  sollya_lib_clear_obj(a);
  a = sollya_lib_parse_string("[exp(1), pi]");
  s = sollya_lib_get_bounds_from_range(resleft, resright, a);
  if (s==0) sollya_lib_printf("%b is not a range\n\n", a);
  else sollya_lib_printf("%b has been converted to\n[%v, %v] (left bound of the second one should be smaller than left bound of the first one. Right bounds should be equal .\n\n", a, resleft, resright);
  sollya_lib_clear_obj(a);


  /* Inexact conversion */
  a = SOLLYA_CONST(165);
  sollya_lib_set_prec_and_print(a);
  sollya_lib_clear_obj(a);
  a = sollya_lib_decimal();
  sollya_lib_set_display(a);
  sollya_lib_clear_obj(a);
  a = sollya_lib_parse_string("[exp(1), pi]");
  s = sollya_lib_get_bounds_from_range(resleft, resright, a);
  if (s==0) sollya_lib_printf("%b is not a range\n\n", a);
  else sollya_lib_printf("%b has been converted to\n[%v, %v] (the first one should be enclosed in the second one).\n\n", a, resleft, resright);
  sollya_lib_clear_obj(a);


  mpfr_clear(resleft);
  mpfr_clear(resright);
  sollya_lib_close();
  return 0;
}
