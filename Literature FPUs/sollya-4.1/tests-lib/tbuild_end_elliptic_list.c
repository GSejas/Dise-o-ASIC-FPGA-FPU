#include <sollya.h>

int main(void) {
  sollya_obj_t listobj, tmp;
  sollya_lib_init();

  /* Empty end-elliptic list from nothing: expecting error */
  listobj = sollya_lib_build_end_elliptic_list(NULL);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  /* Empty end-elliptic list with an invalid pointer after NULL: expecting error */
  listobj = sollya_lib_build_end_elliptic_list(NULL, 0x1);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  /* List with one non-integer element, with invalide pointer after NULL */
  listobj = sollya_lib_build_end_elliptic_list(SOLLYA_COS(SOLLYA_X_), NULL, 0x1);
  sollya_lib_printf("%b. ", listobj);
  if (sollya_lib_get_element_in_list(&tmp, listobj, 2)) {
    sollya_lib_printf("listobj[2] is %b\n", tmp); sollya_lib_clear_obj(tmp);
  }
  else sollya_lib_printf("listobj[2] does not exist.\n");
  sollya_lib_clear_obj(listobj);

  /* List with one integer element, with invalid pointer after NULL*/
  listobj = sollya_lib_build_end_elliptic_list(SOLLYA_CONST(3.), NULL, 0x1);
  sollya_lib_printf("%b. ", listobj);
  if (sollya_lib_get_element_in_list(&tmp, listobj, 2)) {
    sollya_lib_printf("listobj[2] is %b\n", tmp); sollya_lib_clear_obj(tmp);
  }
  else sollya_lib_printf("listobj[2] does not exist.\n");
  sollya_lib_clear_obj(listobj);

  /* List from an array. Ends with a non-integer element */
  listobj = sollya_lib_build_end_elliptic_list(SOLLYA_COS(SOLLYA_X_),
                                               SOLLYA_CONST(3.),
                                               sollya_lib_double_obj(),
                                               NULL);

  sollya_lib_printf("%b. ", listobj);
  if (sollya_lib_get_element_in_list(&tmp, listobj, 4)) {
    sollya_lib_printf("listobj[2] is %b\n", tmp); sollya_lib_clear_obj(tmp);
  }
  else sollya_lib_printf("listobj[2] does not exist.\n");
  sollya_lib_clear_obj(listobj);

  /* List from an array with 2 elements of the array. Ends with an integer element */
  listobj = sollya_lib_build_end_elliptic_list(SOLLYA_COS(SOLLYA_X_),
                                               SOLLYA_CONST(3.),
                                               NULL);
  sollya_lib_printf("%b. ", listobj);
  if (sollya_lib_get_element_in_list(&tmp, listobj, 4)) {
    sollya_lib_printf("listobj[4] is %b\n", tmp); sollya_lib_clear_obj(tmp);
  }
  else sollya_lib_printf("listobj[4] does not exist.\n");
  sollya_lib_clear_obj(listobj);

  sollya_lib_close();
  return 0;
}
