#include <sollya.h>

int callback(sollya_msg_t msg, void *data) {
  int message = sollya_lib_get_msg_id(msg);
  (void)data; /* Avoiding "unused parameter" warning */

  if (message == SOLLYA_MSG_EXPR_NOT_CORRECTLY_TYPED)
    sollya_lib_printf("The following test produces a typing error\n");
  else
    sollya_lib_printf("Unexpected message\n");
  return 0;

}

int main(void) {
  sollya_obj_t true, false, a, b, res;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  true = sollya_lib_true();
  false = sollya_lib_false();

  a = sollya_lib_copy_obj(true);
  b = sollya_lib_copy_obj(true);
  res = sollya_lib_and(a, b);
  sollya_lib_printf("%b and %b gives %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_copy_obj(true);
  b = sollya_lib_copy_obj(false);
  res = sollya_lib_and(a, b);
  sollya_lib_printf("%b and %b gives %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_copy_obj(false);
  b = sollya_lib_copy_obj(true);
  res = sollya_lib_and(a, b);
  sollya_lib_printf("%b and %b gives %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = sollya_lib_copy_obj(false);
  b = sollya_lib_copy_obj(false);
  res = sollya_lib_and(a, b);
  sollya_lib_printf("%b and %b gives %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);

  a = SOLLYA_CONST(17);
  b = sollya_lib_string("Hello");
  res = sollya_lib_and(a, b);
  sollya_lib_printf("%b and %b gives %b\n", a, b, res);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);
  sollya_lib_clear_obj(res);


  sollya_lib_clear_obj(true);
  sollya_lib_clear_obj(false);
  sollya_lib_close();
  return 0;
}
