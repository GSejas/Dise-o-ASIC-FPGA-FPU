#include <mpfi.h>

int foo(mpfi_t rop, mpfi_t op, int n) {
  (void) n;
  (void) op;
  mpfi_interv_ui(rop, 0, 1);
  return 0;
}
