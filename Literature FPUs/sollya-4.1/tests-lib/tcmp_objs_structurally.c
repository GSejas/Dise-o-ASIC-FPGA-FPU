#include <sollya.h>

int main(void) {
  sollya_obj_t a, b, c, d, e;
  mpfr_t tmp1, tmp2;

  sollya_lib_init();
  a = SOLLYA_ADD(SOLLYA_CONST(2), SOLLYA_CONST(3));
  b = SOLLYA_CONST(5);
  c = sollya_lib_simplify(a);

  if (sollya_lib_cmp_objs_structurally(a,b))
    sollya_lib_printf("2+3 is structurally equal to 5\n");
  else
    sollya_lib_printf("2+3 is *NOT* structurally equal to 5\n");

  if (sollya_lib_cmp_objs_structurally(b,c))
    sollya_lib_printf("5 is structurally equal to the result of simplify(2+3)\n");
  else
    sollya_lib_printf("5 is *NOT* structurally equal to the result of simplify(2+3)\n");

  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);


  /* Commutativity */
  a = SOLLYA_ADD(SOLLYA_CONST(2), SOLLYA_X_);
  b = SOLLYA_ADD(SOLLYA_X_, SOLLYA_CONST(2));

  if (sollya_lib_cmp_objs_structurally(a,b))
    sollya_lib_printf("2+x is structurally equal to x+2\n");
  else
    sollya_lib_printf("2+x is *NOT* structurally equal to x+2\n");

  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);


  /* Structural equality between objs that are not expressions */
  a = sollya_lib_parse_string("[1;2]");
  mpfr_init2(tmp1, 20); /* not the current precision */
  mpfr_init2(tmp2, 30); /* not the current precision */
  mpfr_set_ui(tmp1, 1, GMP_RNDN);
  mpfr_set_ui(tmp2, 2, GMP_RNDN);
  b = sollya_lib_range_from_bounds(tmp1, tmp2);
  mpfr_clear(tmp1); mpfr_clear(tmp2);
  c = sollya_lib_copy_obj(a);

  if (sollya_lib_cmp_objs_structurally(a,b))
    sollya_lib_printf("Intervals with identical bounds but stored at different precisions are structurally equal\n");
  else
    sollya_lib_printf("Intervals with identical bounds but stored at different precisions are *NOT* structurally equal\n");

  if (sollya_lib_cmp_objs_structurally(a,c))
    sollya_lib_printf("Identical intervals are structurally equal\n");
  else
    sollya_lib_printf("Identical intervals are *NOT* structurally equal\n");

  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);



  a = sollya_lib_on();
  b = sollya_lib_on();
  c = sollya_lib_off();
  if (sollya_lib_cmp_objs_structurally(a,b))
    sollya_lib_printf("on is structurally equal to on\n");
  else
    sollya_lib_printf("on is not structurally equal to on\n");

  if (sollya_lib_cmp_objs_structurally(a,c))
    sollya_lib_printf("on is structurally equal to off\n");
  else
    sollya_lib_printf("on is *NOT* structurally equal to off\n");

  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);



  /* Structural equality between strings */
  a = sollya_lib_string("Hello!");
  b = sollya_lib_string("Hella!");
  c = sollya_lib_string("ello!");
  d = sollya_lib_string("H");
  e = sollya_lib_concat(d, c);

  if (sollya_lib_cmp_objs_structurally(a,b))
    sollya_lib_printf("%b is structurally equal to %b\n", a, b);
  else
    sollya_lib_printf("%b is *NOT* structurally equal to %b\n", a, b);

  if (sollya_lib_cmp_objs_structurally(a,e))
    sollya_lib_printf("%b is structurally equal to %b\n", a, e);
  else
    sollya_lib_printf("%b is *NOT* structurally equal to %b\n", a, e);

  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);
  sollya_lib_clear_obj(d);
  sollya_lib_clear_obj(e);


  /* More involved expression */
  a = sollya_lib_parse_string("1 + exp(sin(x + log(x^2)))");
  c = SOLLYA_CONST(40);
  sollya_lib_set_prec(c);
  sollya_lib_clear_obj(c);
  b = sollya_lib_parse_string("sin(x + log(x^2))");
  b = SOLLYA_ADD(SOLLYA_CONST(1), SOLLYA_EXP(b));

  if (sollya_lib_cmp_objs_structurally(a,b))
    sollya_lib_printf("%b is structurally equal to %b, even if defined at different precisions\n", a, b);
  else
    sollya_lib_printf("%b is *NOT* structurally equal to %b, even if defined at different precisions\n", a, b);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);


  sollya_lib_close();
  return 0;
}
