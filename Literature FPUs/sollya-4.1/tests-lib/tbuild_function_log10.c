#include <sollya.h>

int main(void) {
  sollya_obj_t f;

  sollya_lib_init();
  f = sollya_lib_build_function_free_variable();
  f = sollya_lib_build_function_log10(f);
  sollya_lib_printf("%b", f);
  sollya_lib_clear_obj(f);
  sollya_lib_close();
  return 0;
}
