#include <sollya.h>

int main(void) {
  sollya_obj_t a;
  mpq_t b;

  sollya_lib_init();
  mpq_init(b);

  mpq_set_ui(b, 17, 1);
  a = sollya_lib_constant_from_mpq(b);
  sollya_lib_printf("%r has been converted to %b\n\n", b, a);
  sollya_lib_clear_obj(a);

  mpq_set_si(b, -42, 1);
  a = sollya_lib_constant_from_mpq(b);
  sollya_lib_printf("%r has been converted to %b\n\n", b, a);
  sollya_lib_clear_obj(a);

  mpq_set_str(b, "-1606938044258990275541962092341162602522202993782792835301377/1532495540865888858358347027150309183618739122183602169", 10);
  a = sollya_lib_constant_from_mpq(b);
  sollya_lib_printf("%r has been converted to %b\n\n", b, a);
  sollya_lib_clear_obj(a);

  mpq_clear(b);
  sollya_lib_close();
  return 0;
}
