#include <sollya.h>

#define A_DIM 34

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  default:
    sollya_lib_printf("Unexpected warning %d.\n", message);
  }
  return 0;
}

int main(void) {
  sollya_obj_t a[A_DIM], b[A_DIM];
  int i;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  a[0] = SOLLYA_CONST(17.0);
  a[1] = SOLLYA_EXP(SOLLYA_ADD(SOLLYA_SIN(SOLLYA_X_), SOLLYA_X_));
  a[2] = sollya_lib_parse_string("(x + 1)^7");
  a[3] = SOLLYA_SIN(SOLLYA_MUL(SOLLYA_CONST(17.0),SOLLYA_X_));
  a[4] = SOLLYA_X_;
  a[5] = SOLLYA_ADD(SOLLYA_EXP(SOLLYA_X_),SOLLYA_ATAN(SOLLYA_X_));
  a[6] = SOLLYA_SUB(SOLLYA_EXP(SOLLYA_X_),SOLLYA_ATAN(SOLLYA_X_));
  a[7] = SOLLYA_MUL(SOLLYA_EXP(SOLLYA_X_),SOLLYA_ATAN(SOLLYA_X_));
  a[8] = SOLLYA_DIV(SOLLYA_EXP(SOLLYA_X_),SOLLYA_ATAN(SOLLYA_X_));
  a[9] = SOLLYA_SQRT(SOLLYA_X_);
  a[10] = SOLLYA_EXP(SOLLYA_X_);
  a[11] = SOLLYA_LOG(SOLLYA_X_);
  a[12] = SOLLYA_LOG2(SOLLYA_X_);
  a[13] = SOLLYA_LOG10(SOLLYA_X_);
  a[14] = SOLLYA_SIN(SOLLYA_X_);
  a[15] = SOLLYA_COS(SOLLYA_X_);
  a[16] = SOLLYA_TAN(SOLLYA_X_);
  a[17] = SOLLYA_ASIN(SOLLYA_X_);
  a[18] = SOLLYA_ACOS(SOLLYA_X_);
  a[19] = SOLLYA_ATAN(SOLLYA_X_);
  a[20] = SOLLYA_POW(SOLLYA_EXP(SOLLYA_X_),SOLLYA_ATAN(SOLLYA_X_));
  a[21] = SOLLYA_NEG(SOLLYA_X_);
  a[22] = SOLLYA_ABS(SOLLYA_X_);
  a[23] = SOLLYA_ERF(SOLLYA_X_);
  a[24] = SOLLYA_ERFC(SOLLYA_X_);
  a[25] = SOLLYA_LOG1P(SOLLYA_X_);
  a[26] = SOLLYA_EXPM1(SOLLYA_X_);
  a[27] = SOLLYA_SINH(SOLLYA_X_);
  a[28] = SOLLYA_COSH(SOLLYA_X_);
  a[29] = SOLLYA_TANH(SOLLYA_X_);
  a[30] = SOLLYA_ASINH(SOLLYA_X_);
  a[31] = SOLLYA_ACOSH(SOLLYA_X_);
  a[32] = SOLLYA_ATANH(SOLLYA_X_);
  a[33] = SOLLYA_PI;

  for (i=0;i<A_DIM;i++) {
      b[i] = sollya_lib_diff(a[i]);
      sollya_lib_printf("The derivative of %b is %b\n",a[i],b[i]);
  }

  for (i=0;i<A_DIM;i++) {
    sollya_lib_clear_obj(a[i]);
  }

  for (i=0;i<A_DIM;i++) {
    sollya_lib_clear_obj(b[i]);
  }

  sollya_lib_close();
  return 0;
}

