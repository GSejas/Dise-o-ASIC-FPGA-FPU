#include <sollya.h>

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  case SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_THAT_IS_NOT_FAITHFUL:
    sollya_lib_printf("The test will rely on pure FP evaluation.\n");
    break;
  case SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_UNDECIDED:
    sollya_lib_printf("The following inclusion test is not certified (probably equal to one of the endpoints)\n");
    break;
  case SOLLYA_MSG_ONLY_ONE_ENDPOINT_OF_RANGE_IS_NAN:
    sollya_lib_printf("Only one endpoint of the interval is NaN. Will replace it by [NaN,NaN]\n");
    break;
  case SOLLYA_MSG_EXPR_NOT_CORRECTLY_TYPED:
    sollya_lib_printf("The following expression is not correctly typed.\n");
    break;
 default:
    sollya_lib_printf("Unexpected warning %d.\n", message);

  }
  return 0;
}

int main(void) {
  sollya_obj_t a, b, res;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  a = SOLLYA_CONST(1);
  b = sollya_lib_parse_string("[1,2]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = SOLLYA_CONST(4);
  b = sollya_lib_parse_string("[1,2]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("17 + log2(13)/log2(9)");
  b = sollya_lib_parse_string("[18,19]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("17 + log2(13)/log2(9)");
  b = sollya_lib_parse_string("[1,2]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("sin(pi/3) - sqrt(3)/2");
  b = sollya_lib_parse_string("[1,2]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("sin(pi/3) - sqrt(3)/2");
  b = sollya_lib_parse_string("[0,2]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("sin(pi/3) - sqrt(3)/2");
  b = sollya_lib_parse_string("[-1,0]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("sin(pi/3) - sqrt(3)/2");
  b = sollya_lib_parse_string("[-1,1]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("sin(pi/6)");
  b = sollya_lib_parse_string("[1/2,1]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("sin(pi/6)");
  b = sollya_lib_parse_string("[0,1/2]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("sin(pi/6)");
  b = sollya_lib_parse_string("[0,1]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("sin(pi/6)");
  b = sollya_lib_parse_string("[1,2]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("[1,2]");
  b = sollya_lib_parse_string("[3,4]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("[2,3]");
  b = sollya_lib_parse_string("[1,4]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("[1,3]");
  b = sollya_lib_parse_string("[2,4]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_string("e");
  b = sollya_lib_string("Hello");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = SOLLYA_CONST(1);
  b = sollya_lib_string("H1llo");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);


  /* Testing inclusion when NaN is a bound */
  a = sollya_lib_parse_string("[@NaN@,3]");
  b = sollya_lib_parse_string("[2,4]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("[@NaN@,5]");
  b = sollya_lib_parse_string("[2,4]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("[2,4]");
  b = sollya_lib_parse_string("[@NaN@,3]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("[2,4]");
  b = sollya_lib_parse_string("[@NaN@,5]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("[@NaN@,4]");
  b = sollya_lib_parse_string("[2, @NaN@]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_parse_string("[@NaN@,4]");
  b = sollya_lib_parse_string("[@NaN@, 5]");
  res = sollya_lib_cmp_in(a, b);
  sollya_lib_printf("%b in %b returns %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  sollya_lib_close();
  return 0;
}
