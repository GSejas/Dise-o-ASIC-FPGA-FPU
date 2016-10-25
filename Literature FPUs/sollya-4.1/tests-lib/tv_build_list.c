#include <sollya.h>
#include <stdarg.h>

sollya_obj_t stupid_wrapper(int arg1, ...) {
  va_list va;
  sollya_obj_t a;
  va_start(va, arg1);
  a = sollya_lib_v_build_list(va);
  va_end(va);
  return a;
}

int main(void) {
  sollya_obj_t listobj;
  sollya_lib_init();

  /* Empty list from nothing */
  listobj = stupid_wrapper(-1, NULL);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  /* Empty list with invalid pointers after NULL */
  listobj = stupid_wrapper(-1, NULL, 0x1);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  /* List with one element */
  listobj = stupid_wrapper(-1, SOLLYA_CONST(3.), NULL, 0x1);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  /* List of three elements */
  listobj = stupid_wrapper(-1,
                           SOLLYA_COS(SOLLYA_X_),
                           SOLLYA_CONST(3.),
                           sollya_lib_double_obj(),
                           NULL);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  sollya_lib_close();
  return 0;
}
