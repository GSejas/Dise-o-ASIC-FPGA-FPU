#include <sollya.h>

int main(void) {
  sollya_obj_t a, prec;
  int b;

  sollya_lib_init();

  b = -5;
  a = sollya_lib_constant_from_int(b);
  sollya_lib_printf("%b (should be %d)\n", a, b);
  sollya_lib_clear_obj(a);

  b = 7;
  a = sollya_lib_constant_from_int(b);
  sollya_lib_printf("%b (should be %d)\n", a, b);
  sollya_lib_clear_obj(a);

  /* overflow */
  b = 1234567890;
  b *= 1234567890;
  b *= 123456;
  a = sollya_lib_constant_from_int(b);
  sollya_lib_printf("%b (should be %d)\n", a, b);
  sollya_lib_clear_obj(a);

  prec = sollya_lib_constant_from_int(20);
  sollya_lib_set_prec(prec);
  sollya_lib_clear_obj(prec);
  b = 4194304; /* Does not fit on 20 bits */
  a = sollya_lib_constant_from_int(b);
  sollya_lib_printf("%b (should be %d)\n", a, b);
  sollya_lib_clear_obj(a);

  sollya_lib_close();
  return 0;
}
