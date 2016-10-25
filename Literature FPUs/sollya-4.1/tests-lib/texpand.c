#include <sollya.h>

int main(void) {
  sollya_obj_t a[7], b[7];
  int i;

  sollya_lib_init();

  a[0] = SOLLYA_POW(SOLLYA_SUB(SOLLYA_POW(SOLLYA_ADD(SOLLYA_MUL(SOLLYA_CONST(2.0),SOLLYA_X_),SOLLYA_CONST(-3.0)),SOLLYA_CONST(3)),SOLLYA_POW(SOLLYA_X_,SOLLYA_CONST(5))),SOLLYA_CONST(2.0)); /* ( (2x+(-3))^3 - x^5 )^2 = 729 - 2916*x + 4860*x^2 - 4320*x^3 + 2160*x^4 - 522*x^5 - 44*x^6 + 72*x^7 - 16*x^8 + x^10 */
  a[1] = SOLLYA_EXP(SOLLYA_X_);
  a[2] = sollya_lib_parse_string("(x+3)^3 + sin((x+3)^3)");
  a[3] = sollya_lib_parse_string("horner((x^4 + x^2 + ((x + 3)^2)/(x + 4))^3)");
  a[4] = sollya_lib_parse_string("(((x + 1)/(x + 2)) * ((x + 3)/(x + 4)))/(((x + 5)/(x + 6)) * ((x + 7)/(x + 8)))");
  a[5] = sollya_lib_parse_string("(((x + 1)/(x + 2)) * ((x + 3)/(x + 4)))/x");
  a[6] = sollya_lib_parse_string("expand( (x+3)^3 )");

  for (i=0;i<7;i++) {
    b[i] = sollya_lib_expand(a[i]);
    sollya_lib_printf("%b after a call to 'expand' becomes %b.\n",a[i],b[i]);
  }

  for (i=0;i<7;i++) {
    sollya_lib_clear_obj(a[i]);
    sollya_lib_clear_obj(b[i]);
  }

  sollya_lib_close();
  return 0;
}
