#include <sollya.h>

#define A_DIM 4
#define B_DIM 5

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  case SOLLYA_MSG_GIVEN_FUNCTION_IS_NO_POLYNOMIAL:
    sollya_lib_printf("The message \"The given function is not a polynomial\" has been caught.\n");
    break;
  case SOLLYA_MSG_ERROR_POLY_COEFF_GETS_ROUNDED:
    sollya_lib_printf("The message \"A coefficient of a polynomial gets rounded twice\" has been caught.\n");
    break;
  case SOLLYA_MSG_NUM_OF_FORMATS_DOES_NOT_CORRESPOND_TO_DEGREE:
    sollya_lib_printf("The message \"The number of formats does not correspond to the degree of the polynomial\" has been caught.\n");
    break;    
  default:
    sollya_lib_printf("Unexpected warning %d.\n", message);
  }
  return 0;
}

int main(void) {
  sollya_obj_t a[A_DIM], b[B_DIM], c[A_DIM * B_DIM];
  int i, j;
  sollya_obj_t temp;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  a[0] = SOLLYA_EXP(SOLLYA_ADD(SOLLYA_MUL(SOLLYA_PI,SOLLYA_X_),SOLLYA_SIN(SOLLYA_CONST(9.0))));
  a[1] = SOLLYA_ADD(SOLLYA_MUL(SOLLYA_PI,SOLLYA_X_),SOLLYA_SIN(SOLLYA_CONST(9.0)));
  a[2] = sollya_lib_parse_string("1 + x * (1 + x * (0.5 + x * (1 / 6 + x * (1 / 24 + x * (1 / 120 + x * (1 / 720 + x * (1 / 5040 + x * (1 / 40320 + x * (1 / 362880 + x * (1 / 3628800 + x * (1 / 39916800 + x * (1 / 479001600 + x * (1 / 6227020800 + x * (1 / 87178291200 + x / 1307674368000))))))))))))))");
  a[3] = sollya_lib_parse_string("1 + x * (1 + x * (1b-1 + x * (1948668849774537224271579776955044026207910057301b-163 + x * (1948668849774537224271579776955044026207910057301b-165 + x * (24942961277114076470676221145024563535461248733457b-171 + x * (2078580106426173039223018428752046961288437394455b-170 + x * (1187760060814956022413153387858312549307678511117b-172 + x * (1187760060814956022413153387858312549307678511117b-175 + x * (527893360362202676628068172381472244136746004941b-177 + x * (1689258753159048565209818151620711181237587215811b-182 + x * (4914207281917232189701289168351159799963890082359b-187 + x * (3276138187944821459800859445567439866642593388239b-190 + x * (504021259683818686123209145471913825637322059729b-191 + x * (4608194374252056558840769330028926405826944546095b-198 + x * 19661629330142107984387282474790085998194963396671b-204))))))))))))))");
  
  b[0] = sollya_lib_parse_string("[| D, DD, DD, D |]");
  b[1] = sollya_lib_parse_string("[| D, DD, DD, D... |]");
  b[2] = sollya_lib_parse_string("[| D, D, D, HP, SG, D, DE, DD, TD, QD |]");
  b[3] = sollya_lib_parse_string("[| D, D, D, HP, SG, D, DE, DD, TD, QD... |]");
  b[4] = sollya_lib_parse_string("[| D, D, D, HP, SG, D, DE, DD, TD, QD, D, D, D, D, D, D, D |]");
  
  sollya_lib_set_display(temp = sollya_lib_dyadic());
  sollya_lib_clear_obj(temp);

  for (i=0;i<A_DIM;i++) {
    for (j=0;j<B_DIM;j++) {
      c[i * B_DIM + j] = sollya_lib_roundcoefficients(a[i],b[j]);
      sollya_lib_printf("rounding the coefficients of %b to the formats %b yields to %b\n",a[i],b[j],c[i * B_DIM + j]);
    }
  }

  for (i=0;i<A_DIM;i++) {
    sollya_lib_clear_obj(a[i]);
  }

  for (i=0;i<B_DIM;i++) {
    sollya_lib_clear_obj(b[i]);
  }
  
  for (i=0;i<A_DIM*B_DIM;i++) {
    sollya_lib_clear_obj(c[i]);
  }

  sollya_lib_close();
  return 0;
}

