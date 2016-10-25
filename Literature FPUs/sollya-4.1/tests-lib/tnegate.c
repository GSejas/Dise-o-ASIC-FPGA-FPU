#include <sollya.h>

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  if (message == SOLLYA_MSG_EXPR_NOT_CORRECTLY_TYPED)
    sollya_lib_printf("The following test produces a typing error\n");
  else
    sollya_lib_printf("Unexpected message\n");
  return 0;

}
int main(void) {
  sollya_obj_t true, false, a, res;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  true = sollya_lib_true();
  false = sollya_lib_false();

  a = sollya_lib_copy_obj(true);
  res = sollya_lib_negate(a);
  sollya_lib_printf("the negation of %b gives %b\n", a, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(res);

  a = sollya_lib_copy_obj(false);
  res = sollya_lib_negate(a);
  sollya_lib_printf("the negation of %b gives %b\n", a, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(res);

  a = SOLLYA_CONST(17);
  res = sollya_lib_negate(a);
  sollya_lib_printf("the negation of %b gives %b\n", a, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(res);


  sollya_lib_clear_obj(true);
  sollya_lib_clear_obj(false);
  sollya_lib_close();
  return 0;
}
