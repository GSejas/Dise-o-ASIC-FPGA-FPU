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
  sollya_obj_t f, tmp, tmp2, tmp3;
  sollya_obj_t g[3];
  int n;
  int res;

  sollya_lib_init();

  /* Constant */
  f = SOLLYA_PI;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("Subfunction of %b: %b, %b and %b (n=%d)\n", f, g[0], g[1], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* Another constant */
  f = SOLLYA_CONST(3);
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("Subfunction of %b: %b, %b and %b (n=%d)\n", f, g[0], g[1], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* A library constant constant */
  f = sollya_lib_libraryconstant("superconst", euler_gamma);
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("Subfunction of %b: %b, %b and %b (n=%d)\n", f, g[0], g[1], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* Free variable */
  f = SOLLYA_X_;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("Subfunction of %b: %b, %b and %b (n=%d)\n", f, g[0], g[1], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);


  /* Elementary function */
  f = SOLLYA_EXP(SOLLYA_ADD(SOLLYA_SIN(SOLLYA_X_), SOLLYA_CONST(17)));
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("Subfunction of %b: %b, %b and %b (n=%d)\n", f, g[0], g[1], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* Procedure function */
  tmp = sollya_lib_parse_string("proc(X,n,p) {var res, oldPrec; oldPrec = prec; prec = p!; res = exp(X); prec = oldPrec!; return res; };");
  tmp = sollya_lib_build_function_procedurefunction(SOLLYA_X_, tmp);
  tmp2 = sollya_lib_diff(tmp);
  tmp3 = SOLLYA_SIN(SOLLYA_X_);
  f = sollya_lib_apply(tmp2, tmp3, NULL);
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("Subfunction of %b: %b, %b and %b (n=%d)\n", f, g[0], g[1], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);
  sollya_lib_clear_obj(tmp);
  sollya_lib_clear_obj(tmp2);
  sollya_lib_clear_obj(tmp3);

  /* Library function */
  f = sollya_lib_build_function_libraryfunction(SOLLYA_COS(SOLLYA_X_), "stupid1", stupid1);
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("Subfunction of %b: %b, %b and %b (n=%d)\n", f, g[0], g[1], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* arithmetic operator */
  f = SOLLYA_ADD(SOLLYA_X_,
                 sollya_lib_build_function_libraryfunction(SOLLYA_X_, "stupid1", stupid1));
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("Subfunction of %b: %b, %b and %b (n=%d)\n", f, g[0], g[1], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* A Sollya object that is not an expression */
  f = sollya_lib_absolute();
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("Subfunction of %b: %b, %b and %b (n=%d)\n", f, g[0], g[1], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* Another one */
  f = sollya_lib_parse_string("[1,2]");
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("Subfunction of %b: %b, %b and %b (n=%d)\n", f, g[0], g[1], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);


  /*************************************************************/
  /* Testing what happens when NULL is encountered prematurely */
  /*************************************************************/

  /* As second argument */
  f = SOLLYA_EXP(SOLLYA_ADD(SOLLYA_SIN(SOLLYA_X_), SOLLYA_CONST(17)));
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, NULL, &g[1], &g[2]);
  if (res) sollya_lib_printf("Subfunction of %b with NULL as 2nd argument: %b and %b (n=%d)\n", f, g[1], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* As third argument */
  f = SOLLYA_EXP(SOLLYA_ADD(SOLLYA_SIN(SOLLYA_X_), SOLLYA_CONST(17)));
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, NULL, &g[1], &g[2]);
  if (res) sollya_lib_printf("Subfunction of %b with NULL as 3rd argument: %b and %b (n=%d)\n", f, g[1], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* As third argument in a binary operator */
  f = SOLLYA_ADD(SOLLYA_SIN(SOLLYA_X_), SOLLYA_CONST(17));
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, NULL, &g[1], &g[2]);
  if (res) sollya_lib_printf("Subfunction of %b with NULL as 3rd argument: %b and %b (n=%d)\n", f, g[1], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* As fourth argument in a binary operator */
  f = SOLLYA_ADD(SOLLYA_SIN(SOLLYA_X_), SOLLYA_CONST(17));
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, &g[0], NULL, &g[2]);
  if (res) sollya_lib_printf("Subfunction of %b with NULL as 4th argument: %b and %b (n=%d)\n", f, g[0], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* As third argument in a library function */
  f = sollya_lib_build_function_libraryfunction(SOLLYA_COS(SOLLYA_X_), "stupid1", stupid1);
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, NULL, &g[1], &g[2]);
  if (res) sollya_lib_printf("Subfunction of %b with NULL as 3rd argument: %b and %b (n=%d)\n", f, g[1], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* As fourth argument in a library function */
  f = sollya_lib_build_function_libraryfunction(SOLLYA_COS(SOLLYA_X_), "stupid1", stupid1);
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_get_subfunctions(f, &n, &g[0], NULL, &g[2]);
  if (res) sollya_lib_printf("Subfunction of %b with NULL as 4th argument: %b and %b (n=%d)\n", f, g[0], g[2], n);
  else sollya_lib_printf("%b is not a functional expression (n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, NULL, NULL, NULL)\n", f, n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  sollya_lib_close();
  return 0;
}
