#include <sollya.h>

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch (message) {
  case SOLLYA_MSG_FAITHFUL_ROUNDING_FOR_EXPR_THAT_SHOULD_BE_CONST:
  case SOLLYA_MSG_ROUNDING_DOWN_BEFORE_PRINTING_DOUBLE:
  case SOLLYA_MSG_ROUNDING_UP_BEFORE_PRINTING_DOUBLE:
    sollya_lib_printf("One of the expected warning messages has been caught.\n");
    break;
  default:
    sollya_lib_printf("Unexpected message caught.\n");
  }
  return 0;
}

int main(void) {
  sollya_obj_t a[6];
  int i;
  double huge = 1e300;
  volatile double infval, nanval;
  uint64_t specialval = 0x3ff6a09e667f3bcdull;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  a[0] = sollya_lib_constant_from_double(1.);

  infval = huge * huge;
  nanval = infval - infval;

  a[1] = sollya_lib_constant_from_double(infval);
  a[2] = sollya_lib_constant_from_double(-infval);
  a[3] = sollya_lib_constant_from_double(nanval);
  a[4] = sollya_lib_constant_from_double(*((double *) &specialval));

  a[5] = SOLLYA_EXP(SOLLYA_ASIN(sollya_lib_copy_obj(a[0])));
  
  for (i=0;i<6;i++) {
    sollya_lib_printdouble(a[i]);
  }

  for (i=0;i<6;i++) {
    sollya_lib_clear_obj(a[i]);
  }
  
  sollya_lib_close();
  return 0;
}
