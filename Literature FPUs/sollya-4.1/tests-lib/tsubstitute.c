#include <sollya.h>

int main(void) {
  sollya_obj_t a[5], b[5], c[5 * 5];
  int i, j;

  sollya_lib_init();

  a[0] = SOLLYA_ADD(SOLLYA_X_, SOLLYA_ADD(SOLLYA_CONST(1.0),SOLLYA_POW(SOLLYA_X_,SOLLYA_CONST(2.0))));
  a[1] = SOLLYA_LOG(SOLLYA_X_);
  a[2] = SOLLYA_CONST(17.0);
  a[3] = SOLLYA_DIV(SOLLYA_X_,SOLLYA_CONST(13.0));
  a[4] = SOLLYA_DIV(SOLLYA_CONST(13.0),SOLLYA_X_);
  
  b[0] = SOLLYA_CONST(13.0);
  b[1] = SOLLYA_EXP(SOLLYA_X_);
  b[2] = SOLLYA_ADD(SOLLYA_MUL(SOLLYA_ADD(SOLLYA_MUL(SOLLYA_CONST(5.0),SOLLYA_X_),SOLLYA_CONST(7.0)),SOLLYA_X_),SOLLYA_CONST(9.0));
  b[3] = SOLLYA_SQRT(SOLLYA_X_);
  b[4] = SOLLYA_CONST(1001.0);

  for (i=0;i<5;i++) {
    for (j=0;j<5;j++) {
      c[i * 5 + j] = sollya_lib_substitute(a[i],b[j]);
      sollya_lib_printf("Substituting _x_ in %b with %b yields %b\n",a[i],b[j],c[i * 5 + j]);
    }
  }

  for (i=0;i<5;i++) {
    sollya_lib_clear_obj(a[i]);
    sollya_lib_clear_obj(b[i]);
  }
  
  for (i=0;i<5*5;i++) {
    sollya_lib_clear_obj(c[i]);
  }

  sollya_lib_close();
  return 0;
}

