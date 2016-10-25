#include <sollya.h>

int main(void) {
  sollya_obj_t pstar, P, f, n, formats, I, fp, mode, constrainedpart, powers, tmp1, tmp2, P1, P2, P3;
  sollya_lib_init();

  pstar = sollya_lib_parse_string("5846006549323611671784298104022718622318882177971b-162 + x * (37857459261849734002934198358497784854969213609141b-241 + x * (-23384026197294176595383359674367214160107584181507b-165 + x * (-38602791478525408905485501706553096127203819717855b-228 + x * (31178701574267686389540459856148935530651557981629b-169 + x * (14117092987825147270453985390332190734246695748303b-216 + x * (-16628060881742355087337911794409009456208012766191b-173))))))");
  f = SOLLYA_COS(SOLLYA_X_);
  n = SOLLYA_CONST(6);
  formats = sollya_lib_parse_string("[|DD, DD, D...|]");
  I = sollya_lib_parse_string("[-1b-5;1b-5]");
  fp = sollya_lib_default();
  mode = sollya_lib_default();
  constrainedpart = sollya_lib_default();
  P = sollya_lib_fpminimax(f, n, formats, I, fp, mode, constrainedpart, pstar, NULL);
  sollya_lib_printexpansion(P);
  sollya_lib_clear_obj(pstar);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(n);
  sollya_lib_clear_obj(formats);
  sollya_lib_clear_obj(I);
  sollya_lib_clear_obj(fp);
  sollya_lib_clear_obj(mode);
  sollya_lib_clear_obj(constrainedpart);
  sollya_lib_clear_obj(P);



  pstar = sollya_lib_parse_string("2148263723907549819858926287983956687732819b-218 + x * (46768052394587948180729798097226792243112547550905b-165 + x * (-25507165977932281269808564943557572116806817621809b-228 + x * (-31178701565420095891159605334409136402204722409645b-167 + x * (12584781347098934684186528379166357990161007221285b-216 + x * (24941946363609599630853575496590807881363811501643b-171 + x * (-27084577193023540426845942064151570020527090561271b-208))))))");
  f = SOLLYA_SIN(SOLLYA_X_);
  n = SOLLYA_CONST(6);
  formats = sollya_lib_parse_string("[|32...|]");
  I = sollya_lib_parse_string("[-1b-5;1b-5]");
  fp = sollya_lib_fixed();
  mode = sollya_lib_absolute();
  constrainedpart = sollya_lib_default();
  tmp1 = sollya_lib_fpminimax(f, n, formats, I, fp, mode, constrainedpart, pstar, NULL);
  P = sollya_lib_horner(tmp1);
  sollya_lib_clear_obj(tmp1);
  powers = sollya_lib_powers();
  sollya_lib_set_display(powers);
  sollya_lib_clear_obj(powers);
  sollya_lib_printf("%b\n",P);
  sollya_lib_clear_obj(pstar);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(n);
  sollya_lib_clear_obj(formats);
  sollya_lib_clear_obj(I);
  sollya_lib_clear_obj(fp);
  sollya_lib_clear_obj(mode);
  sollya_lib_clear_obj(constrainedpart);
  sollya_lib_clear_obj(P);


  pstar = sollya_lib_parse_string("x^3 * (7794680717168470900797342378780962700124730873177b-165 + x * 31179902867931546748200780881663744737011812548003b-169)");
  f = SOLLYA_EXP(SOLLYA_X_);
  n =  sollya_lib_parse_string("[|3,4|]");
  formats = sollya_lib_parse_string("[|D,24|]");

  tmp1 = sollya_lib_off();
  sollya_lib_set_roundingwarnings(tmp1);
  sollya_lib_clear_obj(tmp1);
  I = sollya_lib_parse_string("[-1/256; 1/246]");
  constrainedpart = sollya_lib_parse_string("1+x+x^2/2");
  fp = sollya_lib_default();
  mode = sollya_lib_default();
  tmp1 = sollya_lib_fpminimax(f, n, formats, I, constrainedpart, fp, mode, pstar, NULL);
  P = sollya_lib_horner(tmp1);
  sollya_lib_clear_obj(tmp1);
  powers = sollya_lib_powers();
  sollya_lib_set_display(powers);
  sollya_lib_clear_obj(powers);
  sollya_lib_printf("%b\n",P);
  sollya_lib_clear_obj(pstar);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(n);
  sollya_lib_clear_obj(formats);
  sollya_lib_clear_obj(I);
  sollya_lib_clear_obj(fp);
  sollya_lib_clear_obj(mode);
  sollya_lib_clear_obj(constrainedpart);
  sollya_lib_clear_obj(P);


  f = SOLLYA_COS(SOLLYA_EXP(SOLLYA_X_));
  pstar = sollya_lib_parse_string("12634443274879194690170438040404782420883156872817b-164 + x * (-9838489776505477022831228470738983214292503288671b-163 + x * (-32311422838792817804696665515592631012661758648301b-165 + x * (-25268886572680378753378093437862180139058069966971b-166 + x * (15055969478386755176354565521121927285916932024465b-168 + x * 3245144072789014252966495640681210160689977302851b-164))))");
  mode = sollya_lib_absolute();
  n = SOLLYA_CONST(5);
  fp = sollya_lib_default();
  constrainedpart = sollya_lib_default();

  tmp1 = SOLLYA_SUB(sollya_lib_copy_obj(f), sollya_lib_copy_obj(pstar));
  tmp2 = sollya_lib_parse_string("[-1b-7; 1b-7]");
  I = sollya_lib_dirtyfindzeros(tmp1, tmp2);
  sollya_lib_clear_obj(tmp1);
  sollya_lib_clear_obj(tmp2);

  formats = sollya_lib_parse_string("[|DD...|]");
  P1 = sollya_lib_fpminimax(f, n, formats, I, mode, constrainedpart, fp, pstar, NULL);
  sollya_lib_clear_obj(formats);

  formats = sollya_lib_parse_string("[|D...|]");
  P2 = sollya_lib_fpminimax(f, n, formats, I, mode, constrainedpart, fp, pstar, NULL);
  sollya_lib_clear_obj(formats);

  formats = sollya_lib_parse_string("[|D, D, D, 24...|]");
  P3 = sollya_lib_fpminimax(f, n, formats, I, mode, constrainedpart, fp, pstar, NULL);
  sollya_lib_clear_obj(formats);

  sollya_lib_clear_obj(I);
  I = sollya_lib_parse_string("[-1b-7; 1b-7]");

  tmp1 = SOLLYA_SUB(sollya_lib_copy_obj(f), sollya_lib_copy_obj(pstar));
  tmp2 = sollya_lib_dirtyinfnorm(tmp1, I);
  sollya_lib_printf("Error of pstar:  %b\n", tmp2);
  sollya_lib_clear_obj(tmp1);
  sollya_lib_clear_obj(tmp2);

  tmp1 = SOLLYA_SUB(sollya_lib_copy_obj(f), sollya_lib_copy_obj(P1));
  tmp2 = sollya_lib_dirtyinfnorm(tmp1, I);
  sollya_lib_printf("Error of P1:     %b\n", tmp2);
  sollya_lib_clear_obj(tmp1);
  sollya_lib_clear_obj(tmp2);

  tmp1 = SOLLYA_SUB(sollya_lib_copy_obj(f), sollya_lib_copy_obj(P2));
  tmp2 = sollya_lib_dirtyinfnorm(tmp1, I);
  sollya_lib_printf("Error of P2:     %b\n", tmp2);
  sollya_lib_clear_obj(tmp1);
  sollya_lib_clear_obj(tmp2);

  tmp1 = SOLLYA_SUB(sollya_lib_copy_obj(f), sollya_lib_copy_obj(P3));
  tmp2 = sollya_lib_dirtyinfnorm(tmp1, I);
  sollya_lib_printf("Error of P3:     %b\n", tmp2);
  sollya_lib_clear_obj(tmp1);
  sollya_lib_clear_obj(tmp2);

  sollya_lib_clear_obj(I);
  sollya_lib_clear_obj(pstar);
  sollya_lib_clear_obj(f);
  sollya_lib_clear_obj(n);
  sollya_lib_clear_obj(fp);
  sollya_lib_clear_obj(mode);
  sollya_lib_clear_obj(constrainedpart);
  sollya_lib_clear_obj(P1);
  sollya_lib_clear_obj(P2);
  sollya_lib_clear_obj(P3);


  sollya_lib_close();
  return 0;
}
