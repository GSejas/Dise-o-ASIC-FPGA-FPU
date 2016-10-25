/*

  Copyright 2012 by

  Laboratoire d'Informatique de Paris 6, equipe PEQUAN,
  UPMC Universite Paris 06 - CNRS - UMR 7606 - LIP6, Paris, France.

  Contributors Ch. Lauter

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

#include <stdlib.h>
#include "general.h"
#include "bitfields.h"


bitfield initializeBitfield() {
  bitfield res;

  res = (bitfield) safeMalloc(sizeof(bitfieldBlock));
  res->limbs = 1;
  res->fields = (uint64_t *) safeMalloc(sizeof(uint64_t));
  res->fields[0] = 0ULL;

  return res;
}

void freeBitfield(bitfield bf) {
  safeFree(bf->fields);
  safeFree(bf);
}

void setBitInBitfield(bitfield bf, unsigned int bit) {
  uint64_t *newFields;
  unsigned int i;

  if ((bit >> 6) >= bf->limbs) {
    newFields = (uint64_t *) safeCalloc((bit >> 6) + 1,sizeof(uint64_t));
    for (i=0;i<(bit >> 6) + 1;i++) {
      newFields[i] = 0ULL;
    }
    for (i=0;i<bf->limbs;i++) {
      newFields[i] = bf->fields[i];
    }
    bf->limbs = (bit >> 6) + 1;
    safeFree(bf->fields);
    bf->fields = newFields;
  }

  bf->fields[bit >> 6] |= 1ULL << (bit & 0x3f);
}

void clearBitInBitfield(bitfield bf, unsigned int bit) {
  if ((bit >> 6) < bf->limbs) {
    bf->fields[bit >> 6] &= ~(1ULL << (bit & 0x3f));
  }
}

void fixBitInBitfield(bitfield bf, unsigned int bit, int val) {
  if (val) {
    setBitInBitfield(bf, bit);
  } else {
    clearBitInBitfield(bf, bit);
  }
}

int getBitInBitfield(bitfield bf, unsigned int bit) {
  if ((bit >> 6) >= bf->limbs) return 0;
  return !(!(bf->fields[bit >> 6] & (1ULL << (bit & 0x3f))));
}

void clearBitfield(bitfield bf) {
  unsigned int i;
  for (i=0;i<bf->limbs;i++) bf->fields[i] = 0ULL;
}

int getMaxIndexOfSetBit(bitfield bf) {
  int i, j;
  for (i=bf->limbs-1;i>=0;i--) {
    if (!(!(bf->fields[i]))) {
      for (j=63;j>=0;j--) {
	if (!(!(bf->fields[i] & (1ULL << j)))) {
	  return j + (i << 6);
	}
      }
    }
  }
  return -1;
}
