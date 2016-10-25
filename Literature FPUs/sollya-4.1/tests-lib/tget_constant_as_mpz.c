#include <sollya.h>

int main(void) {
  sollya_obj_t a, prec;
  mpz_t res;
  int i;

  sollya_lib_init();
  mpz_init(res);

  prec = SOLLYA_CONST(20);
  sollya_lib_set_prec_and_print(prec);
  sollya_lib_clear_obj(prec);

  /* something that is obviously not a constant */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("[1;2]");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf("\n\n");
  }
  sollya_lib_clear_obj(a);


  /* something that could be interpreted as constant but that is not a */
  /* constant, strictly speaking */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("[1;1]");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf("\n\n");
  }
  sollya_lib_clear_obj(a);


  /* something that is constant, but it is not obvious */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("3*cos(2*x)/(2*sin(x)*cos(x))");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf("\n\n");
  }
  sollya_lib_clear_obj(a);


  /* An obvious constant */
  mpz_set_ui(res, 17);
  a = SOLLYA_CONST(3);
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expecting 3)\n\n");
  }
  sollya_lib_clear_obj(a);

  /* A constant, but that does not fit on 20 bits */
  mpz_set_ui(res, 17);
  a = SOLLYA_CONST(1073741824);
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expecting 1073741824)\n\n");
  }
  sollya_lib_clear_obj(a);

  /* A negative constant */
  mpz_set_ui(res, 17);
  a = SOLLYA_CONST(-3);
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expecting -3)\n\n");
  }
  sollya_lib_clear_obj(a);


  /* A constant that does not fit in a integer */
  mpz_set_ui(res, 17);
  a = SOLLYA_CONST(1);
  for (i=1;i<=90;i++) a = SOLLYA_MUL(a, SOLLYA_CONST(2));
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expected 1237940039285380274899124224)\n\n");
  }
  sollya_lib_clear_obj(a);


  /* The same, but negative */
  mpz_set_ui(res, 17);
  a = SOLLYA_CONST(-1);
  for (i=1;i<=90;i++) a = SOLLYA_MUL(a, SOLLYA_CONST(2));
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expected -1237940039285380274899124224)\n\n");
  }
  sollya_lib_clear_obj(a);



  /* A constant expression exactly representable as an int but it cannot be decided. */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("(1b200+1)-1b200*(log2(3)/log2(7) - log(3)/log(7) + 1)");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expecting 1)\n\n");
  }
  sollya_lib_clear_obj(a);


  /* A constant expression very close to the middle between two integers
   and it cannot be decided. */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("1 + 1b-400 + 0.5*(log2(3)/log2(7) - log(3)/log(7) + 1)");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expecting either 1 or 2 -- 2 would be better)\n\n");
  }
  sollya_lib_clear_obj(a);


  /* A constant expression very close to the middle between two doubles */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("1 + 1b-400 + 0.5");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expecting either 1 or 2 -- 2 would be better)\n\n");
  }
  sollya_lib_clear_obj(a);


  /* A constant expression exactly at the middle between two doubles, but
     it cannot be decided. */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("1 - 0.5*(log2(3)/log2(7) - log(3)/log(7) + 1)");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expecting either 0 or 1 -- 0 would be better)\n\n");
  }
  sollya_lib_clear_obj(a);


  /* The same constant but decidable */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("1 - 0.5");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expecting either 0 or 1 -- 0 would be better)\n\n");
  }
  sollya_lib_clear_obj(a);


  /* Another constant expression exactly at the middle between two doubles, but
     it cannot be decided. */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("1 + 1.5*(log2(3)/log2(7) - log(3)/log(7) + 1)");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expecting either 2 or 3 -- 2 would be better)\n\n");
  }
  sollya_lib_clear_obj(a);


  /* The same constant but decidable. */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("1 + 1.5");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expecting either 2 or 3 -- 2 would be better)\n\n");
  }
  sollya_lib_clear_obj(a);


  /* A transcendantal constant. */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("exp(pi) + log(2)");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expecting either 23 or 24 -- 24 would be better)\n\n");
  }
  sollya_lib_clear_obj(a);


  /* A constant hard to evaluate because exactly zero but undecidable. */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("log10(2)/log10(3) - log(2)/log(3)");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expecting 0).\n\n");
  }
  sollya_lib_clear_obj(a);


  /* A constant very hard to evaluate (cf. tevaluate_function_at_constant_expression). */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("(sin((pi) / 3) - sqrt(3) / 2) * (1 * 2^(100000)) + 3");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to some number. Expecting that the above warning message states that faithtul evaluation is *NOT* possible.\n\n", a);
  }
  sollya_lib_clear_obj(a);



  /* Trying -inf */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("-@Inf@");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expected 0)\n\n");
  }
  sollya_lib_clear_obj(a);


/* Trying NaN */
  mpz_set_ui(res, 17);
  a = sollya_lib_parse_string("@NaN@");
  if (!sollya_lib_get_constant_as_mpz(res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to ", a); gmp_printf("%Zd", res); sollya_lib_printf(" (expecting 0).\n\n");
  }
  sollya_lib_clear_obj(a);


  mpz_clear(res);
  sollya_lib_close();
  return 0;
}
