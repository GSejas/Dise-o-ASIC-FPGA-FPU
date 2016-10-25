#include <sollya.h>

#define NB_OF_TESTS 12

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  case SOLLYA_MSG_STURM_COEFF_NOT_CONSTANT_NOR_RATIONAL_ROUNDING:
    sollya_lib_printf("Caught the message that a certain polynomial coefficient is neither a constant nor a rational expression and that it got rounded.\n");
    break;
  case SOLLYA_MSG_STURM_USING_SLOWER_ALGORITHM_ON_RATIONALS:
    sollya_lib_printf("Caught the message that a slower version of the Sturm algorithm, using rational arithmetic is used.\n");
    break;    
  case SOLLYA_MSG_GIVEN_FUNCTION_IS_NO_POLYNOMIAL:
    sollya_lib_printf("Caught the message that a given function is no polynomial.\n");
    break;    
  case SOLLYA_MSG_EXPR_NOT_CORRECTLY_TYPED:
    sollya_lib_printf("Caught the message that a given expression is not correctly typed.\n");
    break;        
  default:
    sollya_lib_printf("Unexpected warning %d.\n", message);
  }
  return 0;
}

int main(void) {
  sollya_obj_t a[NB_OF_TESTS], b[NB_OF_TESTS], c[NB_OF_TESTS];
  int i;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  a[0] = SOLLYA_X_;
  b[0] = sollya_lib_parse_string("[-1;1]");
  
  a[1] = SOLLYA_X_;
  b[1] = sollya_lib_parse_string("[-1/1024;1]");

  a[2] = SOLLYA_X_;
  b[2] = sollya_lib_parse_string("[0;1]");

  a[3] = SOLLYA_X_;
  b[3] = sollya_lib_parse_string("[1/1024;1]");

  a[4] = sollya_lib_parse_string("x^2 - 1/1024");
  b[4] = sollya_lib_parse_string("[-1;1]");

  a[5] = sollya_lib_parse_string("x^2 + 1/1024");
  b[5] = sollya_lib_parse_string("[-1;1]");
  
  a[6] = sollya_lib_parse_string("x^2");
  b[6] = sollya_lib_parse_string("[-1;1]");

  a[7] = sollya_lib_parse_string("x^2 - 1b-2000");
  b[7] = sollya_lib_parse_string("[-1;1]");

  a[8] = sollya_lib_parse_string("exp(1) * x^2 - 2.5");
  b[8] = sollya_lib_parse_string("[-1;1]");

  a[9] = sollya_lib_parse_string("106/39 * x^2 - 2.5");
  b[9] = sollya_lib_parse_string("[-1;1]");

  a[10] = sollya_lib_parse_string("498433858766847607572119674832101659036346057980888594722531428147165925512023745865901769 / 4046269353306249636975402911371420403218250121568610417645180644958487760262349813894609b6 + x * (-524133224017035031109281522782898592169355668835836355206157 / 28642971806507469479740749646041579549850744218111183188997b2 + x * 551157654494325100219720823521 / 202759569932735203392750534601)");
  b[10] = sollya_lib_parse_string("[-2;2]");

  a[11] = sollya_lib_parse_string("exp(x)");
  b[11] = sollya_lib_parse_string("[-1;1]");

  for (i=0;i<NB_OF_TESTS;i++) {
    c[i] = sollya_lib_numberroots(a[i],b[i]);
    sollya_lib_printf("The polynomial %b has %b root(s) in the interval %b.\n",a[i],c[i],b[i]);
  }

  for (i=0;i<NB_OF_TESTS;i++) {
    sollya_lib_clear_obj(a[i]);
    sollya_lib_clear_obj(b[i]);
    sollya_lib_clear_obj(c[i]);
  }

  sollya_lib_close();
  return 0;
}

