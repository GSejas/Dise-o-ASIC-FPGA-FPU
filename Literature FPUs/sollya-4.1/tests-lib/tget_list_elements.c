#include <sollya.h>

int main(void) {
  sollya_obj_t listobj;
  sollya_obj_t *ptr;
  int i, n, end_ell;

  sollya_lib_init();

  /* Empty list */
  listobj = sollya_lib_build_list(NULL);
  n = -1; end_ell = -1; ptr = NULL;
  if (sollya_lib_get_list_elements(&ptr, &n, &end_ell, listobj)) {
    sollya_lib_printf("Success on %b (n=%d and end_ell=%d).", listobj, n, end_ell);
    for(i=0;i<n;i++) sollya_lib_printf(" %b", ptr[i]);
    sollya_lib_printf("\n");
    for(i=0;i<n;i++) sollya_lib_clear_obj(ptr[i]);
    sollya_lib_free(ptr);
  }
  else {
    sollya_lib_printf("Failure on %b (n=%d, end_ell=%d, ptr=%s).\n", listobj, n, end_ell, (ptr==NULL)?"NULL":"non NULL pointer");
  }
  sollya_lib_clear_obj(listobj);


  /* List with a single element */
  listobj = sollya_lib_build_list(SOLLYA_CONST(2.), NULL);
  n = -1; end_ell = -1; ptr = NULL;
  if (sollya_lib_get_list_elements(&ptr, &n, &end_ell, listobj)) {
    sollya_lib_printf("Success on %b (n=%d and end_ell=%d).", listobj, n, end_ell);
    for(i=0;i<n;i++) sollya_lib_printf(" %b", ptr[i]);
    sollya_lib_printf("\n");
    for(i=0;i<n;i++) sollya_lib_clear_obj(ptr[i]);
    sollya_lib_free(ptr);
  }
  else {
    sollya_lib_printf("Failure on %b (n=%d, end_ell=%d, ptr=%s).\n", listobj, n, end_ell, (ptr==NULL)?"NULL":"non NULL pointer");
  }
  sollya_lib_clear_obj(listobj);

  /* List with many elements */
  listobj = sollya_lib_build_list(SOLLYA_CONST(2.),
                                  SOLLYA_SIN(SOLLYA_X_),
                                  sollya_lib_double_obj(),
                                  NULL);
  n = -1; end_ell = -1; ptr = NULL;
  if (sollya_lib_get_list_elements(&ptr, &n, &end_ell, listobj)) {
    sollya_lib_printf("Success on %b (n=%d and end_ell=%d).", listobj, n, end_ell);
    for(i=0;i<n;i++) sollya_lib_printf(" %b", ptr[i]);
    sollya_lib_printf("\n");
    for(i=0;i<n;i++) sollya_lib_clear_obj(ptr[i]);
    sollya_lib_free(ptr);
  }
  else {
    sollya_lib_printf("Failure on %b (n=%d, end_ell=%d, ptr=%s).\n", listobj, n, end_ell, (ptr==NULL)?"NULL":"non NULL pointer");
  }
  sollya_lib_clear_obj(listobj);

  /* End-elliptic list with a single element */
  listobj = sollya_lib_build_end_elliptic_list(SOLLYA_CONST(2.), NULL);
  n = -1; end_ell = -1; ptr = NULL;
  if (sollya_lib_get_list_elements(&ptr, &n, &end_ell, listobj)) {
    sollya_lib_printf("Success on %b (n=%d and end_ell=%d).", listobj, n, end_ell);
    for(i=0;i<n;i++) sollya_lib_printf(" %b", ptr[i]);
    sollya_lib_printf("\n");
    for(i=0;i<n;i++) sollya_lib_clear_obj(ptr[i]);
    sollya_lib_free(ptr);
  }
  else {
    sollya_lib_printf("Failure on %b (n=%d, end_ell=%d, ptr=%s).\n", listobj, n, end_ell, (ptr==NULL)?"NULL":"non NULL pointer");
  }
  sollya_lib_clear_obj(listobj);

  /* End-elliptic list with many elements */
  listobj = sollya_lib_build_end_elliptic_list(SOLLYA_CONST(2.),
                                               SOLLYA_SIN(SOLLYA_X_),
                                               sollya_lib_double_obj(),
                                               NULL);
  n = -1; end_ell = -1; ptr = NULL;
  if (sollya_lib_get_list_elements(&ptr, &n, &end_ell, listobj)) {
    sollya_lib_printf("Success on %b (n=%d and end_ell=%d).", listobj, n, end_ell);
    for(i=0;i<n;i++) sollya_lib_printf(" %b", ptr[i]);
    sollya_lib_printf("\n");
    for(i=0;i<n;i++) sollya_lib_clear_obj(ptr[i]);
    sollya_lib_free(ptr);
  }
  else {
    sollya_lib_printf("Failure on %b (n=%d, end_ell=%d, ptr=%s).\n", listobj, n, end_ell, (ptr==NULL)?"NULL":"non NULL pointer");
  }
  sollya_lib_clear_obj(listobj);

  /* Non list object */
  listobj = sollya_lib_double_obj();
  n = -1; end_ell = -1; ptr = NULL;
  if (sollya_lib_get_list_elements(&ptr, &n, &end_ell, listobj)) {
    sollya_lib_printf("Success on %b (n=%d and end_ell=%d).", listobj, n, end_ell);
    for(i=0;i<n;i++) sollya_lib_printf(" %b", ptr[i]);
    sollya_lib_printf("\n");
    for(i=0;i<n;i++) sollya_lib_clear_obj(ptr[i]);
    sollya_lib_free(ptr);
  }
  else {
    sollya_lib_printf("Failure on %b (n=%d, end_ell=%d, ptr=%s).\n", listobj, n, end_ell, (ptr==NULL)?"NULL":"non NULL pointer");
  }
  sollya_lib_clear_obj(listobj);


  sollya_lib_close();
  return 0;
}
