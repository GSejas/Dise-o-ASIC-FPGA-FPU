#include <sollya.h>
#include <stdlib.h>

int main(void) {
  sollya_int_list_t list1, iter, list2;
  int a, b, c, d, e;
  int i;

  sollya_lib_init();

  a = 1;
  b = 2;
  c = 3;
  d = 4;
  e = 5;
  
  list1 = sollya_lib_construct_int_list(a, sollya_lib_construct_int_list(b, sollya_lib_construct_int_list(c, sollya_lib_construct_int_list(d, NULL))));
  
  for (iter = list1, i = 0; !sollya_lib_is_empty_int_list(iter); iter = sollya_lib_get_int_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list1 before copy and modification of the copy: %d\n", i, sollya_lib_get_int_list_head(iter));
  }

  list2 = sollya_lib_copy_int_list(list1);
  list2 = sollya_lib_construct_int_list(e, list2);
  
  for (iter = list1, i = 0; !sollya_lib_is_empty_int_list(iter); iter = sollya_lib_get_int_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list1 after copy and modification of the copy: %d\n", i, sollya_lib_get_int_list_head(iter));
  }

  for (iter = list2, i = 0; !sollya_lib_is_empty_int_list(iter); iter = sollya_lib_get_int_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list2 after copy and modification of the copy: %d\n", i, sollya_lib_get_int_list_head(iter));
  }

  sollya_lib_clear_int_list(list1);
  sollya_lib_clear_int_list(list2);

  sollya_lib_close();

  return 0;
}
