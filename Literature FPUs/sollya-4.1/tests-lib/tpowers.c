#include <sollya.h>

int main(void) {
  sollya_obj_t f;

  sollya_lib_init();
  f = sollya_lib_powers();
  sollya_lib_printf("%b", f);
  sollya_lib_clear_obj(f);
  sollya_lib_close();
  return 0;
}
