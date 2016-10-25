#include <sollya.h>

int main(void) {
  sollya_obj_t listobj;
  sollya_lib_init();

  /* Empty list from nothing */
  listobj = sollya_lib_build_list(NULL);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  /* Empty list with invalid pointers after NULL */
  listobj = sollya_lib_build_list(NULL, 0x1);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  /* List with one element */
  listobj = sollya_lib_build_list(SOLLYA_CONST(3.), NULL, 0x1);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  /* List of three elements */
  listobj = sollya_lib_build_list(SOLLYA_COS(SOLLYA_X_),
                                  SOLLYA_CONST(3.),
                                  sollya_lib_double_obj(),
                                  NULL);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  sollya_lib_close();
  return 0;
}
