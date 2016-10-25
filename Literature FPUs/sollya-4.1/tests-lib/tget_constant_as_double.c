#include <sollya.h>

int main(void) {
  sollya_obj_t a, prec;
  double res;

  sollya_lib_init();


  prec = SOLLYA_CONST(20);
  sollya_lib_set_prec_and_print(prec);
  sollya_lib_clear_obj(prec);

  /* something that is obviously not a constant */
  res = -17;
  a = sollya_lib_parse_string("[1;2]");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %e\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* something that could be interpreted as constant but that is not a */
  /* constant, strictly speaking */
  res = -17;
  a = sollya_lib_parse_string("[1;1]");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %e\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* something that is constant, but it is not obvious */
  res = -17;
  a = sollya_lib_parse_string("3*cos(2*x)/(2*sin(x)*cos(x))");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %e\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* An obvious constant */
  res = -17;
  a = SOLLYA_CONST(3.25);
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %a (expecting 0x1.ap+1)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant, but that does not fit on 20 bits */
  res = -17;
  a = SOLLYA_CONST(7.62939453125e4);
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %a (expecting 0x1.2a05f2p16)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant expression exactly representable as a double
   but it cannot be decided. */
  res = -17;
  a = sollya_lib_parse_string("(1b200+1)-1b200*(log2(3)/log2(7) - log(3)/log(7) + 1)");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %a (expecting 0x1p+0)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant expression very close to the middle between two doubles
   and it cannot be decided. */
  res = -17;
  a = sollya_lib_parse_string("1 + 1b-400 + 1b-53*(log2(3)/log2(7) - log(3)/log(7) + 1)");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %a (expecting one of 0x1p+0 or 0x1.0000000000001p+0 -- the second one would be better)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant expression very close to the middle between two doubles */
  res = -17;
  a = sollya_lib_parse_string("1 + 1b-400 + 1b-53");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %a (expecting one of 0x1p+0 or 0x1.0000000000001p+0 -- the second one would be better)\n\n", a, res);

  }
  sollya_lib_clear_obj(a);


  /* A constant expression exactly at the middle between two doubles, but
     it cannot be decided. */
  res = -17;
  a = sollya_lib_parse_string("1 - 1b-54*(log2(3)/log2(7) - log(3)/log(7) + 1)");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %a (expecting one of 0x1p+0 or 0xf.ffffffffffff8p-4 -- the first one would be better)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* The same constant but decidable */
  res = -17;
  a = sollya_lib_parse_string("1 - 1b-54");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %a (expecting one of 0x1p+0 or 0xf.ffffffffffff8p-4 -- the first one would be better)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* Another constant expression exactly at the middle between two doubles, but
     it cannot be decided. */
  res = -17;
  a = sollya_lib_parse_string("1 + 3b-53*(log2(3)/log2(7) - log(3)/log(7) + 1)");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %a (expecting one of 0x1.0000000000001p0 or 0x1.0000000000002p0 -- the second one would be better)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* The same constant but decidable. */
  res = -17;
  a = sollya_lib_parse_string("1 + 3b-53");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %a (expecting one of 0x1.0000000000001p0 or 0x1.0000000000002p0 -- the second one would be better)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A transcendantal constant. */
  res = -17;
  a = sollya_lib_parse_string("exp(pi) + log(2)");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %a (expecting one of 0x1.7d57686a86509p4 or 0x1.7d57686a8650ap4 -- the first one would be better)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant hard to evaluate because exactly zero but undecidable. */
  res = -17;
  a = sollya_lib_parse_string("log10(2)/log10(3) - log(2)/log(3)");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %a (expecting 0x0p+0).\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant very hard to evaluate (cf. tevaluate_function_at_constant_expression). */
  res = -17;
  a = sollya_lib_parse_string("(sin((pi) / 3) - sqrt(3) / 2) * (1 * 2^(100000)) + 3");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to some number. Expecting that the above warning message states that faithtul evaluation is *NOT* possible.\n\n", a);
  }
  sollya_lib_clear_obj(a);


  /* Another tricky one. */
  res = -17;
  a = sollya_lib_parse_string("(sin((pi) / 3) - sqrt(3) / 2 ) * (1 * 2^(100000)) + (1 * 2^(60000))");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to some number. Expecting that the above warning message states that faithtul evaluation is *NOT* possible.\n\n", a);
  }
  sollya_lib_clear_obj(a);


 /* Trying -inf */
  res = -17;
  a = sollya_lib_parse_string("-@Inf@");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %a (expecting -inf).\n\n", a, res);
  }
  sollya_lib_clear_obj(a);

 /* Trying -Huge */
  res = -17;
  a = sollya_lib_parse_string("-1b2000");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %a (expecting -inf with an overflow warning).\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


 /* Trying NaN */
  res = -17;
  a = sollya_lib_parse_string("@NaN@");
  if (!sollya_lib_get_constant_as_double(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %a (expecting NaN).\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  sollya_lib_close();
  return 0;
}
