#include <sollya.h>
#include <inttypes.h>

int flag = 0;

int special_callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  sollya_lib_printf("Testing a tricky expression. Might return UINT64_MAX with an overflow message or return anything with a message stating that faithful rounding was not possible... ");
  if( sollya_lib_get_msg_id(msg) == SOLLYA_MSG_EXPR_SHOULD_BE_CONSTANT_AND_IS_NOT_FAITHFUL )
    sollya_lib_printf("OK\n");
  else if ( sollya_lib_get_msg_id(msg) == SOLLYA_MSG_FAITHFUL_ROUNDING_FOR_EXPR_THAT_SHOULD_BE_CONST ) {
    flag = 1;
  }
  else sollya_lib_printf("not OK.\n");
  return 0;
}

int main(void) {
  sollya_obj_t a, prec;
  uint64_t res;
  int i;

  sollya_lib_init();

  prec = SOLLYA_CONST(20);
  sollya_lib_set_prec_and_print(prec);
  sollya_lib_clear_obj(prec);


  /* something that is obviously not a constant */
  res = -17;
  a = sollya_lib_parse_string("[1;2]");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 "\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* something that could be interpreted as constant but that is not a */
  /* constant, strictly speaking */
  res = -17;
  a = sollya_lib_parse_string("[1;1]");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 "\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* something that is constant, but it is not obvious */
  res = -17;
  a = sollya_lib_parse_string("3*cos(2*x)/(2*sin(x)*cos(x))");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 "\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* An obvious constant */
  res = -17;
  a = SOLLYA_CONST(3);
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 " (expecting 3)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant, but that does not fit on 20 bits */
  res = -17;
  a = SOLLYA_CONST(1073741824);
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 " (expecting 1073741824)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A negative constant */
  res = -17;
  a = SOLLYA_CONST(-3);
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 " (expecting 0)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant close to an overflow */
  res = -17;
  a = SOLLYA_CONST(1);
  for (i=1;(size_t)(i)<=sizeof(int64_t)*8;i++) a = SOLLYA_MUL(a, SOLLYA_CONST(2));
  a = SOLLYA_SUB(a, SOLLYA_CONST(1));
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    if (res == UINT64_MAX) sollya_lib_printf("%b has been converted to UINT64_MAX\n\n", a);
    else sollya_lib_printf("%b has been converted to %" PRIu64 " (expected UINT64_MAX=%" PRIu64 ")\n\n", a, res, UINT64_MAX);
  }
  sollya_lib_clear_obj(a);

  /* A constant that overflows */
  res = -17;
  a = SOLLYA_CONST(1);
  for (i=1;(size_t)(i)<=sizeof(int64_t)*8;i++) a = SOLLYA_MUL(a, SOLLYA_CONST(2));
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    if (res == UINT64_MAX) sollya_lib_printf("%b has been converted to UINT64_MAX (with an overflow warning expected)\n\n", a);
    else sollya_lib_printf("%b has been converted to %" PRIu64 " (expected UINT64_MAX=%" PRIu64 ")\n\n", a, res, UINT64_MAX);
  }
  sollya_lib_clear_obj(a);



  /* A constant expression exactly representable as an int but it cannot be decided. */
  res = -17;
  a = sollya_lib_parse_string("(1b200+1)-1b200*(log2(3)/log2(7) - log(3)/log(7) + 1)");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 " (expecting 1)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant expression very close to the middle between two integers
   and it cannote be decided. */
  res = -17;
  a = sollya_lib_parse_string("1 + 1b-400 + 0.5*(log2(3)/log2(7) - log(3)/log(7) + 1)");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 " (expecting either 1 or 2 -- 2 would be better)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant expression very close to the middle between two doubles */
  res = -17;
  a = sollya_lib_parse_string("1 + 1b-400 + 0.5");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 " (expecting either 1 or 2 -- 2 would be better)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant expression exactly at the middle between two doubles, but
     it cannot be decided. */
  res = -17;
  a = sollya_lib_parse_string("1 - 0.5*(log2(3)/log2(7) - log(3)/log(7) + 1)");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 " (expecting either 0 or 1 -- 0 would be better)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* The same constant but decidable */
  res = -17;
  a = sollya_lib_parse_string("1 - 0.5");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 " (expecting either 0 or 1 -- 0 would be better)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* Another constant expression exactly at the middle between two doubles, but
     it cannot be decided. */
  res = -17;
  a = sollya_lib_parse_string("1 + 1.5*(log2(3)/log2(7) - log(3)/log(7) + 1)");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 " (expecting either 2 or 3 -- 2 would be better)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* The same constant but decidable. */
  res = -17;
  a = sollya_lib_parse_string("1 + 1.5");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 " (expecting either 2 or 3 -- 2 would be better)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A transcendantal constant. */
  res = -17;
  a = sollya_lib_parse_string("exp(pi) + log(2)");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 " (expecting either 23 or 24 -- 24 would be better)\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant hard to evaluate because exactly zero but undecidable. */
  res = -17;
  a = sollya_lib_parse_string("log10(2)/log10(3) - log(2)/log(3)");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 " (expecting 0).\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* A constant very hard to evaluate (cf. tevaluate_function_at_constant_expression). */
  res = -17;
  a = sollya_lib_parse_string("(sin((pi) / 3) - sqrt(3) / 2) * (1 * 2^(100000)) + 3");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to some number. Expecting that the above warning message states that faithtul evaluation is *NOT* possible.\n\n", a);
  }
  sollya_lib_clear_obj(a);


  /* Another tricky one. */
  res = -17;
  sollya_lib_install_msg_callback(special_callback, NULL);
  a = sollya_lib_parse_string("(sin((pi) / 3) - sqrt(3) / 2 ) * (1 * 2^(100000)) + (1 * 2^(60000))");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    if (flag) {
      if (res != UINT64_MAX)
        sollya_lib_printf("%b has been converted to %d (expected UINT64_MAX=%" PRIu64 ")\n\n", a, res, UINT64_MAX);
    else
      sollya_lib_printf("OK\n");
    }
    sollya_lib_printf("%b has been converted to some number.\n\n", a);
  }
  sollya_lib_uninstall_msg_callback();
  flag = 0;
  sollya_lib_clear_obj(a);


  /* Trying -inf */
  res = -17;
  a = sollya_lib_parse_string("-@Inf@");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 " (expecting 0).\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  /* Trying +inf */
  res = -17;
  a = sollya_lib_parse_string("@Inf@");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    if (res == UINT64_MAX) sollya_lib_printf("%b has been converted to UINT64_MAX\n\n", a);
    else sollya_lib_printf("%b has been converted to %" PRIu64 " (expected UINT64_MAX=%" PRIu64 ")\n\n", a, res, UINT64_MAX);
  }
  sollya_lib_clear_obj(a);


 /* Trying NaN */
  res = -17;
  a = sollya_lib_parse_string("@NaN@");
  if (!sollya_lib_get_constant_as_uint64(&res, a))
    sollya_lib_printf("%b is not a constant.\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to %" PRIu64 " (expecting 0).\n\n", a, res);
  }
  sollya_lib_clear_obj(a);


  sollya_lib_close();
  return 0;
}
