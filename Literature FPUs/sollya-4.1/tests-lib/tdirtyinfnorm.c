#include <sollya.h>

#define NB_OF_TESTS 11

int callback(sollya_msg_t msg, void *data) {
  (void)data; /* Avoiding "unused parameter" warning */

  int message = sollya_lib_get_msg_id(msg);
  switch(message) {
  case SOLLYA_MSG_EXPRESSION_IS_CONSTANT:
    sollya_lib_printf("Caught message: a certain expression is constant.\n");
    break;
  case SOLLYA_MSG_DOMAIN_IS_NO_CLOSED_INTERVAL_ON_THE_REALS:
    sollya_lib_printf("Caught message: the domain to compute on must be a closed subset of the real numbers.\n");
    break;
  case SOLLYA_MSG_DOMAIN_IS_REDUCED_TO_A_POINT_WILL_SIMPLY_EVAL:
    sollya_lib_printf("Caught message: the domain is reduced to a point.\n");
    break;
  default:
    sollya_lib_printf("Unexpected warning %d.\n", message);
  }
  return 0;
}

int boolean_not_eq(sollya_obj_t a, sollya_obj_t b) {
  sollya_obj_t tmp;
  int res;

  tmp = sollya_lib_cmp_not_equal(a,b);
  res = sollya_lib_is_true(tmp);
  sollya_lib_clear_obj(tmp);
  return res;
}


int main(void) {
  sollya_obj_t a[NB_OF_TESTS], b[NB_OF_TESTS], c[NB_OF_TESTS];
  sollya_obj_t vold32, vold64, vsvn;
  int i;

  sollya_lib_init();
  sollya_lib_install_msg_callback(callback, NULL);

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

  for (i=0;i<NB_OF_TESTS-1;i++) {
    c[i] = sollya_lib_dirtyinfnorm(a[i],b[i]);
    sollya_lib_printf("The supremum norm of %b over %b gets approximated with dirtyinfnorm by %b\n",a[i],b[i],c[i]);
  }

  c[10] = sollya_lib_dirtyinfnorm(a[10],b[10]);
  vold32 = sollya_lib_parse_string("29227078620752385174690861915460872239107789574239b-162");
  vold64 = sollya_lib_parse_string("29227078620752385174690861915460872239107789574239b-162");
  vsvn = sollya_lib_parse_string("29211104992902755825848922629443447049332431007237b-162");
  if (boolean_not_eq(c[10], vsvn) && boolean_not_eq(c[10], vold32) && boolean_not_eq(c[10], vold64))
    sollya_lib_printf("%b\n", c[10]);
  else sollya_lib_printf("Check that mpfr_urandom has the expected behavior (either one of the old 32-bit or 64-bit behavior), or the new one. OK\n");
  sollya_lib_clear_obj(vsvn);
  sollya_lib_clear_obj(vold32);
  sollya_lib_clear_obj(vold64);

  for (i=0;i<NB_OF_TESTS;i++) {
    sollya_lib_clear_obj(a[i]);
    sollya_lib_clear_obj(b[i]);
    sollya_lib_clear_obj(c[i]);
  }

  sollya_lib_close();
  return 0;
}

