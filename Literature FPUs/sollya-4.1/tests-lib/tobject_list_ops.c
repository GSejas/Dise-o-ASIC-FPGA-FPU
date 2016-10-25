#include <sollya.h>


int main(void) {
  sollya_obj_list_t list1, iter, list2;
  sollya_obj_t a, b, c, d, e;
  int i;

  sollya_lib_init();

  a = SOLLYA_EXP(SOLLYA_ASIN(SOLLYA_X_));
  b = sollya_lib_parse_string("\"Hello\"");
  c = sollya_lib_on();
  d = sollya_lib_parse_string("[| 1, ..., 17... |]");
  e = sollya_lib_parse_string("1 + x");

  list1 = sollya_lib_construct_object_list(a, sollya_lib_construct_object_list(b, sollya_lib_construct_object_list(c, sollya_lib_construct_object_list(d, NULL))));

  for (iter = list1, i = 0; !sollya_lib_is_empty_object_list(iter); iter = sollya_lib_get_object_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list1 before copy and modification of the copy: %b\n", i, sollya_lib_get_object_list_head(iter));
  }

  list2 = sollya_lib_copy_object_list(list1);
  list2 = sollya_lib_construct_object_list(e, list2);

  for (iter = list1, i = 0; !sollya_lib_is_empty_object_list(iter); iter = sollya_lib_get_object_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list1 after copy and modification of the copy: %b\n", i, sollya_lib_get_object_list_head(iter));
  }

  for (iter = list2, i = 0; !sollya_lib_is_empty_object_list(iter); iter = sollya_lib_get_object_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list2 after copy and modification of the copy: %b\n", i, sollya_lib_get_object_list_head(iter));
  }

  sollya_lib_clear_object_list(list1);
  sollya_lib_clear_object_list(list2);

  sollya_lib_close();

  return 0;
}
