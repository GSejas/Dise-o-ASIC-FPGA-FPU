#include <sollya.h>

int main(void) {
  sollya_obj_t a[5], b[5];
  int i;

  sollya_lib_init();

  a[0] = SOLLYA_POW(SOLLYA_SUB(SOLLYA_POW(SOLLYA_ADD(SOLLYA_MUL(SOLLYA_CONST(2.0),SOLLYA_X_),SOLLYA_CONST(-3.0)),SOLLYA_CONST(3)),SOLLYA_POW(SOLLYA_X_,SOLLYA_CONST(5))),SOLLYA_CONST(2.0)); /* ( (2x+(-3))^3 - x^5 )^2 = 729 - 2916*x + 4860*x^2 - 4320*x^3 + 2160*x^4 - 522*x^5 - 44*x^6 + 72*x^7 - 16*x^8 + x^10 */
  a[1] = SOLLYA_EXP(SOLLYA_X_);
  a[2] = SOLLYA_ADD(sollya_lib_copy_obj(a[0]),SOLLYA_SIN(sollya_lib_copy_obj(a[0])));
  a[3] = sollya_lib_parse_string("3*x^5 + 2*x^4 + 7*x");
  a[4] = sollya_lib_horner(a[3]);

  for (i=0;i<5;i++) {
    b[i] = sollya_lib_horner(a[i]);
    sollya_lib_printf("The hornerized version of %b is %b.\n",a[i],b[i]);
  }

  for (i=0;i<5;i++) {
    sollya_lib_clear_obj(a[i]);
    sollya_lib_clear_obj(b[i]);
  }

  sollya_lib_close();
  return 0;
}
