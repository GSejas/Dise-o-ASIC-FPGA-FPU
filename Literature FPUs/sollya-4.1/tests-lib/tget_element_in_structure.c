#include <sollya.h>
#include <stdlib.h>


int main(void) {
  sollya_obj_t a, b;
  sollya_obj_t ea, eb, ec, ed;
  int ra, rb, rc, rd;


  sollya_lib_init();

  a = sollya_lib_parse_string("{ .a = 5; .b = exp(_x_); .c = { .d = 17; .e = sin(_x_) }}");
  b = SOLLYA_EXP(SOLLYA_X_);

  ea = NULL;
  ra = sollya_lib_get_element_in_structure(&ea, "a", a);
  sollya_lib_printf("Does the Sollya object %b contain an element called \"a\"? %s. ",a,(ra?"Yes":"No"));
  if (ra) sollya_lib_printf("That element is %b.",ea);
  sollya_lib_printf("\n");

  eb = NULL;
  rb = sollya_lib_get_element_in_structure(&eb, "a", b);
  sollya_lib_printf("Does the Sollya object %b contain an element called \"a\"? %s. ",b,(rb?"Yes":"No"));
  if (rb) sollya_lib_printf("That element is %b.",eb);
  sollya_lib_printf("\n");

  ec = NULL;
  rc = sollya_lib_get_element_in_structure(&ec, "u", a);
  sollya_lib_printf("Does the Sollya object %b contain an element called \"u\"? %s. ",a,(rc?"Yes":"No"));
  if (rc) sollya_lib_printf("That element is %b.",ec);
  sollya_lib_printf("\n");

  ed = NULL;
  rd = sollya_lib_get_element_in_structure(&ec, "d", a);
  sollya_lib_printf("Does the Sollya object %b contain an element called \"d\"? %s. ",a,(rd?"Yes":"No"));
  if (rd) sollya_lib_printf("That element is %b.",ed);
  sollya_lib_printf("\n");

  if (ea != NULL) sollya_lib_clear_obj(ea);
  if (eb != NULL) sollya_lib_clear_obj(eb);
  if (ec != NULL) sollya_lib_clear_obj(ec);
  if (ed != NULL) sollya_lib_clear_obj(ed);


  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);

  sollya_lib_close();
  return 0;
}
