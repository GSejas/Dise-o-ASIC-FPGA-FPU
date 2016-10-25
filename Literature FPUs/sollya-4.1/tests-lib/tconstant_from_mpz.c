#include <sollya.h>

int main(void) {
  sollya_obj_t a;
  mpz_t b;

  sollya_lib_init();
  mpz_init(b);

  mpz_set_ui(b, 17);
  a = sollya_lib_constant_from_mpz(b);
  gmp_printf("%Zd", b); sollya_lib_printf(" has been converted to %b\n\n", a);
  sollya_lib_clear_obj(a);

  mpz_set_si(b, -42);
  a = sollya_lib_constant_from_mpz(b);
  gmp_printf("%Zd", b); sollya_lib_printf(" has been converted to %b\n\n", a);
  sollya_lib_clear_obj(a);

  mpz_set_str(b, "1606938044258990275541962092341162602522202993782792835301377", 10);
  a = sollya_lib_constant_from_mpz(b);
  gmp_printf("%Zd", b); sollya_lib_printf(" has been converted to %b\n\n", a);
  sollya_lib_clear_obj(a);

  mpz_clear(b);
  sollya_lib_close();
  return 0;
}
