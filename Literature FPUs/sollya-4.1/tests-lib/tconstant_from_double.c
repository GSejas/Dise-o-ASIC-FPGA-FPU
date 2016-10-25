#include <sollya.h>

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  if (message==SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_READING_A_CONSTANT)
    sollya_lib_printf("Caught the message about rounding while reading a constant.\n");
  else
    sollya_lib_printf("Unexpected message caught.\n");
  return 0;
}

int main(void) {
  sollya_obj_t a, a2, prec, tmp;
  double d;
  volatile double e;
  volatile double f;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  tmp = sollya_lib_binary();
  sollya_lib_set_display(tmp);
  sollya_lib_clear_obj(tmp);

  prec = sollya_lib_constant_from_int(53);
  sollya_lib_set_prec(prec);
  sollya_lib_clear_obj(prec);
  a2 = sollya_lib_parse_string("3.141592653589793");

  prec = sollya_lib_constant_from_int(100);
  sollya_lib_set_prec(prec);
  sollya_lib_clear_obj(prec);
  d = -3.141592653589793;
  a = sollya_lib_constant_from_double(d);
  sollya_lib_printf("%b\n-%b (should be the same as above)\n", a, a2);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(a2);

  prec = sollya_lib_constant_from_int(20);
  sollya_lib_set_prec(prec);
  sollya_lib_clear_obj(prec);
  a = sollya_lib_constant_from_double(d);
  sollya_lib_printf("%b (should be the same as above)\n", a);
  sollya_lib_clear_obj(a);

  d = 3.141592653589793;
  a = sollya_lib_constant_from_double(d);
  sollya_lib_printf("-%b (should be the same as above)\n", a);
  sollya_lib_clear_obj(a);

  d = 0.;
  a = sollya_lib_constant_from_double(d);
  sollya_lib_printf("%b (should be 0)\n", a);
  sollya_lib_clear_obj(a);

  d = 0./0.; /* NaN */
  a = sollya_lib_constant_from_double(d);
  sollya_lib_printf("%b (should be NaN)\n", a);
  sollya_lib_clear_obj(a);

  d = 1/0.; d = (d>0)?d:(-d); /* +Inf */
  a = sollya_lib_constant_from_double(d);
  sollya_lib_printf("%b (should be +Inf)\n", a);
  sollya_lib_clear_obj(a);

  prec = sollya_lib_constant_from_int(53);
  sollya_lib_set_prec(prec);
  sollya_lib_clear_obj(prec);
  a2 = sollya_lib_parse_string("D(5.4611528809225927e-310)");
  e = 1.787648654869691154845095994269186112904125380971e-159;
  f = 3.0549363634996046820519793932136176997894027405723e-151;
  d = e * f; /* subnormal */
  a = sollya_lib_constant_from_double(d);
  sollya_lib_printf("%b\n%b (should be the same as above)\n", a, a2);
  sollya_lib_clear_obj(a2);
  a2 = sollya_lib_parse_string("5.4611528809225927e-310");
  sollya_lib_printf("%b (should *NOT* be the same, but the previous entry should be a prefix of this one)\n", a2);
  sollya_lib_clear_obj(a2);
  sollya_lib_clear_obj(a);

  d = -1.0e300;
  d *= 1e300; /* overflow */
  a = sollya_lib_constant_from_double(d);
  sollya_lib_printf("%b (should be -Inf)\n", a);
  sollya_lib_clear_obj(a);

  sollya_lib_close();
  return 0;
}
