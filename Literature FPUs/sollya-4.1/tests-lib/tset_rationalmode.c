#include <sollya.h>

int state_of_the_tool(void) {
  sollya_obj_t a[15];
  int i;

  a[0] = sollya_lib_get_prec();
  a[1] = sollya_lib_get_points();
  a[2] = sollya_lib_get_diam();
  a[3] = sollya_lib_get_display();
  a[4] = sollya_lib_get_verbosity();
  a[5] = sollya_lib_get_canonical();
  a[6] = sollya_lib_get_autosimplify();
  a[7] = sollya_lib_get_showmessagenumbers();
  a[8] = sollya_lib_get_taylorrecursions();
  a[9] = sollya_lib_get_timing();
  a[10] = sollya_lib_get_midpointmode();
  a[11] = sollya_lib_get_dieonerrormode();
  a[12] = sollya_lib_get_rationalmode();
  a[13] = sollya_lib_get_roundingwarnings();
  a[14] = sollya_lib_get_hopitalrecursions();

  sollya_lib_printf("Current state of the tool:\n");
  sollya_lib_printf("  prec = %b\n", a[0]);
  sollya_lib_printf("  points = %b\n", a[1]);
  sollya_lib_printf("  diam = %b\n", a[2]);
  sollya_lib_printf("  display = %b\n", a[3]);
  sollya_lib_printf("  verbosity = %b\n", a[4]);
  sollya_lib_printf("  canonical = %b\n", a[5]);
  sollya_lib_printf("  autosimplify = %b\n", a[6]);
  sollya_lib_printf("  showmessagenumbers = %b\n", a[7]);
  sollya_lib_printf("  taylorrecursions = %b\n", a[8]);
  sollya_lib_printf("  timing = %b\n", a[9]);
  sollya_lib_printf("  midpointmode = %b\n", a[10]);
  sollya_lib_printf("  dieonerrormode = %b\n", a[11]);
  sollya_lib_printf("  rationalmode = %b\n", a[12]);
  sollya_lib_printf("  roundingwarnings = %b\n", a[13]);
  sollya_lib_printf("  hopitalrecursions = %b\n\n", a[14]);

  for(i=0;i<15;i++) sollya_lib_clear_obj(a[i]);
  return 0;
}

int main(void) {
  sollya_obj_t a;

  sollya_lib_init();
  state_of_the_tool();
  a = sollya_lib_on();
  sollya_lib_set_rationalmode(a);
  state_of_the_tool();;
  sollya_lib_clear_obj(a);
  sollya_lib_close();
  return 0;
}
