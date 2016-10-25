#include <sollya.h>

int main(void) {
  sollya_obj_t f[4];
  sollya_obj_t d[4];
  sollya_obj_t temp1, temp2;
  int i;

  sollya_lib_init();

  f[0] = SOLLYA_SIN(SOLLYA_ADD(SOLLYA_X_, SOLLYA_CONST(1.0)));
  d[0] = sollya_lib_range(temp1 = SOLLYA_CONST(-3.0), temp2 = SOLLYA_CONST(3.0));
  sollya_lib_clear_obj(temp1); sollya_lib_clear_obj(temp2);
  
  f[1] = SOLLYA_ADD(SOLLYA_SIN(SOLLYA_ADD(SOLLYA_X_, SOLLYA_CONST(1.0))),SOLLYA_CONST(2.0));
  d[1] = sollya_lib_range(temp1 = SOLLYA_CONST(-3.0), temp2 = SOLLYA_CONST(3.0));
  sollya_lib_clear_obj(temp1); sollya_lib_clear_obj(temp2);

  f[2] = SOLLYA_SIN(SOLLYA_ADD(SOLLYA_X_, SOLLYA_CONST(1.0)));
  d[2] = sollya_lib_range(temp1 = SOLLYA_CONST(1.0), temp2 = SOLLYA_CONST(7.0));
  sollya_lib_clear_obj(temp1); sollya_lib_clear_obj(temp2);
  
  f[3] = SOLLYA_ADD(SOLLYA_SIN(SOLLYA_ADD(SOLLYA_X_, SOLLYA_CONST(1.0))),SOLLYA_CONST(2.0));
  d[3] = sollya_lib_range(temp1 = SOLLYA_CONST(1.0), temp2 = SOLLYA_CONST(7.0));
  sollya_lib_clear_obj(temp1); sollya_lib_clear_obj(temp2);
  
  for (i=0;i<4;i++) {
    sollya_lib_asciiplot(f[i],d[i]);
    sollya_lib_printf("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
  }
   
  for (i=0;i<4;i++) {
    sollya_lib_clear_obj(f[i]);
  }

  for (i=0;i<4;i++) {
    sollya_lib_clear_obj(d[i]);
  }

  
  sollya_lib_close();
  return 0;
}
