#include <sollya.h>

#define A_DIM 14

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  case SOLLYA_MSG_FAITHFUL_ROUNDING_FOR_EXPR_THAT_SHOULD_BE_CONST:
    sollya_lib_printf("Caught a message stating that a constant expression was given instead of a constant.\n");
    break;
  case SOLLYA_MSG_RATIONALAPPROX_SECOND_ARG_MUST_BE_GREATER_THAN_ONE:
    sollya_lib_printf("Caught a message stating that the precision is not large enough.\n");
    break;
  case SOLLYA_MSG_EXPR_OR_COMMAND_COULD_NOT_BE_HANDLED:
    sollya_lib_printf("Caught a message stating that the command cannot be handeled.\n");
    break;
  default:
    sollya_lib_printf("Unexpected warning %d.\n", message);
  }
  return 0;
}

int checkrationalapprox(sollya_obj_t num, sollya_obj_t bits, sollya_obj_t res) {
  sollya_obj_t zero, temp, eps, bound;
  int numIsZero, resIsZero, okay;

  if (sollya_lib_obj_is_error(res)) return 1;

  zero = SOLLYA_CONST(0.0);

  temp = sollya_lib_cmp_equal(num, zero);
  numIsZero = sollya_lib_is_true(temp);
  sollya_lib_clear_obj(temp);

  temp = sollya_lib_cmp_equal(res, zero);
  resIsZero = sollya_lib_is_true(temp);
  sollya_lib_clear_obj(temp);

  sollya_lib_clear_obj(zero);

  if (numIsZero) {
    return resIsZero;
  }

  eps = SOLLYA_ABS(SOLLYA_SUB(SOLLYA_DIV(sollya_lib_copy_obj(res), sollya_lib_copy_obj(num)), SOLLYA_CONST(1.0)));
  bound = SOLLYA_POW(SOLLYA_CONST(2.0), SOLLYA_NEG(sollya_lib_copy_obj(bits)));

  temp = sollya_lib_cmp_less_equal(eps, bound);
  okay = sollya_lib_is_true(temp);
  sollya_lib_clear_obj(temp);

  sollya_lib_clear_obj(eps);
  sollya_lib_clear_obj(bound);

  return okay;
}

int main(void) {
  sollya_obj_t a[A_DIM], b[A_DIM], c[A_DIM];
  int i, okay, check;

  okay = 1;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  a[0] = SOLLYA_CONST(17.0);
  b[0] = SOLLYA_CONST(2.0);
  
  a[1] = SOLLYA_CONST(17.0);
  b[1] = SOLLYA_CONST(15.0);

  a[2] = SOLLYA_D(SOLLYA_PI);
  b[2] = SOLLYA_CONST(15.0);

  a[3] = SOLLYA_TD(SOLLYA_PI);
  b[3] = SOLLYA_CONST(150.0);

  a[4] = SOLLYA_D(SOLLYA_PI);
  b[4] = SOLLYA_CONST(1.0); 

  a[5] = SOLLYA_D(SOLLYA_PI);
  b[5] = SOLLYA_CONST(0.0); 

  a[6] = SOLLYA_D(SOLLYA_PI);
  b[6] = SOLLYA_CONST(2.0); 

  a[7] = SOLLYA_D(SOLLYA_PI);
  b[7] = SOLLYA_CONST(-2.0); 

  a[8] = SOLLYA_CONST(0.1);
  b[8] = SOLLYA_CONST(10.0);

  a[9] = SOLLYA_CONST(0.1);
  b[9] = SOLLYA_CONST(100.0);

  a[10] = SOLLYA_TD(SOLLYA_DIV(SOLLYA_CONST(1329.0),SOLLYA_CONST(5971.0)));
  b[10] = SOLLYA_CONST(20.0);

  a[11] = SOLLYA_CONST(0.0);
  b[11] = SOLLYA_CONST(17.0);

  a[12] = SOLLYA_MUL(SOLLYA_CONST(10), SOLLYA_DIV(SOLLYA_PI, SOLLYA_CONST(59)));
  b[12] = SOLLYA_CONST(6.0);

  a[13] = SOLLYA_SIN(SOLLYA_MUL(SOLLYA_CONST(10), SOLLYA_DIV(SOLLYA_PI, SOLLYA_CONST(59))));
  b[13] = SOLLYA_CONST(7.0);

  for (i=0;i<A_DIM;i++) {
    c[i] = sollya_lib_rationalapprox(a[i],b[i]);
    check = checkrationalapprox(a[i],b[i],c[i]);
    okay = okay && check;
    sollya_lib_printf("%b gets approximated to %b bits by rationalapprox with %b which is %s.\n",a[i],b[i],c[i],(check ? "correct" : "incorrect"));
  }

  for (i=0;i<A_DIM;i++) {
    sollya_lib_clear_obj(a[i]);
  }

  for (i=0;i<A_DIM;i++) {
    sollya_lib_clear_obj(b[i]);
  }

  for (i=0;i<A_DIM;i++) {
    sollya_lib_clear_obj(c[i]);
  }

  sollya_lib_close();
  if (!okay) return 1;
  return 0;
}

