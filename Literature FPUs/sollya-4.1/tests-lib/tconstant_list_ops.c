#include <sollya.h>
#include <stdlib.h>

mpfr_t *tconstant_list_ops_make_mpfr_ptr(double x) {
  mpfr_t *res;

  res = (mpfr_t *) malloc(sizeof(mpfr_t));
  if (res == NULL) exit(1);

  mpfr_init2(*res, 64);
  mpfr_set_d(*res, x, GMP_RNDN);
  
  return res;
}

int main(void) {
  sollya_constant_list_t list1, iter, list2;
  mpfr_t *a, *b, *c, *d, *e;
  int i;

  sollya_lib_init();

  a = tconstant_list_ops_make_mpfr_ptr(0.5);
  b = tconstant_list_ops_make_mpfr_ptr(1.25);
  c = tconstant_list_ops_make_mpfr_ptr(3.75);
  d = tconstant_list_ops_make_mpfr_ptr(9.125);
  e = tconstant_list_ops_make_mpfr_ptr(17.0e17); 
  
  list1 = sollya_lib_construct_constant_list(a, sollya_lib_construct_constant_list(b, sollya_lib_construct_constant_list(c, sollya_lib_construct_constant_list(d, NULL))));
  
  for (iter = list1, i = 0; !sollya_lib_is_empty_constant_list(iter); iter = sollya_lib_get_constant_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list1 before copy and modification of the copy: %v\n", i, *sollya_lib_get_constant_list_head(iter));
  }

  list2 = sollya_lib_copy_constant_list(list1);
  list2 = sollya_lib_construct_constant_list(e, list2);
  
  for (iter = list1, i = 0; !sollya_lib_is_empty_constant_list(iter); iter = sollya_lib_get_constant_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list1 after copy and modification of the copy: %v\n", i, *sollya_lib_get_constant_list_head(iter));
  }

  for (iter = list2, i = 0; !sollya_lib_is_empty_constant_list(iter); iter = sollya_lib_get_constant_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list2 after copy and modification of the copy: %v\n", i, *sollya_lib_get_constant_list_head(iter));
  }

  sollya_lib_clear_constant_list(list1);
  sollya_lib_clear_constant_list(list2);

  sollya_lib_close();

  return 0;
}
