#include <sollya.h>
#include <mpfr.h>
#include <mpfi.h>

void euler_gamma(mpfr_t res, mp_prec_t prec) {
  mpfr_set_prec(res, prec);
  mpfr_const_euler(res, GMP_RNDN);
  return;
}

int stupid1(mpfi_t result, mpfi_t x, int n) {
  (void)x; /* Avoiding "unused parameter" warning */
  (void)n; /* Avoiding "unused parameter" warning */
  mpfi_set_ui(result, 0);
  return 0;
}

int main(void) {
  sollya_obj_t f, tmp;
  int n;
  int res;

  sollya_lib_init();

  /* Constant */
  f = SOLLYA_PI;
  n = -1;
  res = sollya_lib_get_function_arity(&n, f);
  if (res) sollya_lib_printf("Arity of %b: %d\n", f, n);
  else sollya_lib_printf("%b is not a functional expression (n=%d. Expecting -1)\n", f, n);
  sollya_lib_clear_obj(f);

  /* Another constant */
  f = SOLLYA_CONST(3);
  n = -1;
  res = sollya_lib_get_function_arity(&n, f);
  if (res) sollya_lib_printf("Arity of %b: %d\n", f, n);
  else sollya_lib_printf("%b is not a functional expression (n=%d. Expecting -1)\n", f, n);
  sollya_lib_clear_obj(f);

  /* A library constant constant */
  f = sollya_lib_libraryconstant("superconst", euler_gamma);
  n = -1;
  res = sollya_lib_get_function_arity(&n, f);
  if (res) sollya_lib_printf("Arity of %b: %d\n", f, n);
  else sollya_lib_printf("%b is not a functional expression (n=%d. Expecting -1)\n", f, n);
  sollya_lib_clear_obj(f);

  /* Free variable */
  f = SOLLYA_X_;
  n = -1;
  res = sollya_lib_get_function_arity(&n, f);
  if (res) sollya_lib_printf("Arity of %b: %d\n", f, n);
  else sollya_lib_printf("%b is not a functional expression (n=%d. Expecting -1)\n", f, n);
  sollya_lib_clear_obj(f);

  /* Elementary function */
  f = SOLLYA_EXP(SOLLYA_X_);
  n = -1;
  res = sollya_lib_get_function_arity(&n, f);
  if (res) sollya_lib_printf("Arity of %b: %d\n", f, n);
  else sollya_lib_printf("%b is not a functional expression (n=%d. Expecting -1)\n", f, n);
  sollya_lib_clear_obj(f);

  /* Procedure function */
  tmp = sollya_lib_parse_string("proc(X,n,p) {var res, oldPrec; oldPrec = prec; prec = p!; res = exp(X); prec = oldPrec!; return res; };");
  tmp = sollya_lib_build_function_procedurefunction(SOLLYA_X_, tmp);
  f = sollya_lib_diff(tmp);
  n = -1;
  res = sollya_lib_get_function_arity(&n, f);
  if (res) sollya_lib_printf("Arity of %b: %d\n", f, n);
  else sollya_lib_printf("%b is not a functional expression (n=%d. Expecting -1)\n", f, n);
  sollya_lib_clear_obj(tmp);
  sollya_lib_clear_obj(f);

  /* Library function */
  f = sollya_lib_build_function_libraryfunction(SOLLYA_X_, "stupid1", stupid1);
  n = -1;
  res = sollya_lib_get_function_arity(&n, f);
  if (res) sollya_lib_printf("Arity of %b: %d\n", f, n);
  else sollya_lib_printf("%b is not a functional expression (n=%d. Expecting -1)\n", f, n);
  sollya_lib_clear_obj(f);

  /* arithmetic operator */
  f = SOLLYA_ADD(SOLLYA_X_,
                 sollya_lib_build_function_libraryfunction(SOLLYA_X_, "stupid1", stupid1));
  n = -1;
  res = sollya_lib_get_function_arity(&n, f);
  if (res) sollya_lib_printf("Arity of %b: %d\n", f, n);
  else sollya_lib_printf("%b is not a functional expression (n=%d. Expecting -1)\n", f, n);
  sollya_lib_clear_obj(f);

  /* A Sollya object that is not an expression */
  f = sollya_lib_absolute();
  n = -1;
  res = sollya_lib_get_function_arity(&n, f);
  if (res) sollya_lib_printf("Arity of %b: %d\n", f, n);
  else sollya_lib_printf("%b is not a functional expression (n=%d. Expecting -1)\n", f, n);
  sollya_lib_clear_obj(f);

  /* Another one */
  f = sollya_lib_parse_string("[1,2]");
  n = -1;
  res = sollya_lib_get_function_arity(&n, f);
  if (res) sollya_lib_printf("Arity of %b: %d\n", f, n);
  else sollya_lib_printf("%b is not a functional expression (n=%d. Expecting -1)\n", f, n);
  sollya_lib_clear_obj(f);

  sollya_lib_close();
  return 0;
}
