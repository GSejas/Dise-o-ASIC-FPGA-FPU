#include <sollya.h>

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  case SOLLYA_MSG_FAITHFUL_ROUNDING_FOR_EXPR_THAT_SHOULD_BE_CONST:
    sollya_lib_printf("An expression should have been a constant but it is just a constant expression.\n");
    break;
  default:
    sollya_lib_printf("Unexpected warning %d\n", message);
  }
  return 0;
}


int main(void) {
  sollya_obj_t a[8];
  int i;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  a[0] = SOLLYA_PI;
  a[1] = SOLLYA_CONST(20.0);
  a[2] = sollya_lib_round_to_nearest();
  a[3] = sollya_lib_round(a[0],a[1],a[2]);
  a[4] = sollya_lib_exponent(a[3]);
  a[5] = sollya_lib_mantissa(a[3]);
  a[6] = SOLLYA_SUB(sollya_lib_copy_obj(a[3]),SOLLYA_MUL(sollya_lib_copy_obj(a[5]),SOLLYA_POW(SOLLYA_CONST(2.0),sollya_lib_copy_obj(a[4]))));
  a[7] = sollya_lib_simplify(a[6]);
  
  sollya_lib_printf("val = %b, mantissa = %b, exponent = %b, val - mantissa * 2^exponent = %b\n", a[3], a[5], a[4], a[7]);

  for (i=0;i<8;i++) {
    sollya_lib_clear_obj(a[i]);
  }

  a[0] = SOLLYA_NEG(SOLLYA_PI);
  a[1] = SOLLYA_CONST(20.0);
  a[2] = sollya_lib_round_to_nearest();
  a[3] = sollya_lib_round(a[0],a[1],a[2]);
  a[4] = sollya_lib_exponent(a[3]);
  a[5] = sollya_lib_mantissa(a[3]);
  a[6] = SOLLYA_SUB(sollya_lib_copy_obj(a[3]),SOLLYA_MUL(sollya_lib_copy_obj(a[5]),SOLLYA_POW(SOLLYA_CONST(2.0),sollya_lib_copy_obj(a[4]))));
  a[7] = sollya_lib_simplify(a[6]);
  
  sollya_lib_printf("val = %b, mantissa = %b, exponent = %b, val - mantissa * 2^exponent = %b\n", a[3], a[5], a[4], a[7]);

  for (i=0;i<8;i++) {
    sollya_lib_clear_obj(a[i]);
  }
  
  a[0] = SOLLYA_ADD(SOLLYA_CONST(1.0),SOLLYA_POW(SOLLYA_CONST(2.0),SOLLYA_CONST(-17.0)));
  a[1] = SOLLYA_CONST(40.0);
  a[2] = sollya_lib_round_to_nearest();
  a[3] = sollya_lib_round(a[0],a[1],a[2]);
  a[4] = sollya_lib_exponent(a[3]);
  a[5] = sollya_lib_mantissa(a[3]);
  a[6] = SOLLYA_SUB(sollya_lib_copy_obj(a[3]),SOLLYA_MUL(sollya_lib_copy_obj(a[5]),SOLLYA_POW(SOLLYA_CONST(2.0),sollya_lib_copy_obj(a[4]))));
  a[7] = sollya_lib_simplify(a[6]);
  
  sollya_lib_printf("val = %b, mantissa = %b, exponent = %b, val - mantissa * 2^exponent = %b\n", a[3], a[5], a[4], a[7]);

  for (i=0;i<8;i++) {
    sollya_lib_clear_obj(a[i]);
  }




  sollya_lib_close();
  return 0;
}

