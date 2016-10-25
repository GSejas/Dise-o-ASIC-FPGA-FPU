#include <sollya.h>


int main(void) {
  sollya_obj_t a, b;
  int ra, rb;
  sollya_obj_t *ea, *eb;
  char **ia, **ib;
  int na, nb;
  int i;

  sollya_lib_init();

  a = sollya_lib_parse_string("{ .a = 5; .b = exp(_x_); .c = { .d = 17; .e = sin(_x_) }}");
  b = SOLLYA_EXP(SOLLYA_X_);

  ea = NULL;
  ia = NULL;
  eb = NULL;
  ib = NULL;
  na = -1;
  nb = -1;

  ra = sollya_lib_get_structure_elements(&ia, &ea, &na, a);
  rb = sollya_lib_get_structure_elements(&ib, &eb, &nb, b);

  sollya_lib_printf("Is the Sollya object %b detected as a structure? %s. It contains %d elements, which are ", a, (ra?"Yes":"No"), na);
  if (ra) { 
    for (i=0;i<na;i++) sollya_lib_printf("%s -> %b, ", ia[i], ea[i]);
  } else {
    sollya_lib_printf("None");
  }
  sollya_lib_printf("\n");

  sollya_lib_printf("Is the Sollya object %b is detected as a structure? %s. It contains %d elements, which are ", b, (rb?"Yes":"No"), nb);
  if (rb) { 
    for (i=0;i<nb;i++) sollya_lib_printf("%s -> %b, ", ib[i], eb[i]);
  } else {
    sollya_lib_printf("None");
  }
  sollya_lib_printf("\n");

  if (ea != NULL) {
    for (i=0;i<na;i++) sollya_lib_clear_obj(ea[i]);
    sollya_lib_free(ea);
  }
  if (ia != NULL) {
    for (i=0;i<na;i++) sollya_lib_free(ia[i]);
    sollya_lib_free(ia);
  }

  if (eb != NULL) {
    for (i=0;i<nb;i++) sollya_lib_clear_obj(eb[i]);
    sollya_lib_free(eb);
  }
  if (ib != NULL) {
    for (i=0;i<nb;i++) sollya_lib_free(ib[i]);
    sollya_lib_free(ib);
  }

  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);

  sollya_lib_close();
  return 0;
}
