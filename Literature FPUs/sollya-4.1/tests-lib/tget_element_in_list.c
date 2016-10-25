#include <sollya.h>
#include <sys/time.h>

int main(void) {
  sollya_obj_t listobj;
  sollya_obj_t tab[2000];
  sollya_obj_t a;
  int i, k;
  struct timeval t1;
  struct timeval t2;
  double length1;
  double length2;

  sollya_lib_init();

  /* Empty list */
  listobj = sollya_lib_build_list(NULL);
  a = NULL;
  i = 0;
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Success on %b : %b (i=%d)\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n", listobj, i, a);
  }
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Second call on %b : %b (i=%d)\n\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n\n", listobj, i, a);
  }
  sollya_lib_clear_obj(listobj);


  /* Negative index on a regular list */
  listobj = sollya_lib_build_list(SOLLYA_CONST(3.),
                                  SOLLYA_COS(SOLLYA_X_),
                                  sollya_lib_double_obj(),
                                  NULL);
  a = NULL;
  i = -1;
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Success on %b : %b (i=%d)\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n", listobj, i, a);
  }
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Second call on %b : %b (i=%d)\n\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n\n", listobj, i, a);
  }
  sollya_lib_clear_obj(listobj);


  /* Out-of-bounds index on a regular list */
  listobj = sollya_lib_build_list(SOLLYA_CONST(3.),
                                  SOLLYA_COS(SOLLYA_X_),
                                  sollya_lib_double_obj(),
                                  NULL);
  a = NULL;
  i = 3;
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Success on %b : %b (i=%d)\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n", listobj, i, a);
  }
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Second call on %b : %b (i=%d)\n\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n\n", listobj, i, a);
  }
  sollya_lib_clear_obj(listobj);


  /* First element on a regular list */
  listobj = sollya_lib_build_list(SOLLYA_CONST(3.),
                                  SOLLYA_COS(SOLLYA_X_),
                                  sollya_lib_double_obj(),
                                  NULL);
  a = NULL;
  i=0;
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Success on %b : %b (i=%d)\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n", listobj, i, a);
  }
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Second call on %b : %b (i=%d)\n\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n\n", listobj, i, a);
  }
  sollya_lib_clear_obj(listobj);


  /* Last element on a regular list */
  listobj = sollya_lib_build_list(SOLLYA_CONST(3.),
                                  SOLLYA_COS(SOLLYA_X_),
                                  sollya_lib_double_obj(),
                                  NULL);
  a = NULL;
  i=2;
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Success on %b : %b (i=%d)\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n", listobj, i, a);
  }
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Second call on %b : %b (i=%d)\n\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n\n", listobj, i, a);
  }
  sollya_lib_clear_obj(listobj);


  /* Negative index on an end-elliptic list */
  listobj = sollya_lib_build_end_elliptic_list(SOLLYA_CONST(3.),
                                               SOLLYA_COS(SOLLYA_X_),
                                               sollya_lib_double_obj(),
                                               NULL);
  a = NULL;
  i=-1;
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Success on %b : %b (i=%d)\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n", listobj, i, a);
  }
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Second call on %b : %b (i=%d)\n\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n\n", listobj, i, a);
  }
  sollya_lib_clear_obj(listobj);


  /* index after the ellipsis on an end-elliptic list ending with a non-integer element */
  listobj = sollya_lib_build_end_elliptic_list(SOLLYA_CONST(3.),
                                               SOLLYA_COS(SOLLYA_X_),
                                               sollya_lib_double_obj(),
                                               NULL);
  a = NULL;
  i=3;
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Success on %b : %b (i=%d)\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n", listobj, i, a);
  }
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Second call on %b : %b (i=%d)\n\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n\n", listobj, i, a);
  }
  sollya_lib_clear_obj(listobj);


  /* index after the ellipsis on an end-elliptic list ending with an integer element */
  listobj = sollya_lib_build_end_elliptic_list(SOLLYA_PI,
                                               SOLLYA_COS(SOLLYA_X_),
                                               SOLLYA_CONST(4.),
                                               NULL);
  a = NULL;
  i=3;
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Success on %b : %b (i=%d)\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n", listobj, i, a);
  }
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Second call on %b : %b (i=%d)\n\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n\n", listobj, i, a);
  }
  sollya_lib_clear_obj(listobj);


  /* First element on an end-elliptic list */
  listobj = sollya_lib_build_end_elliptic_list(SOLLYA_PI,
                                               SOLLYA_COS(SOLLYA_X_),
                                               SOLLYA_CONST(4.),
                                               NULL);
  a = NULL;
  i=0;
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Success on %b : %b (i=%d)\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n", listobj, i, a);
  }
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Second call on %b : %b (i=%d)\n\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n\n", listobj, i, a);
  }
  sollya_lib_clear_obj(listobj);


  /* Last element before the ellipsis on an end-elliptic list */
  listobj = sollya_lib_build_end_elliptic_list(SOLLYA_PI,
                                               SOLLYA_COS(SOLLYA_X_),
                                               SOLLYA_CONST(4.),
                                               NULL);
  a = NULL;
  i=2;
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Success on %b : %b (i=%d)\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n", listobj, i, a);
  }
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Second call on %b : %b (i=%d)\n\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n\n", listobj, i, a);
  }
  sollya_lib_clear_obj(listobj);


  /* Not a list */
  listobj = SOLLYA_COS(SOLLYA_X_);
  a = NULL;
  i=0;
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Success on %b : %b (i=%d)\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n", listobj, i, a);
  }
  if (sollya_lib_get_element_in_list(&a, listobj, i)) {
    sollya_lib_printf("Second call on %b : %b (i=%d)\n\n", listobj, a, i);
    sollya_lib_clear_obj(a);
  }
  else {
    sollya_lib_printf("Failure on %b (i=%d and a=%b).\n\n", listobj, i, a);
  }
  sollya_lib_clear_obj(listobj);


  /* Time Complexity */
  for(i=0;i<2000;i++) tab[i] = SOLLYA_CONST(i);

  listobj = sollya_lib_list(tab, 1000);
  gettimeofday(&t1, NULL);
  for(k=0;k<10000;k++) {
    sollya_lib_get_element_in_list(&a, listobj, 999);
    sollya_lib_clear_obj(a);
  }
  gettimeofday(&t2, NULL);
  length1 = (double)(t2.tv_sec - t1.tv_sec) * 1000000. +
    (double)(t2.tv_usec - t1.tv_usec);
  sollya_lib_clear_obj(listobj);

  listobj = sollya_lib_list(tab, 2000);
  gettimeofday(&t1, NULL);
  for(k=0;k<10000;k++) {
    sollya_lib_get_element_in_list(&a, listobj, 1999);
    sollya_lib_clear_obj(a);
  }
  gettimeofday(&t2, NULL);
  length2 = (double)(t2.tv_sec - t1.tv_sec) * 1000000. +
    (double)(t2.tv_usec - t1.tv_usec);
  sollya_lib_clear_obj(listobj);

  if ((0.75 <= length2/length1) && (length2/length1 <= 1.25))
    sollya_lib_printf("Testing that a call to get_element_in_list has complexity O(1): OK\n");
  else
    sollya_lib_printf("Testing that a call to get_element_in_list has complexity O(1): not OK. Observed ratio: %g (should be close to 1 for O(1) complexity, and close to 2 for linear complexity)\n", length2/length1);

  for(i=0;i<2000;i++) sollya_lib_clear_obj(tab[i]);

 sollya_lib_close();

  return 0;
}
