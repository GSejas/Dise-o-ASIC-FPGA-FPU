#include <sollya.h>
#include <stdlib.h>


int main(void) {
  sollya_obj_t a[8];
  int r[5];
  int i;

  sollya_lib_init();

  for (i=0;i<8;i++) a[i] = NULL;
  for (i=0;i<5;i++) r[i] = 0;

  a[0] = sollya_lib_parse_string("{ .a = 5; .b = exp(_x_); .c = { .d = 17; .e = sin(_x_) }}");
  a[1] = SOLLYA_EXP(SOLLYA_ASIN(SOLLYA_X_));
  a[2] = SOLLYA_LOG(SOLLYA_ATAN(SOLLYA_X_));
  r[0] = sollya_lib_create_structure(&(a[3]), NULL, "u", a[1]);
  sollya_lib_printf("Adding element \"%s\" with content %b to an empty thing: %s, yielding %b\n","u",a[1],(r[0]?"Success":"Failure"),a[3]);
  r[1] = sollya_lib_create_structure(&(a[4]), a[3], "v", a[2]);
  sollya_lib_printf("Adding element \"%s\" with content %b to %b: %s, yielding %b\n","v",a[2],a[3],(r[1]?"Success":"Failure"),a[4]);
  r[2] = sollya_lib_create_structure(&(a[5]), a[0], "v", a[3]);
  sollya_lib_printf("Adding element \"%s\" with content %b to %b: %s, yielding %b\n","v",a[3],a[0],(r[2]?"Success":"Failure"),a[5]);
  r[3] = sollya_lib_create_structure(&(a[6]), a[1], "v", a[3]);
  sollya_lib_printf("Adding element \"%s\" with content %b to %b: %s, yielding %b\n","v",a[3],a[1],(r[3]?"Success":"Failure"),a[6]);
  r[4] = sollya_lib_create_structure(&(a[7]), a[4], "u", a[3]);
  sollya_lib_printf("Adding element \"%s\" with content %b to %b: %s, yielding %b\n","u",a[3],a[4],(r[4]?"Success":"Failure"),a[7]);

  for (i=0;i<8;i++) 
    if (a[i] != NULL) sollya_lib_clear_obj(a[i]);

  sollya_lib_close();
  return 0;
}
