/*

  Copyright 2007-2013 by

  Laboratoire de l'Informatique du Parallelisme,
  UMR CNRS - ENS Lyon - UCB Lyon 1 - INRIA 5668,

  LORIA (CNRS, INPL, INRIA, UHP, U-Nancy 2)

  and by

  Laboratoire d'Informatique de Paris 6, equipe PEQUAN,
  UPMC Universite Paris 06 - CNRS - UMR 7606 - LIP6, Paris, France.

  Contributors Ch. Lauter, S. Chevillard, M. Joldes

  christoph.lauter@ens-lyon.org
  sylvain.chevillard@ens-lyon.org
  joldes@lass.fr

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

#ifndef SOLLYA_H
#define SOLLYA_H

/* The following #include should be first !

   IT MUST BE PROTECTED BY THE #if THAT IS USED!

   This is because this header file is used both internally when
   compiling the Sollya library and when using the library.

*/
#if (!(defined(__SOLLYA_NODE_TYPE_ALREADY_DEFINED) && (__SOLLYA_NODE_TYPE_ALREADY_DEFINED)))
#include <sollya-messages.h>
#endif

/* Now some other #includes we need to get the different types defined.

   For some reason we can't really understand, some systems need the
   inclusions to be done in the order they are given.

*/
#include <stdarg.h>
#include <mpfr.h>
#include <mpfi.h>
#include <stdint.h>
#include <stdio.h>
#include <gmp.h>

#ifdef __cplusplus
extern "C" {
#endif

  /* Define a type for all Sollya objects and for lists
     of Sollya objects, constants, intervals, integers, strings and booleans.

     This header file is used both internally when compiling
     the Sollya library and when using the library.

     This is why the typedef logic below is pretty ackward.
     Please be very careful when messing with it.

     If you are a Sollya library user, the only thing you have
     to know that in the end of the following #if block, a
     type

     sollya_obj_t,

     types

     sollya_obj_list_t         (list of Sollya objects)
     sollya_constant_list_t    (list of MPFRs)
     sollya_interval_list_t    (list of MPFIs)
     sollya_int_list_t         (list of ints)
     sollya_string_list_t      (list of char *s)
     sollya_boolean_list_t     (list of ints as booleans)

     and the type

     sollya_msg_t

     are defined. These types represent the different objects the Sollya
     library is able to handle and objects that can be chained together.

  */
#if (!(defined(__SOLLYA_NODE_TYPE_ALREADY_DEFINED) && (__SOLLYA_NODE_TYPE_ALREADY_DEFINED)))
  typedef struct __sollya_internal_type_chain_struct __sollya_internal_type_chain;

  typedef __sollya_internal_type_chain * sollya_obj_list_t;
  typedef __sollya_internal_type_chain * sollya_constant_list_t;
  typedef __sollya_internal_type_chain * sollya_interval_list_t;
  typedef __sollya_internal_type_chain * sollya_int_list_t;
  typedef __sollya_internal_type_chain * sollya_string_list_t;
  typedef __sollya_internal_type_chain * sollya_boolean_list_t;

  typedef struct __sollya_internal_type_object_base_struct __sollya_internal_type_object_base;
  typedef __sollya_internal_type_object_base * sollya_obj_t;
  typedef struct __sollya_internal_type_msg_struct * sollya_msg_t;
#endif


  /* Define an enumeration type for the status
     of floating-point evaluation
  */
  enum sollya_fp_result_flag_enum_t {
    SOLLYA_FP_FLAG_CORRECTLY_ROUNDED       = (1 << 0),
    SOLLYA_FP_FLAG_FAITHFUL                = (1 << 1),
    SOLLYA_FP_FLAG_PROVEN_EXACT            = (1 << 2),
    SOLLYA_FP_FLAG_PROVEN_INEXACT          = (1 << 3),
    SOLLYA_FP_FLAG_NOT_FAITHFUL            = (1 << 4),
    SOLLYA_FP_FLAG_BELOW_CUTOFF            = (1 << 5),
    SOLLYA_FP_FLAG_BELOW_THRESHOLD         = (1 << 6),
    SOLLYA_FP_FLAG_ZERO_CONTAINED          = (1 << 7),
    SOLLYA_FP_FLAG_INFINITY_CONTAINED      = (1 << 8),
    SOLLYA_FP_FLAG_FAILURE                 = (1 << 9),
    SOLLYA_FP_FLAG_CUTOFF_IS_NAN           = (1 << 10),
    SOLLYA_FP_FLAG_EXPRESSION_NOT_CONSTANT = (1 << 11)
  };
  typedef enum sollya_fp_result_flag_enum_t sollya_fp_result_flag_t;

  enum sollya_fp_result_enum_t {
    SOLLYA_FP_OBJ_NO_FUNCTION = 0,
    SOLLYA_FP_PROVEN_EXACT = SOLLYA_FP_FLAG_PROVEN_EXACT,
    SOLLYA_FP_FAITHFUL = SOLLYA_FP_FLAG_FAITHFUL,
    SOLLYA_FP_FAITHFUL_PROVEN_INEXACT = (SOLLYA_FP_FLAG_FAITHFUL | SOLLYA_FP_FLAG_PROVEN_INEXACT),
    SOLLYA_FP_CORRECTLY_ROUNDED = SOLLYA_FP_FLAG_CORRECTLY_ROUNDED,
    SOLLYA_FP_CORRECTLY_ROUNDED_PROVEN_INEXACT = (SOLLYA_FP_FLAG_CORRECTLY_ROUNDED | SOLLYA_FP_FLAG_PROVEN_INEXACT),
    SOLLYA_FP_BELOW_CUTOFF = SOLLYA_FP_FLAG_BELOW_CUTOFF,
    SOLLYA_FP_NOT_FAITHFUL_ZERO_CONTAINED_BELOW_THRESHOLD = (SOLLYA_FP_FLAG_NOT_FAITHFUL | SOLLYA_FP_FLAG_ZERO_CONTAINED | SOLLYA_FP_FLAG_BELOW_THRESHOLD),
    SOLLYA_FP_NOT_FAITHFUL_ZERO_CONTAINED_NOT_BELOW_THRESHOLD = (SOLLYA_FP_FLAG_NOT_FAITHFUL | SOLLYA_FP_FLAG_ZERO_CONTAINED),
    SOLLYA_FP_NOT_FAITHFUL_ZERO_NOT_CONTAINED = SOLLYA_FP_FLAG_NOT_FAITHFUL,
    SOLLYA_FP_NOT_FAITHFUL_INFINITY_CONTAINED = (SOLLYA_FP_FLAG_NOT_FAITHFUL | SOLLYA_FP_FLAG_INFINITY_CONTAINED),
    SOLLYA_FP_INFINITY = (SOLLYA_FP_FLAG_INFINITY_CONTAINED | SOLLYA_FP_FLAG_PROVEN_EXACT),
    SOLLYA_FP_FAILURE = SOLLYA_FP_FLAG_FAILURE,
    SOLLYA_FP_CUTOFF_IS_NAN = SOLLYA_FP_FLAG_CUTOFF_IS_NAN,
    SOLLYA_FP_EXPRESSION_NOT_CONSTANT = SOLLYA_FP_FLAG_EXPRESSION_NOT_CONSTANT
  };
  typedef enum sollya_fp_result_enum_t sollya_fp_result_t;

  /* Define an enumeration type for the mathematical base functions */
  enum sollya_base_function_enum_t {
    SOLLYA_BASE_FUNC_ABS,
    SOLLYA_BASE_FUNC_ACOS,
    SOLLYA_BASE_FUNC_ACOSH,
    SOLLYA_BASE_FUNC_ADD,
    SOLLYA_BASE_FUNC_ASIN,
    SOLLYA_BASE_FUNC_ASINH,
    SOLLYA_BASE_FUNC_ATAN,
    SOLLYA_BASE_FUNC_ATANH,
    SOLLYA_BASE_FUNC_CEIL,
    SOLLYA_BASE_FUNC_CONSTANT,
    SOLLYA_BASE_FUNC_COS,
    SOLLYA_BASE_FUNC_COSH,
    SOLLYA_BASE_FUNC_DIV,
    SOLLYA_BASE_FUNC_DOUBLE,
    SOLLYA_BASE_FUNC_DOUBLEDOUBLE,
    SOLLYA_BASE_FUNC_DOUBLEEXTENDED,
    SOLLYA_BASE_FUNC_ERF,
    SOLLYA_BASE_FUNC_ERFC,
    SOLLYA_BASE_FUNC_EXP,
    SOLLYA_BASE_FUNC_EXP_M1,
    SOLLYA_BASE_FUNC_FLOOR,
    SOLLYA_BASE_FUNC_FREE_VARIABLE,
    SOLLYA_BASE_FUNC_HALFPRECISION,
    SOLLYA_BASE_FUNC_LIBRARYCONSTANT,
    SOLLYA_BASE_FUNC_LIBRARYFUNCTION,
    SOLLYA_BASE_FUNC_LOG,
    SOLLYA_BASE_FUNC_LOG_10,
    SOLLYA_BASE_FUNC_LOG_1P,
    SOLLYA_BASE_FUNC_LOG_2,
    SOLLYA_BASE_FUNC_MUL,
    SOLLYA_BASE_FUNC_NEARESTINT,
    SOLLYA_BASE_FUNC_NEG,
    SOLLYA_BASE_FUNC_PI,
    SOLLYA_BASE_FUNC_POW,
    SOLLYA_BASE_FUNC_PROCEDUREFUNCTION,
    SOLLYA_BASE_FUNC_QUAD,
    SOLLYA_BASE_FUNC_SIN,
    SOLLYA_BASE_FUNC_SINGLE,
    SOLLYA_BASE_FUNC_SINH,
    SOLLYA_BASE_FUNC_SQRT,
    SOLLYA_BASE_FUNC_SUB,
    SOLLYA_BASE_FUNC_TAN,
    SOLLYA_BASE_FUNC_TANH,
    SOLLYA_BASE_FUNC_TRIPLEDOUBLE
  };
  typedef enum sollya_base_function_enum_t sollya_base_function_t;

  /* Initialization and finalization functions */
  int sollya_lib_init();
  int sollya_lib_init_with_custom_memory_functions(void *(*custom_malloc)(size_t),
						   void *(*custom_calloc)(size_t, size_t),
						   void *(*custom_realloc)(void *, size_t),
						   void (*custom_free)(void *),
						   void *(*custom_realloc_with_size)(void *, size_t, size_t),
						   void (*custom_free_with_size)(void *, size_t));
  int sollya_lib_close();

  /* Functions to install and uninstall a call-back for the messages
     emitted by the Sollya core.
  */
  int sollya_lib_install_msg_callback(int (*) (sollya_msg_t, void *), void *);
  int sollya_lib_uninstall_msg_callback();
  void sollya_lib_get_msg_callback(int (**)(sollya_msg_t, void *), void **);

  /* A function to get a numerical message id out of the opaque
     sollya_msg_t object
  */
  int sollya_lib_get_msg_id(sollya_msg_t);

  /* A function to translate a message (as received by the message
     call-back function) to text.

     Attention: the function malloc's the returned character string, which
     must therefore be freed by the user.
  */
  char *sollya_lib_msg_to_text(sollya_msg_t);

  /* Functions to print anything, including Sollya objects */
  int sollya_lib_printf(const char *, ...);
  int sollya_lib_v_printf(const char *, va_list);
  int sollya_lib_fprintf(FILE *, const char *, ...);
  int sollya_lib_v_fprintf(FILE *, const char *, va_list);
  int sollya_lib_sprintf(char *, const char *, ...);
  int sollya_lib_v_sprintf(char *, const char *, va_list);
  int sollya_lib_snprintf(char *, size_t, const char *, ...);
  int sollya_lib_v_snprintf(char *, size_t, const char *, va_list);


  /* A function to clear Sollya_objects */
  void sollya_lib_clear_obj(sollya_obj_t);

  /* Some Sollya library functions allocate memory when returning
     arrays or character strings. This memory must be freed by the
     user. However, the freeing must not be done using the traditional
     system free() but the following Sollya free.

     The Sollya free function will call back the memory deallocation
     function that might have been registered with the Sollya library
     upon library initialization.
  */
  void sollya_lib_free(void *);

  /* The same way, the user might want to allocate memory through
     Sollya library's memory function call chain
  */
  void *sollya_lib_malloc(size_t);
  void *sollya_lib_calloc(size_t, size_t);
  void *sollya_lib_realloc(void *, size_t);

  /* A function to structurally compare two Sollya objects */
  int sollya_lib_cmp_objs_structurally(sollya_obj_t, sollya_obj_t);

  /* A function to copy Sollya objects */
  sollya_obj_t sollya_lib_copy_obj(sollya_obj_t);

  /* A function to name the free mathematical variable and one to get its name.

     - If the variable has already been named when the naming function
     is called, the variable gets renamed.

     - If the variable has not been named yet, "_x_" is returned as its name.
     This corresponds to the name displayed by other functions.

     - The pointer returned for the name *must* be freed by the user.

     - The pointer given to the naming function is not "used up" by
     the function.

  */
  void sollya_lib_name_free_variable(const char *);
  char *sollya_lib_get_free_variable_name();

  /* Functions corresponding to Sollya commands */
  void sollya_lib_plot(sollya_obj_t, sollya_obj_t, ...);
  void sollya_lib_v_plot(sollya_obj_t, sollya_obj_t, va_list);
  void sollya_lib_printdouble(sollya_obj_t);
  void sollya_lib_printsingle(sollya_obj_t);
  void sollya_lib_printexpansion(sollya_obj_t);
  void sollya_lib_bashexecute(sollya_obj_t);
  void sollya_lib_externalplot(sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, ...);
  void sollya_lib_v_externalplot(sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, va_list);
  void sollya_lib_asciiplot(sollya_obj_t, sollya_obj_t);
  void sollya_lib_printxml(sollya_obj_t);
  void sollya_lib_printxml_newfile(sollya_obj_t, sollya_obj_t);
  void sollya_lib_printxml_appendfile(sollya_obj_t, sollya_obj_t);
  void sollya_lib_worstcase(sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, ...);
  void sollya_lib_v_worstcase(sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, va_list);
  void sollya_lib_autoprint(sollya_obj_t, ...);
  void sollya_lib_v_autoprint(sollya_obj_t, va_list);
  void sollya_lib_suppressmessage(sollya_obj_t, ...);
  void sollya_lib_v_suppressmessage(sollya_obj_t, va_list);
  void sollya_lib_unsuppressmessage(sollya_obj_t, ...);
  void sollya_lib_v_unsuppressmessage(sollya_obj_t, va_list);
  void sollya_lib_implementconstant(sollya_obj_t, ...);
  void sollya_lib_v_implementconstant(sollya_obj_t, va_list);
  void sollya_lib_set_prec_and_print(sollya_obj_t);
  void sollya_lib_set_points_and_print(sollya_obj_t);
  void sollya_lib_set_diam_and_print(sollya_obj_t);
  void sollya_lib_set_display_and_print(sollya_obj_t);
  void sollya_lib_set_verbosity_and_print(sollya_obj_t);
  void sollya_lib_set_canonical_and_print(sollya_obj_t);
  void sollya_lib_set_autosimplify_and_print(sollya_obj_t);
  void sollya_lib_set_fullparentheses_and_print(sollya_obj_t);
  void sollya_lib_set_showmessagenumbers_and_print(sollya_obj_t);
  void sollya_lib_set_taylorrecursions_and_print(sollya_obj_t);
  void sollya_lib_set_timing_and_print(sollya_obj_t);
  void sollya_lib_set_midpointmode_and_print(sollya_obj_t);
  void sollya_lib_set_dieonerrormode_and_print(sollya_obj_t);
  void sollya_lib_set_rationalmode_and_print(sollya_obj_t);
  void sollya_lib_set_roundingwarnings_and_print(sollya_obj_t);
  void sollya_lib_set_hopitalrecursions_and_print(sollya_obj_t);
  void sollya_lib_set_prec(sollya_obj_t);
  void sollya_lib_set_points(sollya_obj_t);
  void sollya_lib_set_diam(sollya_obj_t);
  void sollya_lib_set_display(sollya_obj_t);
  void sollya_lib_set_verbosity(sollya_obj_t);
  void sollya_lib_set_canonical(sollya_obj_t);
  void sollya_lib_set_autosimplify(sollya_obj_t);
  void sollya_lib_set_fullparentheses(sollya_obj_t);
  void sollya_lib_set_showmessagenumbers(sollya_obj_t);
  void sollya_lib_set_taylorrecursions(sollya_obj_t);
  void sollya_lib_set_timing(sollya_obj_t);
  void sollya_lib_set_midpointmode(sollya_obj_t);
  void sollya_lib_set_dieonerrormode(sollya_obj_t);
  void sollya_lib_set_rationalmode(sollya_obj_t);
  void sollya_lib_set_roundingwarnings(sollya_obj_t);
  void sollya_lib_set_hopitalrecursions(sollya_obj_t);

  /* Functions corresponding to Sollya built-in procedures */
  sollya_obj_t sollya_lib_free_variable();
  sollya_obj_t sollya_lib_and(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_or(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_negate(sollya_obj_t);
  sollya_obj_t sollya_lib_cmp_equal(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_cmp_in(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_cmp_less(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_cmp_greater(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_cmp_less_equal(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_cmp_greater_equal(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_cmp_not_equal(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_add(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_sub(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_concat(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_append(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_prepend(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_apply(sollya_obj_t, sollya_obj_t, ...);
  sollya_obj_t sollya_lib_v_apply(sollya_obj_t, sollya_obj_t, va_list);
  sollya_obj_t sollya_lib_approx(sollya_obj_t);
  sollya_obj_t sollya_lib_mul(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_div(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_pow(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_neg(sollya_obj_t);
  sollya_obj_t sollya_lib_sup(sollya_obj_t);
  sollya_obj_t sollya_lib_mid(sollya_obj_t);
  sollya_obj_t sollya_lib_inf(sollya_obj_t);
  sollya_obj_t sollya_lib_diff(sollya_obj_t);
  sollya_obj_t sollya_lib_bashevaluate(sollya_obj_t, ...);
  sollya_obj_t sollya_lib_v_bashevaluate(sollya_obj_t, va_list);
  sollya_obj_t sollya_lib_getsuppressedmessages();
  sollya_obj_t sollya_lib_remez(sollya_obj_t, sollya_obj_t, sollya_obj_t, ...);
  sollya_obj_t sollya_lib_v_remez(sollya_obj_t, sollya_obj_t, sollya_obj_t, va_list);
  sollya_obj_t sollya_lib_min(sollya_obj_t, ...);
  sollya_obj_t sollya_lib_v_min(sollya_obj_t, va_list);
  sollya_obj_t sollya_lib_max(sollya_obj_t, ...);
  sollya_obj_t sollya_lib_v_max(sollya_obj_t, va_list);
  sollya_obj_t sollya_lib_fpminimax(sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, ...);
  sollya_obj_t sollya_lib_v_fpminimax(sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, va_list);
  sollya_obj_t sollya_lib_horner(sollya_obj_t);
  sollya_obj_t sollya_lib_canonical(sollya_obj_t);
  sollya_obj_t sollya_lib_expand(sollya_obj_t);
  sollya_obj_t sollya_lib_dirtysimplify(sollya_obj_t);
  sollya_obj_t sollya_lib_simplify(sollya_obj_t);
  sollya_obj_t sollya_lib_simplifysafe(sollya_obj_t);
  sollya_obj_t sollya_lib_taylor(sollya_obj_t, sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_taylorform(sollya_obj_t, sollya_obj_t, sollya_obj_t, ...);
  sollya_obj_t sollya_lib_v_taylorform(sollya_obj_t, sollya_obj_t, sollya_obj_t, va_list);
  sollya_obj_t sollya_lib_chebyshevform(sollya_obj_t, sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_autodiff(sollya_obj_t, sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_degree(sollya_obj_t);
  sollya_obj_t sollya_lib_numerator(sollya_obj_t);
  sollya_obj_t sollya_lib_denominator(sollya_obj_t);
  sollya_obj_t sollya_lib_substitute(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_composepolynomials(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_coeff(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_subpoly(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_roundcoefficients(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_rationalapprox(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_round(sollya_obj_t, sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_evaluate(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_parse(sollya_obj_t);
  sollya_obj_t sollya_lib_readxml(sollya_obj_t);
  sollya_obj_t sollya_lib_infnorm(sollya_obj_t, sollya_obj_t, ...);
  sollya_obj_t sollya_lib_v_infnorm(sollya_obj_t, sollya_obj_t, va_list);
  sollya_obj_t sollya_lib_supnorm(sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_findzeros(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_dirtyinfnorm(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_numberroots(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_integral(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_dirtyintegral(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_implementpoly(sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, ...);
  sollya_obj_t sollya_lib_v_implementpoly(sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, va_list);
  sollya_obj_t sollya_lib_checkinfnorm(sollya_obj_t, sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_zerodenominators(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_searchgal(sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_guessdegree(sollya_obj_t, sollya_obj_t, sollya_obj_t, ...);
  sollya_obj_t sollya_lib_v_guessdegree(sollya_obj_t, sollya_obj_t, sollya_obj_t, va_list);
  sollya_obj_t sollya_lib_dirtyfindzeros(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_head(sollya_obj_t);
  sollya_obj_t sollya_lib_roundcorrectly(sollya_obj_t);
  sollya_obj_t sollya_lib_revert(sollya_obj_t);
  sollya_obj_t sollya_lib_sort(sollya_obj_t);
  sollya_obj_t sollya_lib_mantissa(sollya_obj_t);
  sollya_obj_t sollya_lib_exponent(sollya_obj_t);
  sollya_obj_t sollya_lib_precision(sollya_obj_t);
  sollya_obj_t sollya_lib_tail(sollya_obj_t);
  sollya_obj_t sollya_lib_range(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_sqrt(sollya_obj_t);
  sollya_obj_t sollya_lib_exp(sollya_obj_t);
  sollya_obj_t sollya_lib_log(sollya_obj_t);
  sollya_obj_t sollya_lib_log2(sollya_obj_t);
  sollya_obj_t sollya_lib_log10(sollya_obj_t);
  sollya_obj_t sollya_lib_sin(sollya_obj_t);
  sollya_obj_t sollya_lib_cos(sollya_obj_t);
  sollya_obj_t sollya_lib_tan(sollya_obj_t);
  sollya_obj_t sollya_lib_asin(sollya_obj_t);
  sollya_obj_t sollya_lib_acos(sollya_obj_t);
  sollya_obj_t sollya_lib_atan(sollya_obj_t);
  sollya_obj_t sollya_lib_sinh(sollya_obj_t);
  sollya_obj_t sollya_lib_cosh(sollya_obj_t);
  sollya_obj_t sollya_lib_tanh(sollya_obj_t);
  sollya_obj_t sollya_lib_asinh(sollya_obj_t);
  sollya_obj_t sollya_lib_acosh(sollya_obj_t);
  sollya_obj_t sollya_lib_atanh(sollya_obj_t);
  sollya_obj_t sollya_lib_abs(sollya_obj_t);
  sollya_obj_t sollya_lib_erf(sollya_obj_t);
  sollya_obj_t sollya_lib_erfc(sollya_obj_t);
  sollya_obj_t sollya_lib_log1p(sollya_obj_t);
  sollya_obj_t sollya_lib_expm1(sollya_obj_t);
  sollya_obj_t sollya_lib_double(sollya_obj_t);
  sollya_obj_t sollya_lib_single(sollya_obj_t);
  sollya_obj_t sollya_lib_quad(sollya_obj_t);
  sollya_obj_t sollya_lib_halfprecision(sollya_obj_t);
  sollya_obj_t sollya_lib_double_double(sollya_obj_t);
  sollya_obj_t sollya_lib_triple_double(sollya_obj_t);
  sollya_obj_t sollya_lib_doubleextended(sollya_obj_t);
  sollya_obj_t sollya_lib_ceil(sollya_obj_t);
  sollya_obj_t sollya_lib_floor(sollya_obj_t);
  sollya_obj_t sollya_lib_nearestint(sollya_obj_t);
  sollya_obj_t sollya_lib_length(sollya_obj_t);
  sollya_obj_t sollya_lib_get_prec();
  sollya_obj_t sollya_lib_get_points();
  sollya_obj_t sollya_lib_get_diam();
  sollya_obj_t sollya_lib_get_display();
  sollya_obj_t sollya_lib_get_verbosity();
  sollya_obj_t sollya_lib_get_canonical();
  sollya_obj_t sollya_lib_get_autosimplify();
  sollya_obj_t sollya_lib_get_fullparentheses();
  sollya_obj_t sollya_lib_get_showmessagenumbers();
  sollya_obj_t sollya_lib_get_taylorrecursions();
  sollya_obj_t sollya_lib_get_timing();
  sollya_obj_t sollya_lib_get_midpointmode();
  sollya_obj_t sollya_lib_get_dieonerrormode();
  sollya_obj_t sollya_lib_get_rationalmode();
  sollya_obj_t sollya_lib_get_roundingwarnings();
  sollya_obj_t sollya_lib_get_hopitalrecursions();

  /* Functions creating Sollya objects */
  sollya_obj_t sollya_lib_on();
  sollya_obj_t sollya_lib_off();
  sollya_obj_t sollya_lib_dyadic();
  sollya_obj_t sollya_lib_powers();
  sollya_obj_t sollya_lib_binary();
  sollya_obj_t sollya_lib_hexadecimal();
  sollya_obj_t sollya_lib_file();
  sollya_obj_t sollya_lib_postscript();
  sollya_obj_t sollya_lib_postscriptfile();
  sollya_obj_t sollya_lib_perturb();
  sollya_obj_t sollya_lib_round_down();
  sollya_obj_t sollya_lib_round_up();
  sollya_obj_t sollya_lib_round_towards_zero();
  sollya_obj_t sollya_lib_round_to_nearest();
  sollya_obj_t sollya_lib_honorcoeffprec();
  sollya_obj_t sollya_lib_true();
  sollya_obj_t sollya_lib_false();
  sollya_obj_t sollya_lib_void();
  sollya_obj_t sollya_lib_default();
  sollya_obj_t sollya_lib_decimal();
  sollya_obj_t sollya_lib_absolute();
  sollya_obj_t sollya_lib_relative();
  sollya_obj_t sollya_lib_fixed();
  sollya_obj_t sollya_lib_floating();
  sollya_obj_t sollya_lib_error();
  sollya_obj_t sollya_lib_double_obj();
  sollya_obj_t sollya_lib_single_obj();
  sollya_obj_t sollya_lib_quad_obj();
  sollya_obj_t sollya_lib_halfprecision_obj();
  sollya_obj_t sollya_lib_doubleextended_obj();
  sollya_obj_t sollya_lib_double_double_obj();
  sollya_obj_t sollya_lib_triple_double_obj();
  sollya_obj_t sollya_lib_pi();
  sollya_obj_t sollya_lib_libraryconstant(char *, void (*)(mpfr_t, mp_prec_t));
  sollya_obj_t sollya_lib_libraryfunction(sollya_obj_t, char *, int (*)(mpfi_t, mpfi_t, int));
  sollya_obj_t sollya_lib_procedurefunction(sollya_obj_t, sollya_obj_t);

  /* A function to parse expressions and evaluate them */
  sollya_obj_t sollya_lib_parse_string(const char *);

  /* Functions to convert from constants to Sollya objects */
  /* There is no specific constructor for NaN and +/-Inf: they
     can be created through a call to sollya_lib_constant_from_double
  */
  sollya_obj_t sollya_lib_string(char *);
  sollya_obj_t sollya_lib_range_from_interval(mpfi_t);
  sollya_obj_t sollya_lib_range_from_bounds(mpfr_t, mpfr_t);
  sollya_obj_t sollya_lib_constant(mpfr_t);
  sollya_obj_t sollya_lib_constant_from_double(double);
  sollya_obj_t sollya_lib_constant_from_int(int);
  sollya_obj_t sollya_lib_constant_from_int64(int64_t);
  sollya_obj_t sollya_lib_constant_from_uint64(uint64_t);
  sollya_obj_t sollya_lib_constant_from_mpz(mpz_t);
  sollya_obj_t sollya_lib_constant_from_mpq(mpq_t);

  /* Functions to get values contained in Sollya objects */
  int sollya_lib_get_interval_from_range(mpfi_t, sollya_obj_t);
  int sollya_lib_get_bounds_from_range(mpfr_t, mpfr_t, sollya_obj_t);
  int sollya_lib_get_string(char **, sollya_obj_t);
  int sollya_lib_get_constant_as_double(double *, sollya_obj_t);
  int sollya_lib_get_constant_as_int(int *, sollya_obj_t);
  int sollya_lib_get_constant_as_int64(int64_t *, sollya_obj_t);
  int sollya_lib_get_constant_as_uint64(uint64_t *, sollya_obj_t);
  int sollya_lib_get_constant(mpfr_t, sollya_obj_t);
  int sollya_lib_get_prec_of_constant(mp_prec_t *, sollya_obj_t);
  int sollya_lib_get_prec_of_range(mp_prec_t *, sollya_obj_t);
  int sollya_lib_get_constant_as_mpz(mpz_t, sollya_obj_t);
  int sollya_lib_get_constant_as_mpq(mpq_t, sollya_obj_t);

  /* Functions to build up Sollya lists from arrays of objects and
     to get arrays of Sollya objects out of Sollya lists
  */
  /* Please notice that the list is created from copies of the elements
     given in the argument array. There exist sollya_lib_build_*list to
     create a list with references to the elements of the argument array
  */
  /* The empty list is created with sollya_lib_list(NULL, 0)
     The end-elliptic list has no meaning.
     Hence sollya_lib_end_elliptic_list(NULL, 0) leads to an error */
  sollya_obj_t sollya_lib_list(sollya_obj_t[], int);
  sollya_obj_t sollya_lib_end_elliptic_list(sollya_obj_t[], int);
  int sollya_lib_get_list_elements(sollya_obj_t **, int *, int *, sollya_obj_t);
  int sollya_lib_get_element_in_list(sollya_obj_t *, sollya_obj_t, int);

  /* Functions to check if a Sollya object represents a mathematical
     function, a list, an end-elliptic list, a range, a string, a
     structure or error.
  */
  /* Constants and 0-ary functions as pi are considered as functions
     The empty list is considered both as a regular and
     an end-elliptic list.
  */
  int sollya_lib_obj_is_function(sollya_obj_t);
  int sollya_lib_obj_is_list(sollya_obj_t);
  int sollya_lib_obj_is_end_elliptic_list(sollya_obj_t);
  int sollya_lib_obj_is_range(sollya_obj_t);
  int sollya_lib_obj_is_string(sollya_obj_t);
  int sollya_lib_obj_is_error(sollya_obj_t);
  int sollya_lib_obj_is_structure(sollya_obj_t);

  /* Functions to decompose Sollya objects that represent mathematical
     functions.

     All these functions return a zero value if the Sollya object they
     are given is something else but a mathematical function and a
     non-zero value otherwise (i.e. if it is a function with an arity).
  */
  int sollya_lib_get_function_arity(int *, sollya_obj_t);
  int sollya_lib_get_head_function(sollya_base_function_t *, sollya_obj_t);

  /* The first object is the function to get the subfunctions from.

     The second object is a pointer to an integer to store the number
     of subfunctions stored.

     The variadic objects are pointers to Sollya objects in which the
     subfunctions will be stored (if they exist).  If less pointers
     are given than the function has subfunctions (i.e.  less than the
     function's arity), the last pointer must be NULL.
  */
  int sollya_lib_get_subfunctions(sollya_obj_t, int *, ...);
  int sollya_lib_v_get_subfunctions(sollya_obj_t, int *, va_list);

  /* A one-does-it-all function */
  int sollya_lib_decompose_function(sollya_obj_t, sollya_base_function_t *, int *, ...);
  int sollya_lib_v_decompose_function(sollya_obj_t, sollya_base_function_t *, int *, va_list);

  /* Some particular functions to decompose library function objects,
     library constant objects and procedure function objects
  */
  int sollya_lib_decompose_libraryfunction(int (**)(mpfi_t, mpfi_t, int), int *, sollya_obj_t *, sollya_obj_t);
  int sollya_lib_decompose_libraryconstant(void (**)(mpfr_t, mp_prec_t), sollya_obj_t);
  int sollya_lib_decompose_procedurefunction(sollya_obj_t *, int *, sollya_obj_t *, sollya_obj_t);

  /* Functions that work on Sollya objects that are structures

     The int return value indicates success (zero -> failure, non-zero -> success).

     Attention:

     Upon success, memory is allocated by the functions for the
     returned objects.

     This includes sollya_lib_create_structure which "returns" a
     new Sollya object representing a structure that contains all
     elements contained in the structure given in parameter plus, if
     applicable, a new element "identifier -> object". In the case
     when the identifier was already present in the given structure, a
     new (copied) structure is "returned" in which the existing
     correspondence "identifier -> ..." is replaced by the new one.

     In order to create a structure "from scratch", give NULL as an
     existing Sollya structure object to sollya_lib_create_structure.

  */
  int sollya_lib_get_structure_elements(char ***, sollya_obj_t **, int *, sollya_obj_t);
  int sollya_lib_get_element_in_structure(sollya_obj_t *, char *, sollya_obj_t);
  int sollya_lib_create_structure(sollya_obj_t *, sollya_obj_t, char *, sollya_obj_t);

  /* Functions that check if a Sollya object is some particular constant */
  int sollya_lib_is_on(sollya_obj_t);
  int sollya_lib_is_off(sollya_obj_t);
  int sollya_lib_is_dyadic(sollya_obj_t);
  int sollya_lib_is_powers(sollya_obj_t);
  int sollya_lib_is_binary(sollya_obj_t);
  int sollya_lib_is_hexadecimal(sollya_obj_t);
  int sollya_lib_is_file(sollya_obj_t);
  int sollya_lib_is_postscript(sollya_obj_t);
  int sollya_lib_is_postscriptfile(sollya_obj_t);
  int sollya_lib_is_perturb(sollya_obj_t);
  int sollya_lib_is_round_down(sollya_obj_t);
  int sollya_lib_is_round_up(sollya_obj_t);
  int sollya_lib_is_round_towards_zero(sollya_obj_t);
  int sollya_lib_is_round_to_nearest(sollya_obj_t);
  int sollya_lib_is_honorcoeffprec(sollya_obj_t);
  int sollya_lib_is_true(sollya_obj_t);
  int sollya_lib_is_false(sollya_obj_t);
  int sollya_lib_is_void(sollya_obj_t);
  int sollya_lib_is_default(sollya_obj_t);
  int sollya_lib_is_decimal(sollya_obj_t);
  int sollya_lib_is_absolute(sollya_obj_t);
  int sollya_lib_is_relative(sollya_obj_t);
  int sollya_lib_is_fixed(sollya_obj_t);
  int sollya_lib_is_floating(sollya_obj_t);
  int sollya_lib_is_double_obj(sollya_obj_t);
  int sollya_lib_is_single_obj(sollya_obj_t);
  int sollya_lib_is_quad_obj(sollya_obj_t);
  int sollya_lib_is_halfprecision_obj(sollya_obj_t);
  int sollya_lib_is_doubleextended_obj(sollya_obj_t);
  int sollya_lib_is_double_double_obj(sollya_obj_t);
  int sollya_lib_is_triple_double_obj(sollya_obj_t);
  int sollya_lib_is_pi(sollya_obj_t);

  /* Functions to evaluate Sollya objects that are mathematical
     functions at points, over intervals or at points given by constant expressions
  */
  sollya_fp_result_t sollya_lib_evaluate_function_at_point(mpfr_t, sollya_obj_t, mpfr_t, mpfr_t *);
  sollya_fp_result_t sollya_lib_evaluate_function_at_constant_expression(mpfr_t, sollya_obj_t, sollya_obj_t, mpfr_t *);
  int sollya_lib_evaluate_function_over_interval(mpfi_t, sollya_obj_t, mpfi_t);

  /* Functions to manipulate lists

     These functions are not necessarily needed when using the Sollya library in
     free-standing applications. They are needed when the Sollya library is used
     in external procedures that are to be dynamically loaded into interactive
     Sollya sessions.

     Attention: these functions
     - take and return NULL as a placeholder for empty lists
     - only return references for Sollya objects, constants, intervals and strings (for the head functions)
     - only return references for the tail lists (for the tail functions)
     - "eat up" the references given when constructing lists from elements (construct functions)
     - return NULL (resp. 0 for integers and booleans) if the head of an empty list is queried
     - return an empty list for empty tails, in particular tails of empty lists.

     The copy functions structurally (deeply) copy both the lists and all elements.

     The clear functions clear both the lists and the elements.
  */
  sollya_obj_t sollya_lib_get_object_list_head(sollya_obj_list_t);
  sollya_obj_list_t sollya_lib_get_object_list_tail(sollya_obj_list_t);
  sollya_obj_list_t sollya_lib_construct_object_list(sollya_obj_t, sollya_obj_list_t);
  sollya_obj_list_t sollya_lib_copy_object_list(sollya_obj_list_t);
  void sollya_lib_clear_object_list(sollya_obj_list_t);
  int sollya_lib_is_empty_object_list(sollya_obj_list_t);

  mpfr_t *sollya_lib_get_constant_list_head(sollya_constant_list_t);
  sollya_constant_list_t sollya_lib_get_constant_list_tail(sollya_constant_list_t);
  sollya_constant_list_t sollya_lib_construct_constant_list(mpfr_t *, sollya_constant_list_t);
  sollya_constant_list_t sollya_lib_copy_constant_list(sollya_constant_list_t);
  void sollya_lib_clear_constant_list(sollya_constant_list_t);
  int sollya_lib_is_empty_constant_list(sollya_obj_list_t);

  mpfi_t *sollya_lib_get_interval_list_head(sollya_interval_list_t);
  sollya_interval_list_t sollya_lib_get_interval_list_tail(sollya_interval_list_t);
  sollya_interval_list_t sollya_lib_construct_interval_list(mpfi_t *, sollya_interval_list_t);
  sollya_interval_list_t sollya_lib_copy_interval_list(sollya_interval_list_t);
  void sollya_lib_clear_interval_list(sollya_interval_list_t);
  int sollya_lib_is_empty_interval_list(sollya_obj_list_t);

  int sollya_lib_get_int_list_head(sollya_int_list_t);
  sollya_int_list_t sollya_lib_get_int_list_tail(sollya_int_list_t);
  sollya_int_list_t sollya_lib_construct_int_list(int, sollya_int_list_t);
  sollya_int_list_t sollya_lib_copy_int_list(sollya_int_list_t);
  void sollya_lib_clear_int_list(sollya_int_list_t);
  int sollya_lib_is_empty_int_list(sollya_obj_list_t);

  int sollya_lib_get_boolean_list_head(sollya_boolean_list_t);
  sollya_boolean_list_t sollya_lib_get_boolean_list_tail(sollya_boolean_list_t);
  sollya_boolean_list_t sollya_lib_construct_boolean_list(int, sollya_boolean_list_t);
  sollya_boolean_list_t sollya_lib_copy_boolean_list(sollya_boolean_list_t);
  void sollya_lib_clear_boolean_list(sollya_boolean_list_t);
  int sollya_lib_is_empty_boolean_list(sollya_obj_list_t);

  char *sollya_lib_get_string_list_head(sollya_string_list_t);
  sollya_string_list_t sollya_lib_get_string_list_tail(sollya_string_list_t);
  sollya_string_list_t sollya_lib_construct_string_list(char *, sollya_string_list_t);
  sollya_string_list_t sollya_lib_copy_string_list(sollya_string_list_t);
  void sollya_lib_clear_string_list(sollya_string_list_t);
  int sollya_lib_is_empty_string_list(sollya_obj_list_t);

  /* Functions for building Sollya objects representing
     mathematical functions or Sollya objects representing lists.

     Attention: in contrast to all other functions in
     the Sollya library, these functions "use up" the
     objects they take as an argument.

  */

  sollya_obj_t sollya_lib_build_list(sollya_obj_t, ...);
  sollya_obj_t sollya_lib_build_end_elliptic_list(sollya_obj_t, ...);
  sollya_obj_t sollya_lib_v_build_list(va_list);
  sollya_obj_t sollya_lib_v_build_end_elliptic_list(va_list);

  sollya_obj_t sollya_lib_build_function_free_variable();
  sollya_obj_t sollya_lib_build_function_add(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_sub(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_mul(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_div(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_sqrt(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_exp(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_log(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_log2(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_log10(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_sin(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_cos(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_tan(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_asin(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_acos(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_atan(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_pow(sollya_obj_t, sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_neg(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_abs(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_double(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_single(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_quad(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_halfprecision(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_double_double(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_triple_double(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_erf(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_erfc(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_log1p(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_expm1(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_doubleextended(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_ceil(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_floor(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_nearestint(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_sinh(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_cosh(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_tanh(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_asinh(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_acosh(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_atanh(sollya_obj_t);
  sollya_obj_t sollya_lib_build_function_pi();
  sollya_obj_t sollya_lib_build_function_libraryconstant(char *, void (*)(mpfr_t, mp_prec_t));
  sollya_obj_t sollya_lib_build_function_libraryfunction(sollya_obj_t, char *, int (*)(mpfi_t, mpfi_t, int));
  sollya_obj_t sollya_lib_build_function_procedurefunction(sollya_obj_t, sollya_obj_t);

  /* Macros provided as shortcuts to functions sollya_lib_build_function_* */
#define SOLLYA_X_ sollya_lib_build_function_free_variable()
#define SOLLYA_ADD(x,y) sollya_lib_build_function_add((x), (y))
#define SOLLYA_SUB(x,y) sollya_lib_build_function_sub((x), (y))
#define SOLLYA_MUL(x,y) sollya_lib_build_function_mul((x), (y))
#define SOLLYA_DIV(x,y) sollya_lib_build_function_div((x), (y))
#define SOLLYA_SQRT(x) sollya_lib_build_function_sqrt(x)
#define SOLLYA_EXP(x) sollya_lib_build_function_exp(x)
#define SOLLYA_LOG(x) sollya_lib_build_function_log(x)
#define SOLLYA_LOG2(x) sollya_lib_build_function_log2(x)
#define SOLLYA_LOG10(x) sollya_lib_build_function_log10(x)
#define SOLLYA_SIN(x) sollya_lib_build_function_sin(x)
#define SOLLYA_COS(x) sollya_lib_build_function_cos(x)
#define SOLLYA_TAN(x) sollya_lib_build_function_tan(x)
#define SOLLYA_ASIN(x) sollya_lib_build_function_asin(x)
#define SOLLYA_ACOS(x) sollya_lib_build_function_acos(x)
#define SOLLYA_ATAN(x) sollya_lib_build_function_atan(x)
#define SOLLYA_POW(x,y) sollya_lib_build_function_pow((x), (y))
#define SOLLYA_NEG(x) sollya_lib_build_function_neg(x)
#define SOLLYA_ABS(x) sollya_lib_build_function_abs(x)
#define SOLLYA_D(x) sollya_lib_build_function_double(x)
#define SOLLYA_SG(x) sollya_lib_build_function_single(x)
#define SOLLYA_QD(x) sollya_lib_build_function_quad(x)
#define SOLLYA_HP(x) sollya_lib_build_function_halfprecision(x)
#define SOLLYA_DD(x) sollya_lib_build_function_double_double(x)
#define SOLLYA_TD(x) sollya_lib_build_function_triple_double(x)
#define SOLLYA_ERF(x) sollya_lib_build_function_erf(x)
#define SOLLYA_ERFC(x) sollya_lib_build_function_erfc(x)
#define SOLLYA_LOG1P(x) sollya_lib_build_function_log1p(x)
#define SOLLYA_EXPM1(x) sollya_lib_build_function_expm1(x)
#define SOLLYA_DE(x) sollya_lib_build_function_doubleextended(x)
#define SOLLYA_CEIL(x) sollya_lib_build_function_ceil(x)
#define SOLLYA_FLOOR(x) sollya_lib_build_function_floor(x)
#define SOLLYA_NEARESTINT(x) sollya_lib_build_function_nearestint(x)
#define SOLLYA_SINH(x) sollya_lib_build_function_sinh(x)
#define SOLLYA_COSH(x) sollya_lib_build_function_cosh(x)
#define SOLLYA_TANH(x) sollya_lib_build_function_tanh(x)
#define SOLLYA_ASINH(x) sollya_lib_build_function_asinh(x)
#define SOLLYA_ACOSH(x) sollya_lib_build_function_acosh(x)
#define SOLLYA_ATANH(x) sollya_lib_build_function_atanh(x)
#define SOLLYA_PI (sollya_lib_build_function_pi())
#define SOLLYA_CONST(x) sollya_lib_constant_from_double(x)
#define SOLLYA_CONST_UI64(x) sollya_lib_constant_from_uint64(x)
#define SOLLYA_CONST_SI64(x) sollya_lib_constant_from_int64(x)

#ifdef __cplusplus
}
#endif

#endif
