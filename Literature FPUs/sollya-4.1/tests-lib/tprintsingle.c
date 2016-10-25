#include <sollya.h>

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch (message) {
  case SOLLYA_MSG_FAITHFUL_ROUNDING_FOR_EXPR_THAT_SHOULD_BE_CONST:
  case SOLLYA_MSG_ROUNDING_DOWN_BEFORE_PRINTING_SINGLE:
  case SOLLYA_MSG_ROUNDING_UP_BEFORE_PRINTING_SINGLE:
    sollya_lib_printf("One of the expected warning messages has been caught.\n");
    break;
  default:
    sollya_lib_printf("Unexpected message caught.\n");
  }
  return 0;
}

int main(void) {
  sollya_obj_t a[24];
  sollya_obj_t temp;
  int i;
  float huge = 1e38f;
  volatile float infval, nanval;
  uint32_t specialval = 0x3fb504f3u;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  a[0] = sollya_lib_constant_from_double(1.);

  infval = huge * huge;
  nanval = infval - infval;

  a[1] = sollya_lib_constant_from_double((double) (infval));
  a[2] = sollya_lib_constant_from_double((double) (-infval));
  a[3] = sollya_lib_constant_from_double((double) nanval);
  a[4] = sollya_lib_constant_from_double((double) *((float *) &specialval));

  a[5] = SOLLYA_EXP(SOLLYA_ASIN(sollya_lib_copy_obj(a[0])));
  
  sollya_lib_set_prec(temp = sollya_lib_constant_from_double(1000.0));
  sollya_lib_clear_obj(temp);

  a[6] = sollya_lib_parse_string("1b128 - 1b103 - 1b-500");
  a[7] = sollya_lib_parse_string("1b128 - 1b103 - 1b-74");
  a[8] = sollya_lib_parse_string("1b128 - 1b103 - 1b-75");
  a[9] = sollya_lib_parse_string("1b128 - 1b103");
  a[10] = sollya_lib_parse_string("1b128 - 1b103 + 1b-500");
  a[11] = sollya_lib_parse_string("1b128 - 1b103 + 1b-74");
  a[12] = sollya_lib_parse_string("1b128 - 1b103 + 1b-75");
  a[13] = sollya_lib_parse_string("1.0000000010111111111111111000001_2 * 2^(-140)");
  a[14] = sollya_lib_parse_string("-1.0000000010111111111111111000001_2 * 2^(-140)");
  a[15] = sollya_lib_parse_string("1b-1000");
  a[16] = sollya_lib_parse_string("-1b-1000");
  a[17] = sollya_lib_parse_string("0");
  a[18] = sollya_lib_parse_string("-0");
  a[19] = sollya_lib_parse_string("1b-150");
  a[20] = sollya_lib_parse_string("1b-150 + 1b-1000");
  a[21] = sollya_lib_parse_string("1b-150 - 1b-1000");
  a[22] = sollya_lib_parse_string("-1b-150 + 1b-1000");
  a[23] = sollya_lib_parse_string("-1b-150 - 1b-1000");


  for (i=0;i<24;i++) {
    sollya_lib_printsingle(a[i]);
  }

  for (i=0;i<24;i++) {
    sollya_lib_clear_obj(a[i]);
  }
  
  sollya_lib_close();
  return 0;
}
