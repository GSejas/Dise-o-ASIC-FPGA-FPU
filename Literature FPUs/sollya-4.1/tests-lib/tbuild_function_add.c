#include <sollya.h>

int main(void) {
  sollya_obj_t f, f1, f2;

  sollya_lib_init();
  f1 = sollya_lib_build_function_free_variable();
  f2 = sollya_lib_constant_from_double(1.0);
  f = sollya_lib_build_function_add(f1, f2);
  sollya_lib_printf("%b", f);
  sollya_lib_clear_obj(f);
  sollya_lib_close();
  return 0;
}
