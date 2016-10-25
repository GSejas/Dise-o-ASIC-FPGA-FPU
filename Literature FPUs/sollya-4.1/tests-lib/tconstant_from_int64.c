#include <sollya.h>
#include <inttypes.h>

int main(void) {
  sollya_obj_t a, prec;
  int64_t b;

  sollya_lib_init();

  b = INT64_C(-5);
  a = sollya_lib_constant_from_int64(b);
  sollya_lib_printf("%b (should be %" PRId64 ")\n", a, (long long int)b);
  sollya_lib_clear_obj(a);

  b = INT64_C(7);
  a = sollya_lib_constant_from_int64(b);
  sollya_lib_printf("%b (should be %" PRId64 ")\n", a, (long long int)b);
  sollya_lib_clear_obj(a);

  /* overflow */
  b = INT64_C(1234567890);
  b *= INT64_C(1234567890);
  b *= INT64_C(123456);
  a = sollya_lib_constant_from_int64(b);
  sollya_lib_printf("%b (should be %" PRId64 ")\n", a, (long long int)b);
  sollya_lib_clear_obj(a);

  prec = SOLLYA_CONST(20);
  sollya_lib_set_prec(prec);
  sollya_lib_clear_obj(prec);
  b = INT64_C(4194304); /* Does not fit on 20 bits */
  a = sollya_lib_constant_from_int64(b);
  sollya_lib_printf("%b (should be %" PRId64 ")\n", a, (long long int)b);
  sollya_lib_clear_obj(a);

  sollya_lib_close();
  return 0;
}
