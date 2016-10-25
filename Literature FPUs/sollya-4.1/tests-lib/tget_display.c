#include <sollya.h>

int main(void) {
  sollya_obj_t a;

  sollya_lib_init();
  a = sollya_lib_get_display();
  sollya_lib_printf("Default value for display: %b\n", a);
  sollya_lib_clear_obj(a);
  sollya_lib_close();
  return 0;
}
