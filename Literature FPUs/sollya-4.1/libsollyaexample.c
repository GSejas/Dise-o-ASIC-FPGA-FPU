/*

  Copyright 2007-2012 by

  Laboratoire de l'Informatique du Parallelisme,
  UMR CNRS - ENS Lyon - UCB Lyon 1 - INRIA 5668

  and

  Laboratoire d'Informatique de Paris 6, equipe PEQUAN,
  UPMC Universite Paris 06 - CNRS - UMR 7606 - LIP6, Paris, France.

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

#include <stdlib.h>
#include "sollya.h"

/* Example for the usage of libsollya

   Compile with something similar to

   gcc -Wall -I. -c libsollyaexample.c
   gcc -L./.libs -I. -Wall -o libsollyaexample libsollyaexample.o -lsollya -lmpfi -lmpfr -lxml2 -lfplll


   The example...

   TODO

*/

int myMessageCallback(int msg) {
  char *str;
  str = sollya_lib_msg_number_to_text(msg);
  sollya_lib_printf("Got message #%d - \"%s\"\n", msg, str);
  safeFree(str);
  return 1;
}

int main(int argc, char *argv[]) {
  sollya_obj_t func;

  sollya_lib_init();

  sollya_lib_install_msg_callback(myMessageCallback);

  func = sollya_lib_parse_string("exp(1.7 * x)");

  sollya_lib_autoprint(func, NULL);

  sollya_lib_clear_obj(func);

  sollya_lib_close();

  return 0;
}
