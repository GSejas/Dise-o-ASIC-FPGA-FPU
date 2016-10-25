#include <sollya.h>
#include <mpfr.h>
#include <mpfi.h>

char *pretty_print(sollya_base_function_t type) {
  switch(type) {
  case SOLLYA_BASE_FUNC_ABS: return "SOLLYA_BASE_FUNC_ABS";
  case SOLLYA_BASE_FUNC_ACOS: return "SOLLYA_BASE_FUNC_ACOS";
  case SOLLYA_BASE_FUNC_ACOSH: return "SOLLYA_BASE_FUNC_ACOSH";
  case SOLLYA_BASE_FUNC_ADD: return "SOLLYA_BASE_FUNC_ADD";
  case SOLLYA_BASE_FUNC_ASIN: return "SOLLYA_BASE_FUNC_ASIN";
  case SOLLYA_BASE_FUNC_ASINH: return "SOLLYA_BASE_FUNC_ASINH";
  case SOLLYA_BASE_FUNC_ATAN: return "SOLLYA_BASE_FUNC_ATAN";
  case SOLLYA_BASE_FUNC_ATANH: return "SOLLYA_BASE_FUNC_ATANH";
  case SOLLYA_BASE_FUNC_CEIL: return "SOLLYA_BASE_FUNC_CEIL";
  case SOLLYA_BASE_FUNC_CONSTANT: return "SOLLYA_BASE_FUNC_CONSTANT";
  case SOLLYA_BASE_FUNC_COS: return "SOLLYA_BASE_FUNC_COS";
  case SOLLYA_BASE_FUNC_COSH: return "SOLLYA_BASE_FUNC_COSH";
  case SOLLYA_BASE_FUNC_DIV: return "SOLLYA_BASE_FUNC_DIV";
  case SOLLYA_BASE_FUNC_DOUBLE: return "SOLLYA_BASE_FUNC_DOUBLE";
  case SOLLYA_BASE_FUNC_DOUBLEDOUBLE: return "SOLLYA_BASE_FUNC_DOUBLEDOUBLE";
  case SOLLYA_BASE_FUNC_DOUBLEEXTENDED: return "SOLLYA_BASE_FUNC_DOUBLEEXTENDED";
  case SOLLYA_BASE_FUNC_ERF: return "SOLLYA_BASE_FUNC_ERF";
  case SOLLYA_BASE_FUNC_ERFC: return "SOLLYA_BASE_FUNC_ERFC";
  case SOLLYA_BASE_FUNC_EXP: return "SOLLYA_BASE_FUNC_EXP";
  case SOLLYA_BASE_FUNC_EXP_M1: return "SOLLYA_BASE_FUNC_EXP_M1";
  case SOLLYA_BASE_FUNC_FLOOR: return "SOLLYA_BASE_FUNC_FLOOR";
  case SOLLYA_BASE_FUNC_FREE_VARIABLE: return "SOLLYA_BASE_FUNC_FREE_VARIABLE";
  case SOLLYA_BASE_FUNC_HALFPRECISION: return "SOLLYA_BASE_FUNC_HALFPRECISION";
  case SOLLYA_BASE_FUNC_LIBRARYCONSTANT: return "SOLLYA_BASE_FUNC_LIBRARYCONSTANT";
  case SOLLYA_BASE_FUNC_LIBRARYFUNCTION: return "SOLLYA_BASE_FUNC_LIBRARYFUNCTION";
  case SOLLYA_BASE_FUNC_LOG: return "SOLLYA_BASE_FUNC_LOG";
  case SOLLYA_BASE_FUNC_LOG_10: return "SOLLYA_BASE_FUNC_LOG_10";
  case SOLLYA_BASE_FUNC_LOG_1P: return "SOLLYA_BASE_FUNC_LOG_1P";
  case SOLLYA_BASE_FUNC_LOG_2: return "SOLLYA_BASE_FUNC_LOG_2";
  case SOLLYA_BASE_FUNC_MUL: return "SOLLYA_BASE_FUNC_MUL";
  case SOLLYA_BASE_FUNC_NEARESTINT: return "SOLLYA_BASE_FUNC_NEARESTINT";
  case SOLLYA_BASE_FUNC_NEG: return "SOLLYA_BASE_FUNC_NEG";
  case SOLLYA_BASE_FUNC_PI: return "SOLLYA_BASE_FUNC_PI";
  case SOLLYA_BASE_FUNC_POW: return "SOLLYA_BASE_FUNC_POW";
  case SOLLYA_BASE_FUNC_PROCEDUREFUNCTION: return "SOLLYA_BASE_FUNC_PROCEDUREFUNCTION";
  case SOLLYA_BASE_FUNC_QUAD: return "SOLLYA_BASE_FUNC_QUAD";
  case SOLLYA_BASE_FUNC_SIN: return "SOLLYA_BASE_FUNC_SIN";
  case SOLLYA_BASE_FUNC_SINGLE: return "SOLLYA_BASE_FUNC_SINGLE";
  case SOLLYA_BASE_FUNC_SINH: return "SOLLYA_BASE_FUNC_SINH";
  case SOLLYA_BASE_FUNC_SQRT: return "SOLLYA_BASE_FUNC_SQRT";
  case SOLLYA_BASE_FUNC_SUB: return "SOLLYA_BASE_FUNC_SUB";
  case SOLLYA_BASE_FUNC_TAN: return "SOLLYA_BASE_FUNC_TAN";
  case SOLLYA_BASE_FUNC_TANH: return "SOLLYA_BASE_FUNC_TANH";
  case SOLLYA_BASE_FUNC_TRIPLEDOUBLE: return"SOLLYA_BASE_FUNC_TRIPLEDOUBLE";
  default: return "Unknown type";
  }
}

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

/* Note: given as an example in the documentation.
   We suppose that the library has already been initialized */
int is_made_of_constants(sollya_obj_t f) {
  sollya_obj_t tmp1 = NULL;
  sollya_obj_t tmp2 = NULL;
  int n, r, res;
  sollya_base_function_t type;
  r = sollya_lib_decompose_function(f, &type, &n, &tmp1, &tmp2, NULL);
  if (!r) { sollya_lib_printf("%b is not a mathematical function.", f); res = 0; }
  else if (n >= 3) {
    sollya_lib_printf("Unexpected error: %b has more than two arguments.\n", f);
    res = 0;
  }
  else {
    switch (type) {
    case SOLLYA_BASE_FUNC_FREE_VARIABLE: res = 0; break;
    case SOLLYA_BASE_FUNC_PI: res = 1; break;
    case SOLLYA_BASE_FUNC_CONSTANT: res = 1; break;
    case SOLLYA_BASE_FUNC_LIBRARYCONSTANT: res = 1; break;
    default:
      res = is_made_of_constants(tmp1);
      if ((res) && (n==2)) res = is_made_of_constants(tmp2);
    }
  }
  if (tmp1) sollya_lib_clear_obj(tmp1);
  if (tmp2) sollya_lib_clear_obj(tmp2);
  return res;
}

int main(void) {
  sollya_obj_t f, tmp, tmp2, tmp3;
  sollya_base_function_t type;
  sollya_obj_t g[3];
  int n;
  int res;

  sollya_lib_init();

  /* Constant */
  f = SOLLYA_PI;
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("%b: type = %s, n = %d, subfunctions = %b, %b and %b.\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s, n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, -1, NULL, NULL, NULL)\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* Another constant */
  f = SOLLYA_CONST(3);
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("%b: type = %s, n = %d, subfunctions = %b, %b and %b.\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s, n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, -1, NULL, NULL, NULL)\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* A library constant constant */
  f = sollya_lib_libraryconstant("superconst", euler_gamma);
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("%b: type = %s, n = %d, subfunctions = %b, %b and %b.\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s, n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, -1, NULL, NULL, NULL)\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* Free variable */
  f = SOLLYA_X_;
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("%b: type = %s, n = %d, subfunctions = %b, %b and %b.\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s, n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, -1, NULL, NULL, NULL)\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* Elementary function */
  f = SOLLYA_EXP(SOLLYA_ADD(SOLLYA_SIN(SOLLYA_X_), SOLLYA_CONST(17)));
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("%b: type = %s, n = %d, subfunctions = %b, %b and %b.\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s, n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, -1, NULL, NULL, NULL)\n", f, pretty_print(type), n, g[0], g[1], g[2]);
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
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("%b: type = %s, n = %d, subfunctions = %b, %b and %b.\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s, n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, -1, NULL, NULL, NULL)\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(tmp);
  sollya_lib_clear_obj(tmp2);
  sollya_lib_clear_obj(tmp3);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* Library function */
  f = sollya_lib_build_function_libraryfunction(SOLLYA_COS(SOLLYA_X_), "stupid1", stupid1);
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("%b: type = %s, n = %d, subfunctions = %b, %b and %b.\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s, n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, -1, NULL, NULL, NULL)\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* arithmetic operator */
  f = SOLLYA_ADD(SOLLYA_X_,
                 sollya_lib_build_function_libraryfunction(SOLLYA_X_, "stupid1", stupid1));
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("%b: type = %s, n = %d, subfunctions = %b, %b and %b.\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s, n=%d, g[0]=%b, g[1]=%b, g[2]=%b. Expecting -1, -1, NULL, NULL, NULL)\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* A Sollya object that is not an expression */
  f = sollya_lib_absolute();
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("%b: type = %s, n = %d, subfunctions = %b, %b and %b.\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s. Expecting 'Unknown type')\n", f, pretty_print(type));
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* Another one */
  f = sollya_lib_parse_string("[1,2]");
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, &g[0], &g[1], &g[2], NULL);
  if (res) sollya_lib_printf("%b: type = %s, n = %d, subfunctions = %b, %b and %b.\n", f, pretty_print(type), n, g[0], g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s. Expecting 'Unknown type')\n", f, pretty_print(type));
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /*************************************************************/
  /* Testing what happens when NULL is encountered prematurely */
  /*************************************************************/

  /* As second argument */
  f = SOLLYA_EXP(SOLLYA_ADD(SOLLYA_SIN(SOLLYA_X_), SOLLYA_CONST(17)));
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, NULL, &n, &g[1], &g[2]);
  if (res) sollya_lib_printf("NULL given as 2nd argument. %b: type = %s, n = %d, subfunctions = %b and %b.\n", f, pretty_print(type), n, g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s. Expecting 'Unknown type')\n", f, pretty_print(type));
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* As third argument */
  f = SOLLYA_EXP(SOLLYA_ADD(SOLLYA_SIN(SOLLYA_X_), SOLLYA_CONST(17)));
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, NULL, &g[1], &g[2]);
  if (res) sollya_lib_printf("NULL given as 3rd argument. %b: type = %s, n = %d, subfunctions = %b and %b.\n", f, pretty_print(type), n, g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s. Expecting 'Unknown type')\n", f, pretty_print(type));
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* As fourth argument */
  f = SOLLYA_EXP(SOLLYA_ADD(SOLLYA_SIN(SOLLYA_X_), SOLLYA_CONST(17)));
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, NULL, &g[1], &g[2]);
  if (res) sollya_lib_printf("NULL given as 4th argument. %b: type = %s, n = %d, subfunctions = %b and %b.\n", f, pretty_print(type), n, g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s. Expecting 'Unknown type')\n", f, pretty_print(type));
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* As fourth argument in a binary operator */
  f = SOLLYA_ADD(SOLLYA_SIN(SOLLYA_X_), SOLLYA_CONST(17));
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, NULL, &g[1], &g[2]);
  if (res) sollya_lib_printf("NULL given as 4th argument. %b: type = %s, n = %d, subfunctions = %b and %b.\n", f, pretty_print(type), n, g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s. Expecting 'Unknown type')\n", f, pretty_print(type));
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* As fifth argument in a binary operator */
  f = SOLLYA_ADD(SOLLYA_SIN(SOLLYA_X_), SOLLYA_CONST(17));
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, &g[0], NULL, &g[2]);
  if (res)  sollya_lib_printf("NULL given as 5th argument. %b: type = %s, n = %d, subfunctions = %b and %b.\n", f, pretty_print(type), n, g[0], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s. Expecting 'Unknown type')\n", f, pretty_print(type));
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* As fourth argument in a library function */
  f = sollya_lib_build_function_libraryfunction(SOLLYA_COS(SOLLYA_X_), "stupid1", stupid1);
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, NULL, &g[1], &g[2]);
  if (res) sollya_lib_printf("NULL given as 4th argument. %b: type = %s, n = %d, subfunctions = %b and %b.\n", f, pretty_print(type), n, g[1], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s. Expecting 'Unknown type')\n", f, pretty_print(type));
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);

  /* As fifth argument in a library function */
  f = sollya_lib_build_function_libraryfunction(SOLLYA_COS(SOLLYA_X_), "stupid1", stupid1);
  type = (sollya_base_function_t) -1;
  g[0] = NULL; g[1] = NULL; g[2] = NULL;
  n = -1;
  res = sollya_lib_decompose_function(f, &type, &n, &g[0], NULL, &g[2]);
  if (res) sollya_lib_printf("NULL given as 5th argument. %b: type = %s, n = %d, subfunctions = %b and %b.\n", f, pretty_print(type), n, g[0], g[2]);
  else sollya_lib_printf("%b is not a functional expression (type=%s. Expecting 'Unknown type')\n", f, pretty_print(type));
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(g[0]);
  sollya_lib_clear_obj(g[1]);
  sollya_lib_clear_obj(g[2]);


  /*******************************************************/
  /* Testing the function presented in the documentation */
  /*******************************************************/
  f = sollya_lib_build_function_libraryfunction(SOLLYA_COS(SOLLYA_X_), "stupid1", stupid1);
  if (is_made_of_constants(f)) sollya_lib_printf("%b is made of constants.\n", f);
  else sollya_lib_printf("%b is *NOT* made of constants.\n", f);
  sollya_lib_clear_obj(f);

  f = sollya_lib_build_function_libraryfunction(SOLLYA_COS(SOLLYA_PI), "stupid1", stupid1);
  if (is_made_of_constants(f)) sollya_lib_printf("%b is made of constants.\n", f);
  else sollya_lib_printf("%b is *NOT* made of constants.\n", f);
  sollya_lib_clear_obj(f);
  
  f = sollya_lib_libraryconstant("superconst", euler_gamma);
  f = SOLLYA_MUL(SOLLYA_ADD(SOLLYA_PI, SOLLYA_CONST(1)), f);
  if (is_made_of_constants(f)) sollya_lib_printf("%b is made of constants.\n", f);
  else sollya_lib_printf("%b is *NOT* made of constants.\n", f);
  sollya_lib_clear_obj(f);

  f = SOLLYA_X_;
  if (is_made_of_constants(f)) sollya_lib_printf("%b is made of constants.\n", f);
  else sollya_lib_printf("%b is *NOT* made of constants.\n", f);
  sollya_lib_clear_obj(f);

  f = SOLLYA_SIN(SOLLYA_ADD(SOLLYA_X_, SOLLYA_CONST(1)));
  if (is_made_of_constants(f)) sollya_lib_printf("%b is made of constants.\n", f);
  else sollya_lib_printf("%b is *NOT* made of constants.\n", f);
  sollya_lib_clear_obj(f);

  f = SOLLYA_SIN(SOLLYA_EXP(SOLLYA_CONST(1)));
  if (is_made_of_constants(f)) sollya_lib_printf("%b is made of constants.\n", f);
  else sollya_lib_printf("%b is *NOT* made of constants.\n", f);
  sollya_lib_clear_obj(f);

  f = sollya_lib_parse_string("[0,1]");
  if (is_made_of_constants(f)) sollya_lib_printf("%b is made of constants.\n", f);
  else sollya_lib_printf("%b is *NOT* made of constants.\n", f);
  sollya_lib_clear_obj(f);

  f = sollya_lib_relative();
  if (is_made_of_constants(f)) sollya_lib_printf("%b is made of constants.\n", f);
  else sollya_lib_printf("%b is *NOT* made of constants.\n", f);
  sollya_lib_clear_obj(f);


  sollya_lib_close();
  return 0;
}
