#include <sollya.h>

#define A_DIM 8

int main(void) {
  sollya_obj_t a[A_DIM], b[A_DIM];
  sollya_obj_t temp;
  int i;

  sollya_lib_init();

  temp = sollya_lib_off();
  sollya_lib_set_autosimplify(temp);
  sollya_lib_clear_obj(temp);

  a[0] = SOLLYA_SUB(SOLLYA_ADD(SOLLYA_X_,SOLLYA_CONST(2.0)),SOLLYA_ADD(SOLLYA_X_,SOLLYA_CONST(2.0)));
  a[1] = SOLLYA_ASIN(SOLLYA_EXP(SOLLYA_SUB(SOLLYA_ADD(SOLLYA_X_,SOLLYA_CONST(2.0)),SOLLYA_ADD(SOLLYA_X_,SOLLYA_CONST(2.0)))));
  a[2] = SOLLYA_SUB(sollya_lib_parse_string("exp(x) - 1"),
		    sollya_lib_parse_string("expm1(x)"));
  a[3] = SOLLYA_ADD(SOLLYA_CONST(1.0),SOLLYA_CONST(1e-300));
  a[4] = sollya_lib_parse_string("13/17 - 19/368");
  a[5] = sollya_lib_parse_string("((x + 1)^5 + exp(3)) - ((x + 1)^(log10(100000)) + exp(3 + 1b-1000))");
  a[6] = sollya_lib_parse_string("((x + 1)^5 + exp(3)) - ((x + 1)^5 + exp(3))");
  a[7] = sollya_lib_parse_string("-log(13)/log(17) + x * (sin(pi/3) - sqrt(3)/2) + log2(13)/log2(17)");

  for (i=0;i<A_DIM;i++) {
    b[i] = sollya_lib_dirtysimplify(a[i]);
    sollya_lib_printf("%b has been simplified (with possible rounding) to %b.\n",a[i],b[i]);
  }

  for (i=0;i<A_DIM;i++) {
    sollya_lib_clear_obj(a[i]);
    sollya_lib_clear_obj(b[i]);
  }

  sollya_lib_close();
  return 0;
}

