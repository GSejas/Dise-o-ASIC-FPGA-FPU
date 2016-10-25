#include <sollya.h>

int main(void) {
  sollya_obj_t L[3];
  sollya_obj_t listobj;
  sollya_lib_init();

  /* Empty list from nothing */
  listobj = sollya_lib_list(NULL, 0);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  L[0] = SOLLYA_COS(SOLLYA_X_);
  L[1] = SOLLYA_CONST(3.);
  L[2] = sollya_lib_double_obj();

  /* Empty list from an invalid pointer */
  listobj = sollya_lib_list(L+17, 0);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  /* Empty list from a valid pointer */
  listobj = sollya_lib_list(L, 0);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  /* List with one element, out of an array of more elements */
  listobj = sollya_lib_list(L, 1);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  /* List from an array with all the elements of the array */
  listobj = sollya_lib_list(L, 3);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);


  sollya_lib_clear_obj(L[0]);
  sollya_lib_clear_obj(L[1]);
  sollya_lib_clear_obj(L[2]);
  sollya_lib_close();
  return 0;
}
