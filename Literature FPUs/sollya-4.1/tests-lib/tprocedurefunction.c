#include <sollya.h>
#include <mpfr.h>

int main(void) {
  sollya_obj_t f[11];
  mpfr_t x,y;
  int i;

  sollya_lib_init();

  /* Simple definition and evaluation */
  f[0] = sollya_lib_parse_string("proc(X,n,p) {var res, oldPrec; oldPrec = prec; prec = p!; res = exp(X); prec = oldPrec!; return res; };");
  f[1] = SOLLYA_X_;
  f[2] = sollya_lib_procedurefunction(f[1], f[0]);

  sollya_lib_printf("%b\n", f[2]);
  mpfr_init2(x, 30);
  mpfr_init2(y, 50);
  mpfr_set_ui(x, 2, GMP_RNDN);
  sollya_lib_evaluate_function_at_point(y,f[2], x, NULL);
  sollya_lib_printf("%v (expecting approximate value of exp(2))\n", y);

  /* Trying to differentiate and display */
  f[3] = SOLLYA_SIN(SOLLYA_X_);
  f[4] = sollya_lib_apply(f[2], f[3], NULL);
  f[5] = sollya_lib_diff(f[4]);
  sollya_lib_printf("%b (expecting: (diff(function(proc(X, n, p) {...})))(sin(_x_)) * cos(_x_))\n", f[5]);

  f[6] = SOLLYA_X_;
  f[7] = sollya_lib_apply(f[2], f[6], NULL);
  f[8] = sollya_lib_diff(f[7]);
  sollya_lib_printf("%b (expecting: diff(function(proc(X, n, p) {...})))\n", f[8]);

  /* Applying a procedure function to an interval. */
  f[9] = sollya_lib_parse_string("[1,2]");
  f[10] = sollya_lib_procedurefunction(f[9], f[0]);
  sollya_lib_printf("%b (expecting: [2.71828182845904523536028747135266249775724709369989, 7.3890560989306502272304274605750078131803155705518])\n", f[10]);

  for(i=0;i<=10;i++) { sollya_lib_clear_obj(f[i]); }
  mpfr_clear(x);
  mpfr_clear(y);
  sollya_lib_close();
  return 0;
}
