#include <sollya.h>
#include <mpfr.h>
#include <mpfi.h>

int stupid1(mpfi_t result, mpfi_t x, int n) {
  (void)x; /* Avoiding "unused parameter" warning */
  (void)n; /* Avoiding "unused parameter" warning */
  mpfi_set_ui(result, 0);
  return 0;
}

int stupid2(mpfi_t result, mpfi_t x, int n) {
  (void)x; /* Avoiding "unused parameter" warning */
  (void)n; /* Avoiding "unused parameter" warning */
  mpfi_set_ui(result, 1);
  return 0;
}

int main(void) {
  sollya_obj_t f[36];
  int (*libfun)(mpfi_t, mpfi_t, int) = NULL;
  int deriv = -1;
  int res = -1;
  int i;

  sollya_lib_init();

  f[0] = sollya_lib_parse_string("(proc() {myownlog = library(\"./libraryexample.a\"); return myownlog;})()");
  f[1] = SOLLYA_COS(SOLLYA_ADD(SOLLYA_X_, SOLLYA_CONST(1)));

  /* Trying to decompose an object that is *not* a library function */
  f[2] = sollya_lib_apply(f[0], f[1], NULL);
  f[3] = sollya_lib_diff(f[2]);
  res = sollya_lib_decompose_libraryfunction(&libfun, &deriv, &f[4], f[3]);
  if (res) sollya_lib_printf("sollya_lib_decompose_libraryfunction should not succeed on %b but it did.\n", f[3]);

  /* Trying to decompose a library function created by parse_string */
  /* Trying also to recompose an object with the function pointer that we get and to test if both objects compare equal. */
  f[4] = sollya_lib_diff(f[0]);
  f[5] = sollya_lib_apply(f[4], f[1], NULL);
  deriv = -1; libfun = NULL;
  res = sollya_lib_decompose_libraryfunction(&libfun, &deriv, &f[6], f[5]);
  f[7] = sollya_lib_build_function_libraryfunction(SOLLYA_X_, "should_not_be_used", libfun);
  f[8] = sollya_lib_diff(f[7]);
  f[9] = sollya_lib_apply(f[8], f[1], NULL);
  f[10] = sollya_lib_cmp_equal(f[5], f[9]);
  if (!res) sollya_lib_printf("sollya_lib_decompose_libraryfunction should succeed on %b. It did not.\n", f[5]);
  else {
    sollya_lib_printf("Decomposing %b gives deriv=%d and the sub-object %b.\n", f[5], deriv, f[6]);
    sollya_lib_printf("%b == %b gives %b (expecting true)\n", f[5], f[9], f[10]);
  }


  /* Trying to decompose a library function created with sollya_lib_libraryfunction */
  /* Trying also to recompose an object with the function pointer that we get and to test if both objects compare equal. */
  f[11] = SOLLYA_X_;
  f[12] = sollya_lib_libraryfunction(f[11], "foo", stupid1);
  f[13] = sollya_lib_diff(f[12]);
  f[14] = sollya_lib_diff(f[13]);
  f[15] = SOLLYA_EXP(SOLLYA_X_);
  f[16] = sollya_lib_apply(f[14], f[15], NULL);
  deriv = -1; libfun = NULL;
  res = sollya_lib_decompose_libraryfunction(&libfun, &deriv, &f[17], f[16]);
  f[18] = sollya_lib_build_function_libraryfunction(SOLLYA_X_, "should_not_be_used", libfun);
  f[19] = sollya_lib_diff(f[18]);
  f[20] = sollya_lib_diff(f[19]);
  f[21] = sollya_lib_copy_obj(f[15]);
  f[22] = sollya_lib_apply(f[20], f[21], NULL);
  f[23] = sollya_lib_cmp_equal(f[16], f[22]);
  if (!res) sollya_lib_printf("sollya_lib_decompose_libraryfunction should succeed on %b. It did not.\n", f[16]);
  else {
    sollya_lib_printf("Decomposing %b gives deriv=%d and the sub-object %b.\n", f[16], deriv, f[17]);
    sollya_lib_printf("%b == %b gives %b (expecting true)\n", f[16], f[22], f[23]);
  }


  /* Trying to decompose a library function created with sollya_lib_build_function_libraryfunction */
  /* Trying also to recompose an object with the function pointer that we get and to test if both objects compare equal. */
  f[24] = sollya_lib_build_function_libraryfunction(SOLLYA_X_, "bar", stupid2);
  f[25] = sollya_lib_diff(f[24]);
  f[26] = sollya_lib_diff(f[25]);
  f[27] = SOLLYA_LOG(SOLLYA_X_);
  f[28] = sollya_lib_apply(f[26], f[27], NULL);
  deriv = -1; libfun = NULL;
  res = sollya_lib_decompose_libraryfunction(&libfun, &deriv, &f[29], f[28]);
  f[30] = sollya_lib_build_function_libraryfunction(SOLLYA_X_, "should_not_be_used", libfun);
  f[31] = sollya_lib_diff(f[30]);
  f[32] = sollya_lib_diff(f[31]);
  f[33] = sollya_lib_copy_obj(f[27]);
  f[34] = sollya_lib_apply(f[32], f[33], NULL);
  f[35] = sollya_lib_cmp_equal(f[28], f[34]);
  if (!res) sollya_lib_printf("sollya_lib_decompose_libraryfunction should succeed on %b. It did not.\n", f[28]);
  else {
    sollya_lib_printf("Decomposing %b gives deriv=%d and the sub-object %b.\n", f[28], deriv, f[29]);
    sollya_lib_printf("%b == %b gives %b (expecting true)\n", f[28], f[34], f[35]);
  }

  for(i=0;i<=35;i++)  sollya_lib_clear_obj(f[i]);

  sollya_lib_close();
  return 0;
}
