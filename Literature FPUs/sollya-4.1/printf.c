/*

  Copyright 2011-2013 by

  Laboratoire d'Informatique de Paris 6, equipe PEQUAN,
  UPMC Universite Paris 06 - CNRS - UMR 7606 - LIP6, Paris, France

  Contributor Ch. Lauter

  christoph.lauter@ens-lyon.org

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

#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdint.h>
#include <stddef.h>
#include <wchar.h>
#include <gmp.h>
#include <mpfr.h>
#include "expression.h"
#include "general.h"
#include "mpfi-compat.h"
#include "execute.h"
#include "printf.h"
#include "infnorm.h"
#include "execute.h"
#include "sturm.h"

/* Some flag constants used only in this file */
#define SOLLYA_PRINTF_IMPL_FLAG_ALTERNATE_FORM          1
#define SOLLYA_PRINTF_IMPL_FLAG_ZERO_PADDING            2
#define SOLLYA_PRINTF_IMPL_FLAG_LEFT_ADJUSTMENT         4
#define SOLLYA_PRINTF_IMPL_FLAG_POSITIVE_LEAVE_SPACE    8
#define SOLLYA_PRINTF_IMPL_FLAG_POSITIVE_GET_PLUS      16
#define SOLLYA_PRINTF_IMPL_FLAG_GROUP_THOUSANDS        32
#define SOLLYA_PRINTF_IMPL_FLAG_ALTERNATE_DIGITS       64

/* Remark: we don't really know how large the maximum precision could
   ever be and if we should apply some modulo behavior. Anyway, we
   can't test the whole thing so the precision is stored on a uint64_t
   for now.
*/
static inline int analyzePrecModifier(uint64_t *analyzedPrec, int *analyzedStar,
                                      char *startBuf, char *endBuf) {
  char *curr;
  char *myStart, *myEnd, *endBufBeforeNull;
  uint64_t prec;

  endBufBeforeNull = endBuf;
  while ((endBufBeforeNull > startBuf) && (*endBufBeforeNull == '\0'))
    endBufBeforeNull--;

  /* Check if first character is a dot */
  if (*startBuf != '.') return 0;

  /* Check if last character is a format specifier
     that may come with a precision modifier
  */
  switch (*endBufBeforeNull) {
  case 'v':
  case 'w':
  case 'b':
  case 'r':
  case 'k':
    break;
  default:
    return 0;
  }

  /* Check that between the first and the last character there is at
     least one other character. If not, the analyzed precision is 0.
  */
  myStart = startBuf + 1;
  myEnd = endBufBeforeNull - 1;
  if (myStart > myEnd) {
    *analyzedPrec = 0;
    return 1;
  }

  /* Check if there is exactly one character
     between the first and the last character
     and if it is a star.
  */
  if ((myStart == myEnd) && (*myStart == '*')) {
    /* Here, we have a correct dynamic precision
       modifier
    */
    *analyzedStar = 1;
    return 1;
  }

  /* If we are here, all characters between the
     first and the last character must be decimal
     digits. Check this condition first.
  */
  for (curr=myStart;curr<=myEnd;curr++) {
    if ((*curr < '0') || (*curr > '9')) return 0;
  }

  /* Here, we know that all characters between
     the first and the last character are decimal digits.
     We convert them to a 64 unsigned int.
  */
  prec = 0;
  for (curr=myStart;curr<=myEnd;curr++) {
    prec *= 10;
    prec += ((uint64_t) (*curr)) - ((uint64_t) '0');
  }
  *analyzedPrec = prec;
  return 1;
}

/* Remark: we don't really know how large the maximum width could
   ever be and if we should apply some modulo behavior. Anyway, we
   can't test the whole thing so the width is stored on a uint64_t
   for now.
*/
static inline int analyzeWidthModifier(uint64_t *analyzedWidth, int *setAnalyzedWidth, int *analyzedStar, uint64_t *analyzedFlags,
				       char *startBuf, char *endBuf) {
  char *myStartBuf, *myEndBuf;
  char *curr;
  int gottaBreak;
  uint64_t flags, width;

  /* Trim off a possible leading '%' and a possible trailing '\0'. */
  myStartBuf = startBuf;
  if (*myStartBuf == '%') myStartBuf++;
  myEndBuf = endBuf;
  if (*myEndBuf == '\0') myEndBuf--;

  /* Now check if we have at least one character to analyze between
     myStartBuf and myEndBuf
  */
  if (myEndBuf < myStartBuf) return 0;

  /* Trim off a possible trailing '.', 'b', 'v', 'w', 'r' or 'k'. */
  switch (*myEndBuf) {
  case '.':
  case 'b':
  case 'v':
  case 'w':
  case 'r':
  case 'k':
    myEndBuf--;
    break;
  default:
    break;
  }

  /* Now check if we have at least one character to analyze between
     myStartBuf and myEndBuf
  */
  if (myEndBuf < myStartBuf) return 0;

  /* Now analyze the flag characters */
  flags = (uint64_t) 0;
  for (curr = myStartBuf; curr <= myEndBuf; curr++) {
    gottaBreak = 0;
    switch (*curr) {
    case '#':
      flags |= SOLLYA_PRINTF_IMPL_FLAG_ALTERNATE_FORM;
      break;
    case '0':
      flags |= SOLLYA_PRINTF_IMPL_FLAG_ZERO_PADDING;
      break;
    case '-':
      flags |= SOLLYA_PRINTF_IMPL_FLAG_LEFT_ADJUSTMENT;
      break;
    case ' ':
      flags |= SOLLYA_PRINTF_IMPL_FLAG_POSITIVE_LEAVE_SPACE;
      break;
    case '+':
      flags |= SOLLYA_PRINTF_IMPL_FLAG_POSITIVE_GET_PLUS;
      break;
    case '\'':
      flags |= SOLLYA_PRINTF_IMPL_FLAG_GROUP_THOUSANDS;
      break;
    case 'I':
      flags |= SOLLYA_PRINTF_IMPL_FLAG_ALTERNATE_DIGITS;
      break;
    default:
      gottaBreak = 1;
    }
    if (gottaBreak) break;
  }

  /* Check for flags that override each other. */
  if (flags & SOLLYA_PRINTF_IMPL_FLAG_LEFT_ADJUSTMENT) {
    /* Left adjustment overrides zero padding */
    flags &= ~SOLLYA_PRINTF_IMPL_FLAG_ZERO_PADDING;
  }
  if (flags & SOLLYA_PRINTF_IMPL_FLAG_POSITIVE_GET_PLUS) {
    /* Plus-sign display overrides space display for signed
       conversions.
    */
    flags &= ~SOLLYA_PRINTF_IMPL_FLAG_POSITIVE_LEAVE_SPACE;
  }

  /* Check if we already got everything (because there are only flags,
     no width) and return.
  */
  if (curr > myEndBuf) {
    *analyzedFlags = flags;
    *setAnalyzedWidth = 0;
    *analyzedStar = 0;
    return 1;
  }

  /* Analyze now the width field, which can either be a '*' or a
     decimal number.

     If the field is a star, this character must be the only one left.
     Otherwise all characters must be decimal digits.
  */
  if ((curr == myEndBuf) && (*curr == '*')) {
    *analyzedFlags = flags;
    *setAnalyzedWidth = 0;
    *analyzedStar = 1;
    return 1;
  }

  /* Here all characters must be decimal digits. */
  width = (uint64_t) 0;
  for (; curr <= myEndBuf; curr++) {
    /* If a character is not a decimal digit, return failure */
    if ((*curr < '0') || (*curr > '9')) return 0;
    width *= (uint64_t) 10;
    width += (uint64_t) (*curr - '0');
  }

  /* Here, everthing went fine and we have an analyzed width */
  *analyzedFlags = flags;
  *analyzedWidth = width;
  *setAnalyzedWidth = 1;
  *analyzedStar = 0;

  return 1;
}

static inline char *justifyString(char *str, int justify, int justifyLeft, size_t width) {
  size_t len, num;
  char *res, *curr1, *curr2;

  /* Nothing to do if we don't justify at all or if the string is already longer than the field */
  if (!justify) return str;
  len = strlen(str);
  if (len >= width) return str;

  /* Compute number of justification characters */
  num = width - len;

  /* Allocate string for the output */
  res = safeCalloc(width + 1, sizeof(char));

  /* Justify to the left or to the right */
  if (justifyLeft) {
    for (curr1=str,curr2=res;*curr1!='\0';curr1++,curr2++) {
      *curr2 = *curr1;
    }
    for (;num>0;num--,curr2++) {
      *curr2 = ' ';
    }
  } else {
    for (curr2=res;num>0;num--,curr2++) {
      *curr2 = ' ';
    }
    for (curr1=str;*curr1!='\0';curr1++,curr2++) {
      *curr2 = *curr1;
    }
  }

  /* Free the old string */
  safeFree(str);

  /* Return the new justified string */
  return res;
}

static inline void initAndCopyMpfr(mpfr_t rop, mpfr_srcptr op) {
  mpfr_init2(rop,mpfr_get_prec(op));
  mpfr_set(rop,op,GMP_RNDN);
}

static inline void initAndCopyMpfi(sollya_mpfi_t rop, sollya_mpfi_srcptr op) {
  sollya_mpfi_init2(rop,sollya_mpfi_get_prec(op));
  sollya_mpfi_set(rop,op);
}

static inline void initAndCopyMpq(mpq_t rop, mpq_srcptr op) {
  mpq_init(rop);
  mpq_set(rop,op);
}

static inline void initAndCopyMpz(mpz_t rop, mpz_srcptr op) {
  mpz_init(rop);
  mpz_set(rop,op);
}

static inline int specialSnFprintf(FILE *fd, int useFd, char *str, size_t size, int offset, int useSize, const char *format, ...) {
  va_list varlist;
  size_t actualSize;
  char *actualStr;
  int res = -1;

  if (useFd) {
    va_start(varlist, format);
    res = vfprintf(fd, format, varlist);
    va_end(varlist);
    return res;
  }

  if (offset < 0) return offset;

  if ((size_t) offset > size) {
    actualSize = 0;
    actualStr = NULL;
  } else {
    actualSize = size - offset;
    actualStr = str + offset;
  }

  va_start(varlist, format);

  if (useSize) {
    if (actualSize >= 1) {
      res = vsnprintf(actualStr, actualSize, format, varlist);
    } else {
      res = vsnprintf(actualStr, 0, format, varlist);
    }
  } else {
    res = vsprintf(str + offset, format, varlist);
  }

  va_end(varlist);

  return res;
}

static inline int sollyaInternalBaseSnFprintf(FILE *fd, int useFd, char *str, size_t size, int useSize, const char *format, va_list varlist) {
  int res = 0;
  char *buf;
  const char *currFormat;
  char *currBuf;
  char *dotBuf, *percentBuf, *percentEndBuf;
  int r, shiftedState, starModifiers, hModifiers;
  int lModifiers, LModifier, jModifier, zModifier;
  int tModifier, dotModifier;
  char c;
  int tempInt;
  ssize_t tempSsize_t;
  intmax_t tempIntmax_t;
  ptrdiff_t tempPtrdiff_t;
  long int tempLongInt;
  long long int tempLongLongInt;
  short int tempShortInt;
  signed char tempSignedChar;
  int firstStarInt, secondStarInt;
  unsigned int tempUInt;
  size_t tempSize_t;
  uintmax_t tempUintmax_t;
  unsigned long int tempULongInt;
  unsigned long long int tempULongLongInt;
  unsigned short int tempUShortInt;
  unsigned char tempUnsignedChar;
  double tempDouble;
  long double tempLongDouble;
  wint_t tempWint_t;
  char *tempCharPtr;
  wchar_t *tempWCharPtr;
  void *tempVoidPtr;
  int *tempIntPtr;
  intmax_t *tempIntMaxTPtr;
  ssize_t *tempSSizePtr;
  ptrdiff_t *tempPtrDiffTPtr;
  signed char *tempSignedCharPtr;
  short int *tempShortIntPtr;
  long int *tempLongIntPtr;
  long long int *tempLongLongIntPtr;
  char *tempString;
  int isPercent;
  mpfr_t tempMpfrOrig;
  sollya_mpfi_t tempMpfiOrig;
  node *tempNode;
  mpq_t tempMpqOrig;
  mpz_t tempMpzOrig;
  int correctPrecModifier, analyzedStar, correctWidthModifier, analyzedWidthStar;
  int setAnalyzedWidth;
  uint64_t analyzedPrec, analyzedWidth, analyzedFlags;
  int precisionSpecified;
  mp_prec_t prec;
  mpfr_t tempMpfr;
  sollya_mpfi_t tempMpfi;

  buf = (char *) safeCalloc(strlen(format) + 1, sizeof(char));

  currBuf = buf;
  *currBuf = '\0';
  shiftedState = 0;
  currFormat = format;
  while (*currFormat != '\0') {
    switch (*currFormat) {
    case '%':
      *currBuf = *currFormat;
      currBuf++;
      *currBuf = '\0';
      currFormat++;
      shiftedState = 1;
      starModifiers = 0;
      hModifiers = 0;
      lModifiers = 0;
      LModifier = 0;
      jModifier = 0;
      zModifier = 0;
      tModifier = 0;
      dotModifier = 0;
      while ((*currFormat != '\0') &&
	     (shiftedState != 0)) {
	*currBuf = *currFormat;
	currBuf++;
	*currBuf = '\0';
	c = *currFormat;
	currFormat++;
	switch (c) {
	case '*':
	  starModifiers++;
	  break;
	case '.':
	  dotModifier = 1;
	  break;
	case 'h':
	  hModifiers++;
	  break;
	case 'l':
	  lModifiers++;
	  break;
	case 'L':
	  LModifier = 1;
	  break;
	case 'q':
	  lModifiers += 2;
	  break;
	case 'j':
	  jModifier = 1;
	  break;
	case 'z':
	  zModifier = 1;
	  break;
	case 't':
	  tModifier = 1;
	  break;
	case 'd':
	case 'i':
	  switch (starModifiers) {
	  case 0:
	    /* No star modifier given

	       We do not have to read an extra int
	    */
	    switch (hModifiers) {
	    case 0:
	      switch (lModifiers) {
	      case 0:
		if (jModifier) {
		  /* intmax_t integer conversion, no star */
		  tempIntmax_t = va_arg(varlist,intmax_t);
		  r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempIntmax_t);
		  if (r >= 0) {
		    if (res >= 0) {
		      res += r;
		    }
		  } else {
		    res = r;
		  }
		  currBuf = buf;
		  *currBuf = '\0';
		} else {
		  if (zModifier) {
		    /* ssize_t integer conversion, no star */
		    tempSsize_t = va_arg(varlist,ssize_t);
		    r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempSsize_t);
		    if (r >= 0) {
		      if (res >= 0) {
			res += r;
		      }
		    } else {
		      res = r;
		    }
		    currBuf = buf;
		    *currBuf = '\0';
		  } else {
		    if (tModifier) {
		      /* ptrdiff_t integer conversion, no star */
		      tempPtrdiff_t = va_arg(varlist,ptrdiff_t);
		      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempPtrdiff_t);
		      if (r >= 0) {
			if (res >= 0) {
			  res += r;
			}
		      } else {
			res = r;
		      }
		      currBuf = buf;
		      *currBuf = '\0';
		    } else {
		      /* int integer conversion, no star */
		      tempInt = va_arg(varlist,int);
		      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempInt);
		      if (r >= 0) {
			if (res >= 0) {
			  res += r;
			}
		      } else {
			res = r;
		      }
		      currBuf = buf;
		      *currBuf = '\0';
		    }
		  }
		}
		break;
	      case 1:
		/* long int integer conversion, no star */
		tempLongInt = va_arg(varlist,long int);
		r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempLongInt);
		if (r >= 0) {
		  if (res >= 0) {
		    res += r;
		  }
		} else {
		  res = r;
		}
		currBuf = buf;
		*currBuf = '\0';
		break;
	      default:
		/* long long int integer conversion, no star */
		tempLongLongInt = va_arg(varlist,long long int);
		r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempLongLongInt);
		if (r >= 0) {
		  if (res >= 0) {
		    res += r;
		  }
		} else {
		  res = r;
		}
		currBuf = buf;
		*currBuf = '\0';
		break;
	      }
	      break;
	    case 1:
	      /* short int integer conversion, no star

	         short int integers get promoted to
	         int when passed through variable args.
	      */
	      tempShortInt = (short int) (va_arg(varlist,int));
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempShortInt);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	      break;
	    default:
	      /* signed char integer conversion, no star

	         signed char integers get promoted to
	         int when passed through variable args.
	      */
	      tempSignedChar = (signed char) (va_arg(varlist,int));
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempSignedChar);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	      break;
	    }
	    break;
	  case 1:
	    /* One star modifier given

	       We have to read an extra int
	    */
	    firstStarInt = va_arg(varlist,int);
	    switch (hModifiers) {
	    case 0:
	      switch (lModifiers) {
	      case 0:
		if (jModifier) {
		  /* intmax_t integer conversion, one star */
		  tempIntmax_t = va_arg(varlist,intmax_t);
		  r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempIntmax_t);
		  if (r >= 0) {
		    if (res >= 0) {
		      res += r;
		    }
		  } else {
		    res = r;
		  }
		  currBuf = buf;
		  *currBuf = '\0';
		} else {
		  if (zModifier) {
		    /* ssize_t integer conversion, one star */
		    tempSsize_t = va_arg(varlist,ssize_t);
		    r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempSsize_t);
		    if (r >= 0) {
		      if (res >= 0) {
			res += r;
		      }
		    } else {
		      res = r;
		    }
		    currBuf = buf;
		    *currBuf = '\0';
		  } else {
		    if (tModifier) {
		      /* ptrdiff_t integer conversion, one star */
		      tempPtrdiff_t = va_arg(varlist,ptrdiff_t);
		      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempPtrdiff_t);
		      if (r >= 0) {
			if (res >= 0) {
			  res += r;
			}
		      } else {
			res = r;
		      }
		      currBuf = buf;
		      *currBuf = '\0';
		    } else {
		      /* int integer conversion, one star */
		      tempInt = va_arg(varlist,int);
		      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempInt);
		      if (r >= 0) {
			if (res >= 0) {
			  res += r;
			}
		      } else {
			res = r;
		      }
		      currBuf = buf;
		      *currBuf = '\0';
		    }
		  }
		}
		break;
	      case 1:
		/* long int integer conversion, one star */
		tempLongInt = va_arg(varlist,long int);
		r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempLongInt);
		if (r >= 0) {
		  if (res >= 0) {
		    res += r;
		  }
		} else {
		  res = r;
		}
		currBuf = buf;
		*currBuf = '\0';
		break;
	      default:
		/* long long int integer conversion, one star */
		tempLongLongInt = va_arg(varlist,long long int);
		r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempLongLongInt);
		if (r >= 0) {
		  if (res >= 0) {
		    res += r;
		  }
		} else {
		  res = r;
		}
		currBuf = buf;
		*currBuf = '\0';
		break;
	      }
	      break;
	    case 1:
	      /* short int integer conversion, one star

	         short int integers get promoted to
	         int when passed through variable args.
	      */
	      tempShortInt = (short int) (va_arg(varlist,int));
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempShortInt);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	      break;
	    default:
	      /* signed char integer conversion, one star

	         signed char integers get promoted to
	         int when passed through variable args.
	      */
	      tempSignedChar = (signed char) (va_arg(varlist,int));
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempSignedChar);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	      break;
	    }
	    break;
	  default:
	    /* Two (or more) star modifiers given

	       We have to read two extra ints
	    */
	    firstStarInt = va_arg(varlist,int);
	    secondStarInt = va_arg(varlist,int);
	    switch (hModifiers) {
	    case 0:
	      switch (lModifiers) {
	      case 0:
		if (jModifier) {
		  /* intmax_t integer conversion, one star */
		  tempIntmax_t = va_arg(varlist,intmax_t);
		  r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempIntmax_t);
		  if (r >= 0) {
		    if (res >= 0) {
		      res += r;
		    }
		  } else {
		    res = r;
		  }
		  currBuf = buf;
		  *currBuf = '\0';
		} else {
		  if (zModifier) {
		    /* ssize_t integer conversion, one star */
		    tempSsize_t = va_arg(varlist,ssize_t);
		    r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempSsize_t);
		    if (r >= 0) {
		      if (res >= 0) {
			res += r;
		      }
		    } else {
		      res = r;
		    }
		    currBuf = buf;
		    *currBuf = '\0';
		  } else {
		    if (tModifier) {
		      /* ptrdiff_t integer conversion, one star */
		      tempPtrdiff_t = va_arg(varlist,ptrdiff_t);
		      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempPtrdiff_t);
		      if (r >= 0) {
			if (res >= 0) {
			  res += r;
			}
		      } else {
			res = r;
		      }
		      currBuf = buf;
		      *currBuf = '\0';
		    } else {
		      /* int integer conversion, one star */
		      tempInt = va_arg(varlist,int);
		      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempInt);
		      if (r >= 0) {
			if (res >= 0) {
			  res += r;
			}
		      } else {
			res = r;
		      }
		      currBuf = buf;
		      *currBuf = '\0';
		    }
		  }
		}
		break;
	      case 1:
		/* long int integer conversion, one star */
		tempLongInt = va_arg(varlist,long int);
		r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempLongInt);
		if (r >= 0) {
		  if (res >= 0) {
		    res += r;
		  }
		} else {
		  res = r;
		}
		currBuf = buf;
		*currBuf = '\0';
		break;
	      default:
		/* long long int integer conversion, one star */
		tempLongLongInt = va_arg(varlist,long long int);
		r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempLongLongInt);
		if (r >= 0) {
		  if (res >= 0) {
		    res += r;
		  }
		} else {
		  res = r;
		}
		currBuf = buf;
		*currBuf = '\0';
		break;
	      }
	      break;
	    case 1:
	      /* short int integer conversion, one star

	         short int integers get promoted to
	         int when passed through variable args.
	      */
	      tempShortInt = (short int) (va_arg(varlist,int));
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempShortInt);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	      break;
	    default:
	      /* signed char integer conversion, one star

	         signed char integers get promoted to
	         int when passed through variable args.
	      */
	      tempSignedChar = (signed char) (va_arg(varlist,int));
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempSignedChar);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	      break;
	    }
	    break;
	  }
	  shiftedState = 0;
	  break;
	case 'o':
	case 'u':
	case 'x':
	case 'X':
	  switch (starModifiers) {
	  case 0:
	    /* No star modifier given

	       We do not have to read an extra int
	    */
	    switch (hModifiers) {
	    case 0:
	      switch (lModifiers) {
	      case 0:
		if (jModifier) {
		  /* uintmax_t integer conversion, no star */
		  tempUintmax_t = va_arg(varlist,uintmax_t);
		  r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempUintmax_t);
		  if (r >= 0) {
		    if (res >= 0) {
		      res += r;
		    }
		  } else {
		    res = r;
		  }
		  currBuf = buf;
		  *currBuf = '\0';
		} else {
		  if (zModifier) {
		    /* size_t integer conversion, no star */
		    tempSize_t = va_arg(varlist,size_t);
		    r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempSize_t);
		    if (r >= 0) {
		      if (res >= 0) {
			res += r;
		      }
		    } else {
		      res = r;
		    }
		    currBuf = buf;
		    *currBuf = '\0';
		  } else {
		    if (tModifier) {
		      /* ptrdiff_t integer conversion, no star */
		      tempPtrdiff_t = va_arg(varlist,ptrdiff_t);
		      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempPtrdiff_t);
		      if (r >= 0) {
			if (res >= 0) {
			  res += r;
			}
		      } else {
			res = r;
		      }
		      currBuf = buf;
		      *currBuf = '\0';
		    } else {
		      /* unsigned int integer conversion, no star */
		      tempUInt = va_arg(varlist,unsigned int);
		      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempUInt);
		      if (r >= 0) {
			if (res >= 0) {
			  res += r;
			}
		      } else {
			res = r;
		      }
		      currBuf = buf;
		      *currBuf = '\0';
		    }
		  }
		}
		break;
	      case 1:
		/* unsigned long int integer conversion, no star */
		tempULongInt = va_arg(varlist,unsigned long int);
		r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempULongInt);
		if (r >= 0) {
		  if (res >= 0) {
		    res += r;
		  }
		} else {
		  res = r;
		}
		currBuf = buf;
		*currBuf = '\0';
		break;
	      default:
		/* unsigned long long int integer conversion, no star */
		tempULongLongInt = va_arg(varlist,unsigned long long int);
		r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempULongLongInt);
		if (r >= 0) {
		  if (res >= 0) {
		    res += r;
		  }
		} else {
		  res = r;
		}
		currBuf = buf;
		*currBuf = '\0';
		break;
	      }
	      break;
	    case 1:
	      /* unsigned short int integer conversion, no star

	         unsigned short int integers get promoted to
	         unsigned int when passed through variable args.
	      */
	      tempUShortInt = (unsigned short int) (va_arg(varlist,unsigned int));
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempUShortInt);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	      break;
	    default:
	      /* unsigned char integer conversion, no star

	         unsigned char integers get promoted to
	         unsigned int when passed through variable args.
	      */
	      tempUnsignedChar = (unsigned char) (va_arg(varlist,unsigned int));
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempUnsignedChar);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	      break;
	    }
	    break;
	  case 1:
	    /* One star modifier given

	       We have to read an extra int
	    */
	    firstStarInt = va_arg(varlist,int);
	    switch (hModifiers) {
	    case 0:
	      switch (lModifiers) {
	      case 0:
		if (jModifier) {
		  /* uintmax_t integer conversion, one star */
		  tempUintmax_t = va_arg(varlist,uintmax_t);
		  r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempUintmax_t);
		  if (r >= 0) {
		    if (res >= 0) {
		      res += r;
		    }
		  } else {
		    res = r;
		  }
		  currBuf = buf;
		  *currBuf = '\0';
		} else {
		  if (zModifier) {
		    /* size_t integer conversion, one star */
		    tempSize_t = va_arg(varlist,size_t);
		    r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempSize_t);
		    if (r >= 0) {
		      if (res >= 0) {
			res += r;
		      }
		    } else {
		      res = r;
		    }
		    currBuf = buf;
		    *currBuf = '\0';
		  } else {
		    if (tModifier) {
		      /* ptrdiff_t integer conversion, one star */
		      tempPtrdiff_t = va_arg(varlist,ptrdiff_t);
		      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempPtrdiff_t);
		      if (r >= 0) {
			if (res >= 0) {
			  res += r;
			}
		      } else {
			res = r;
		      }
		      currBuf = buf;
		      *currBuf = '\0';
		    } else {
		      /* unsigned int integer conversion, one star */
		      tempUInt = va_arg(varlist,unsigned int);
		      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempUInt);
		      if (r >= 0) {
			if (res >= 0) {
			  res += r;
			}
		      } else {
			res = r;
		      }
		      currBuf = buf;
		      *currBuf = '\0';
		    }
		  }
		}
		break;
	      case 1:
		/* unsigned long int integer conversion, one star */
		tempULongInt = va_arg(varlist,unsigned long int);
		r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempULongInt);
		if (r >= 0) {
		  if (res >= 0) {
		    res += r;
		  }
		} else {
		  res = r;
		}
		currBuf = buf;
		*currBuf = '\0';
		break;
	      default:
		/* unsigned long long int integer conversion, one star */
		tempULongLongInt = va_arg(varlist,unsigned long long int);
		r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempULongLongInt);
		if (r >= 0) {
		  if (res >= 0) {
		    res += r;
		  }
		} else {
		  res = r;
		}
		currBuf = buf;
		*currBuf = '\0';
		break;
	      }
	      break;
	    case 1:
	      /* unsigned short int integer conversion, one star

	         unsigned short int integers get promoted to
	         unsigned int when passed through variable args.
	      */
	      tempUShortInt = (unsigned short int) (va_arg(varlist,unsigned int));
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempUShortInt);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	      break;
	    default:
	      /* unsigned char integer conversion, one star

	         unsigned char integers get promoted to
	         unsigned int when passed through variable args.
	      */
	      tempUnsignedChar = (unsigned char) (va_arg(varlist,unsigned int));
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempUnsignedChar);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	      break;
	    }
	    break;
	  default:
	    /* Two (or more) star modifiers given

	       We have to read two extra ints
	    */
	    firstStarInt = va_arg(varlist,int);
	    secondStarInt = va_arg(varlist,int);
	    switch (hModifiers) {
	    case 0:
	      switch (lModifiers) {
	      case 0:
		if (jModifier) {
		  /* uintmax_t integer conversion, one star */
		  tempUintmax_t = va_arg(varlist,uintmax_t);
		  r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempUintmax_t);
		  if (r >= 0) {
		    if (res >= 0) {
		      res += r;
		    }
		  } else {
		    res = r;
		  }
		  currBuf = buf;
		  *currBuf = '\0';
		} else {
		  if (zModifier) {
		    /* size_t integer conversion, one star */
		    tempSize_t = va_arg(varlist,size_t);
		    r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempSize_t);
		    if (r >= 0) {
		      if (res >= 0) {
			res += r;
		      }
		    } else {
		      res = r;
		    }
		    currBuf = buf;
		    *currBuf = '\0';
		  } else {
		    if (tModifier) {
		      /* ptrdiff_t integer conversion, one star */
		      tempPtrdiff_t = va_arg(varlist,ptrdiff_t);
		      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempPtrdiff_t);
		      if (r >= 0) {
			if (res >= 0) {
			  res += r;
			}
		      } else {
			res = r;
		      }
		      currBuf = buf;
		      *currBuf = '\0';
		    } else {
		      /* unsigned int integer conversion, one star */
		      tempUInt = va_arg(varlist,unsigned int);
		      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempUInt);
		      if (r >= 0) {
			if (res >= 0) {
			  res += r;
			}
		      } else {
			res = r;
		      }
		      currBuf = buf;
		      *currBuf = '\0';
		    }
		  }
		}
		break;
	      case 1:
		/* unsigned long int integer conversion, one star */
		tempULongInt = va_arg(varlist,unsigned long int);
		r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempULongInt);
		if (r >= 0) {
		  if (res >= 0) {
		    res += r;
		  }
		} else {
		  res = r;
		}
		currBuf = buf;
		*currBuf = '\0';
		break;
	      default:
		/* unsigned long long int integer conversion, one star */
		tempULongLongInt = va_arg(varlist,unsigned long long int);
		r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempULongLongInt);
		if (r >= 0) {
		  if (res >= 0) {
		    res += r;
		  }
		} else {
		  res = r;
		}
		currBuf = buf;
		*currBuf = '\0';
		break;
	      }
	      break;
	    case 1:
	      /* unsigned short int integer conversion, one star

	         unsigned short int integers get promoted to
	         unsigned int when passed through variable args.
	      */
	      tempUShortInt = (unsigned short int) (va_arg(varlist,unsigned int));
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempUShortInt);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	      break;
	    default:
	      /* unsigned char integer conversion, one star

	         unsigned char integers get promoted to
	         unsigned int when passed through variable args.
	      */
	      tempUnsignedChar = (unsigned char) (va_arg(varlist,unsigned int));
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempUnsignedChar);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	      break;
	    }
	    break;
	  }
	  shiftedState = 0;
	  break;
	case 'e':
	case 'E':
	case 'f':
	case 'F':
	case 'g':
	case 'G':
	case 'a':
	case 'A':
	  switch (starModifiers) {
	  case 0:
	    /* No star modifier given

	       We do not have to read an extra int
	    */
	    if (LModifier) {
	      /* The floating-point conversion takes
	         a long double argument
	      */
	      tempLongDouble = va_arg(varlist,long double);
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempLongDouble);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	    } else {
	      /* The floating-point conversion takes
	         a double argument
	      */
	      tempDouble = va_arg(varlist,double);
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempDouble);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	    }
	    break;
	  case 1:
	    /* One star modifier given

	       We have to read one extra int
	    */
	    firstStarInt = va_arg(varlist,int);
	    if (LModifier) {
	      /* The floating-point conversion takes
	         a long double argument
	      */
	      tempLongDouble = va_arg(varlist,long double);
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempLongDouble);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	    } else {
	      /* The floating-point conversion takes
	         a double argument
	      */
	      tempDouble = va_arg(varlist,double);
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempDouble);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	    }
	    break;
	  default:
	    /* Two (or more) star modifiers given

	       We have to read two extra ints
	    */
	    firstStarInt = va_arg(varlist,int);
	    secondStarInt = va_arg(varlist,int);
	    if (LModifier) {
	      /* The floating-point conversion takes
	         a long double argument
	      */
	      tempLongDouble = va_arg(varlist,long double);
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempLongDouble);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	    } else {
	      /* The floating-point conversion takes
	         a double argument
	      */
	      tempDouble = va_arg(varlist,double);
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, secondStarInt, tempDouble);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	    }
	    break;
	  }
	  shiftedState = 0;
	  break;
	case 'C':
	  lModifiers++;
	  /* Fall-through... */
	case 'c':
	  if (lModifiers == 0) {
	    tempUnsignedChar = (unsigned char) va_arg(varlist,int);
	    r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempUnsignedChar);
	    if (r >= 0) {
	      if (res >= 0) {
		res += r;
	      }
	    } else {
	      res = r;
	    }
	    currBuf = buf;
	    *currBuf = '\0';
	  } else {
	    tempWint_t = va_arg(varlist,wint_t);
	    r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempWint_t);
	    if (r >= 0) {
	      if (res >= 0) {
		res += r;
	      }
	    } else {
	      res = r;
	    }
	    currBuf = buf;
	    *currBuf = '\0';
	  }
	  shiftedState = 0;
	  break;
	case 'S':
	  lModifiers++;
	  /* Fall-through... */
	case 's':
	  if (starModifiers == 0) {
	    /* No star modifier given

	       We do not have to read an extra int
	    */
	    if (lModifiers == 0) {
	      tempCharPtr = va_arg(varlist,char *);
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempCharPtr);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	    } else {
	      tempWCharPtr = va_arg(varlist,wchar_t *);
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempWCharPtr);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	    }
	  } else {
	    /* One star modifier given

	       We have to read one extra int
	    */
	    firstStarInt = va_arg(varlist,int);
	    if (lModifiers == 0) {
	      tempCharPtr = va_arg(varlist,char *);
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempCharPtr);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	    } else {
	      tempWCharPtr = va_arg(varlist,wchar_t *);
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, firstStarInt, tempWCharPtr);
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	    }
	  }
	  shiftedState = 0;
	  break;
	case 'p':
	  tempVoidPtr = va_arg(varlist,void *);
	  r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempVoidPtr);
	  if (r >= 0) {
	    if (res >= 0) {
	      res += r;
	    }
	  } else {
	    res = r;
	  }
	  currBuf = buf;
	  *currBuf = '\0';
	  shiftedState = 0;
	  break;
	case 'n':
	  switch (hModifiers) {
	  case 0:
	    switch (lModifiers) {
	    case 0:
	      if (jModifier) {
		/* intmax_t * argument */
		tempIntMaxTPtr = va_arg(varlist,intmax_t *);
		r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, &tempIntmax_t);
		if (res >= 0) {
		  *tempIntMaxTPtr = tempIntmax_t + res;
		} else {
		  *tempIntMaxTPtr = 0;
		}
		if (r >= 0) {
		  if (res >= 0) {
		    res += r;
		  }
		} else {
		  res = r;
		}
		currBuf = buf;
		*currBuf = '\0';
	      } else {
		if (zModifier) {
		  /* ssize_t * argument */
		  tempSSizePtr = va_arg(varlist,ssize_t *);
		  r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, &tempSsize_t);
		  if (res >= 0) {
		    *tempSSizePtr = tempSsize_t + res;
		  } else {
		    *tempSSizePtr = 0;
		  }
		  if (r >= 0) {
		    if (res >= 0) {
		      res += r;
		    }
		  } else {
		    res = r;
		  }
		  currBuf = buf;
		  *currBuf = '\0';
		} else {
		  if (tModifier) {
		    /*  ptrdiff_t * argument */
		    tempPtrDiffTPtr = va_arg(varlist,ptrdiff_t *);
		    r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, &tempPtrdiff_t);
		    if (res >= 0) {
		      *tempPtrDiffTPtr = tempPtrdiff_t + res;
		    } else {
		      *tempPtrDiffTPtr = 0;
		    }
		    if (r >= 0) {
		      if (res >= 0) {
			res += r;
		      }
		    } else {
		      res = r;
		    }
		    currBuf = buf;
		    *currBuf = '\0';
		  } else {
		    /* int * argument */
		    tempIntPtr = va_arg(varlist,int *);
		    r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, &tempInt);
		    if (res >= 0) {
		      *tempIntPtr = tempInt + res;
		    } else {
		      *tempIntPtr = 0;
		    }
		    if (r >= 0) {
		      if (res >= 0) {
			res += r;
		      }
		    } else {
		      res = r;
		    }
		    currBuf = buf;
		    *currBuf = '\0';
		  }
		}
	      }
	      break;
	    case 1:
	      /* long int * argument */
	      tempLongIntPtr = va_arg(varlist,long int *);
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, &tempLongInt);
	      if (res >= 0) {
		*tempLongIntPtr = tempLongInt + res;
	      } else {
		*tempLongIntPtr = 0;
	      }
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	      break;
	    default:
	      /* long long int * */
	      tempLongLongIntPtr = va_arg(varlist,long long int *);
	      r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, &tempLongLongInt);
	      if (res >= 0) {
		*tempLongLongIntPtr = tempLongLongInt + res;
	      } else {
		*tempLongLongIntPtr = 0;
	      }
	      if (r >= 0) {
		if (res >= 0) {
		  res += r;
		}
	      } else {
		res = r;
	      }
	      currBuf = buf;
	      *currBuf = '\0';
	      break;
	    }
	    break;
	  case 1:
	    /* short int * argument */
	    tempShortIntPtr = va_arg(varlist,short int *);
	    r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, &tempShortInt);
	    if (res >= 0) {
	      *tempShortIntPtr = tempShortInt + res;
	    } else {
	      *tempShortIntPtr = 0;
	    }
	    if (r >= 0) {
	      if (res >= 0) {
		res += r;
	      }
	    } else {
	      res = r;
	    }
	    currBuf = buf;
	    *currBuf = '\0';
	    break;
	  default:
	    /* signed char * argument */
	    tempSignedCharPtr = va_arg(varlist,signed char *);
	    r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, &tempSignedChar);
	    if (res >= 0) {
	      *tempSignedCharPtr = tempSignedChar + res;
	    } else {
	      *tempSignedCharPtr = 0;
	    }
	    if (r >= 0) {
	      if (res >= 0) {
		res += r;
	      }
	    } else {
	      res = r;
	    }
	    currBuf = buf;
	    *currBuf = '\0';
	    break;
	  }
	  shiftedState = 0;
	  break;
	case 'm':
	case '%':
	  r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf);
	  if (r >= 0) {
	    if (res >= 0) {
	      res += r;
	    }
	  } else {
	    res = r;
	  }
	  currBuf = buf;
	  *currBuf = '\0';
	  shiftedState = 0;
	  break;
	case 'v':
	case 'w':
	case 'b':
	case 'r':
	case 'k':
	  /* Still free, too: y */
	  correctPrecModifier = 0;
	  analyzedStar = 0;
	  percentBuf = currBuf;
	  percentEndBuf = currBuf;
	  while (percentBuf > buf) {
	    percentBuf--;
	    if (*percentBuf == '%') break;
	  }
	  if (dotModifier) {
	    dotBuf = currBuf;
	    while (dotBuf > buf) {
	      dotBuf--;
	      if (*dotBuf == '.') break;
	    }
	    if (*dotBuf == '.') {
	      percentEndBuf = dotBuf;
	      correctPrecModifier = analyzePrecModifier(&analyzedPrec,&analyzedStar,dotBuf,currBuf);
	    }
	  }
	  correctWidthModifier = 0;
	  analyzedFlags = (uint64_t) 0;
	  setAnalyzedWidth = 0;
	  analyzedWidthStar = 0;
	  if (percentBuf < percentEndBuf - 1) {
	    correctWidthModifier = analyzeWidthModifier(&analyzedWidth,&setAnalyzedWidth,&analyzedWidthStar,&analyzedFlags,percentBuf,percentEndBuf);
	  }
	  while (currBuf > buf) {
	    currBuf--;
	    isPercent = (*currBuf == '%');
	    *currBuf = '\0';
	    if (isPercent) break;
	  }
	  *currBuf = '%';
	  currBuf++;
	  *currBuf = 's';
	  currBuf++;
	  *currBuf = '\0';
	  if (correctWidthModifier) {
	    if (analyzedWidthStar) {
	      firstStarInt = va_arg(varlist,int);
	      if (firstStarInt >= 0) {
		analyzedWidth = firstStarInt;
	      } else {
		firstStarInt = -firstStarInt;
		analyzedWidth = firstStarInt;
		analyzedFlags |= SOLLYA_PRINTF_IMPL_FLAG_LEFT_ADJUSTMENT;
	      }
	      setAnalyzedWidth = 1;
	    }
	  }
	  precisionSpecified = 0;
	  if (correctPrecModifier) {
	    if (analyzedStar) {
	      firstStarInt = va_arg(varlist,int);
	      if (firstStarInt >= 1) {
		analyzedPrec = firstStarInt;
	      } else {
		analyzedPrec = 1;
	      }
	      precisionSpecified = 1;
	      prec = (mp_prec_t) (((double) analyzedPrec) * 3.32192809488736234787031942948939017586483139302458); /* Digits to bits */
	      if (prec < 4) prec = 4;
	    } else {
	      precisionSpecified = 1;
	      prec = (mp_prec_t) (((double) analyzedPrec) * 3.32192809488736234787031942948939017586483139302458); /* Digits to bits */
	      if (prec < 4) prec = 4;
	    }
	  }
	  switch (c) {
	  case 'v':
	    initAndCopyMpfr(tempMpfrOrig,va_arg(varlist,mpfr_srcptr));
	    if (precisionSpecified) {
	      mpfr_init2(tempMpfr,prec);
	      mpfr_set(tempMpfr,tempMpfrOrig,GMP_RNDN);
	      tempString = sprintValue(&tempMpfr);
	      mpfr_clear(tempMpfr);
	    } else {
	      tempString = sprintValue(&tempMpfrOrig);
	    }
	    mpfr_clear(tempMpfrOrig);
	    break;
	  case 'w':
	    initAndCopyMpfi(tempMpfiOrig,va_arg(varlist,sollya_mpfi_srcptr));
	    if (precisionSpecified) {
	      sollya_mpfi_init2(tempMpfi,prec);
	      sollya_mpfi_set(tempMpfi,tempMpfiOrig);
	      tempString = sprintInterval(tempMpfi);
	      sollya_mpfi_clear(tempMpfi);
	    } else {
	      tempString = sprintInterval(tempMpfiOrig);
	    }
	    sollya_mpfi_clear(tempMpfiOrig);
	    break;
	  case 'r':
	    initAndCopyMpq(tempMpqOrig,va_arg(varlist,mpq_srcptr));
	    tempString = sprintMpq(tempMpqOrig);
	    mpq_clear(tempMpqOrig);
	    break;
	  case 'k':
	    initAndCopyMpz(tempMpzOrig,va_arg(varlist,mpz_srcptr));
	    tempString = sprintMpz(tempMpzOrig);
	    mpz_clear(tempMpzOrig);
	    break;
	  case 'b':
	    tempNode = va_arg(varlist,node *);
	    if (tempNode != NULL) {
	      tempString = sPrintThing(tempNode);
	    } else {
	      tempString = safeCalloc(5,sizeof(char));
	      sprintf(tempString,"NULL");
	    }
	    break;
	  default:
	    tempString = (char *) safeCalloc(1,sizeof(char));
	    break;
	  }
	  tempString = justifyString(tempString, setAnalyzedWidth,
				     ((analyzedFlags & SOLLYA_PRINTF_IMPL_FLAG_LEFT_ADJUSTMENT) != ((uint64_t) 0)),
				     (size_t) analyzedWidth); /* Does not leak memory */
	  r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf, tempString);
	  if (r >= 0) {
	    if (res >= 0) {
	      res += r;
	    }
	  } else {
	    res = r;
	  }
	  currBuf = buf;
	  *currBuf = '\0';
	  safeFree(tempString);
	  shiftedState = 0;
	  break;
	default:
	  break;
	}
      }
      break;
    default:
      *currBuf = *currFormat;
      currBuf++;
      *currBuf = '\0';
      currFormat++;
      break;
    }
  }
  if (currBuf != buf) {
    r = specialSnFprintf(fd, useFd, str, size, res, useSize, buf);
    if (r >= 0) {
      if (res >= 0) {
	res += r;
      }
    } else {
      res = r;
    }
  }

  safeFree(buf);
  return res;
}

int sollyaInternalVfprintf(FILE *fd, const char *format, va_list ap) {
  return sollyaInternalBaseSnFprintf(fd, 1, NULL, 0, 0, format, ap);
}

int sollyaInternalVsnprintf(char *str, size_t size, const char *format, va_list ap) {
  return sollyaInternalBaseSnFprintf(NULL, 0, str, size, 1, format, ap);
}

int sollyaInternalVsprintf(char *str, const char *format, va_list ap) {
  return sollyaInternalBaseSnFprintf(NULL, 0, str, 0, 0, format, ap);
}

int sollya_snprintf(char *str, size_t size, const char *format, ...) {
  va_list varlist;
  int res;

  va_start(varlist,format);

  res = sollyaInternalVsnprintf(str, size, format, varlist);

  va_end(varlist);

  return res;
}
