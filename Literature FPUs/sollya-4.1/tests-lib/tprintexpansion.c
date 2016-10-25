#include <sollya.h>

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch (message) {
  case SOLLYA_MSG_ERROR_POLY_COEFF_GETS_ROUNDED:
  case SOLLYA_MSG_ROUNDING_WHILE_PRINTING:
    sollya_lib_printf("One of the expected warning messages has been caught.\n");
    break;
  default:
    sollya_lib_printf("Unexpected message caught.\n");
  }
  return 0;
}

int main(void) {
  sollya_obj_t a[4];
  int i;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  a[0] = sollya_lib_parse_string("roundcoefficients(taylor(exp(x),5,0),[|DD...|])");
  a[1] = sollya_lib_parse_string("11692536319630510474283968587625525849426869787677b-163 + x * (23384922893552793741208186896732057180708286140565b-164 + x * (46692941277611593554424973690517694800554713844979b-166 + x * (3891678517537147456387754739468835779118224484425b-164 + x * (1024072943597638219514404758611859127188920401873b-164 + x * 26154763285557255659575812244171511366994513699585b-171))))");
  a[2] = SOLLYA_PI;
  a[3] = sollya_lib_parse_string("fpminimax(cos(x),6,[|DD, DD, D...|],[-1b-5;1b-5],default,default,default,5846006549323611671784298104022718622318882177971b-162 + x * (37857459261849734002934198358497784854969213609141b-241 + x * (-23384026197294176595383359674367214160107584181507b-165 + x * (-38602791478525408905485501706553096127203819717855b-228 + x * (31178701574267686389540459856148935530651557981629b-169 + x * (14117092987825147270453985390332190734246695748303b-216 + x * (-16628060881742355087337911794409009456208012766191b-173)))))))");

  for (i=0;i<4;i++) {
    sollya_lib_printexpansion(a[i]);
  }

  for (i=0;i<4;i++) {
    sollya_lib_clear_obj(a[i]);
  }
  
  sollya_lib_close();
  return 0;
}
