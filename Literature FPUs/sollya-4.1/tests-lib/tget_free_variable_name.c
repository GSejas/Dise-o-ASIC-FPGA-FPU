#include <sollya.h>

int main(void) {
  sollya_obj_t f;
  char *name;

  sollya_lib_init();
  f = SOLLYA_ADD(SOLLYA_COS(SOLLYA_X_), SOLLYA_X_);
  name = sollya_lib_get_free_variable_name();
  sollya_lib_printf("%b (variable name: %s)\n", f, name);
  name[0]='a';
  sollya_lib_printf("%b (with local name changed: %s)\n", f, name);
  sollya_lib_free(name);

  sollya_lib_name_free_variable("foo");
  name = sollya_lib_get_free_variable_name();
  sollya_lib_printf("%b (variable name: %s)\n", f, name);
  name[0]='a';
  sollya_lib_printf("%b (with local name changed: %s)\n", f, name);
  sollya_lib_free(name);

  sollya_lib_clear_obj(f);
  sollya_lib_close();
  return 0;
}
