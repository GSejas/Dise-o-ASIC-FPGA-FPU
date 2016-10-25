#include <sollya.h>

int main(void) {
  sollya_obj_t a, b;

  sollya_lib_init();

  a = sollya_lib_string("");
  sollya_lib_printf("An empty string: A%bA\n", a);
  sollya_lib_clear_obj(a);

  a = sollya_lib_string("foobar");
  sollya_lib_printf("A non-empty string: A%bA\n", a);
  sollya_lib_clear_obj(a);

  a = sollya_lib_string("cos(_x_)");
  b = SOLLYA_COS(SOLLYA_X_);
  sollya_lib_printf("%b must not be mistaken for %b\n", a, b);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);

  a = sollya_lib_build_list(sollya_lib_string("cos(_x_)"),
                            SOLLYA_COS(SOLLYA_X_),
                            NULL);
  sollya_lib_printf("A list of strings: %b\n", a, b);
  sollya_lib_clear_obj(a);

  sollya_lib_close();
  return 0;
}
