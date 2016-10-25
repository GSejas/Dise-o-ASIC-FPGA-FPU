#include <sollya.h>
#include <mpfr.h>
#include <mpfi.h>

int main(void) {
  sollya_obj_t f[31];
  int deriv = -1;
  int res = -1;
  int i;

  sollya_lib_init();

  f[0] = sollya_lib_parse_string("function(proc(X,n,p) {var res, oldPrec; oldPrec = prec; prec = p!; res = exp(X); prec = oldPrec!; return res; })");
  f[1] = SOLLYA_COS(SOLLYA_ADD(SOLLYA_X_, SOLLYA_CONST(1)));

  /* Trying to decompose an object that is *not* a procedure function */
  f[2] = sollya_lib_apply(f[0], f[1], NULL);
  f[3] = sollya_lib_diff(f[2]);
  res = sollya_lib_decompose_procedurefunction(&f[4], &deriv, &f[5], f[3]);
  if (res) sollya_lib_printf("sollya_lib_decompose_procedurefunction should not succeed on %b but it did.\n", f[3]);

  /* Trying to decompose a procedure function created by parse_string */
  /* Trying also to recompose an object with the function pointer that we get and to test if both objects compare equal. */
  f[4] = sollya_lib_diff(f[0]);
  f[5] = sollya_lib_apply(f[4], f[1], NULL);
  deriv = -1;
  res = sollya_lib_decompose_procedurefunction(&f[6], &deriv, &f[7], f[5]);
  f[8] = SOLLYA_X_;
  f[9] = sollya_lib_procedurefunction(f[8], f[6]);
  f[10] = sollya_lib_diff(f[9]);
  f[11] = sollya_lib_apply(f[10], f[1], NULL);
  f[12] = sollya_lib_cmp_equal(f[5], f[11]);
  if (!res) sollya_lib_printf("sollya_lib_decompose_procedurefunction should succeed on %b. It did not.\n", f[5]);
  else {
    sollya_lib_printf("Decomposing %b gives deriv=%d and the sub-objects %b and %b.\n", f[5], deriv, f[6], f[7]);
    sollya_lib_printf("%b == %b gives %b (expecting true)\n", f[5], f[11], f[12]);
  }


  /* Trying to decompose a procedure function created with sollya_lib_procedurefunction */
  /* Trying also to recompose an object with the function pointer that we get and to test if both objects compare equal. */
  f[13] = sollya_lib_parse_string("proc(X,n,p) {var res, oldPrec; oldPrec = prec; prec = p!; res = 3*exp(X); prec = oldPrec!; return res; }");
  f[14] = SOLLYA_X_;
  f[15] = sollya_lib_procedurefunction(f[14], f[13]);
  f[16] = sollya_lib_diff(f[15]);
  f[17] = sollya_lib_diff(f[16]);
  deriv = -1;
  res = sollya_lib_decompose_procedurefunction(&f[18], &deriv, &f[19], f[17]);
  f[20] = SOLLYA_X_;
  f[21] = sollya_lib_procedurefunction(f[20], f[18]);
  f[22] = sollya_lib_diff(f[21]);
  f[23] = sollya_lib_diff(f[22]);
  f[24] = sollya_lib_cmp_equal(f[17], f[23]);
  if (!res) sollya_lib_printf("sollya_lib_decompose_procedurefunction should succeed on %b. It did not.\n", f[17]);
  else {
    sollya_lib_printf("Decomposing %b gives deriv=%d and the sub-objects %b and %b.\n", f[17], deriv, f[18], f[19]);
    sollya_lib_printf("%b == %b gives %b (expecting true)\n", f[17], f[23], f[24]);
  }

  /* Trying to decompose a procedure function created with sollya_lib_build_function_procedurefunction */
  f[25] = sollya_lib_parse_string("proc(X,n,p) {var res, oldPrec; oldPrec = prec; prec = p!; res = 17*exp(X); prec = oldPrec!; return res; }");
  f[25] = sollya_lib_build_function_procedurefunction(SOLLYA_X_, f[25]);
  deriv = -1;
  res = sollya_lib_decompose_procedurefunction(&f[26], &deriv, &f[27], f[25]);
  f[28] = SOLLYA_X_;
  f[29] = sollya_lib_procedurefunction(f[28], f[26]);
  f[30] = sollya_lib_cmp_equal(f[25], f[29]);
  if (!res) sollya_lib_printf("sollya_lib_decompose_procedurefunction should succeed on %b. It did not.\n", f[25]);
  else {
    sollya_lib_printf("Decomposing %b gives deriv=%d and the sub-objects %b and %b.\n", f[25], deriv, f[26], f[27]);
    sollya_lib_printf("%b == %b gives %b (expecting true)\n", f[25], f[29], f[30]);
  }


  for(i=0;i<=30;i++)  sollya_lib_clear_obj(f[i]);

  sollya_lib_close();
  return 0;
}
