#include <sollya.h>

int main(void) {
  sollya_obj_t L[3];
  sollya_obj_t listobj, tmp;
  sollya_lib_init();

  /* Empty end-elliptic list from nothing: expecting error */
  listobj = sollya_lib_end_elliptic_list(NULL, 0);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  L[0] = SOLLYA_COS(SOLLYA_X_);
  L[1] = SOLLYA_CONST(3.);
  L[2] = sollya_lib_double_obj();

  /* Empty end-elliptic list from an invalid pointer: expecting error */
  listobj = sollya_lib_end_elliptic_list(L+17, 0);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  /* Empty end-elliptic list from a valid pointer: expecting error */
  listobj = sollya_lib_end_elliptic_list(L, 0);
  sollya_lib_printf("%b\n", listobj);
  sollya_lib_clear_obj(listobj);

  /* List with one non-integer element, out of an array of more elements */
  listobj = sollya_lib_end_elliptic_list(L, 1);
  sollya_lib_printf("%b. ", listobj);
  if (sollya_lib_get_element_in_list(&tmp, listobj, 2)) {
    sollya_lib_printf("listobj[2] is %b\n", tmp); sollya_lib_clear_obj(tmp);
  }
  else sollya_lib_printf("listobj[2] does not exist.\n");
  sollya_lib_clear_obj(listobj);

  /* List with one integer element, out of an array of more elements */
  listobj = sollya_lib_end_elliptic_list(L+1, 1);
  sollya_lib_printf("%b. ", listobj);
  if (sollya_lib_get_element_in_list(&tmp, listobj, 2)) {
    sollya_lib_printf("listobj[2] is %b\n", tmp); sollya_lib_clear_obj(tmp);
  }
  else sollya_lib_printf("listobj[2] does not exist.\n");
  sollya_lib_clear_obj(listobj);

  /* List from an array with all the elements of the array. Ends with a non-integer element */
  listobj = sollya_lib_end_elliptic_list(L, 3);
  sollya_lib_printf("%b. ", listobj);
  if (sollya_lib_get_element_in_list(&tmp, listobj, 4)) {
    sollya_lib_printf("listobj[2] is %b\n", tmp); sollya_lib_clear_obj(tmp);
  }
  else sollya_lib_printf("listobj[2] does not exist.\n");
  sollya_lib_clear_obj(listobj);

  /* List from an array with 2 elements of the array. Ends with an integer element */
  listobj = sollya_lib_end_elliptic_list(L, 2);
  sollya_lib_printf("%b. ", listobj);
  if (sollya_lib_get_element_in_list(&tmp, listobj, 4)) {
    sollya_lib_printf("listobj[4] is %b\n", tmp); sollya_lib_clear_obj(tmp);
  }
  else sollya_lib_printf("listobj[4] does not exist.\n");
  sollya_lib_clear_obj(listobj);


  sollya_lib_clear_obj(L[0]);
  sollya_lib_clear_obj(L[1]);
  sollya_lib_clear_obj(L[2]);
  sollya_lib_close();
  return 0;
}
