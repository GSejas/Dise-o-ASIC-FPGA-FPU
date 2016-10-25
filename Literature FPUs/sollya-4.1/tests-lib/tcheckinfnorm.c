#include <sollya.h>

#define A_DIM 8

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  case SOLLYA_MSG_FAITHFUL_ROUNDING_FOR_EXPR_THAT_SHOULD_BE_CONST:
    sollya_lib_printf("Caught the message: a certain expression should have been constant and has been faithfully rounded.\n");
    break;
  default:
    sollya_lib_printf("Unexpected warning %d.\n", message);
  }
  return 0;
}

int main(void) {
  sollya_obj_t a[A_DIM];
  int i;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  /* checkinfnorm(sin(x),[0;1.75], 1); */
  for (i=0;i<A_DIM;i++) {
    a[i] = NULL;
  }
  
  a[0] = SOLLYA_SIN(SOLLYA_X_);
  a[1] = sollya_lib_parse_string("[0;1.75]");
  a[2] = SOLLYA_CONST(1.0);

  a[A_DIM-1] = sollya_lib_checkinfnorm(a[0],a[1],a[2]);
  
  sollya_lib_printf("checkinfnorm(%b, %b, %b) = %b - expecting true\n",a[0],a[1],a[2],a[A_DIM-1]);
  
  for (i=0;i<A_DIM;i++) {
    if (a[i] != NULL) sollya_lib_clear_obj(a[i]);
  }

  /* checkinfnorm(sin(x),[0;1.75], 1/2); */
  for (i=0;i<A_DIM;i++) {
    a[i] = NULL;
  }
  
  a[0] = SOLLYA_SIN(SOLLYA_X_);
  a[1] = sollya_lib_parse_string("[0;1.75]");
  a[2] = SOLLYA_CONST(0.5);

  a[A_DIM-1] = sollya_lib_checkinfnorm(a[0],a[1],a[2]);
  
  sollya_lib_printf("checkinfnorm(%b, %b, %b) = %b - expecting false\n",a[0],a[1],a[2],a[A_DIM-1]);
  
  for (i=0;i<A_DIM;i++) {
    if (a[i] != NULL) sollya_lib_clear_obj(a[i]);
  }

  /* checkinfnorm(sin(x),[0;20/39], 1/2);*/
  for (i=0;i<A_DIM;i++) {
    a[i] = NULL;
  }
  
  a[0] = SOLLYA_SIN(SOLLYA_X_);
  a[1] = sollya_lib_parse_string("[0;23983616612609688914111751100985157245635816089863b-165]");
  a[2] = SOLLYA_CONST(0.5);

  a[A_DIM-1] = sollya_lib_checkinfnorm(a[0],a[1],a[2]);
  
  sollya_lib_printf("checkinfnorm(%b, %b, %b) = %b - expecting true\n",a[0],a[1],a[2],a[A_DIM-1]);
  
  for (i=0;i<A_DIM;i++) {
    if (a[i] != NULL) sollya_lib_clear_obj(a[i]);
  }

  /* checkinfnorm(11692536319630510474283968587625525849426869787677b-163 + x * (23384922893552793741208186896732057180708286140565b-164 + x * (46692941277611593554424973690517694800554713844979b-166 + x * (3891678517537147456387754739468835779118224484425b-164 + x * (1024072943597638219514404758611859127188920401873b-164 + x * 26154763285557255659575812244171511366994513699585b-171)))) - exp(x),[-1;1], dirtyinfnorm(func, [-1;1])); */

  for (i=0;i<A_DIM;i++) {
    a[i] = NULL;
  }
  
  a[0] = sollya_lib_parse_string("11692536319630510474283968587625525849426869787677b-163 + _x_ * (23384922893552793741208186896732057180708286140565b-164 + _x_ * (46692941277611593554424973690517694800554713844979b-166 + _x_ * (3891678517537147456387754739468835779118224484425b-164 + _x_ * (1024072943597638219514404758611859127188920401873b-164 + _x_ * 26154763285557255659575812244171511366994513699585b-171)))) - exp(_x_)");
  a[1] = sollya_lib_parse_string("[-1;1]");
  a[2] = sollya_lib_dirtyinfnorm(a[0],a[1]);

  a[A_DIM-1] = sollya_lib_checkinfnorm(a[0],a[1],a[2]);
  
  sollya_lib_printf("checkinfnorm(%b, %b, %b) = %b - expecting false\n",a[0],a[1],a[2],a[A_DIM-1]);
  
  for (i=0;i<A_DIM;i++) {
    if (a[i] != NULL) sollya_lib_clear_obj(a[i]);
  }

  /* checkinfnorm(11692536319630510474283968587625525849426869787677b-163 + x * (23384922893552793741208186896732057180708286140565b-164 + x * (46692941277611593554424973690517694800554713844979b-166 + x * (3891678517537147456387754739468835779118224484425b-164 + x * (1024072943597638219514404758611859127188920401873b-164 + x * 26154763285557255659575812244171511366994513699585b-171)))) - exp(x),[-1;1], round(dirtyinfnorm(func, [-1;1])),25,RU); with modified diam = 1b-20 */

  for (i=0;i<A_DIM;i++) {
    a[i] = NULL;
  }
  
  a[0] = sollya_lib_parse_string("11692536319630510474283968587625525849426869787677b-163 + _x_ * (23384922893552793741208186896732057180708286140565b-164 + _x_ * (46692941277611593554424973690517694800554713844979b-166 + _x_ * (3891678517537147456387754739468835779118224484425b-164 + _x_ * (1024072943597638219514404758611859127188920401873b-164 + _x_ * 26154763285557255659575812244171511366994513699585b-171)))) - exp(_x_)");
  a[1] = sollya_lib_parse_string("[-1;1]");
  a[2] = sollya_lib_dirtyinfnorm(a[0],a[1]);
  a[3] = SOLLYA_CONST(25.0);
  a[4] = sollya_lib_round_up();
  a[5] = sollya_lib_round(a[2],a[3],a[4]);
  a[6] = sollya_lib_parse_string("1b-20");
  
  sollya_lib_set_diam(a[6]);

  a[A_DIM-1] = sollya_lib_checkinfnorm(a[0],a[1],a[5]);
  
  sollya_lib_printf("checkinfnorm(%b, %b, %b) = %b - expecting true\n",a[0],a[1],a[5],a[A_DIM-1]);
  
  for (i=0;i<A_DIM;i++) {
    if (a[i] != NULL) sollya_lib_clear_obj(a[i]);
  }

  sollya_lib_close();
  return 0;
}

