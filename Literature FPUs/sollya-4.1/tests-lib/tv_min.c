#include <sollya.h>
#include <stdarg.h>

sollya_obj_t stupid_wrapper(sollya_obj_t arg1, ...) {
  va_list va;
  sollya_obj_t a;
  va_start(va, arg1);
  a = sollya_lib_v_min(arg1, va);
  va_end(va);
  return a;
}

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  case SOLLYA_MSG_MIN_RELIES_ON_FP_RESULT_FAITHFUL_BUT_UNDECIDED:
    sollya_lib_printf("The following test is not certified (probably because the min is reached by two equal values).\n");
    break;
  case SOLLYA_MSG_MIN_RELIES_ON_FP_RESULT_THAT_IS_NOT_FAITHFUL:
    sollya_lib_printf("The test will rely on pure FP evaluation (probably because 0 is the minimum but it is hard to prove it).\n");
    break;
  case SOLLYA_MSG_MIN_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL:
    sollya_lib_printf("Warning: the following test involves a NaN\n");
    break;
  case SOLLYA_MSG_EXPR_NOT_CORRECTLY_TYPED:
    sollya_lib_printf("The following expression is not correctly typed.\n");
    break;
  default:
    sollya_lib_printf("Unexpected warning %d\n", message);
  }
  return 0;
}

int main(void) {
  sollya_obj_t a[4];
  sollya_obj_t b,c;
  int i;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  /* Tests a simple minimum */
  a[0] = sollya_lib_constant_from_int(4);
  a[1] = sollya_lib_constant_from_int(5);
  a[2] = sollya_lib_constant_from_int(1);
  a[3] = sollya_lib_constant_from_int(3);

  b = stupid_wrapper(a[0], a[1], a[2], a[3], NULL);
  sollya_lib_printf("min(4,5,1,3) returns %b\n\n", b);
  sollya_lib_clear_obj(b);

  c = sollya_lib_list(a, 4);
  b = stupid_wrapper(c, NULL);
  sollya_lib_printf("min(%b) returns %b\n\n", c, b);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);

  for(i=0;i<4;i++) sollya_lib_clear_obj(a[i]);


  /* Tests a tricky case where the minimum is impossible to detect */
  a[0] = sollya_lib_parse_string("17 + log2(13)/log2(9)");
  a[1] = sollya_lib_parse_string("17 + log(13)/log(9)");

  b = stupid_wrapper(a[0], a[1], NULL);
  sollya_lib_printf("min of 17 + log2(13)/log2(9) and 17 + log(13)/log(9) returns %b\n\n", b);
  sollya_lib_clear_obj(b);

  c = sollya_lib_list(a, 2);
  b = stupid_wrapper(c, NULL);
  sollya_lib_printf("min(%b) returns %b\n\n", c, b);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);

  sollya_lib_clear_obj(a[0]);
  sollya_lib_clear_obj(a[1]);

  /* Tests a tricky case when the minimum is possible to detect, but at some point of the algorithm
     it was impossible to detect it for sure */
  a[0] = sollya_lib_parse_string("17 + log2(13)/log2(9)");
  a[1] = sollya_lib_parse_string("17 + log(13)/log(9)");
  a[2] = SOLLYA_CONST(1);

  b = stupid_wrapper(a[0], a[1], a[2], NULL);
  sollya_lib_printf("min of 17 + log2(13)/log2(9), 17 + log(13)/log(9), 1 returns %b\n\n", b);
  sollya_lib_clear_obj(b);

  c = sollya_lib_list(a, 3);
  b = stupid_wrapper(c, NULL);
  sollya_lib_printf("min(%b) returns %b\n\n", c, b);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);

  sollya_lib_clear_obj(a[0]);
  sollya_lib_clear_obj(a[1]);
  sollya_lib_clear_obj(a[2]);


  /* The same but in reversed order */
  a[0] = SOLLYA_CONST(1);
  a[1] = sollya_lib_parse_string("17 + log2(13)/log2(9)");
  a[2] = sollya_lib_parse_string("17 + log(13)/log(9)");

  b = stupid_wrapper(a[0], a[1], a[2], NULL);
  sollya_lib_printf("min of 1, 17 + log2(13)/log2(9) and 17 + log(13)/log(9) returns %b\n\n", b);
  sollya_lib_clear_obj(b);

  c = sollya_lib_list(a, 3);
  b = stupid_wrapper(c, NULL);
  sollya_lib_printf("min(%b) returns %b\n\n", c, b);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);

  sollya_lib_clear_obj(a[0]);
  sollya_lib_clear_obj(a[1]);
  sollya_lib_clear_obj(a[2]);


  /* Tests another tricky case where the minimum is impossible to detect */
  a[0] = sollya_lib_parse_string("sin(pi/3) - sqrt(3)/2");
  a[1] = sollya_lib_parse_string("0");

  b = stupid_wrapper(a[0], a[1], NULL);
  sollya_lib_printf("min of sin(pi/3)-sqrt(3)/2 and 0 returns %b\n\n", b);
  sollya_lib_clear_obj(b);

  c = sollya_lib_list(a, 2);
  b = stupid_wrapper(c, NULL);
  sollya_lib_printf("min(%b) returns %b\n\n", c, b);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);

  sollya_lib_clear_obj(a[0]);
  sollya_lib_clear_obj(a[1]);

  /* Tests another tricky case where the minimum is possible to detect, but the list contains elements that are hard to evaluate */
  a[0] = SOLLYA_CONST(0);
  a[1] = sollya_lib_parse_string("sin(pi/3) - sqrt(3)/2");
  a[2] = sollya_lib_parse_string("-1");

  b = stupid_wrapper(a[0], a[1], a[2], NULL);
  sollya_lib_printf("min of 0, sin(pi/3)-sqrt(3)/2 and -1 returns %b\n\n", b);
  sollya_lib_clear_obj(b);

  c = sollya_lib_list(a, 3);
  b = stupid_wrapper(c, NULL);
  sollya_lib_printf("min(%b) returns %b\n\n", c, b);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);

  sollya_lib_clear_obj(a[0]);
  sollya_lib_clear_obj(a[1]);
  sollya_lib_clear_obj(a[2]);

  /* The same, but in reversed order  */
  a[0] = sollya_lib_parse_string("-1");
  a[1] = sollya_lib_parse_string("sin(pi/3) - sqrt(3)/2");
  a[2] = SOLLYA_CONST(0);

  b = stupid_wrapper(a[0], a[1], a[2], NULL);
  sollya_lib_printf("min of -1 and sin(pi/3)-sqrt(3)/2 and 0 returns %b\n\n", b);
  sollya_lib_clear_obj(b);

  c = sollya_lib_list(a, 3);
  b = stupid_wrapper(c, NULL);
  sollya_lib_printf("min(%b) returns %b\n\n", c, b);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);

  sollya_lib_clear_obj(a[0]);
  sollya_lib_clear_obj(a[1]);
  sollya_lib_clear_obj(a[2]);

  /* Tests what happens when a NaN is in the list */
  a[0] = sollya_lib_constant_from_int(2);
  a[1] = sollya_lib_parse_string("NaN");
  a[2] = sollya_lib_constant_from_int(1);

  b = stupid_wrapper(a[0], a[1], a[2], NULL);
  sollya_lib_printf("min(2,NaN,1) returns %b\n\n", b);
  sollya_lib_clear_obj(b);

  c = sollya_lib_list(a, 3);
  b = stupid_wrapper(c, NULL);
  sollya_lib_printf("min(%b) returns %b\n\n", c, b);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);

  sollya_lib_clear_obj(a[0]);
  sollya_lib_clear_obj(a[1]);
  sollya_lib_clear_obj(a[2]);


  a[0] = sollya_lib_constant_from_int(2);
  a[1] = SOLLYA_LOG(SOLLYA_CONST(-17));
  a[2] = sollya_lib_constant_from_int(1);

  b = stupid_wrapper(a[0], a[1], a[2], NULL);
  sollya_lib_printf("min(2,log(-17),1) returns %b\n\n", b);
  sollya_lib_clear_obj(b);

  c = sollya_lib_list(a, 3);
  b = stupid_wrapper(c, NULL);
  sollya_lib_printf("min(%b) returns %b\n\n", c, b);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);

  sollya_lib_clear_obj(a[0]);
  sollya_lib_clear_obj(a[1]);
  sollya_lib_clear_obj(a[2]);


  a[0] = sollya_lib_parse_string("NaN");
  a[1] = sollya_lib_constant_from_int(1);
  a[2] = sollya_lib_constant_from_int(2);

  b = stupid_wrapper(a[0], a[1], a[2], NULL);
  sollya_lib_printf("min(NaN,1,2) returns %b\n\n", b);
  sollya_lib_clear_obj(b);

  c = sollya_lib_list(a, 3);
  b = stupid_wrapper(c, NULL);
  sollya_lib_printf("min(%b) returns %b\n\n", c, b);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);

  sollya_lib_clear_obj(a[0]);
  sollya_lib_clear_obj(a[1]);
  sollya_lib_clear_obj(a[2]);



  a[0] = SOLLYA_LOG(SOLLYA_CONST(-17));
  a[1] = sollya_lib_constant_from_int(1);
  a[2] = sollya_lib_constant_from_int(2);

  b = stupid_wrapper(a[0], a[1], a[2], NULL);
  sollya_lib_printf("min(log(-17),1,2) returns %b\n\n", b);
  sollya_lib_clear_obj(b);

  c = sollya_lib_list(a, 3);
  b = stupid_wrapper(c, NULL);
  sollya_lib_printf("min(%b) returns %b\n\n", c, b);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);

  sollya_lib_clear_obj(a[0]);
  sollya_lib_clear_obj(a[1]);
  sollya_lib_clear_obj(a[2]);


  /* Tests minimum of only one element */
  a[0] = sollya_lib_constant_from_int(17);
  b = stupid_wrapper(a[0], NULL);
  sollya_lib_printf("min of 17 returns %b\n\n", b);
  sollya_lib_clear_obj(b);

  c = sollya_lib_list(a, 1);
  b = stupid_wrapper(c, NULL);
  sollya_lib_printf("min(%b) returns %b\n\n", c, b);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);

  sollya_lib_clear_obj(a[0]);

  /* Tests minimum of an empty list */
  c = sollya_lib_list(NULL, 0);
  b = stupid_wrapper(c, NULL);
  sollya_lib_printf("min of an empty list returns %b\n\n", b);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);


  /* Tests what happens if a list is given, followed by a constant */
  a[0] = sollya_lib_constant_from_int(4);
  a[1] = sollya_lib_constant_from_int(1);
  a[2] = sollya_lib_constant_from_int(3);
  a[3] = sollya_lib_constant_from_int(5);
  c = sollya_lib_list(a, 3);
  b = stupid_wrapper(c, a[3], NULL);
  sollya_lib_printf("min(%b, 5) returns %b\n\n", c, b);

  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(c);
  for(i=0;i<4;i++) sollya_lib_clear_obj(a[i]);

  sollya_lib_close();
  return 0;
}
