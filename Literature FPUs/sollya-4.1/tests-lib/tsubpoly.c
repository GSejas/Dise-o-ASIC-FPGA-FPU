#include <sollya.h>

int main(void) {
  sollya_obj_t a[8], b[5], c[8 * 5];
  int i, j;

  sollya_lib_init();

  a[0] = SOLLYA_ADD(SOLLYA_X_, SOLLYA_ADD(SOLLYA_CONST(1.0),SOLLYA_POW(SOLLYA_X_,SOLLYA_CONST(2.0))));
  a[1] = SOLLYA_ADD(SOLLYA_MUL(SOLLYA_ADD(SOLLYA_MUL(SOLLYA_CONST(5.0),SOLLYA_X_),SOLLYA_CONST(7.0)),SOLLYA_X_),SOLLYA_CONST(9.0));
  a[2] = SOLLYA_ADD(SOLLYA_ADD(SOLLYA_X_, SOLLYA_ADD(SOLLYA_CONST(1.0),SOLLYA_POW(SOLLYA_X_,SOLLYA_CONST(2.0)))),
		    SOLLYA_ADD(SOLLYA_MUL(SOLLYA_ADD(SOLLYA_MUL(SOLLYA_CONST(5.0),SOLLYA_X_),SOLLYA_CONST(7.0)),SOLLYA_X_),SOLLYA_CONST(9.0)));
  a[3] = SOLLYA_ADD(SOLLYA_X_, SOLLYA_ADD(SOLLYA_EXP(SOLLYA_CONST(1.0)),SOLLYA_POW(SOLLYA_X_,SOLLYA_CONST(2.0))));
  a[4] = SOLLYA_ADD(SOLLYA_MUL(SOLLYA_ADD(SOLLYA_MUL(SOLLYA_LOG(SOLLYA_CONST(5.0)),SOLLYA_X_),SOLLYA_ATAN(SOLLYA_CONST(7.0))),SOLLYA_X_),SOLLYA_ERFC(SOLLYA_CONST(9.0)));
  a[5] = SOLLYA_ADD(SOLLYA_ADD(SOLLYA_X_, SOLLYA_ADD(SOLLYA_EXP(SOLLYA_CONST(1.0)),SOLLYA_POW(SOLLYA_X_,SOLLYA_CONST(2.0)))),
		    SOLLYA_ADD(SOLLYA_MUL(SOLLYA_ADD(SOLLYA_MUL(SOLLYA_LOG(SOLLYA_CONST(5.0)),SOLLYA_X_),SOLLYA_ATAN(SOLLYA_CONST(7.0))),SOLLYA_X_),SOLLYA_ERFC(SOLLYA_CONST(9.0))));
  a[6] = SOLLYA_EXP(SOLLYA_X_);
  a[7] = SOLLYA_POW(SOLLYA_ADD(SOLLYA_X_,SOLLYA_CONST(1.0)),SOLLYA_CONST(15));

  b[0] = sollya_lib_parse_string("[|1|]");
  b[1] = sollya_lib_parse_string("[|1,3,5|]");
  b[2] = sollya_lib_parse_string("[|0,2,7,11...|]");
  b[3] = sollya_lib_parse_string("[|1,3,5,17|]");
  b[4] = sollya_lib_parse_string("[|0...|]");

  for (i=0;i<8;i++) {
    for (j=0;j<5;j++) {
      c[i * 5 + j] = sollya_lib_subpoly(a[i],b[j]);
      sollya_lib_printf("The subpolynomial with monomials %b taken out of %b is %b\n",b[j],a[i],c[i * 5 + j]);
    }
  }

  for (i=0;i<8;i++) {
    sollya_lib_clear_obj(a[i]);
  }

  for (i=0;i<5;i++) {
    sollya_lib_clear_obj(b[i]);
  }
  
  for (i=0;i<8*5;i++) {
    sollya_lib_clear_obj(c[i]);
  }

  sollya_lib_close();
  return 0;
}

