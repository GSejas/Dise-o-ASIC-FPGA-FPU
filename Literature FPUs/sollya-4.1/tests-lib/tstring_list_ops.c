#include <sollya.h>
#include <stdlib.h>
#include <string.h>

char *tstring_list_ops_make_char_ptr(char *x) {
  char *res;

  res = (char *) calloc(strlen(x) + 1, sizeof(char));
  if (res == NULL) exit(1);
  
  strcpy(res, x);

  return res;
}

int main(void) {
  sollya_string_list_t list1, iter, list2;
  char *a, *b, *c, *d, *e;
  int i;

  sollya_lib_init();

  a = tstring_list_ops_make_char_ptr("of");
  b = tstring_list_ops_make_char_ptr("milk");
  c = tstring_list_ops_make_char_ptr("and");
  d = tstring_list_ops_make_char_ptr("honey");
  e = tstring_list_ops_make_char_ptr("land"); 
  
  list1 = sollya_lib_construct_string_list(a, sollya_lib_construct_string_list(b, sollya_lib_construct_string_list(c, sollya_lib_construct_string_list(d, NULL))));
  
  for (iter = list1, i = 0; !sollya_lib_is_empty_string_list(iter); iter = sollya_lib_get_string_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list1 before copy and modification of the copy: \"%s\"\n", i, sollya_lib_get_string_list_head(iter));
  }

  list2 = sollya_lib_copy_string_list(list1);
  list2 = sollya_lib_construct_string_list(e, list2);
  
  for (iter = list1, i = 0; !sollya_lib_is_empty_string_list(iter); iter = sollya_lib_get_string_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list1 after copy and modification of the copy: \"%s\"\n", i, sollya_lib_get_string_list_head(iter));
  }

  for (iter = list2, i = 0; !sollya_lib_is_empty_string_list(iter); iter = sollya_lib_get_string_list_tail(iter), i++) {
    sollya_lib_printf("%d-th element in list2 after copy and modification of the copy: \"%s\"\n", i, sollya_lib_get_string_list_head(iter));
  }

  sollya_lib_clear_string_list(list1);
  sollya_lib_clear_string_list(list2);

  sollya_lib_close();

  return 0;
}
