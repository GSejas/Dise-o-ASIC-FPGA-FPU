#include <gmp.h>
#include <stdio.h>
#include <sollya.h>
#include <stdlib.h>

#define NB_OF_TESTS 11

int myMallocUsed = 0;
int myCallocUsed = 0;
int myReallocUsed = 0;
int myFreeUsed = 0;
int myReallocWithSizeUsed = 0;
int myFreeWithSizeUsed = 0;

int callback(sollya_msg_t msg, void *data) {
  (void)msg; /* Avoiding "unused parameter" warning */
  (void)data; /* Avoiding "unused parameter" warning */
  return 0;
}

void *myMalloc(size_t size) {
  myMallocUsed++;
  return malloc(size);
}

void *myCalloc(size_t nmemb, size_t size) {
  myCallocUsed++;
  return calloc(nmemb,size);
}

void *myRealloc(void *ptr, size_t size) {
  myReallocUsed++;
  return realloc(ptr,size);
}

void myFree(void *ptr) {
  myFreeUsed++;
  free(ptr);
}

void *myReallocWithSize(void *ptr, size_t oldSize, size_t size) {
  (void) oldSize;
  myReallocWithSizeUsed++;
  return realloc(ptr,size);
}

void myFreeWithSize(void *ptr, size_t size) {
  (void) size;
  myFreeWithSizeUsed++;
  free(ptr);
}

int main(void) {
  int okay = 1;
  void *(*gmp_malloc_before)(size_t);
  void *(*gmp_realloc_before)(void *, size_t, size_t);
  void (*gmp_free_before)(void *, size_t);
  void *(*gmp_malloc_after)(size_t);
  void *(*gmp_realloc_after)(void *, size_t, size_t);
  void (*gmp_free_after)(void *, size_t);
  sollya_obj_t a[NB_OF_TESTS], b[NB_OF_TESTS], c[NB_OF_TESTS];
  int i;

  /* Test #1 */

  mp_get_memory_functions(&gmp_malloc_before, &gmp_realloc_before, &gmp_free_before);

  myMallocUsed = 0;
  myCallocUsed = 0;
  myReallocUsed = 0;
  myFreeUsed = 0;
  myReallocWithSizeUsed = 0;
  myFreeWithSizeUsed = 0;

  sollya_lib_init_with_custom_memory_functions(myMalloc, myCalloc, myRealloc, myFree, myReallocWithSize, myFreeWithSize);
  sollya_lib_install_msg_callback(callback, NULL);

  /* Just do some stuff to use the memory functions */

  a[0] = SOLLYA_CONST(17.0);
  b[0] = sollya_lib_parse_string("[-1;1]");
  
  a[1] = SOLLYA_X_;
  b[1] = sollya_lib_parse_string("[-1;1.5]");

  a[2] = sollya_lib_parse_string("x^2 + x -1");
  b[2] = sollya_lib_parse_string("[-2;1]");

  a[3] = sollya_lib_parse_string("x^2 + x -1");
  b[3] = sollya_lib_parse_string("[-2;2]");

  a[4] = sollya_lib_parse_string("sin(17 * (x-3)) * cos(x-3) * exp(x/4)");
  b[4] = sollya_lib_parse_string("[-2;2]");

  a[5] = sollya_lib_parse_string("sin(-51 + x * 17) * cos(-3 + x) * exp(x * 1b-2) + 4 - (5841986838484490273226357258541178809257197853603b-160 + x * (-1657010884744388725768284702475520358103564313103b-163 + x * (1566987824830335456879991047308861887585745670967b-162 + x * (18637702919758264241676014573759486129098461080361b-165 + x * (-4691389977422298284816628406735202847317903770937b-165 + x * (-3641480240898210056437514385988871012264138539689b-165))))))");
  b[5] = sollya_lib_parse_string("[-2;2]");
  
  a[6] = sollya_lib_parse_string("exp(x)");
  b[6] = sollya_lib_parse_string("[-infty;2]");
  
  a[7] = sollya_lib_parse_string("erf(x)");
  b[7] = sollya_lib_parse_string("[-infty;infty]");
  
  a[8] = sollya_lib_parse_string("(x * (46768052394588893382517914646921013753690502283181b-165 + x * (-23842604129029764481373810400725037839108682209013b-310 + x * (-31178701596392595588345276430836652277717061563611b-167 + x * (19474296355951076471139239730950050055091215313371b-300 + x * (6235740319278519117669054529057531256595154021039b-169 + x * (-8903255600987858885078854107239112353939531067197b-291 + x * (-19004160973039296358594544346438861776255280578323b-176 + x * (13978875722788212683821368308788823202998673317847b-285 + x * (16892587531590485568360414041618499983605528356089b-182 + x * (-5509367034013013747984244537606353757286793710935b-278 + x * (-9828414563834216782252138074806120633549802775429b-188 + x * (36514821794022558047614397315048656003649092374341b-276 + x * (4032170077040468786771930826281267656340291488583b-194 + x * (-15157407289929000622398688419996925341779253679627b-271 + x * (-19661622363274627316629009823189604834794640905605b-204 + x * (9925527665865119935372490664410596660907859285007b-268 + x * 9244923258117519852493775515420083692797862150005b-211))))))))))))))))) / sin(x) - 1");
  b[8] = sollya_lib_parse_string("[-1/4;1/4]");

  a[9] = sollya_lib_parse_string("exp(x)");
  b[9] = sollya_lib_parse_string("[2;2]");

  a[10] = sollya_lib_parse_string("(-5 * x^2 + 5) * cos(x * 10000)");
  b[10] = sollya_lib_parse_string("[-1;1]");

  for (i=0;i<NB_OF_TESTS;i++) {
    c[i] = sollya_lib_dirtyinfnorm(a[i],b[i]);
  }

  for (i=0;i<NB_OF_TESTS;i++) {
    sollya_lib_clear_obj(a[i]);
    sollya_lib_clear_obj(b[i]);
    sollya_lib_clear_obj(c[i]);
  }

  /* End of just doing stuff */

  sollya_lib_close();

  mp_get_memory_functions(&gmp_malloc_after, &gmp_realloc_after, &gmp_free_after);

  if (gmp_malloc_after != gmp_malloc_before) okay = 0;
  if (gmp_realloc_after != gmp_realloc_before) okay = 0;
  if (gmp_free_after != gmp_free_before) okay = 0;

  if (myMallocUsed <= 0) okay = 0;
  if (myCallocUsed <= 0) okay = 0;
  if (myReallocUsed <= 0) okay = 0;
  if (myFreeUsed <= 0) okay = 0;
  if (myReallocWithSizeUsed <= 0) okay = 0;
  if (myFreeWithSizeUsed <= 0) okay = 0;

  if (okay) {
    printf("The first memory test seems to be okay.\n");
  } else {
    printf("There seems to be a problem with the memory functions:\n");
    printf("The installed malloc has been used %d times.\n", myMallocUsed);
    printf("The installed calloc has been used %d times.\n", myCallocUsed);
    printf("The installed realloc has been used %d times.\n", myReallocUsed);
    printf("The installed free has been used %d times.\n", myFreeUsed);
    printf("The installed realloc-with-size has been used %d times.\n", myReallocWithSizeUsed);
    printf("The installed free-with-size has been used %d times.\n", myFreeWithSizeUsed);
    printf("The before-and-after pointers for the GMP malloc are %p and %p\n", gmp_malloc_before, gmp_malloc_after);
    printf("The before-and-after pointers for the GMP realloc are %p and %p\n", gmp_realloc_before, gmp_realloc_after);
    printf("The before-and-after pointers for the GMP free are %p and %p\n", gmp_free_before, gmp_free_after);
  }


  /* Test #2 */

  mp_get_memory_functions(&gmp_malloc_before, &gmp_realloc_before, &gmp_free_before);

  myMallocUsed = 0;
  myCallocUsed = 0;
  myReallocUsed = 0;
  myFreeUsed = 0;
  myReallocWithSizeUsed = 0;
  myFreeWithSizeUsed = 0;

  sollya_lib_init_with_custom_memory_functions(myMalloc, myCalloc, myRealloc, myFree, NULL, NULL);
  sollya_lib_install_msg_callback(callback, NULL);

  /* Just do some stuff to use the memory functions */

  a[0] = SOLLYA_CONST(17.0);
  b[0] = sollya_lib_parse_string("[-1;1]");
  
  a[1] = SOLLYA_X_;
  b[1] = sollya_lib_parse_string("[-1;1.5]");

  a[2] = sollya_lib_parse_string("x^2 + x -1");
  b[2] = sollya_lib_parse_string("[-2;1]");

  a[3] = sollya_lib_parse_string("x^2 + x -1");
  b[3] = sollya_lib_parse_string("[-2;2]");

  a[4] = sollya_lib_parse_string("sin(17 * (x-3)) * cos(x-3) * exp(x/4)");
  b[4] = sollya_lib_parse_string("[-2;2]");

  a[5] = sollya_lib_parse_string("sin(-51 + x * 17) * cos(-3 + x) * exp(x * 1b-2) + 4 - (5841986838484490273226357258541178809257197853603b-160 + x * (-1657010884744388725768284702475520358103564313103b-163 + x * (1566987824830335456879991047308861887585745670967b-162 + x * (18637702919758264241676014573759486129098461080361b-165 + x * (-4691389977422298284816628406735202847317903770937b-165 + x * (-3641480240898210056437514385988871012264138539689b-165))))))");
  b[5] = sollya_lib_parse_string("[-2;2]");
  
  a[6] = sollya_lib_parse_string("exp(x)");
  b[6] = sollya_lib_parse_string("[-infty;2]");
  
  a[7] = sollya_lib_parse_string("erf(x)");
  b[7] = sollya_lib_parse_string("[-infty;infty]");
  
  a[8] = sollya_lib_parse_string("(x * (46768052394588893382517914646921013753690502283181b-165 + x * (-23842604129029764481373810400725037839108682209013b-310 + x * (-31178701596392595588345276430836652277717061563611b-167 + x * (19474296355951076471139239730950050055091215313371b-300 + x * (6235740319278519117669054529057531256595154021039b-169 + x * (-8903255600987858885078854107239112353939531067197b-291 + x * (-19004160973039296358594544346438861776255280578323b-176 + x * (13978875722788212683821368308788823202998673317847b-285 + x * (16892587531590485568360414041618499983605528356089b-182 + x * (-5509367034013013747984244537606353757286793710935b-278 + x * (-9828414563834216782252138074806120633549802775429b-188 + x * (36514821794022558047614397315048656003649092374341b-276 + x * (4032170077040468786771930826281267656340291488583b-194 + x * (-15157407289929000622398688419996925341779253679627b-271 + x * (-19661622363274627316629009823189604834794640905605b-204 + x * (9925527665865119935372490664410596660907859285007b-268 + x * 9244923258117519852493775515420083692797862150005b-211))))))))))))))))) / sin(x) - 1");
  b[8] = sollya_lib_parse_string("[-1/4;1/4]");

  a[9] = sollya_lib_parse_string("exp(x)");
  b[9] = sollya_lib_parse_string("[2;2]");

  a[10] = sollya_lib_parse_string("(-5 * x^2 + 5) * cos(x * 10000)");
  b[10] = sollya_lib_parse_string("[-1;1]");

  for (i=0;i<NB_OF_TESTS;i++) {
    c[i] = sollya_lib_dirtyinfnorm(a[i],b[i]);
  }

  for (i=0;i<NB_OF_TESTS;i++) {
    sollya_lib_clear_obj(a[i]);
    sollya_lib_clear_obj(b[i]);
    sollya_lib_clear_obj(c[i]);
  }

  /* End of just doing stuff */

  sollya_lib_close();

  mp_get_memory_functions(&gmp_malloc_after, &gmp_realloc_after, &gmp_free_after);

  if (gmp_malloc_after != gmp_malloc_before) okay = 0;
  if (gmp_realloc_after != gmp_realloc_before) okay = 0;
  if (gmp_free_after != gmp_free_before) okay = 0;

  if (myMallocUsed <= 0) okay = 0;
  if (myCallocUsed <= 0) okay = 0;
  if (myReallocUsed <= 0) okay = 0;
  if (myFreeUsed <= 0) okay = 0;
  if (myReallocWithSizeUsed != 0) okay = 0;
  if (myFreeWithSizeUsed != 0) okay = 0;

  if (okay) {
    printf("The second memory test seems to be okay.\n");
  } else {
    printf("There seems to be a problem with the memory functions:\n");
    printf("The installed malloc has been used %d times.\n", myMallocUsed);
    printf("The installed calloc has been used %d times.\n", myCallocUsed);
    printf("The installed realloc has been used %d times.\n", myReallocUsed);
    printf("The installed free has been used %d times.\n", myFreeUsed);
    printf("The installed realloc-with-size has been used %d times.\n", myReallocWithSizeUsed);
    printf("The installed free-with-size has been used %d times.\n", myFreeWithSizeUsed);
    printf("The before-and-after pointers for the GMP malloc are %p and %p\n", gmp_malloc_before, gmp_malloc_after);
    printf("The before-and-after pointers for the GMP realloc are %p and %p\n", gmp_realloc_before, gmp_realloc_after);
    printf("The before-and-after pointers for the GMP free are %p and %p\n", gmp_free_before, gmp_free_after);
  }

  if (!okay) return 1;
  return 0;
}

