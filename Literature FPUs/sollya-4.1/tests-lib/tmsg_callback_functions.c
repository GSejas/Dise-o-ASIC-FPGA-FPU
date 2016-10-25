#include <sollya.h>

int hide_everything(sollya_msg_t msg, void *data) {
  if (data != NULL)
    printf("Callback hide_everything receives a non-NULL data set.\n");
  (void)msg;
  return 0;
}

int keep_comparison_warnings(sollya_msg_t msg, void *data) {
  (void)data;
  switch(sollya_lib_get_msg_id(msg)) {
  case SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_THAT_IS_NOT_FAITHFUL:
  case SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT:
  case SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_UNDECIDED:
  case SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL:
    return 1;
  default:
    return 0;
  }
}

int flag_double_rounding = 0;
int set_flag_on_problem(sollya_msg_t msg, void *data) {
  (void)data;
  char *s;
  switch(sollya_lib_get_msg_id(msg)) {
  case SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_READING_A_CONSTANT:
    flag_double_rounding = 1;
    s = sollya_lib_msg_to_text(msg);
    printf("Generic message: %s\n", s);
    sollya_lib_free(s);
    printf("Specific message:\n");
  }
  return 1;
}

#define SIZE 10

struct callback_data_struct {
  int counter;
  char *tab[SIZE];
};

typedef struct callback_data_struct callback_data;

int remember_history(sollya_msg_t msg, void *data) {
  callback_data *data_ptr = (callback_data *)(data);

  if (data==NULL) {
    printf("rember_history callback is called with NULL as data argument.\n");
    return 0;
  }

  if (data_ptr->counter < SIZE) {
    data_ptr->tab[data_ptr->counter] = sollya_lib_msg_to_text(msg);
    data_ptr->counter++;
  }
  return 0;
}

int main(void) {
  sollya_obj_t a, b, c;
  int (*old_callback)(sollya_msg_t, void *);
  void *old_data;
  callback_data calls;
  int i;

  calls.counter = 0;

  sollya_lib_init();

  /* Display a warning */
  a = SOLLYA_PI; b = sollya_lib_default(); c = sollya_lib_add(a,b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);

  /* Callback that stops all messages. Tests the effect of the value returned by the callback when it is called */
  printf("\n");
  if (!sollya_lib_install_msg_callback(hide_everything, NULL))
    printf("An error happened when installing the message callback\n");
  printf("Nothing should be displayed between now and ");
  a = SOLLYA_PI; b = sollya_lib_default(); c = sollya_lib_add(a,b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);
  printf("now.\n");

  /* Callback that stops some messages but not all. Tests that the variable msg is correctly passed to the callback */
  printf("\n");
  if (!sollya_lib_install_msg_callback(keep_comparison_warnings, NULL))
    printf("An error happened when installing the message callback\n");
  printf("Nothing should be displayed between now and ");
  a = SOLLYA_PI; b = sollya_lib_default(); c = sollya_lib_add(a,b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);
  printf("now.\n");
  a = SOLLYA_DIV(SOLLYA_LOG(SOLLYA_CONST(17)), SOLLYA_LOG(SOLLYA_CONST(2))); b = SOLLYA_LOG2(SOLLYA_CONST(17));
  c = sollya_lib_cmp_less(a, b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);

  /* Check that uninstalling a callback works and that callbacks do not stack */
  /* A warning should be displayed */
  printf("\n");
  if (!sollya_lib_uninstall_msg_callback())
    printf("An error happened when removing the message callback\n");
  a = SOLLYA_PI; b = sollya_lib_default(); c = sollya_lib_add(a,b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);

  /* Callback with side effect */
  printf("\n");
  if (!sollya_lib_install_msg_callback(set_flag_on_problem, NULL))
    printf("An error happened when installing the message callback\n");
  printf("Value of the flag: %d\n", flag_double_rounding);
  a = SOLLYA_PI; b = sollya_lib_default(); c = sollya_lib_add(a,b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);
  printf("Value of the flag: %d\n", flag_double_rounding);
  a = sollya_lib_parse_string("0.1");
  sollya_lib_clear_obj(a);
  printf("Value of the flag: %d\n", flag_double_rounding);
  a = SOLLYA_PI; b = sollya_lib_default(); c = sollya_lib_add(a,b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);
  printf("Value of the flag: %d\n", flag_double_rounding);

  /* Testing get_msg_callback, when no callback is installed */
  sollya_lib_uninstall_msg_callback();
  sollya_lib_get_msg_callback(&old_callback, &old_data);
  if ( (old_callback != NULL) || (old_data != NULL) )
    printf("sollya_lib_get_msg_callback returned a non-NULL couple of pointers (%p, %p) while no callback is installed.\n", old_callback, old_data);

  /* Testing get_msg_callback, when a callback actually is installed */
  printf("\n");
  if (!sollya_lib_install_msg_callback(keep_comparison_warnings, NULL))
    printf("An error happened when installing the message callback\n");
  printf("Nothing should be displayed between now and ");
  a = SOLLYA_PI; b = sollya_lib_default(); c = sollya_lib_add(a,b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);
  printf("now.\n");
  a = SOLLYA_DIV(SOLLYA_LOG(SOLLYA_CONST(17)), SOLLYA_LOG(SOLLYA_CONST(2))); b = SOLLYA_LOG2(SOLLYA_CONST(17));
  c = sollya_lib_cmp_less(a, b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);

  sollya_lib_get_msg_callback(&old_callback, NULL);
  if (!sollya_lib_install_msg_callback(hide_everything, NULL))
    printf("An error happened when installing the message callback\n");
  printf("Nothing should be displayed between now and ");
  a = SOLLYA_DIV(SOLLYA_LOG(SOLLYA_CONST(17)), SOLLYA_LOG(SOLLYA_CONST(2))); b = SOLLYA_LOG2(SOLLYA_CONST(17));
  c = sollya_lib_cmp_less(a, b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);
  printf("now.\n");

  if (old_callback != keep_comparison_warnings)
    printf("sollya_lib_get_msg_callback returned a pointer different from the intended callback.\n");

  if (old_callback) {
    if (!sollya_lib_install_msg_callback(old_callback, NULL))
      printf("An error happened when installing the message callback\n");
  }
  printf("Nothing should be displayed between now and ");
  a = SOLLYA_PI; b = sollya_lib_default(); c = sollya_lib_add(a,b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);
  printf("now.\n");
  a = SOLLYA_DIV(SOLLYA_LOG(SOLLYA_CONST(17)), SOLLYA_LOG(SOLLYA_CONST(2))); b = SOLLYA_LOG2(SOLLYA_CONST(17));
  c = sollya_lib_cmp_less(a, b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);


  /* Testing the mechanism of data passed to callbacks */
  printf("\n");
  if  (!sollya_lib_install_msg_callback(remember_history, &calls))
    printf("An error happened when installing the message callback\n");
  printf("Nothing should be displayed between now and ");
  a = SOLLYA_PI; b = sollya_lib_default(); c = sollya_lib_add(a,b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);
  a = SOLLYA_DIV(SOLLYA_LOG(SOLLYA_CONST(17)), SOLLYA_LOG(SOLLYA_CONST(2))); b = SOLLYA_LOG2(SOLLYA_CONST(17));
  c = sollya_lib_cmp_less(a, b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);
  printf("now.\n");
  printf("Recorded messages:\n");
  for(i=0;i<calls.counter;i++)
    printf("  * %s\n", calls.tab[i]);
  if (calls.counter >= SIZE) printf("  [Other messages discarded]\n");

  /* Testing get_msg_callback when a callback using data is installed */
  printf("\n");
  sollya_lib_get_msg_callback(&old_callback, &old_data);
  if (old_callback != remember_history)
    printf("sollya_lib_get_msg_callback returned a pointer different from the intended callback.\n");
  if (old_data != &calls)
    printf("sollya_lib_get_msg_callback returned a data pointer different from the intended data object.\n");

  if (!sollya_lib_install_msg_callback(hide_everything, NULL))
    printf("An error happened when installing the message callback\n");

  printf("Nothing should be displayed between now and ");
  a = SOLLYA_DIV(SOLLYA_LOG(SOLLYA_CONST(17)), SOLLYA_LOG(SOLLYA_CONST(2))); b = SOLLYA_LOG2(SOLLYA_CONST(17));
  c = sollya_lib_cmp_less(a, b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);
  printf("now.\n");

  printf("Recorded messages:\n");
  for(i=0;i<calls.counter;i++)
    printf("  * %s\n", calls.tab[i]);
  if (calls.counter >= SIZE) printf("  [Other messages discarded]\n");


  if (old_callback) {
    if (!sollya_lib_install_msg_callback(old_callback, old_data))
      printf("An error happened when installing the message callback\n");
  }
  printf("Nothing should be displayed between now and ");
  a = SOLLYA_PI; b = sollya_lib_default(); c = sollya_lib_add(a,b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);
  printf("now.\n");
  printf("Recorded messages:\n");
  for(i=0;i<calls.counter;i++)
    printf("  * %s\n", calls.tab[i]);
  if (calls.counter >= SIZE) printf("  [Other messages discarded]\n");

  old_data = NULL;
  sollya_lib_get_msg_callback(NULL, &old_data);
  if (old_data != &calls)
    printf("sollya_lib_get_msg_callback returned a data pointer different from the intended data object.\n");

  if (!sollya_lib_install_msg_callback(old_callback, NULL))
    printf("An error happened when installing the message callback\n");

  printf("Expecting a warning about NULL passed as data argument to the callback:\n");
  a = SOLLYA_PI; b = sollya_lib_default(); c = sollya_lib_add(a,b);
  sollya_lib_clear_obj(a); sollya_lib_clear_obj(b); sollya_lib_clear_obj(c);
  printf("Recorded messages:\n");
  for(i=0;i<calls.counter;i++)
    printf("  * %s\n", calls.tab[i]);
  if (calls.counter >= SIZE) printf("  [Other messages discarded]\n");

  for(i=0;i<calls.counter;i++) {
    sollya_lib_free(calls.tab[i]);
  }
  sollya_lib_close();
  return 0;
}
