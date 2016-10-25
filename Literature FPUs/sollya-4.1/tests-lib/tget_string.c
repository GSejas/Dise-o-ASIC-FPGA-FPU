#include <sollya.h>

int main(void) {
  sollya_obj_t a;
  char *s;


  sollya_lib_init();

  a = sollya_lib_parse_string("\"Hello, World!\"");
  if(!sollya_lib_get_string(&s, a)) sollya_lib_printf("%b is not a string\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to \"%s\"\n\n", a, s);
    sollya_lib_free(s);
  }
  sollya_lib_clear_obj(a);


  a = sollya_lib_parse_string("[1; 2]");
  if(!sollya_lib_get_string(&s, a)) sollya_lib_printf("%b is not a string\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to \"%s\"\n\n", a, s);
    sollya_lib_free(s);
  }
  sollya_lib_clear_obj(a);


  a = sollya_lib_parse_string("\"\"");
  if(!sollya_lib_get_string(&s, a)) sollya_lib_printf("%b is not a string\n\n", a);
  else {
    sollya_lib_printf("%b has been converted to \"%s\"\n\n", a, s);
    sollya_lib_free(s);
  }
  sollya_lib_clear_obj(a);

  sollya_lib_close();
  return 0;
}
