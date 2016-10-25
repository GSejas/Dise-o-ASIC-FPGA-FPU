#include <sollya.h>

int main(void) {
  sollya_obj_t f;

  sollya_lib_init();
  f = SOLLYA_ADD(SOLLYA_COS(SOLLYA_X_), SOLLYA_X_);
  sollya_lib_printf("%b\n", f);
  sollya_lib_name_free_variable("foo");
  sollya_lib_printf("%b\n", f);
  sollya_lib_clear_obj(f);
  sollya_lib_close();
  return 0;
}
