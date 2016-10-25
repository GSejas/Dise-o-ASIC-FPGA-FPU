#include <sollya.h>

int main(void) {
  sollya_obj_t f1, f2;

  sollya_lib_init();
  f1 = sollya_lib_free_variable();
  f2 = sollya_lib_double(f1);
  sollya_lib_printf("%b", f2);
  sollya_lib_clear_obj(f1);
  sollya_lib_clear_obj(f2);
  sollya_lib_close();
  return 0;
}
