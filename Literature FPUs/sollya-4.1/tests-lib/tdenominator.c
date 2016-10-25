#include <sollya.h>

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch (message) {
  case SOLLYA_MSG_EXPR_IS_NO_FRACTION:
    sollya_lib_printf("The following object is not a fraction.\n");
    break;
  default:
    sollya_lib_printf("Unexpected message caught.\n");
  }
  return 0;
}

int main(void) {
  sollya_obj_t a[4], b[4];
  int i;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  a[0] = SOLLYA_DIV(SOLLYA_CONST(17.0),SOLLYA_CONST(1001.0));
  a[1] = SOLLYA_DIV(SOLLYA_ADD(SOLLYA_X_,SOLLYA_POW(SOLLYA_X_,SOLLYA_CONST(2.0))),
		    SOLLYA_ADD(SOLLYA_ADD(SOLLYA_X_,SOLLYA_MUL(SOLLYA_CONST(2.0),SOLLYA_POW(SOLLYA_X_,SOLLYA_CONST(2.0)))),SOLLYA_CONST(1.0)));
  a[2] = sollya_lib_parse_string("((x + 1)/(x + 2)) * ((x + 3)/(x + 4))");
  a[3] = SOLLYA_EXP(SOLLYA_DIV(SOLLYA_X_, SOLLYA_CONST(4)));

  for (i=0;i<4;i++) {
    b[i] = sollya_lib_denominator(a[i]);
    sollya_lib_printf("The denominator of %b is %b.\n",a[i],b[i]);
  }

  for (i=0;i<4;i++) {
    sollya_lib_clear_obj(a[i]);
    sollya_lib_clear_obj(b[i]);
  }

  sollya_lib_close();
  return 0;
}

