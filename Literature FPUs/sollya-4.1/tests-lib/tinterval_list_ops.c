#include <sollya.h>
#include <stdlib.h>

mpfi_t *tinterval_list_ops_make_mpfi_ptr(double l, double r) {
  mpfi_t *res;

  res = (mpfi_t *) malloc(sizeof(mpfi_t));
  if (res == NULL) exit(1);

  mpfi_init2(*res, 64);
  mpfi_interv_d(*res, l, r);
  
  return res;
}

int main(void) {
  sollya_interval_list_t list1, iter, list2;
  mpfi_t *a, *b, *c, *d, *e;
  int i;

  sollya_lib_init();

  a = tinterval_list_ops_make_mpfi_ptr(0.5,0.75);
  b = tinterval_list_ops_make_mpfi_ptr(1.25,1.75);
  c = tinterval_list_ops_make_mpfi_ptr(3.75,3.75);
  d = tinterval_list_ops_make_mpfi_ptr(9.125,12.125);
  e = tinterval_list_ops_make_mpfi_ptr(17.0e17,1700000000000000256.); 
  
  list1 = sollya_lib_construct_interval_list(a, sollya_lib_construct_interval_list(b, sollya_lib_construct_interval_list(c, sollya_lib_construct_interval_list(d, NULL))));
  
  for (iter = list1, i = 0; !sollya_lib_is_empty_interval_list(iter); iter = sollya_lib_get_interval_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list1 before copy and modification of the copy: %w\n", i, *sollya_lib_get_interval_list_head(iter));
  }

  list2 = sollya_lib_copy_interval_list(list1);
  list2 = sollya_lib_construct_interval_list(e, list2);
  
  for (iter = list1, i = 0; !sollya_lib_is_empty_interval_list(iter); iter = sollya_lib_get_interval_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list1 after copy and modification of the copy: %w\n", i, *sollya_lib_get_interval_list_head(iter));
  }

  for (iter = list2, i = 0; !sollya_lib_is_empty_interval_list(iter); iter = sollya_lib_get_interval_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list2 after copy and modification of the copy: %w\n", i, *sollya_lib_get_interval_list_head(iter));
  }

  sollya_lib_clear_interval_list(list1);
  sollya_lib_clear_interval_list(list2);

  sollya_lib_close();

  return 0;
}
