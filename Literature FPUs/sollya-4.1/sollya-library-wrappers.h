/*

  Copyright 2011-2012 by

  Laboratoire d'Informatique de Paris 6, equipe PEQUAN,
  UPMC Universite Paris 06 - CNRS - UMR 7606 - LIP6, Paris, France,

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

#ifndef SOLLYA_LIBRARY_WRAPPERS_H
#define SOLLYA_LIBRARY_WRAPPERS_H

/* Attention: do not change order of includes neither remove the
   following #define.
*/

#define __SOLLYA_NODE_TYPE_ALREADY_DEFINED 1

#include <stdarg.h>
#include <gmp.h>
#include <mpfr.h>
#include <stdint.h>
#include <stdio.h>
#include "expression.h"
#include "execute.h"
#include "mpfi-compat.h"

typedef node * sollya_obj_t;
typedef chain * sollya_obj_list_t;
typedef chain * sollya_constant_list_t;
typedef chain * sollya_interval_list_t;
typedef chain * sollya_int_list_t;
typedef chain * sollya_string_list_t;
typedef chain * sollya_boolean_list_t;

/* Here is where things actually do happen */
#include "sollya.h"

#endif /* ifdef SOLLYA_LIBRARY_WRAPPERS_H*/
