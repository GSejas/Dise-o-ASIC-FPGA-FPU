#include <sollya.h>

#define A_DIM 15

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  default:
    sollya_lib_printf("Unexpected warning %d.\n", message);
  }
  return 0;
}

int main(void) {
  sollya_obj_t a[A_DIM];
  sollya_obj_t res;
  sollya_obj_t *resElements;
  int resElementsNum, endElliptic;
  int i;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

  /* searchgal(log(x),2,53,15,DD,1b-112); */
  for (i=0;i<A_DIM;i++) {
    a[i] = NULL;
  }
  res = NULL;

  a[0] = SOLLYA_LOG(SOLLYA_X_);
  a[1] = SOLLYA_CONST(2.0);
  a[2] = SOLLYA_CONST(53.0);
  a[3] = SOLLYA_CONST(15.0);
  a[4] = sollya_lib_double_double_obj();
  a[5] = sollya_lib_parse_string("1b-112");

  res = sollya_lib_searchgal(a[0],a[1],a[2],a[3],a[4],a[5]);

  sollya_lib_printf("searchgal(%b,%b,%b,%b,%b,%b) = %b - expecting empty list\n",a[0],a[1],a[2],a[3],a[4],a[5],res);

  for (i=0;i<A_DIM;i++) {
    if (a[i] != NULL) {
      sollya_lib_clear_obj(a[i]);
    }
  }
  sollya_lib_clear_obj(res);

  /* searchgal(log(x),2,53,18,DD,1b-112); */
  for (i=0;i<A_DIM;i++) {
    a[i] = NULL;
  }
  res = NULL;

  a[0] = SOLLYA_LOG(SOLLYA_X_);
  a[1] = SOLLYA_CONST(2.0);
  a[2] = SOLLYA_CONST(53.0);
  a[3] = SOLLYA_CONST(18.0);
  a[4] = sollya_lib_double_double_obj();
  a[5] = sollya_lib_parse_string("1b-112");

  res = sollya_lib_searchgal(a[0],a[1],a[2],a[3],a[4],a[5]);

  sollya_lib_printf("searchgal(%b,%b,%b,%b,%b,%b) = %b - expecting [|2.0000000000384972054234822280704975128173828125|]\n",a[0],a[1],a[2],a[3],a[4],a[5],res);

  for (i=0;i<A_DIM;i++) {
    if (a[i] != NULL) {
      sollya_lib_clear_obj(a[i]);
    }
  }
  sollya_lib_clear_obj(res);

  /* searchgal([|sin(x),cos(x)|],1,53,15,[|D,D|],[|1b-62,1b-60|]); */
  for (i=0;i<A_DIM;i++) {
    a[i] = NULL;
  }
  res = NULL;

  a[0] = sollya_lib_parse_string("[| sin(_x_), cos(_x_) |]");
  a[1] = SOLLYA_CONST(1.0);
  a[2] = SOLLYA_CONST(53.0);
  a[3] = SOLLYA_CONST(15.0);
  a[4] = sollya_lib_parse_string("[| D, D |]");
  a[5] = sollya_lib_parse_string("[| 1b-62, 1b-60 |]");

  res = sollya_lib_searchgal(a[0],a[1],a[2],a[3],a[4],a[5]);

  sollya_lib_printf("searchgal(%b,%b,%b,%b,%b,%b) = %b - expecting [|1.00000000000159494639717649988597258925437927246094|]\n",a[0],a[1],a[2],a[3],a[4],a[5],res);

  for (i=0;i<A_DIM;i++) {
    if (a[i] != NULL) {
      sollya_lib_clear_obj(a[i]);
    }
  }
  sollya_lib_clear_obj(res);

  /* searchgal(exp(x),2,53,18,DD,1b-112); */
  for (i=0;i<A_DIM;i++) {
    a[i] = NULL;
  }
  res = NULL;

  a[0] = SOLLYA_EXP(SOLLYA_X_);
  a[1] = SOLLYA_CONST(2.0);
  a[2] = SOLLYA_CONST(53.0);
  a[3] = SOLLYA_CONST(18.0);
  a[4] = sollya_lib_double_double_obj();
  a[5] = sollya_lib_parse_string("1b-112");

  res = sollya_lib_searchgal(a[0],a[1],a[2],a[3],a[4],a[5]);

  resElements = NULL;
  sollya_lib_get_list_elements(&resElements, &resElementsNum, &endElliptic, res);
  
  if (resElementsNum < 1) {
    sollya_lib_printf("searchgal(%b,%b,%b,%b,%b,%b) did not find any appropriate pre-image.\n",a[0],a[1],a[2],a[3],a[4],a[5]);
  } else {
    a[6] = SOLLYA_LOG2(SOLLYA_ABS(SOLLYA_SUB(SOLLYA_DIV(SOLLYA_DD(SOLLYA_EXP(SOLLYA_X_)),SOLLYA_EXP(SOLLYA_X_)),SOLLYA_CONST(1.0))));
    a[7] = sollya_lib_evaluate(a[6],resElements[0]);
    sollya_lib_printf("searchgal(%b,%b,%b,%b,%b,%b) found %b, log2(abs(exp(%b)/exp(%b) - 1)) is %b (expecting something around -112)\n",a[0],a[1],a[2],a[3],a[4],a[5],resElements[0],resElements[0],resElements[0],a[7]);
  }

  for (i=0;i<A_DIM;i++) {
    if (a[i] != NULL) {
      sollya_lib_clear_obj(a[i]);
    }
  }
  sollya_lib_clear_obj(res);

  if (resElements != NULL) {
    for (i=0;i<resElementsNum;i++) {
      sollya_lib_clear_obj(resElements[i]);
    }
    sollya_lib_free(resElements);
  }

  sollya_lib_close();
  return 0;
}

