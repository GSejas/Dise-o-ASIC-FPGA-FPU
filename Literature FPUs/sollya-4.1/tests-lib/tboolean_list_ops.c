#include <sollya.h>
#include <stdlib.h>

int main(void) {
  sollya_boolean_list_t list1, iter, list2;
  int a, b, c, d, e;
  int i;

  sollya_lib_init();

  a = 1;
  b = 0;
  c = 1;
  d = 1;
  e = 0;
  
  list1 = sollya_lib_construct_boolean_list(a, sollya_lib_construct_boolean_list(b, sollya_lib_construct_boolean_list(c, sollya_lib_construct_boolean_list(d, NULL))));
  
  for (iter = list1, i = 0; !sollya_lib_is_empty_boolean_list(iter); iter = sollya_lib_get_boolean_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list1 before copy and modification of the copy: %s\n", i, (sollya_lib_get_boolean_list_head(iter)?"true":"false"));
  }

  list2 = sollya_lib_copy_boolean_list(list1);
  list2 = sollya_lib_construct_boolean_list(e, list2);
  
  for (iter = list1, i = 0; !sollya_lib_is_empty_boolean_list(iter); iter = sollya_lib_get_boolean_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list1 after copy and modification of the copy: %s\n", i, (sollya_lib_get_boolean_list_head(iter)?"true":"false"));
  }

  for (iter = list2, i = 0; !sollya_lib_is_empty_boolean_list(iter); iter = sollya_lib_get_boolean_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list2 after copy and modification of the copy: %s\n", i, (sollya_lib_get_boolean_list_head(iter)?"true":"false"));
  }

  sollya_lib_clear_boolean_list(list1);
  sollya_lib_clear_boolean_list(list2);

  sollya_lib_close();

  return 0;
}
