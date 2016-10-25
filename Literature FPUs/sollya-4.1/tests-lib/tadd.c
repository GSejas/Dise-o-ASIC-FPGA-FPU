#include <sollya.h>

int main(void) {
  sollya_obj_t f1, f2, f;

  sollya_lib_init();
  f1 = sollya_lib_free_variable();
  f2 = sollya_lib_constant_from_double(1.0);
  f = sollya_lib_add(f1, f2);
  sollya_lib_printf("%b", f);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(f1);
  sollya_lib_clear_obj(f2);
  sollya_lib_close();
  return 0;
}
