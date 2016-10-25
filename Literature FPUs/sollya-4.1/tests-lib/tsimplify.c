#include <sollya.h>

int main(void) {
  sollya_obj_t a[4], b[4];
  int i;

  sollya_lib_init();

  a[0] = SOLLYA_SUB(SOLLYA_ADD(SOLLYA_X_,SOLLYA_CONST(2.0)),SOLLYA_ADD(SOLLYA_X_,SOLLYA_CONST(2.0)));
  a[1] = SOLLYA_ASIN(SOLLYA_EXP(SOLLYA_SUB(SOLLYA_ADD(SOLLYA_X_,SOLLYA_CONST(2.0)),SOLLYA_ADD(SOLLYA_X_,SOLLYA_CONST(2.0)))));
  a[2] = SOLLYA_SUB(sollya_lib_parse_string("exp(x) - 1"),
		    sollya_lib_parse_string("expm1(x)"));
  a[3] = SOLLYA_ADD(SOLLYA_CONST(1.0),SOLLYA_CONST(1e-300));

  for (i=0;i<4;i++) {
    b[i] = sollya_lib_simplify(a[i]);
  }

  for (i=0;i<4;i++) {
    sollya_lib_printf("%b can be safely simplified to %b.\n",a[i],b[i]);
  }

  for (i=0;i<4;i++) {
    sollya_lib_clear_obj(a[i]);
    sollya_lib_clear_obj(b[i]);
  }

  sollya_lib_close();
  return 0;
}

