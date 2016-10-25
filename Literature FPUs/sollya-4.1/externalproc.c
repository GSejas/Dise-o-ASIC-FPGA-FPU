/*

  Copyright 2007-2012 by

  Laboratoire de l'Informatique du Parallelisme,
  UMR CNRS - ENS Lyon - UCB Lyon 1 - INRIA 5668,

  and by

  Laboratoire d'Informatique de Paris 6, equipe PEQUAN,
  UPMC Universite Paris 06 - CNRS - UMR 7606 - LIP6, Paris, France.

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

#include <mpfr.h>
#include <sollya.h>

/* Example of an external procedure linked to an identifier in sollya

   Compile with

   gcc -fPIC -Wall -c externalproc.c
   gcc -fPIC -shared -o externalproc externalproc.o

   Procedure foo will be linked by

   externalproc(foo, "./externalproc", signature);

   where signature is the signature of the function as type -> type or (type, type, ...) -> type
   where type is one of

   void, constant, function, range, integer, string, boolean, list of constant,
   list of function, list of range, list of integer, list of string, list of boolean.

   It is worth mentionning that the difference between the data and
   result type function and the type object is minimal and due to
   support of legacy Sollya code. Both Sollya functions and Sollya
   objects are transferred from and to the external procedure thru the
   C type sollya_obj_t. The difference is that Sollya will check that
   a certain object is a mathematical function when function is used
   as a type, and will skip this test if the object type is
   used. Similarly, Sollya relies on an object produced by the
   external procedure to be a mathematical function when function is
   used and will not make this assumption for object.
   
   The C function foo is supposed to return an integer indicating success.
   It returns its result depending on its sollya result type as follows:

   * void :        the C function has no pointer argument for the result
   * constant:     the first argument of the C function is of C type mpfr_t *,
   the result is returned by affecting the MPFR variable
   * function:     the first argument of the C function is of C type sollya_obj_t *,
   the result is returned by the sollya_obj_t  pointed with a new sollya_obj_t
   * object:       the first argument of the C function is of C type sollya_obj_t *,
   the result is returned by the sollya_obj_t  pointed with a new sollya_obj_t
   * range:        the first argument of the C function is of C type mpfi_t *,
   the result is returned by affecting the MPFI variable
   * integer:      the first argument of the C function is of C type int *,
   the result is returned by affecting the int variable
   * string:       the first argument of the C function is of C type char **,
   the result is returned by the char * pointed with a new char *
   * boolean:      the first argument of the C function is of C type int *,
   the result is returned by affecting the int variable with a boolean value
   * list of type: the first argument of the C function is of a C type depending
   on the Sollya return type.
   For a list of
   - constant: sollya_constant_list_t *
   - function: sollya_obj_list_t *
   - object:   sollya_obj_list_t *
   - range:    sollya_constant_list_t *
   - integer:  sollya_int_list_t *
   - string:   sollya_string_list_t *
   - boolean:  sollya_boolean_list_t *

   The C function affects its possible pointer argument if and only if it succeeds.
   This means, if the function returns an integer indicating failure, it does not
   leak any memory to the encompassing environment.

   The C function foo receives its arguments as follows:
   If the sollya argument type is void, no argument array is given.
   Otherwise the C function receives a C void ** argument representing an array
   of size equal to the arity of the function where each entry (of C type void *) represents
   a value with a C type depending on the corresponding sollya type:

   * constant:     the C type the void * is to be cast to mpfr_t *
   * function:     the C type the void * is to be cast to sollya_obj_t
   * object:       the C type the void * is to be cast to sollya_obj_t
   * range:        the C type the void * is to be cast to mpfi_t *
   * integer:      the C type the void * is to be cast to int *
   * string:       the C type the void * is to be cast to char *
   * boolean:      the C type the void * is to be cast to int *
   * list of type: the C type the void * is to be cast to a list of a
   type depending on the type of the list argument.
   For a list of
   - constant: sollya_constant_list_t
   - function: sollya_obj_list_t
   - object:   sollya_obj_list_t
   - range:    sollya_interval_list_t
   - integer:  sollya_int_list_t
   - string:   sollya_string_list_t
   - boolean:  sollya_boolean_list_t.

   The C function is not supposed to alter the memory pointed by its array argument void **.

   In both directions (argument and result values), empty lists are represented by NULL pointers.

*/


/* Signature (integer, integer) -> integer */

int foo(int *res, void **args) {

  *res = *((int *) args[0]) + *((int *) args[1]);

  return 1;
}
