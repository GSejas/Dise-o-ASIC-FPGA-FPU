/*

  Copyright 2006-2013 by

  Laboratoire de l'Informatique du Parallelisme,
  UMR CNRS - ENS Lyon - UCB Lyon 1 - INRIA 5668,

  Laboratoire d'Informatique de Paris 6, equipe PEQUAN,
  UPMC Universite Paris 06 - CNRS - UMR 7606 - LIP6, Paris, France,

  and by

  Centre de recherche INRIA Sophia-Antipolis Mediterranee, equipe APICS,
  Sophia Antipolis, France.

  Contributors Ch. Lauter, S. Chevillard

  christoph.lauter@ens-lyon.org
  sylvain.chevillard@ens-lyon.org

  This software is a computer program whose purpose is to provide an
  environment for safe floating-point code development. It is
  particularily targeted to the automatized implementation of
  mathematical floating-point libraries (libm). Amongst other features,
  it offers a certified infinity norm, an automatic polynomial
  implementer and a fast Remez algorithm.

  This software is governed by the CeCILL-C license under French law and
  abiding by the rules of distribution of free software.  You can  use,
  modify and/ or redistribute the software under the terms of the CeCILL-C
  license as circulated by CEA, CNRS and INRIA at the following URL
  "http://www.cecill.info".

  As a counterpart to the access to the source code and  rights to copy,
  modify and redistribute granted by the license, users are provided only
  with a limited warranty  and the software's author,  the holder of the
  economic rights,  and the successive licensors  have only  limited
  liability.

  In this respect, the user's attention is drawn to the risks associated
  with loading,  using,  modifying and/or developing or reproducing the
  software by the user in light of its specific status of free software,
  that may mean  that it is complicated to manipulate,  and  that  also
  therefore means  that it is reserved for developers  and  experienced
  professionals having in-depth computer knowledge. Users are therefore
  encouraged to load and test the software's suitability as regards their
  requirements in conditions enabling the security of their systems and/or
  data to be ensured and,  more generally, to use and operate it in the
  same conditions as regards security.

  The fact that you are presently reading this means that you have had
  knowledge of the CeCILL-C license and that you accept its terms.

  This program is distributed WITHOUT ANY WARRANTY; without even the
  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

*/

#define _BSD_SOURCE

#include <gmp.h>
#include <mpfr.h>
#include "mpfi-compat.h"
#include <stdio.h> /* fprintf, fopen, fclose, */
#include <errno.h>
#include <inttypes.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include "expression.h"
#include "execute.h"
#include "double.h"
#include "general.h"
#include "infnorm.h"


typedef union {
  int32_t i[2];
  double d;
} db_number;

typedef union {
  int32_t i;
  float f;
} fl_number;

/* Converts a string of the form [:space:]*(+)?(-)?(0x)?[0-9A-Fa-f]*
   interpreted in hexadecimal into an int32.
   If the string is not a valid hexadecimal string or if the number it
   represents does not fit on an int32_t, the behavior of the function is not
   determined.

   Note: this function only exists because we cannot use strtoll as it is not
   BSD compliant.
*/
int32_t convertHexadecimalStringToInt32(char *str) {
  char *ptr;
  int negate;
  int32_t res;
  uint32_t t, c;

  negate = 0;
  t = 0;

  for (ptr=str;*ptr!='\0';ptr++) {
    if (!isspace(*ptr)) break;
  }

  if (*ptr=='+') ptr++;
  if (*ptr=='-') {
    negate = 1;
    ptr++;
  }

  if ((*ptr=='0') && (*(ptr+1)=='x')) ptr += 2;

  for (;*ptr!='\0';ptr++) {
    if (((*ptr>='0') && (*ptr<='9')) ||
	((*ptr>='A') && (*ptr<='F')) ||
	((*ptr>='a') && (*ptr<='f'))) {
      t <<= 4;
      if ((*ptr>='0') && (*ptr<='9')) {
	c = *ptr - '0';
      } else {
	if ((*ptr>='A') && (*ptr<='F')) {
	  c = *ptr - 'A' + 0xa;
	} else {
	  c = *ptr - 'a' + 0xa;
	}
      }
      t += c;
    } else {
      t = 0;
      break;
    }
  }

  res = *((int32_t *) &t);
  if (negate) res = -res;

  return res;
}

int round_to_format(mpfr_t rop, mpfr_t op, int prec, mp_rnd_t mode) {
  mpfr_t res;
  int round_dir;

  mpfr_init2(res,(mp_prec_t)prec);

  round_dir = mpfr_set(res,op, mode);
  if (mpfr_set(rop, res, GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_UNDESIRED_ROUNDING_IN_ROUND_TO_FORMAT,"Warning: an undesired rounding occurred on a rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"Try to increase the working precision.\n");
    }
  }

  mpfr_clear(res);
  return round_dir;
}



int mpfr_round_to_double(mpfr_t rop, mpfr_t op) {
  double d;
  int res;

  d = sollya_mpfr_get_d(op,GMP_RNDN);
  if (mpfr_set_d(rop,d,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_DOUBLE,"Warning: double rounding occurred on invoking the double precision rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"Try to increase the working precision.\n");
    }
  }

  res = mpfr_cmp(rop,op);

  return res;
}

int mpfr_round_to_double_mode(mpfr_t rop, mpfr_t op, mp_rnd_t mode) {
  double d;
  int res;

  d = sollya_mpfr_get_d(op,mode);
  if (mpfr_set_d(rop,d,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_DOUBLE,"Warning: double rounding occurred on invoking the double precision rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"Try to increase the working precision.\n");
    }
  }

  res = mpfr_cmp(rop,op);

  return res;
}


int mpfr_round_to_prec(mpfr_t rop, mpfr_t op, mp_prec_t prec) {
  mp_prec_t p;
  mpfr_t temp;
  int res;

  if (prec < 6) p = 6; else p = prec;
  mpfr_init2(temp,p);
  mpfr_set(temp,op,GMP_RNDN);
  if (mpfr_set(rop,temp,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_PREC,"Warning: double rounding occurred on invoking the round-to-prec rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"Try to increase the working precision.\n");
    }
  }
  mpfr_clear(temp);

  res = mpfr_cmp(rop,op);

  return res;
}


int mpfr_round_to_doubledouble(mpfr_t rop, mpfr_t op) {
  double d;
  mpfr_t accu, temp, rest;
  mp_prec_t prec;
  int res;

  prec = mpfr_get_prec(op);
  if (prec < 106) {
    prec = 106;
  }

  mpfr_init2(accu, prec);
  mpfr_init2(temp, prec);
  mpfr_init2(rest, prec);

  d = sollya_mpfr_get_d(op,GMP_RNDN);
  if (mpfr_set_d(accu,d,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_DOUBLE_DOUBLE,"Warning: double rounding occurred on invoking the double-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on recasting to MPFR. This should not occur.\n");
    }
  }
  if (mpfr_sub(rest,op,accu,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_DOUBLE_DOUBLE,"Warning: double rounding occurred on invoking the double-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on substracting in MPFR. This should not occur.\n");
    }
  }
  d = sollya_mpfr_get_d(rest,GMP_RNDN);
  if (mpfr_set_d(temp,d,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_DOUBLE_DOUBLE,"Warning: double rounding occurred on invoking the double-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on recasting to MPFR. This should not occur.\n");
    }
  }
  if (mpfr_add(accu,accu,temp,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_DOUBLE_DOUBLE,"Warning: double rounding occurred on invoking the double-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on substracting in MPFR. This should not occur.\n");
    }
  }
  if (mpfr_set(rop,accu,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_DOUBLE_DOUBLE,"Warning: double rounding occurred on invoking the double-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"Try to increase the working precision.\n");
    }
  }

  res = mpfr_cmp(rop,op);

  mpfr_clear(accu);
  mpfr_clear(temp);
  mpfr_clear(rest);
  return res;
}

int mpfr_round_to_doubledouble_mode(mpfr_t rop, mpfr_t op, mp_rnd_t mode) {
  double d;
  mpfr_t accu, temp, rest;
  mp_prec_t prec;
  int res;

  prec = mpfr_get_prec(op);
  if (prec < 106) {
    prec = 106;
  }

  mpfr_init2(accu, prec);
  mpfr_init2(temp, prec);
  mpfr_init2(rest, prec);

  d = sollya_mpfr_get_d(op,GMP_RNDN);
  if (mpfr_set_d(accu,d,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_DOUBLE_DOUBLE,"Warning: double rounding occurred on invoking the double-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on recasting to MPFR. This should not occur.\n");
    }
  }
  if (mpfr_sub(rest,op,accu,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_DOUBLE_DOUBLE,"Warning: double rounding occurred on invoking the double-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on substracting in MPFR. This should not occur.\n");
    }
  }
  d = sollya_mpfr_get_d(rest,mode);
  if (mpfr_set_d(temp,d,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_DOUBLE_DOUBLE,"Warning: double rounding occurred on invoking the double-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on recasting to MPFR. This should not occur.\n");
    }
  }
  if (mpfr_add(accu,accu,temp,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_DOUBLE_DOUBLE,"Warning: double rounding occurred on invoking the double-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on substracting in MPFR. This should not occur.\n");
    }
  }
  if (mpfr_set(rop,accu,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_DOUBLE_DOUBLE,"Warning: double rounding occurred on invoking the double-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"Try to increase the working precision.\n");
    }
  }

  res = mpfr_cmp(rop,op);

  mpfr_clear(accu);
  mpfr_clear(temp);
  mpfr_clear(rest);
  return res;
}


int mpfr_round_to_tripledouble(mpfr_t rop, mpfr_t op) {
  double d;
  mpfr_t accu, temp, rest;
  mp_prec_t prec;
  int res;

  prec = mpfr_get_prec(op);
  if (prec < 159) {
    prec = 159;
  }

  mpfr_init2(accu, prec);
  mpfr_init2(temp, prec);
  mpfr_init2(rest, prec);

  d = sollya_mpfr_get_d(op,GMP_RNDN);
  if (mpfr_set_d(accu,d,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on recasting to MPFR. This should not occur.\n");
    }
  }
  if (mpfr_sub(rest,op,accu,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on substracting in MPFR. This should not occur.\n");
    }
  }
  d = sollya_mpfr_get_d(rest,GMP_RNDN);
  if (mpfr_set_d(temp,d,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on recasting to MPFR. This should not occur.\n");
    }
  }
  if (mpfr_add(accu,accu,temp,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on substracting in MPFR. This should not occur.\n");
    }
  }
  if (mpfr_sub(rest,op,accu,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on substracting in MPFR. This should not occur.\n");
    }
  }
  d = sollya_mpfr_get_d(rest,GMP_RNDN);
  if (mpfr_set_d(temp,d,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on recasting to MPFR. This should not occur.\n");
    }
  }
  if (mpfr_add(accu,accu,temp,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on substracting in MPFR. This should not occur.\n");
    }
  }
  if (mpfr_set(rop,accu,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"Try to increase the working precision.\n");
    }
  }

  res = mpfr_cmp(rop,op);

  mpfr_clear(accu);
  mpfr_clear(temp);
  mpfr_clear(rest);

  return res;
}

int mpfr_round_to_tripledouble_mode(mpfr_t rop, mpfr_t op, mp_rnd_t mode) {
  double d;
  mpfr_t accu, temp, rest;
  mp_prec_t prec;
  int res;

  prec = mpfr_get_prec(op);
  if (prec < 159) {
    prec = 159;
  }

  mpfr_init2(accu, prec);
  mpfr_init2(temp, prec);
  mpfr_init2(rest, prec);

  d = sollya_mpfr_get_d(op,GMP_RNDN);
  if (mpfr_set_d(accu,d,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on recasting to MPFR. This should not occur.\n");
    }
  }
  if (mpfr_sub(rest,op,accu,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on substracting in MPFR. This should not occur.\n");
    }
  }
  d = sollya_mpfr_get_d(rest,GMP_RNDN);
  if (mpfr_set_d(temp,d,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on recasting to MPFR. This should not occur.\n");
    }
  }
  if (mpfr_add(accu,accu,temp,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on substracting in MPFR. This should not occur.\n");
    }
  }
  if (mpfr_sub(rest,op,accu,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on substracting in MPFR. This should not occur.\n");
    }
  }
  d = sollya_mpfr_get_d(rest,mode);
  if (mpfr_set_d(temp,d,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on recasting to MPFR. This should not occur.\n");
    }
  }
  if (mpfr_add(accu,accu,temp,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The rounding occurred on substracting in MPFR. This should not occur.\n");
    }
  }
  if (mpfr_set(rop,accu,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_TO_TRIPLE_DOUBLE,"Warning: double rounding occurred on invoking the triple-double rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"Try to increase the working precision.\n");
    }
  }

  res = mpfr_cmp(rop,op);

  mpfr_clear(accu);
  mpfr_clear(temp);
  mpfr_clear(rest);

  return res;
}


int printDoubleInHexa(mpfr_t x) {
  int res;
  double d;
  mpfr_t temp;
  db_number xdb, endianessdb;

  mpfr_init2(temp,mpfr_get_prec(x));

  d = sollya_mpfr_get_d(x,GMP_RNDN);
  if (mpfr_set_d(temp,d,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_CONVERTING_FROM_DOUBLE,"Warning: rounding occurred unexpectedly on reconverting a double value.\n");
    }
  }

  res = mpfr_cmp(temp,x);

  if (res) {
    if (!noRoundingWarnings) {
      if (res < 0)
        printMessage(1,SOLLYA_MSG_ROUNDING_DOWN_BEFORE_PRINTING_DOUBLE,"Warning: rounding down occurred before printing a value as a double.\n");
      else
        printMessage(1,SOLLYA_MSG_ROUNDING_UP_BEFORE_PRINTING_DOUBLE,"Warning: rounding up occurred before printing a value as a double.\n");
    }
  }

  xdb.d = d;
  endianessdb.d = 1.0;
  if ((endianessdb.i[1] == 0x3ff00000) && (endianessdb.i[0] == 0)) {
    sollyaPrintf("0x%08x%08x\n",xdb.i[1],xdb.i[0]);
  } else {
    if ((endianessdb.i[0] == 0x3ff00000) && (endianessdb.i[1] == 0)) {
      sollyaPrintf("0x%08x%08x\n",xdb.i[0],xdb.i[1]);
    } else {
      printMessage(1,SOLLYA_MSG_COULD_NOT_FIGURE_OUT_ENDIANESS,"Warning: could not figure out the endianess of the system. Will print 1.0 instead of the value.\n");
      sollyaPrintf("0x3ff0000000000000\n");
    }
  }

  mpfr_clear(temp);
  return res;
}

int printSimpleInHexa(mpfr_t x) {
  int res;
  volatile double dd;
  volatile double d;
  mpfr_t temp, tempRound, temp2;
  fl_number xfl;
  volatile float xfloat;

  if (mpfr_nan_p(x)) {
    xfl.i = 0x7fc00003;
    sollyaPrintf("0x%08x\n",xfl.i);
    return 0;
  }

  mpfr_init2(temp,mpfr_get_prec(x));
  mpfr_init2(temp2,mpfr_get_prec(x));
  mpfr_init2(tempRound,24);

  mpfr_set(tempRound,x,GMP_RNDN);

  d = sollya_mpfr_get_d(tempRound,GMP_RNDN);
  xfloat = d;
  dd = xfloat;
  if (mpfr_set_d(temp,dd,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_CONVERTING_FROM_DOUBLE,"Warning: rounding occurred unexpectedly on reconverting a double value.\n");
    }
  }

  res = mpfr_cmp(temp,x);
  if (res && mpfr_number_p(x) && mpfr_number_p(temp)) {
    xfl.f = xfloat;
    if (*((uint32_t *) &xfl.i) == 0x80000000U) {
      xfl.i = 0x80000001U;
    } else {
      if (res < 0) {
        if (xfl.i >= 0) {
          xfl.i++;
        } else {
          xfl.i--;
        }
      } else {
        if (xfl.i < 0) {
          xfl.i--;
        } else {
          xfl.i++;
        }
      }
    }
    dd = xfl.f;
    if (mpfr_set_d(temp2,dd,GMP_RNDN) != 0) {
      if (!noRoundingWarnings) {
        printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_CONVERTING_FROM_DOUBLE,"Warning: rounding occurred unexpectedly on reconverting a double value.\n");
      }
    }
    mpfr_sub(temp,temp,x,GMP_RNDN);
    mpfr_sub(temp2,temp2,x,GMP_RNDN);
    if (mpfr_cmpabs(temp2,temp) < 0) {
      xfloat = dd;
      if (mpfr_set_d(temp,dd,GMP_RNDN) != 0) {
        if (!noRoundingWarnings) {
          printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_CONVERTING_FROM_DOUBLE,"Warning: rounding occurred unexpectedly on reconverting a double value.\n");
        }
      }
    }
  }

  res = mpfr_cmp(temp,x);

  if (res) {
    if (!noRoundingWarnings) {
      if (res < 0)
        printMessage(1,SOLLYA_MSG_ROUNDING_DOWN_BEFORE_PRINTING_SINGLE,"Warning: rounding down occurred before printing a value as a single.\n");
      else
        printMessage(1,SOLLYA_MSG_ROUNDING_DOWN_BEFORE_PRINTING_SINGLE,"Warning: rounding up occurred before printing a value as a single.\n");
    }
  }

  xfl.f = xfloat;
  sollyaPrintf("0x%08x\n",xfl.i);

  mpfr_clear(temp);
  mpfr_clear(temp2);
  mpfr_clear(tempRound);
  return res;
}


int readHexaDouble(mpfr_t res, char *c) {
  int ret, i;
  int32_t msb, lsb;
  double x;
  char msbstr[9], lsbstr[9];
  db_number xdb, endianessdb;

  x = 1.0;
  c += 2; /* Skip over "0x" */
  for (i=0;i<9;i++) {
    msbstr[i] = '\0';
    lsbstr[i] = '\0';
  }
  for (i=0;i<8;i++) {
    msbstr[i] = *c;
    c++;
  }
  for (i=0;i<8;i++) {
    lsbstr[i] = *c;
    c++;
  }

  msb = convertHexadecimalStringToInt32(msbstr);
  lsb = convertHexadecimalStringToInt32(lsbstr);

  endianessdb.d = 1.0;
  if ((endianessdb.i[1] == 0x3ff00000) && (endianessdb.i[0] == 0)) {
    xdb.i[1] = msb;
    xdb.i[0] = lsb;
  } else {
    if ((endianessdb.i[0] == 0x3ff00000) && (endianessdb.i[1] == 0)) {
      xdb.i[0] = msb;
      xdb.i[1] = lsb;
    } else {
      printMessage(1,SOLLYA_MSG_COULD_NOT_FIGURE_OUT_ENDIANESS,"Warning: could not figure out the endianess of the system. Will read 1.0 instead of the value.\n");
      xdb.d = 1.0;
    }
  }

  x = xdb.d;

  if ((!(x == x)) && ((msb & 0x00080000) == 0)) {
    printMessage(1,SOLLYA_MSG_SNAN_MIGHT_HAVE_BECOME_QNAN,"Warning: a sNaN might have been converted to a qNaN.\n");
  }


  if (mpfr_set_d(res,x,GMP_RNDN) != 0) ret = 0; else ret = 1;
  return ret;
}

int readHexaSimple(mpfr_t res, char *c) {
  int ret, i;
  int32_t msb;
  double x;
  char msbstr[9];
  fl_number xfl;
  float xfloat;

  x = 1.0;
  c += 2; /* Skip over "0x" */
  for (i=0;i<9;i++) {
    msbstr[i] = '\0';
  }
  for (i=0;i<8;i++) {
    msbstr[i] = *c;
    c++;
  }


  msb = convertHexadecimalStringToInt32(msbstr);

  xfl.i = msb;

  xfloat = xfl.f;

  x = xfloat;

  if ((!(x == x)) && ((msb & 0x00400000) == 0)) {
    printMessage(1,SOLLYA_MSG_SNAN_MIGHT_HAVE_BECOME_QNAN,"Warning: a sNaN might have been converted to a qNaN.\n");
  }


  if (mpfr_set_d(res,x,GMP_RNDN) != 0) ret = 0; else ret = 1;
  return ret;
}



int readHexa(mpfr_t res, char *c) {

  if (strlen(c) == 18)
    return readHexaDouble(res, c);

  if (strlen(c) == 10)
    return readHexaSimple(res, c);

  printMessage(1,SOLLYA_MSG_UNABLE_TO_CONVERT_FROM_HEXADECIMAL_CONSTANT,"Warning: unable to convert the hexadecimal sequence \"%s\" to a constant.\n");

  mpfr_set_nan(res);

  return 0;
}


node *roundPolynomialCoefficients(node *poly, chain *formats, mp_prec_t prec) {
  int degree, listLength, i, deg, res, fillUp, k;
  chain *curr, *monomials;
  int *formatsArray, *tempArray;
  node *roundedPoly, *temp;
  node **coefficients;
  mpfr_t *fpcoefficients;
  mpfr_t tempMpfr, dummyX;
  node *subPolyToRound, *subPolyRest, *tempNode;

  degree = getDegree(poly);

  if (degree < 0) {
    printMessage(1,SOLLYA_MSG_GIVEN_FUNCTION_IS_NO_POLYNOMIAL,"Warning: the given function is not a polynomial.\n");
    return copyTree(poly);
  }

  listLength = lengthChain(formats);

  if (*((int *) formats->value) == -1) {
    fillUp = 1;
    curr = formats->next;
  } else {
    curr = formats;
    fillUp = 0;
    if (listLength < (degree + 1)) {
      printMessage(1,SOLLYA_MSG_NUM_OF_FORMATS_DOES_NOT_CORRESPOND_TO_DEGREE,"Warning: the number of the given formats does not correspond to the degree of the given polynomial.\n");
      monomials = makeIntPtrChainFromTo(0, listLength-1);
      subPolyToRound = getSubpolynomial(poly, monomials, 0, prec);
      freeChain(monomials, freeIntPtr);
      monomials = makeIntPtrChainFromTo(listLength, degree);
      subPolyRest = getSubpolynomial(poly, monomials, 0, prec);
      freeChain(monomials, freeIntPtr);
      tempNode = makeAdd(roundPolynomialCoefficients(subPolyToRound, formats, prec), subPolyRest);
      free_memory(subPolyToRound);
      temp = horner(tempNode);
      free_memory(tempNode);
      return temp;
    }
  }

  tempArray = (int *) safeCalloc(degree + 1,sizeof(int));

  i = 0;
  while ((curr != NULL) && (i <= degree)) {
    tempArray[i] = *((int *) curr->value);
    i++;
    curr = curr->next;
  }
  k = i;

  formatsArray = (int *) safeCalloc(degree + 1,sizeof(int));

  if (fillUp) {
    for (i=k-1;i>=0;i--) {
      formatsArray[(k-1) - i] = tempArray[i];
    }
    for (i=k;i<=degree;i++) {
      formatsArray[i] = formatsArray[k-1];
    }
  } else {
    for (i=degree;i>=0;i--) {
      formatsArray[degree - i] = tempArray[i];
    }
  }

  safeFree(tempArray);

  getCoefficients(&deg,&coefficients,poly);

  if (deg != degree) {
    printMessage(1,SOLLYA_MSG_ERROR_WHILE_EXTRACTING_COEFFICIENTS_OF_POLY,"Warning: an error occurred while extracting the coefficients of the polynomial.\n");
    for (i=0;i<=deg;i++) {
      if (coefficients[i] != NULL) free_memory(coefficients[i]);
    }
    safeFree(coefficients);
    return copyTree(poly);
  }

  fpcoefficients = (mpfr_t *) safeCalloc(degree+1,sizeof(mpfr_t));

  mpfr_init2(tempMpfr,prec > 160 ? prec : 160);

  res = 0;

  for (i=0;i<=degree;i++) {
    if (coefficients[i] != NULL) {
      temp = simplifyTreeErrorfree(coefficients[i]);
      free_memory(coefficients[i]);
      if (accessThruMemRef(temp)->nodeType != CONSTANT) {
	if (!noRoundingWarnings) {
	  printMessage(1,SOLLYA_MSG_ERROR_POLY_COEFF_GETS_ROUNDED,"Warning: the %dth coefficient of the given polynomial does not evaluate to a floating-point constant without any rounding.\n",i);
	  printMessage(1,SOLLYA_MSG_CONTINUATION,"Will evaluate the coefficient in the current precision in floating-point before rounding to the target format.\n");
	}
	mpfr_init2(fpcoefficients[i],prec);
	mpfr_init2(dummyX, prec);
	mpfr_set_si(dummyX, 1, GMP_RNDN);
	if (!evaluateFaithful(fpcoefficients[i], temp, dummyX, prec)) {
	  if (!noRoundingWarnings) {
	    printMessage(1,SOLLYA_MSG_ERROR_EVALUATION_OF_POLY_COEFF_NOT_FAITHFUL,"Warning: the evaluation of the %dth coefficient is not faithful.\n",i);
	  }
	  evaluateConstantExpression(fpcoefficients[i], temp, 256 * prec);
	}
	mpfr_clear(dummyX);
	res = 1;
      } else {
	mpfr_init2(fpcoefficients[i],mpfr_get_prec(*(accessThruMemRef(temp)->value)));
	mpfr_set(fpcoefficients[i],*(accessThruMemRef(temp)->value),GMP_RNDN);
      }
      free_memory(temp);
    } else {
      mpfr_init2(fpcoefficients[i],prec);
      mpfr_set_d(fpcoefficients[i],0.0,GMP_RNDN);
    }
    switch (formatsArray[i]) {
    case 7:
      if (mpfr_round_to_quad(tempMpfr, fpcoefficients[i]) != 0) res = 1;
      break;
    case 6:
      if (mpfr_round_to_halfprecision(tempMpfr, fpcoefficients[i]) != 0) res = 1;
      break;
    case 5:
      if (mpfr_round_to_single(tempMpfr, fpcoefficients[i]) != 0) res = 1;
      break;
    case 4:
      if (mpfr_round_to_doubleextended(tempMpfr, fpcoefficients[i]) != 0) res = 1;
      break;
    case 3:
      if (mpfr_round_to_tripledouble(tempMpfr, fpcoefficients[i]) != 0) res = 1;
      break;
    case 2:
      if (mpfr_round_to_doubledouble(tempMpfr, fpcoefficients[i]) != 0) res = 1;
      break;
    case 1:
      if (mpfr_round_to_double(tempMpfr, fpcoefficients[i]) != 0) res = 1;
      break;
    default:
      if (formatsArray[i] > 7) {
	if (mpfr_round_to_prec(tempMpfr, fpcoefficients[i], (mp_prec_t) (formatsArray[i] - 6)) != 0)
	  res = 1;
      } else {
	printMessage(1,SOLLYA_MSG_ERROR_UNKNOWN_EXPANSION_FORMAT,"Warning: unknown expansion format found. No rounding will be performed.\n");
	mpfr_set(tempMpfr,fpcoefficients[i],GMP_RNDN);
      }
    }
    if (mpfr_set(fpcoefficients[i],tempMpfr,GMP_RNDN) != 0) {
      if (!noRoundingWarnings) {
	printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_ON_HANDLING_POLY_COEFF,"Warning: double rounding occurred on internal handling of a coefficient.\nTry to increase the precision.\n");
      }
    }
  }

  safeFree(coefficients);

  if (res) {
    if (!noRoundingWarnings) {
      printMessage(2,SOLLYA_MSG_AT_LEAST_ONE_POLY_COEFF_HAS_BEEN_ROUNDED,"Information: at least one coefficient has been rounded.\n");
    }
  } else {
    if (!noRoundingWarnings) {
      printMessage(2,SOLLYA_MSG_NONE_OF_THE_POLY_COEFFS_HAS_BEEN_ROUNDED,"Information: there has not been any rounding of the coefficients.\n");
    }
  }

  roundedPoly = makePolynomial(fpcoefficients, degree);

  for (i=0;i<=degree;i++) mpfr_clear(fpcoefficients[i]);
  safeFree(fpcoefficients);
  safeFree(formatsArray);
  mpfr_clear(tempMpfr);
  return roundedPoly;
}

int printDoubleExpansion(mpfr_t x) {
  double d;
  mpfr_t temp, rest;
  db_number xdb, endianessdb;
  int noBrackets, roundingOccured;

  mpfr_init2(temp,mpfr_get_prec(x));
  mpfr_init2(rest,mpfr_get_prec(x));

  mpfr_set(rest,x,GMP_RNDN);

  roundingOccured = 0;
  noBrackets = 0;
  d = sollya_mpfr_get_d(x,GMP_RNDN);
  if (mpfr_set_d(temp,d,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_CONVERTING_FROM_DOUBLE,"Warning: rounding occurred unexpectedly on reconverting a double value.\n");
    }
    roundingOccured = 1;
  }

  if (!mpfr_number_p(temp)) {
    printMessage(1,SOLLYA_MSG_NON_REAL_NUMBER_CANNOT_BE_DOUBLE_EXPANSION,"Warning: will not print a number that is not real as a double expansion.\n");
    printValue(&temp);
    mpfr_clear(temp);
    mpfr_clear(rest);
    return 1;
  }

  if (mpfr_cmp(temp,x) == 0)
    noBrackets = 1;

  if (!noBrackets)
    sollyaPrintf("(");

  do {
    d = sollya_mpfr_get_d(rest,GMP_RNDN);
    if (mpfr_set_d(temp,d,GMP_RNDN) != 0) {
      if (!noRoundingWarnings) {
	printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_CONVERTING_FROM_DOUBLE,"Warning: rounding occurred unexpectedly on reconverting a double value.\n");
      }
      roundingOccured = 1;
    }

    xdb.d = d;
    endianessdb.d = 1.0;
    if ((endianessdb.i[1] == 0x3ff00000) && (endianessdb.i[0] == 0)) {
      sollyaPrintf("0x%08x%08x",xdb.i[1],xdb.i[0]);
    } else {
      if ((endianessdb.i[0] == 0x3ff00000) && (endianessdb.i[1] == 0)) {
	sollyaPrintf("0x%08x%08x",xdb.i[0],xdb.i[1]);
      } else {
	printMessage(1,SOLLYA_MSG_COULD_NOT_FIGURE_OUT_ENDIANESS,"Warning: could not figure out the endianess of the system. Will print 1.0 instead of the value.\n");
	sollyaPrintf("0x3ff0000000000000\n");
	roundingOccured = 1;
      }
    }

    if (mpfr_sub(rest,rest,temp,GMP_RNDN) != 0) {
      if (!noRoundingWarnings) {
	printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_ON_CONVERSION,"Warning: rounding occurred unexpectedly on subtracting.\n");
      }
      roundingOccured = 1;
    }

    if ((d != 0.0) && (!mpfr_zero_p(rest))) {
      sollyaPrintf(" + ");
    }

  } while ((d != 0.0) && (!mpfr_zero_p(rest)));

  if (!noBrackets)
    sollyaPrintf(")");


  if (!mpfr_zero_p(rest)) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_EXPANSION_INCOMPLETE,"\nWarning: the expansion is not complete because of the limited exponent range of double precision.");
    }
    roundingOccured = 1;
  }

  mpfr_clear(temp);
  mpfr_clear(rest);
  return roundingOccured;
}

int printPolynomialAsDoubleExpansion(node *poly, mp_prec_t prec) {
  int degree, roundingOccured, i, k, l;
  node **coefficients;
  node *tempNode, *simplifiedTreeSafe, *simplifiedTree, *myTree;
  mpfr_t tempValue, tempValue2;

  roundingOccured = 0;

  tempNode = horner(poly);
  simplifiedTreeSafe = simplifyTreeErrorfree(tempNode);
  free_memory(tempNode);
  simplifiedTree = simplifyTree(simplifiedTreeSafe);

  if (!isPolynomial(simplifiedTreeSafe)) {
    if (!isPolynomial(simplifiedTree)) {
      printMessage(1,SOLLYA_MSG_GIVEN_FUNCTION_IS_NO_POLYNOMIAL,"Warning: the given expression is not a polynomial.");
      free_memory(simplifiedTree);
      free_memory(simplifiedTreeSafe);
      return -1;
    } else {
      if (!noRoundingWarnings) {
	printMessage(1,SOLLYA_MSG_ROUNDING_WHILE_SIMPLIFYING_TO_POLYNOMIAL,"Warning: rounding occurred while simplifying to a polynomial form.\n");
      }
      roundingOccured = 1;
      myTree = simplifiedTree;
      free_memory(simplifiedTreeSafe);
    }
  } else {
    myTree = simplifiedTreeSafe;
    free_memory(simplifiedTree);
  }

  getCoefficients(&degree, &coefficients, myTree);

  mpfr_init2(tempValue,prec);
  mpfr_init2(tempValue2,prec);
  mpfr_set_d(tempValue2,1.0,GMP_RNDN);

  k = 0; l = 0;
  for (i=0;i<=degree;i++) {
    if (coefficients[i] != NULL) {
      if (k > 0) {
	if (k == 1) {
	  sollyaPrintf("%s * ",((variablename == NULL) ? "_x_" : variablename));
	} else {
	  sollyaPrintf("%s^%d * ",((variablename == NULL) ? "_x_" : variablename),k);
	}
      }

      if ((i != degree) && (i != 0)) {
	sollyaPrintf("(");
	l++;
      }

      tempNode = simplifyTreeErrorfree(coefficients[i]);
      if (accessThruMemRef(tempNode)->nodeType == CONSTANT) {
	roundingOccured |=  printDoubleExpansion(*(accessThruMemRef(tempNode)->value));
      } else {
	if (!isConstant(tempNode)) {
	  printMessage(1,SOLLYA_MSG_POLY_COEFF_IS_NOT_CONSTANT,"Error: a coefficient of a polynomial is not constant.\n");
	}
	if (!evaluateFaithful(tempValue, tempNode, tempValue2, prec)) {
	  if (!noRoundingWarnings) {
	    printMessage(1,SOLLYA_MSG_SOME_EVALUATION_IS_NOT_FAITHFUL,"Warning: an evaluation is not faithful.\n");
	  }
	  evaluate(tempValue, tempNode, tempValue2, 256 * prec);
	}
	printDoubleExpansion(tempValue);
	roundingOccured = 1;
      }
      free_memory(tempNode);
      free_memory(coefficients[i]);
      k = 1;

      if (i != degree) {
	sollyaPrintf(" + ");
      }
    } else {
      k++;
    }
  }
  for (i=0;i<l;i++)
    sollyaPrintf(")");

  safeFree(coefficients);
  mpfr_clear(tempValue);
  mpfr_clear(tempValue2);
  free_memory(myTree);

  return roundingOccured;
}


void mpfr_round_to_format(mpfr_t rop, mpfr_t op, int format) {
  switch (format) {
  case 7:
    mpfr_round_to_quad(rop, op);
    break;
  case 6:
    mpfr_round_to_halfprecision(rop, op);
    break;
  case 5:
    mpfr_round_to_single(rop, op);
    break;
  case 4:
    mpfr_round_to_doubleextended(rop, op);
    break;
  case 3:
    mpfr_round_to_tripledouble(rop, op);
    break;
  case 2:
    mpfr_round_to_doubledouble(rop, op);
    break;
  case 1:
    mpfr_round_to_double(rop, op);
    break;
  default:
    sollyaFprintf(stderr,"Error: mpfr_round_to_format: unknown format type.\n");
    exit(1);
  }
}

int mpfr_round_to_doubleextended_mode(mpfr_t rop, mpfr_t op, mp_rnd_t mode);

int round_to_expansion_format(mpfr_t rop, mpfr_t op, int format, mp_rnd_t mode) {
  int res;
  switch (format) {
  case 7:
    mpfr_round_to_quad_mode(rop, op, mode);
    break;
  case 6:
    mpfr_round_to_halfprecision_mode(rop, op, mode);
    break;
  case 5:
    mpfr_round_to_single_mode(rop, op, mode);
    break;
  case 4:
    mpfr_round_to_doubleextended_mode(rop, op, mode);
    break;
  case 3:
    mpfr_round_to_tripledouble_mode(rop, op, mode);
    break;
  case 2:
    mpfr_round_to_doubledouble_mode(rop, op, mode);
    break;
  case 1:
    mpfr_round_to_double_mode(rop, op, mode);
    break;
  default:
    sollyaFprintf(stderr,"Error: round_to_expansion_format: unknown format type.\n");
    exit(1);
  }

  if ((!mpfr_nan_p(op)) &&
      (!mpfr_nan_p(rop))) {
    res = mpfr_cmp(rop,op);
  } else {
    res = 0;
  }

  return res;
}

int round_to_format_or_expansion_format(mpfr_t rop, mpfr_t op, int expansion_format_round, int format, mp_prec_t prec, mp_rnd_t mode) {
  if (expansion_format_round) return round_to_expansion_format(rop, op, format, mode);

  return round_to_format(rop, op, prec, mode);
}

int round_constant_expr_to_format_or_expansion_format(int *ternary, int *ternaryOkay, mpfr_t rop, node *func, int expansion_format_round, int format, mp_prec_t prec, mp_rnd_t mode) {
  mp_prec_t startPrec, p;
  sollya_mpfi_t y, x;
  mpfr_t ya, yb, rya, ryb, tya;
  int ta, tb;
  mp_rnd_t writeBackRnd;

  /* Check if expression is constant */
  if (!isConstant(func)) return 0;

  /* Check if we have a literal constant, in which case things are easy. */
  if (accessThruMemRef(func)->nodeType == CONSTANT) {
    *ternaryOkay = 1;
    *ternary = round_to_format_or_expansion_format(rop, *(accessThruMemRef(func)->value), expansion_format_round, format, prec, mode);
    return 1;
  }

  startPrec = 200;
  if (!expansion_format_round) {
    if (prec + 10 > startPrec) startPrec = prec + 10;
  }

  sollya_mpfi_init2(y, startPrec);
  mpfr_init2(ya, startPrec);
  mpfr_init2(yb, startPrec);
  mpfr_init2(rya, startPrec);
  mpfr_init2(ryb, startPrec);
  sollya_mpfi_init2(x, 12);
  sollya_mpfi_set_si(x, 1);

  for (p = startPrec; p <= 512 * startPrec; p <<= 1) {
    sollya_mpfi_set_prec(y, p);
    mpfr_set_prec(ya, p);
    mpfr_set_prec(yb, p);
    evaluateInterval(y, func, NULL, x);
    sollya_mpfi_get_left(ya, y);
    sollya_mpfi_get_right(yb, y);
    ta = round_to_format_or_expansion_format(rya, ya, expansion_format_round, format, prec, mode);
    tb = round_to_format_or_expansion_format(ryb, yb, expansion_format_round, format, prec, mode);
    if ((!mpfr_nan_p(rya)) &&
	(!mpfr_nan_p(ryb)) &&
	mpfr_equal_p(rya, ryb) &&
	(ta == tb)) {
      writeBackRnd = GMP_RNDN;
      if (ta < 0) writeBackRnd = GMP_RNDD;
      if (ta > 0) writeBackRnd = GMP_RNDU;
      *ternary = ta;
      *ternaryOkay = 1;
      if ((ta = mpfr_set(rop, rya, writeBackRnd)) != 0) {
	if (!noRoundingWarnings) {
	  printMessage(1,SOLLYA_MSG_UNDESIRED_ROUNDING_IN_ROUND_TO_FORMAT,"Warning: an undesired rounding occurred on a rounding operator.\n");
	  printMessage(1,SOLLYA_MSG_CONTINUATION,"Try to increase the working precision.\n");
	}
	*ternary = ta;
      }
      sollya_mpfi_clear(y);
      mpfr_clear(ya);
      mpfr_clear(yb);
      mpfr_clear(rya);
      mpfr_clear(ryb);
      sollya_mpfi_clear(x);
      return 1;
    }
  }

  /* If we are here, we never got a correct rounding or we always got NaNs.

     We are going to re-evaluate the values in ya and yb.

     First, we check if either of them is a NaN, in which case we return NaN.

  */
  if (mpfr_nan_p(ya) || mpfr_nan_p(yb)) {
    *ternaryOkay = 1;
    if (mpfr_nan_p(ya)) {
      *ternary = round_to_format_or_expansion_format(rop, ya, expansion_format_round, format, prec, mode);
    } else {
      *ternary = round_to_format_or_expansion_format(rop, yb, expansion_format_round, format, prec, mode);
    }
    sollya_mpfi_clear(y);
    mpfr_clear(ya);
    mpfr_clear(yb);
    mpfr_clear(rya);
    mpfr_clear(ryb);
    sollya_mpfi_clear(x);
    return 1;
  }

  /* Here, ya and yb can be either real numbers bounding func or infinities.

     We continue by checking if either of them is an infinity.

  */
  if (mpfr_inf_p(ya) || mpfr_inf_p(yb)) {
    /* At least one of ya and yb is an infinity. Check if both are infinity. */
    if (mpfr_inf_p(ya) && mpfr_inf_p(yb)) {
      /* Here, both numbers are infinity. Check if they are identical */
      if ( ((mpfr_sgn(ya) > 0) && (mpfr_sgn(yb) > 0)) ||
           ((mpfr_sgn(ya) < 0) && (mpfr_sgn(yb) < 0)) ) {
        /* They are equal: return the rounding of infinity. */
        *ternaryOkay = 1;
        *ternary = round_to_format_or_expansion_format(rop, ya, expansion_format_round, format, prec, mode);
        sollya_mpfi_clear(y);
        mpfr_clear(ya);
        mpfr_clear(yb);
        mpfr_clear(rya);
        mpfr_clear(ryb);
        sollya_mpfi_clear(x);
        return 1;
      }
      else {
        /* They are different infinities. Return NaN */
        if (!noRoundingWarnings) {
          printMessage(1,SOLLYA_MSG_NO_CORRECT_ROUNDING_FOR_ROUND_OPERATOR,"Warning: no correctly rounded result could be obtained upon evaluation of a rounding operator.\n");
          printMessage(2,SOLLYA_MSG_NO_CORRECT_TERNARY_VALUE_FOR_ROUND,"Warning: the actual rounding direction for a round operation could not be determined.\n");
        }
        *ternaryOkay = 0;
        mpfr_set_nan(ya);
        *ternary = round_to_format_or_expansion_format(rop, ya, expansion_format_round, format, prec, mode);
        sollya_mpfi_clear(y);
        mpfr_clear(ya);
        mpfr_clear(yb);
        mpfr_clear(rya);
        mpfr_clear(ryb);
        sollya_mpfi_clear(x);
        return 1;
      }
    }

    /* Here only one of ya or yb is an infinity, the other one is a real number

       We simply display a warning and return the rounding of the one of ya and yb
       that is a real number.

    */
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_NO_CORRECT_ROUNDING_FOR_ROUND_OPERATOR,"Warning: no correctly rounded result could be obtained upon evaluation of a rounding operator.\n");
      printMessage(2,SOLLYA_MSG_NO_CORRECT_TERNARY_VALUE_FOR_ROUND,"Warning: the actual rounding direction for a round operation could not be determined.\n");
    }
    *ternaryOkay = 0;
    if (mpfr_inf_p(ya)) {
      *ternary = round_to_format_or_expansion_format(rop, yb, expansion_format_round, format, prec, mode);
    } else {
      *ternary = round_to_format_or_expansion_format(rop, ya, expansion_format_round, format, prec, mode);
    }
    sollya_mpfi_clear(y);
    mpfr_clear(ya);
    mpfr_clear(yb);
    mpfr_clear(rya);
    mpfr_clear(ryb);
    sollya_mpfi_clear(x);
    return 1;
  }

  /* Here both ya and yb are real numbers bounding func.

     Distinguish two cases: directed rounding and rounding to nearest.

     For the directed rounding modes, try to compute the value in
     ROUND-TO-NEAREST first (which yields the rounding boundary). Then
     round that rounding boundary.

     For round-to-nearest, a special algorithm is used (see below).

  */
  if (mode != GMP_RNDN) {
    /* Directed rounding mode */
    ta = round_to_format_or_expansion_format(rya, ya, expansion_format_round, format, prec, GMP_RNDN);
    tb = round_to_format_or_expansion_format(ryb, yb, expansion_format_round, format, prec, GMP_RNDN);
    if ((!mpfr_nan_p(rya)) &&
	(!mpfr_nan_p(ryb)) &&
	mpfr_equal_p(rya, ryb)) {
      if (!noRoundingWarnings) {
	printMessage(1,SOLLYA_MSG_ROUNDING_OF_BOUNDARY_INSTEAD_OF_CORRECT_ROUNDING,"Warning: the returned rounding is the rounding of the rounding boundary because correct rounding has not been possible.\n");
      }
      *ternary = round_to_format_or_expansion_format(rop, rya, expansion_format_round, format, prec, mode);
      *ternaryOkay = 0;
      sollya_mpfi_clear(y);
      mpfr_clear(ya);
      mpfr_clear(yb);
      mpfr_clear(rya);
      mpfr_clear(ryb);
      sollya_mpfi_clear(x);
      return 1;
    }

    /* Here, we could not even compute the rounding boundary. We return some approximation. */
    mpfr_add(ya, ya, yb, GMP_RNDN); /* might round but only need an approximation */
    mpfr_div_2ui(ya, ya, 1, GMP_RNDN);
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_NO_CORRECT_ROUNDING_FOR_ROUND_OPERATOR,"Warning: no correctly rounded result could be obtained upon evaluation of a rounding operator.\n");
      printMessage(2,SOLLYA_MSG_NO_CORRECT_TERNARY_VALUE_FOR_ROUND,"Warning: the actual rounding direction for a round operation could not be determined.\n");
    }
    *ternary = round_to_format_or_expansion_format(rop, rya, expansion_format_round, format, prec, mode);
    *ternaryOkay = 0;
    sollya_mpfi_clear(y);
    mpfr_clear(ya);
    mpfr_clear(yb);
    mpfr_clear(rya);
    mpfr_clear(ryb);
    sollya_mpfi_clear(x);
    return 1;
  }

  /* Here, we are in round-to-nearest mode and we know that both ya and yb are real numbers.

     We first check if rounding to nearest would actually be possible if we forgot about the
     ternary value.

  */
  if ((!mpfr_nan_p(rya)) &&
      (!mpfr_nan_p(ryb)) &&
      mpfr_equal_p(rya, ryb)) {
    /* Here, we know the correct rounding rya = ryb but we are unable to produce the ternary value. */
    if (!noRoundingWarnings) {
      printMessage(2,SOLLYA_MSG_NO_CORRECT_TERNARY_VALUE_FOR_ROUND_BUT_CORRECT_ROUNDING,"Warning: correct rounding was possible but the actual rounding direction could not be determined.\n");
    }
    writeBackRnd = GMP_RNDN;
    if (ta < 0) writeBackRnd = GMP_RNDD;
    if (ta > 0) writeBackRnd = GMP_RNDU;
    *ternary = ta;
    *ternaryOkay = 0;
    if ((ta = mpfr_set(rop, rya, writeBackRnd)) != 0) {
      if (!noRoundingWarnings) {
	printMessage(1,SOLLYA_MSG_UNDESIRED_ROUNDING_IN_ROUND_TO_FORMAT,"Warning: an undesired rounding occurred on a rounding operator.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"Try to increase the working precision.\n");
      }
      *ternary = ta;
    }
    sollya_mpfi_clear(y);
    mpfr_clear(ya);
    mpfr_clear(yb);
    mpfr_clear(rya);
    mpfr_clear(ryb);
    sollya_mpfi_clear(x);
    return 1;
  }

  /* Here, we are in round-to-nearest mode, ya and yb are real numbers
     but we cannot produce a correct rounding.

     We suppose that ya and yb are just around the midpoint for the
     considered format but that [ya;yb] is in the interior of the
     interval of the two consecutive floating-point numbers of the
     format around that midpoint.

     So we round ya down, yb up, take the middle and round it to the
     target format.

     We have no means to tell if our assumption was correct, as
     we can no way perform nextabove or nextbelow operations
     on double-double or triple-double expansions.

     So in the worst case, we get some approximation first and a
     correct rounding of that approximation.

     In any case, we have to forget about the ternary value.
  */
  round_to_format_or_expansion_format(rya, ya, expansion_format_round, format, prec, GMP_RNDD);
  round_to_format_or_expansion_format(ryb, yb, expansion_format_round, format, prec, GMP_RNDU);
  mpfr_init2(tya, mpfr_get_prec(rya) + 10);
  mpfr_add(tya, rya, ryb, GMP_RNDN);
  mpfr_div_2ui(tya, tya, 1, GMP_RNDN);
  if (!noRoundingWarnings) {
    printMessage(1,SOLLYA_MSG_NO_CORRECT_ROUNDING_FOR_ROUND_OPERATOR,"Warning: no correctly rounded result could be obtained upon evaluation of a rounding operator.\n");
    printMessage(2,SOLLYA_MSG_NO_CORRECT_TERNARY_VALUE_FOR_ROUND,"Warning: the actual rounding direction for a round operation could not be determined.\n");
  }
  *ternaryOkay = 0;
  *ternary = round_to_format_or_expansion_format(rop, tya, expansion_format_round, format, prec, mode);
  mpfr_clear(tya);
  sollya_mpfi_clear(y);
  mpfr_clear(ya);
  mpfr_clear(yb);
  mpfr_clear(rya);
  mpfr_clear(ryb);
  sollya_mpfi_clear(x);
  return 1;
}

int mpfr_mant_exp(mpfr_t rop, mp_exp_t *expo, mpfr_t op) {
  mp_exp_t e;
  mp_prec_t p;
  mpfr_t temp;
  int res;

  if (!mpfr_number_p(op)) {
    *expo = 0;
    return mpfr_set(rop,op,GMP_RNDN);
  }

  if (mpfr_zero_p(op)) {
    *expo = 0;
    return mpfr_set(rop,op,GMP_RNDN);
  }

  p = mpfr_get_prec(op);
  mpfr_init2(temp,p);
  mpfr_set(temp,op,GMP_RNDN);

  e = mpfr_get_exp(temp) - p;
  mpfr_set_exp(temp,p);

  while (mpfr_integer_p(temp)) {
    mpfr_div_2ui(temp,temp,1,GMP_RNDN);
    e++;
  }
  mpfr_mul_2ui(temp,temp,1,GMP_RNDN);
  e--;

  *expo = e;
  res = mpfr_set(rop,temp,GMP_RNDN);

  mpfr_clear(temp);

  return res;
}


int roundRangeCorrectly(mpfr_t rop, mpfr_t a, mpfr_t b) {
  mp_exp_t expoA, expoB;
  int expoDiff;
  mp_prec_t prec, p;
  mpfr_t tempA, tempB;
  int okay;

  if (mpfr_sgn(a) != mpfr_sgn(b)) {
    mpfr_set_nan(rop);
    return 0;
  }

  expoA = mpfr_get_exp(a);
  expoB = mpfr_get_exp(b);

  expoDiff = expoA - expoB;
  if (expoDiff < 0) expoDiff = -expoDiff;

  if (expoDiff > 1) {
    mpfr_set_nan(rop);
    return 0;
  }

  prec = mpfr_get_prec(a);
  p = mpfr_get_prec(b);
  if (p > prec) prec = p;

  mpfr_init2(tempA,prec);
  mpfr_init2(tempB,prec);

  okay = 0;
  while (prec >= 3) {
    mpfr_set(tempA,a,GMP_RNDN);
    mpfr_set(tempB,b,GMP_RNDN);
    if (mpfr_cmp(tempA,tempB) == 0) {
      okay = 1;
      break;
    }
    prec--;
    mpfr_set_prec(tempA,prec);
    mpfr_set_prec(tempB,prec);
  }
  if (prec < 12) prec = 12;
  if (okay) {
    mpfr_set_prec(rop,prec);
    mpfr_set(rop,tempA,GMP_RNDN);
  } else{
    mpfr_set_nan(rop);
  }

  mpfr_clear(tempA);
  mpfr_clear(tempB);

  return okay;
}




void continuedFrac(mpq_t q, sollya_mpfi_t x) {
  sollya_mpfi_t xprime;
  mpfr_t a,b;
  mpfr_t m1,m2;
  mp_prec_t t;
  mpq_t res;
  mpz_t u;

  t = sollya_mpfi_get_prec(x);
  if (t<= tools_precision) t=tools_precision;

  sollya_mpfi_init2(xprime,t);
  mpfr_init2(a,t);
  mpfr_init2(b,t);
  mpfr_init2(m1,t);
  mpfr_init2(m2,t);
  mpq_init(res);
  mpz_init(u);

  sollya_mpfi_get_left(a,x);
  sollya_mpfi_get_right(b,x);
  mpfr_floor(m1,a); /* really a floor because m1 and a have the same precision */
  mpfr_floor(m2,b); /* really a floor because m2 and b have the same precision */

  if (mpfr_equal_p(m1,m2) && (!mpfr_equal_p(a, m1))) {
    mpfr_get_z(u,m1,GMP_RNDN); /* exact */
    mpfr_sub(a,a,m1,GMP_RNDD);
    mpfr_sub(b,b,m1,GMP_RNDU);
    sollya_mpfi_interv_fr(xprime,a,b);
    sollya_mpfi_inv(xprime,xprime);
    continuedFrac(res,xprime);
    mpq_inv(res,res);
    mpq_set_z(q,u);

    mpq_add(q,q,res);
  }
  else {
    /* According to http://en.wikipedia.org/wiki/Continued_fraction,
       section "Best rational within an interval", the best fraction
       is given by taking the smallest integer in [a,b] */
    if (!mpfr_equal_p(a,m1))  mpfr_add_ui(m1, m1,1,GMP_RNDU);
    mpfr_get_z(u,m1,GMP_RNDN);
    mpq_set_z(q,u);
  }

  sollya_mpfi_clear(xprime);
  mpfr_clear(a);
  mpfr_clear(b);
  mpfr_clear(m1);
  mpfr_clear(m2);
  mpq_clear(res);
  mpz_clear(u);
  return;
}


node *rationalApprox(mpfr_t x, int n) {
  mpq_t q;
  mpz_t u;
  sollya_mpfi_t xprime;
  node *tree;
  node *num;
  node *denom;
  mpfr_t *numerator;
  mpfr_t *denominator;

  /* n should be >= 2 */
  if (n<2) {
    printMessage(1, SOLLYA_MSG_RATIONALAPPROX_SECOND_ARG_MUST_BE_GREATER_THAN_ONE, "Error in rationalapprox: the second argument of rationalapprox must be greater or equal to 2.\n");
    return makeError();
  }

  if ( (!mpfr_number_p(x)) || mpfr_zero_p(x) )  return makeConstant(x);
  mpq_init(q);
  mpz_init(u);
  sollya_mpfi_init2(xprime,(mp_prec_t)(n+1));

  sollya_mpfi_set_fr(xprime,x); /* The bounds of xprime are two consecutive FP numbers at precision n+1.
                                   Hence sup(xprime)-inf(xprime) <= 2^(1-(n+1))*inf(abs(xprime))
                                   Hence, for any t in xprime, |x-t| <= 2^(-n)*|x| */
  continuedFrac(q,xprime);

  mpq_get_num(u,q);
  numerator = (mpfr_t*) safeMalloc(sizeof(mpfr_t));
  mpfr_init2(*numerator,mp_bits_per_limb*mpz_size(u));
  mpfr_set_z(*numerator,u,GMP_RNDN);

  mpq_get_den(u,q);
  denominator = (mpfr_t*) safeMalloc(sizeof(mpfr_t));
  mpfr_init2(*denominator,mp_bits_per_limb*mpz_size(u));
  mpfr_set_z(*denominator,u,GMP_RNDN);

  tree = safeMalloc(sizeof(node));
  tree->nodeType = DIV;
  num = safeMalloc(sizeof(node));
  denom = safeMalloc(sizeof(node));
  num->nodeType = CONSTANT;
  denom->nodeType = CONSTANT;
  num->value = numerator;
  denom->value = denominator;
  tree->child1 = num;
  tree->child2 = denom;

  sollya_mpfi_clear(xprime);
  mpq_clear(q);
  mpz_clear(u);
  return tree;
}

int mpfr_round_to_ieee_format(mpfr_t rop, mpfr_t op, mp_prec_t prec, unsigned int width, mp_rnd_t mode) {
  int res;
  mpfr_t result;
  unsigned int exponent;
  mpfr_t largest, smallest, temp;
  mp_prec_t p;

  /* In the case when the function is called with a silly width (less than 3 or larger than 30),
     we exit from the tool. This case should never happen.
  */
  if ((width < 3) || (width > 30)) {
    sollyaFprintf(stderr,"Error: mpfr_round_to_ieee_format: an exponent width of less than 3 or larger than 30 is not supported\n");
    exit(1);
  }

  /* We will first produce an internal result and then write back to rop */
  mpfr_init2(result,prec);

  /* Handle the special cases: +/- 0, +/- Inf, NaN */
  if (mpfr_zero_p(op) || (!mpfr_number_p(op))) {
    /* The result is the input */
    mpfr_set(result, op, GMP_RNDN); /* exact */
  } else {
    /* Here, the input is not zero, nor Inf nor NaN

       We start with the first rounding step with unbounded exponent.

    */
    mpfr_set(result, op, mode); /* performs a rounding to the desired precision
                                   but with unbounded exponent
				*/

    /* Now check if overflow occurs: compare in magnitude with the largest
       representable number of the format.

       The largest number is 1 ulp (of precision prec) below 2^(2^(width - 1)).
    */
    exponent = 1 << (width - 1);
    mpfr_init2(largest, prec);
    mpfr_set_ui(largest, 1, GMP_RNDN); /* exact: power of 2 */
    mpfr_mul_2ui(largest, largest, exponent, GMP_RNDN); /* exact: power of 2 */
    mpfr_nextbelow(largest); /* exact by specification */
    if (mpfr_cmpabs(result, largest) > 0) {
      /* Here, we have an overflow

	 Depending on the rounding mode and the sign of the input
	 we get the largest representable number or +/- Inf as a result

      */
      switch (mode) {
      case GMP_RNDN:
	/* -Inf, +Inf */
	if (mpfr_sgn(op) < 0) {
	  mpfr_set_inf(result, -1);
	} else {
	  mpfr_set_inf(result, +1);
	}
	break;
      case GMP_RNDD:
	/* -Inf, +largest */
	if (mpfr_sgn(op) < 0) {
	  mpfr_set_inf(result, -1);
	} else {
	  mpfr_set(result, largest, GMP_RNDN); /* exact: same precision */
	}
	break;
      case GMP_RNDU:
	/* -largest, +Inf */
	if (mpfr_sgn(op) < 0) {
	  mpfr_neg(result, largest, GMP_RNDN); /* exact: same precision */
	} else {
	  mpfr_set_inf(result, +1);
	}
	break;
      case GMP_RNDZ:
	/* -largest, +largest */
	if (mpfr_sgn(op) < 0) {
	  mpfr_neg(result, largest, GMP_RNDN); /* exact: same precision */
	} else {
	  mpfr_set(result, largest, GMP_RNDN); /* exact: same precision */
	}
	break;
      default:
	sollyaFprintf(stderr,"Error: mpfr_round_to_ieee_format: unknown rounding mode %d\n", (int) mode);
	exit(1);
      }
    } else {
      /* Here, the result is either a signed 0, denormal or normal

	 We continue by checking if the first rounding is larger
	 than the least normal.

	 For a format of width bits of exponent, the smallest normal
	 is 2^(-2^(width - 1) + 2).

      */
      mpfr_init2(smallest, prec);
      exponent = 1 << (width - 1);
      exponent -= 2;
      mpfr_set_ui(smallest, 1, GMP_RNDN); /* exact: power of 2 */
      mpfr_div_2ui(smallest, smallest, exponent, GMP_RNDN); /* exact: power of 2 */

      if (mpfr_cmpabs(result, smallest) < 0) {
	/* Here, we have to emulate denormal rounding

	   Denormal rounding for precision prec and exponent width
	   width is:

	   result = 2^(-prec - 2^(width - 1) + 3) * round_integer((1/(2^(-prec - 2^(width - 1) + 3))) * op, mode)

           In other words,

           result = smallest * 2^(1-prec) * round_integer( 2^(prec-1)*op/smallest, mode)

           ( the interval [0, smallest) is sent to [0, 2^(prec-1) ) where fixed-point computations at
           precision prec are exactly integer computations, and then we send it back to [0, smallest)
           )
        */
	p = mpfr_get_prec(op);
	mpfr_init2(temp, p);
	mpfr_set(temp, op, GMP_RNDN); /* exact: precision of temp not less than the one of op */
	exponent = 1 << (width - 1);
	exponent -= 3;
	exponent += prec;
	mpfr_mul_2ui(temp, temp, exponent, GMP_RNDN); /* exact: power of 2 and same precision */
	mpfr_rint(result, temp, mode); /* Performs round_integer with mode
					  no wrong rounding possible as precision of
					  result is prec and |temp| <= 2^(prec-1)
				       */
	mpfr_div_2ui(result, result, exponent, GMP_RNDN); /* exact: power of 2 and same precision */
	mpfr_clear(temp);
      }
      /* Otherwise the first rounding is already
	 the final result.
      */

      mpfr_clear(smallest);
    }
    mpfr_clear(largest);
  }

  /* Write back the result, while verifying if we don't get a double rounding there. */
  /* Double-rounding may occur if the precision of rop is smaller than the prec.     */
  if (mpfr_set(rop,result,GMP_RNDN) != 0) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_DOUBLE_ROUNDING_IN_ROUND_IEEE_754_2008_OPERATOR,"Warning: double rounding occurred on invoking the IEEE 754-2008 general rounding operator.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"Try to increase the working precision.\n");
    }
  }

  mpfr_clear(result);

  /* Compute the rounding direction that has finally been chosen */
  res = mpfr_cmp(rop,op);

  return res;
}

int mpfr_round_to_single(mpfr_t rop, mpfr_t x) {
  return mpfr_round_to_ieee_format(rop, x, 24, 8, GMP_RNDN);
}

int mpfr_round_to_single_mode(mpfr_t rop, mpfr_t x, mp_rnd_t mode) {
  return mpfr_round_to_ieee_format(rop, x, 24, 8, mode);
}

int mpfr_round_to_quad(mpfr_t rop, mpfr_t x) {
  return mpfr_round_to_ieee_format(rop, x, 113, 15, GMP_RNDN);
}

int mpfr_round_to_halfprecision(mpfr_t rop, mpfr_t x) {
  return mpfr_round_to_ieee_format(rop, x, 11, 5, GMP_RNDN);
}

int mpfr_round_to_quad_mode(mpfr_t rop, mpfr_t x, mp_rnd_t mode) {
  return mpfr_round_to_ieee_format(rop, x, 113, 15, mode);
}

int mpfr_round_to_halfprecision_mode(mpfr_t rop, mpfr_t x, mp_rnd_t mode) {
  return mpfr_round_to_ieee_format(rop, x, 11, 5, mode);
}

int mpfr_round_to_doubleextended(mpfr_t rop, mpfr_t op) {
  return mpfr_round_to_ieee_format(rop, op, 64, 15, GMP_RNDN);
}

int mpfr_round_to_doubleextended_mode(mpfr_t rop, mpfr_t op, mp_rnd_t mode) {
  return mpfr_round_to_ieee_format(rop, op, 64, 15, mode);
}

int sollya_mpfr_rint_nearestint(mpfr_t rop, mpfr_t op, mpfr_rnd_t rnd) {
  mpfr_t temp;
  int res;

  mpfr_init2(temp, mpfr_get_prec(op));

  mpfr_rint(temp, op, GMP_RNDN); /* No double rounding possible because precision the same */
  
  res = mpfr_set(rop, temp, rnd);

  mpfr_clear(temp);

  return res;
}
