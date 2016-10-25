#include <sollya.h>

int main(void) {
  sollya_obj_t bashCommand;

  sollya_lib_init();

  bashCommand = sollya_lib_string("echo \"Hallo Welt!\" | sed -e 's/a/e/g;s/elt/orld/g;' | tr 'a-z' 'A-Z'");

  sollya_lib_bashexecute(bashCommand);

  sollya_lib_clear_obj(bashCommand);
  
  sollya_lib_close();
  return 0;
}
