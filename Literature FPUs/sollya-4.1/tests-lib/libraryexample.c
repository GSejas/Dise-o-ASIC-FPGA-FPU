#include <mpfi.h>

int myownlog(mpfi_t result, mpfi_t x, int n) {
  if(n==0) {
    /* Implementation of the neperian logarithm */

    if(mpfi_nan_p(x)) { 
      mpfr_t a;
      mpfr_init2(a,mpfi_get_prec(result));
      mpfi_interv_fr(result,a,a);
      mpfr_clear(a);
      return 0;
    }
    if(mpfi_has_zero(x)) {
      mpfr_t a,b;
      mpfr_init2(a,mpfi_get_prec(result));
      mpfr_init2(b,mpfi_get_prec(result));

      mpfr_set_inf(a,-1);
      mpfi_get_right(b,x);
      mpfr_log(b,b,GMP_RNDU);
      mpfi_interv_fr(result, a, b);

      mpfr_clear(a);
      mpfr_clear(b);
      return 0;
    }
    else {
      mpfr_t a,b;
      mpfr_init2(a,mpfi_get_prec(result));
      mpfr_init2(b,mpfi_get_prec(result));

      mpfi_get_left(a,x);
      mpfr_log(a,a, GMP_RNDD);
      mpfi_get_right(b,x);
      mpfr_log(b,b,GMP_RNDU);
      mpfi_interv_fr(result, a, b);

      mpfr_clear(a);
      mpfr_clear(b);
      return 0;
    }
  }


  if(n==1) {
    /* Implementation of 1/x */
    mpfi_inv(result,x);
    return 0;
  }
  
  if(n==2) {
    /* Implementation of -1/x^2 */
    mpfi_t temp;
    mpfi_init2(temp, mpfi_get_prec(result));

    mpfi_sqr(temp, x);
    mpfi_inv(temp, temp);
    mpfi_neg(result, temp);

    mpfi_clear(temp);
    return 0;
  }

  /* else */
  mpfr_t a,b;
  mpfr_init2(a, mpfi_get_prec(result));
  mpfr_init2(b, mpfi_get_prec(result));

  mpfr_set_inf(a,-1);
  mpfr_set_inf(b, 1);
  mpfi_interv_fr(result,a,b);
  
  mpfr_clear(a);
  mpfr_clear(b);
  return 0;
}

void euler_gamma(mpfr_t res, mp_prec_t prec) {
  mpfr_set_prec(res, prec);
  mpfr_const_euler(res, GMP_RNDN);
  return;
}

