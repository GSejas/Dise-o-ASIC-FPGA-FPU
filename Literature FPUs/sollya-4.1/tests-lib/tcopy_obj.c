#include <sollya.h>

int main(void) {
  sollya_obj_t a,b, tmp;
  sollya_lib_init();
  
  a = SOLLYA_COS(SOLLYA_ADD(SOLLYA_EXP(SOLLYA_X_), SOLLYA_CONST(1)));
  b = sollya_lib_copy_obj(a);
  sollya_lib_printf("b = %b [should be cos(exp(_x_) + 1)]\n", b);
  sollya_lib_clear_obj(a);
  sollya_lib_printf("b = %b [should be cos(exp(_x_) + 1)]\n", b);
  a = SOLLYA_SIN(SOLLYA_CONST(3));
  sollya_lib_printf("b = %b [should be cos(exp(_x_) + 1)]\n\n", b);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);


  a = sollya_lib_build_list(SOLLYA_COS(SOLLYA_X_), SOLLYA_CONST(3), NULL);
  b = sollya_lib_copy_obj(a);
  sollya_lib_printf("b = %b [should be [|cos(_x_), 3|]]\n", b);
  sollya_lib_get_element_in_list(&tmp, a, 0);
  sollya_lib_clear_obj(tmp);
  sollya_lib_printf("b = %b [should be [|cos(_x_), 3|]]\n", b);
  sollya_lib_clear_obj(a);
  sollya_lib_printf("b = %b [should be [|cos(_x_), 3|]]\n", b);
  a = SOLLYA_SIN(SOLLYA_CONST(3));
  sollya_lib_printf("b = %b [should be [|cos(_x_), 3|]]\n\n", b);
  sollya_lib_clear_obj(a);
  sollya_lib_clear_obj(b);


  sollya_lib_close();
  return 0;
}
