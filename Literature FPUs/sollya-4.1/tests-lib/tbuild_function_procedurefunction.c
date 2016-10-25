#include <sollya.h>
#include <mpfr.h>

int main(void) {
  sollya_obj_t f1;
  mpfr_t x,y;

  sollya_lib_init();
  f1 = sollya_lib_parse_string("proc(X,n,p) {var res, oldPrec; oldPrec = prec; prec = p!; res = exp(X); prec = oldPrec!; return res; };");
  f1 = sollya_lib_build_function_procedurefunction(SOLLYA_X_, f1);
  sollya_lib_printf("%b\n", f1);
  mpfr_init2(x, 30);
  mpfr_init2(y, 50);
  mpfr_set_ui(x, 2, GMP_RNDN);
  sollya_lib_evaluate_function_at_point(y,f1, x, NULL);
  sollya_lib_printf("%v (expecting approximate value of exp(2))\n", y);

  sollya_lib_clear_obj(f1);
  mpfr_clear(x);
  mpfr_clear(y);
  sollya_lib_close();
  return 0;
}
