#include <sollya.h>

int main(void) {
  sollya_obj_t a, prec;
  mpq_t res;

  sollya_lib_init();
  mpq_init(res);

  prec = SOLLYA_CONST(20);
  sollya_lib_set_prec_and_print(prec);
  sollya_lib_clear_obj(prec);

  /* something that is obviously not a constant */
  mpq_set_si(res, -17, 1);
  a = sollya_lib_parse_string("[1;2]");
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* something that could be interpreted as constant but that is not a */
  /* constant, strictly speaking */
  mpq_set_si(res, -17, 1);
  a = sollya_lib_parse_string("[1;1]");
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* something that is constant, but it is not obvious */
  mpq_set_si(res, -17, 1);
  a = sollya_lib_parse_string("3*cos(2*x)/(2*sin(x)*cos(x))");
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* An obvious constant */
  mpq_set_si(res, -17, 1);
  a = SOLLYA_CONST(3.25);
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r (expecting 13/4)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant, but that does not fit on 20 bits */
  mpq_set_si(res, -17, 1);
  a = SOLLYA_CONST(7.62939453125e4);
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r (expecting 9765625/128)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant expression exactly representable as a double
   but it cannot be decided. */
  mpq_set_si(res, -17, 1);
  a = sollya_lib_parse_string("(1b200+1)-1b200*(log2(3)/log2(7) - log(3)/log(7) + 1)");
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r\n\n", a, res);
  }
  sollya_lib_clear_obj(a);

  /* A constant expression very close to the middle between two doubles */
  mpq_set_si(res, -17, 1);
  a = sollya_lib_parse_string("1 + 1b-400 + 1b-53");
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r (expecting 2582249878086908876343246170761950825682317705590091112401283002575788089215446117995004864340738840188222310738458312705/2582249878086908589655919172003011874329705792829223512830659356540647622016841194629645353280137831435903171972747493376)\n\n", a, res);

  }
  sollya_lib_clear_obj(a);


  /* Another one in the same spirit */
  mpq_set_si(res, -17, 1);
  a = sollya_lib_parse_string("1 - 1b-54");
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r (expecting 18014398509481983/18014398509481984)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant rational expression. */
  mpq_set_si(res, -17, 1);
  a = sollya_lib_parse_string("6/10");
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r (expecting 3/5)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A transcendantal constant. */
  mpq_set_si(res, -17, 1);
  a = sollya_lib_parse_string("exp(pi) + log(2)");
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant hard to evaluate because exactly zero but undecidable. */
  mpq_set_si(res, -17, 1);
  a = sollya_lib_parse_string("log10(2)/log10(3) - log(2)/log(3)");
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r.\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant very hard to evaluate (cf. tevaluate_function_at_constant_expression). */
  mpq_set_si(res, -17, 1);
  a = sollya_lib_parse_string("(sin((pi) / 3) - sqrt(3) / 2) * (1 * 2^(100000)) + 3");
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r.\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


 /* Trying -inf */
  mpq_set_si(res, -17, 1);
  a = sollya_lib_parse_string("-@Inf@");
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r.\n\n", a, res);
  }
  sollya_lib_clear_obj(a);

 /* Trying -Huge */
  mpq_set_si(res, -17, 1);
  a = sollya_lib_parse_string("-1b2000");
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r (expecting -114813069527425452423283320117768198402231770208869520047764273682576626139237031385665948631650626991844596463898746277344711896086305533142593135616665318539129989145312280000688779148240044871428926990063486244781615463646388363947317026040466353970904996558162398808944629605623311649536164221970332681344168908984458505602379484807914058900934776500429002716706625830522008132236281291761267883317206598995396418127021779858404042159853183251540889433902091920554957783589672039160081957216630582755380425583726015528348786419432054508915275783882625175435528800822842770817965453762184851149029376).\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


 /* Trying NaN */
  mpq_set_si(res, -17, 1);
  a = sollya_lib_parse_string("@NaN@");
  if (!sollya_lib_get_constant_as_mpq(res, a))
    sollya_lib_printf("%b is not a rational constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %r.\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  mpq_clear(res);
  sollya_lib_close();
  return 0;
}
