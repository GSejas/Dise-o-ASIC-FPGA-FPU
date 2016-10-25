/*

  Copyright 2006-2013 by

  Laboratoire de l'Informatique du Parallelisme,
  UMR CNRS - ENS Lyon - UCB Lyon 1 - INRIA 5668

  and by

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

#include <mpfr.h>
#include <gmp.h>
#include "implement.h"
#include <stdio.h> /* fprinft, fopen, fclose, */
#include <stdlib.h> /* exit, free, mktemp */
#include <string.h>
#include <errno.h>
#include "general.h"
#include "expression.h"
#include "double.h"
#include "infnorm.h"
#include "proof.h"
#include "printf.h"

#define MIN(a,b) (a > b ? b : a)

void emitLegalNoticeAndDisclaimer(FILE *fd) {
  fprintf(fd, "/*\n"); 
  fprintf(fd, "    This code was generated using non-trivial code generation commands of\n"); 
  fprintf(fd, "    the Sollya software program.\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    Before using, modifying and/or integrating this code into other\n"); 
  fprintf(fd, "    software, review the copyright and license status of this generated\n"); 
  fprintf(fd, "    code. In particular, see the exception below.\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    Sollya is\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    Copyright 2006-2013 by\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    Laboratoire de l'Informatique du Parallelisme, UMR CNRS - ENS Lyon -\n"); 
  fprintf(fd, "    UCB Lyon 1 - INRIA 5668,\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    Laboratoire d'Informatique de Paris 6, equipe PEQUAN, UPMC Universite\n"); 
  fprintf(fd, "    Paris 06 - CNRS - UMR 7606 - LIP6, Paris, France\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    and by\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    Centre de recherche INRIA Sophia-Antipolis Mediterranee, equipe APICS,\n"); 
  fprintf(fd, "    Sophia Antipolis, France.\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    Contributors Ch. Lauter, S. Chevillard, M. Joldes\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    christoph.lauter@ens-lyon.org\n"); 
  fprintf(fd, "    sylvain.chevillard@ens-lyon.org\n"); 
  fprintf(fd, "    joldes@lass.fr\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    The Sollya software is a computer program whose purpose is to provide\n"); 
  fprintf(fd, "    an environment for safe floating-point code development. It is\n"); 
  fprintf(fd, "    particularily targeted to the automatized implementation of\n"); 
  fprintf(fd, "    mathematical floating-point libraries (libm). Amongst other features,\n"); 
  fprintf(fd, "    it offers a certified infinity norm, an automatic polynomial\n"); 
  fprintf(fd, "    implementer and a fast Remez algorithm.\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    The Sollya software is governed by the CeCILL-C license under French\n"); 
  fprintf(fd, "    law and abiding by the rules of distribution of free software.  You\n"); 
  fprintf(fd, "    can use, modify and/ or redistribute the software under the terms of\n"); 
  fprintf(fd, "    the CeCILL-C license as circulated by CEA, CNRS and INRIA at the\n"); 
  fprintf(fd, "    following URL \"http://www.cecill.info\".\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    As a counterpart to the access to the source code and rights to copy,\n"); 
  fprintf(fd, "    modify and redistribute granted by the license, users are provided\n"); 
  fprintf(fd, "    only with a limited warranty and the software's author, the holder of\n"); 
  fprintf(fd, "    the economic rights, and the successive licensors have only limited\n"); 
  fprintf(fd, "    liability.\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    In this respect, the user's attention is drawn to the risks associated\n"); 
  fprintf(fd, "    with loading, using, modifying and/or developing or reproducing the\n"); 
  fprintf(fd, "    software by the user in light of its specific status of free software,\n"); 
  fprintf(fd, "    that may mean that it is complicated to manipulate, and that also\n"); 
  fprintf(fd, "    therefore means that it is reserved for developers and experienced\n"); 
  fprintf(fd, "    professionals having in-depth computer knowledge. Users are therefore\n"); 
  fprintf(fd, "    encouraged to load and test the software's suitability as regards\n"); 
  fprintf(fd, "    their requirements in conditions enabling the security of their\n"); 
  fprintf(fd, "    systems and/or data to be ensured and, more generally, to use and\n"); 
  fprintf(fd, "    operate it in the same conditions as regards security.\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    The fact that you are presently reading this means that you have had\n"); 
  fprintf(fd, "    knowledge of the CeCILL-C license and that you accept its terms.\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    The Sollya program is distributed WITHOUT ANY WARRANTY; without even\n"); 
  fprintf(fd, "    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR\n"); 
  fprintf(fd, "    PURPOSE.\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    This generated program is distributed WITHOUT ANY WARRANTY; without\n"); 
  fprintf(fd, "    even the implied warranty of MERCHANTABILITY or FITNESS FOR A\n"); 
  fprintf(fd, "    PARTICULAR PURPOSE.\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    As a special exception, you may create a larger work that contains\n"); 
  fprintf(fd, "    part or all of this software generated using Sollya and distribute\n"); 
  fprintf(fd, "    that work under terms of your choice, so long as that work isn't\n"); 
  fprintf(fd, "    itself a numerical code generator using the skeleton of this code or a\n"); 
  fprintf(fd, "    modified version thereof as a code skeleton.  Alternatively, if you\n"); 
  fprintf(fd, "    modify or redistribute this generated code itself, or its skeleton,\n"); 
  fprintf(fd, "    you may (at your option) remove this special exception, which will\n"); 
  fprintf(fd, "    cause this generated code and its skeleton and the resulting Sollya\n"); 
  fprintf(fd, "    output files to be licensed under the CeCILL-C licence without this\n"); 
  fprintf(fd, "    special exception.\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "    This special exception was added by the Sollya copyright holders in\n"); 
  fprintf(fd, "    version 4.1 of Sollya.\n"); 
  fprintf(fd, "    \n"); 
  fprintf(fd, "*/\n"); 
  fprintf(fd, "\n"); 
  fprintf(fd, "\n"); 
}

int determinePowers(mpfr_t *coefficients, int degree, int *mulPrec, int *powPrec) {
  int i,k;

  for (i=0;i<degree;i++) powPrec[i] = -1;

  i=0; k=0;

  while (i<=degree) {
    while ((i<=degree) && (mpfr_zero_p(coefficients[i]))) {
      i++;
      k++;
    }

    if (k>=1) {
      if (mulPrec[i-1] > powPrec[k-1]) powPrec[k-1] = mulPrec[i-1];
    }
    k=1;
    i++;
  }

  return 1;
}


int determinePrecisionsHelper(mpfr_t *coefficients, int degree,
                              int *addPrec, int *mulPrec,
                              mpfr_t accuracy, rangetype range,
                              mp_prec_t prec) {

  mpfr_t temp, temp2;
  int precOfAccur, res;
  node *q, *tempNode, *tempNode2, *qCopy;

  qCopy = NULL;

  mpfr_init2(temp,prec);
  mpfr_log2(temp,accuracy,GMP_RNDN);
  precOfAccur = -mpfr_get_si(temp,GMP_RNDD);

  if (degree == 0) {
    /* In this case, the polynomial is a constant.
       No addition and no multiplication must be done.
       addPrec, mulPrec will be -1
    */
    addPrec[0] = -1;
    mulPrec[0] = -1;
    mpfr_clear(temp);
    return 1;
  }

  /* In this case, we check if the constant coefficient is zero.
     If this is the case, no addition must be made, so addPrec will be -1.
     The multiplication must be performed with the precision demanded by the
     target accuracy. Thus, mulPrec will be precOfAccur.
     We continue then filling in the values for the higher degrees with the
     same accuracy.
  */

  if (mpfr_zero_p(coefficients[0])) {
    addPrec[0] = -1;
    mulPrec[0] = precOfAccur;
    res = determinePrecisionsHelper(coefficients+1, degree-1, addPrec+1, mulPrec+1,
			            accuracy, range, prec);
    mpfr_clear(temp);
    return res;
  }

  /* If we are here, we have a non-zero constant coefficient
     and thus an addition to do.

     Notate      p(x) = c + x * q(x)

     We compute alpha = || x * q(x) / c ||^\infty in the given range.

     The addition must be made with the precision demanded by the
     target accuracy.

     If alpha is less than 1/2, the addition can be performed
     without any cancellation.
     We check this condition. If it cannot be fulfilled, we
     do not know how to implement the polynomial automatically.


     The multiplication and the following steps can then be
     performed with an accuracy of accuracy / alpha.
  */

  addPrec[0] = precOfAccur;

  q = makePolynomial(coefficients+1,degree-1);

  if (verbosity >= 3) {
    qCopy = copyTree(q);
  }

  tempNode = (node *) safeMalloc(sizeof(node));
  tempNode->nodeType = VARIABLE;
  tempNode2 = (node *) safeMalloc(sizeof(node));
  tempNode2->nodeType = MUL;
  tempNode2->child1 = tempNode;
  tempNode2->child2 = q;
  tempNode = (node *) safeMalloc(sizeof(node));
  tempNode->nodeType = DIV;
  tempNode->child1 = tempNode2;
  tempNode2 = (node *) safeMalloc(sizeof(node));
  tempNode2->nodeType = CONSTANT;
  tempNode2->value = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
  mpfr_init2(*(tempNode2->value),mpfr_get_prec(coefficients[0]));
  mpfr_set(*(tempNode2->value),coefficients[0],GMP_RNDN);
  tempNode->child2 = tempNode2;

  tempNode2 = horner(tempNode);
  free_memory(tempNode);
  tempNode = tempNode2;

  uncertifiedInfnorm(temp, tempNode, *(range.a), *(range.b), defaultpoints, prec);

  free_memory(tempNode);
  mpfr_init2(temp2,prec);

  mpfr_set_d(temp2,0.5,GMP_RNDN);
  if (mpfr_cmp(temp,temp2) >= 0) {
    printMessage(1,SOLLYA_MSG_COEFF_NOT_TWICE_GREATER_THAN_SUBPOLY,"Warning: a coefficient is not at least 2 times greater than a already evaluated sub-polynomial.\n");
    printMessage(1,SOLLYA_MSG_CONTINUATION,"This procedure is not able to implement the polynomial correctly in this case.\n");
    printMessage(3,SOLLYA_MSG_CONTINUATION,"Information: the subpolynomial q(%s) that has already been handled is\n%b\nThe current coefficient is c = \n%v\n|| %s * q(%s) / c || is approximately %v\n",
		 ((variablename == NULL) ? "_x_" : variablename),qCopy,coefficients[0],((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),temp);
    mpfr_set_d(temp,1.0,GMP_RNDN);
    res = 0;
  } else {
    res = 1;
  }

  if (verbosity >= 3) free_memory(qCopy);

  mpfr_div(temp2,accuracy,temp,GMP_RNDN);
  mpfr_set_d(temp,0.5,GMP_RNDN);
  if (mpfr_cmp(temp2,temp) >= 0) {
    mpfr_set(temp2,temp,GMP_RNDN);
  }
  mpfr_log2(temp,temp2,GMP_RNDN);
  precOfAccur = -mpfr_get_si(temp,GMP_RNDD);

  mulPrec[0] = precOfAccur;

  /* We really do want to have a non-lazy evaluation here, so we use & and not && */
  res = (!(!res)) & (!(!(determinePrecisionsHelper(coefficients+1, degree-1, addPrec+1, mulPrec+1,
						   temp2, range, prec))));

  mpfr_clear(temp);
  mpfr_clear(temp2);
  return res;
}

int determineCoefficientFormat(mpfr_t coefficient) {
  mpfr_t temp;
  int res;

  mpfr_init2(temp,mpfr_get_prec(coefficient));

  if (mpfr_round_to_double(temp,coefficient) == 0) {
    res = 1;
  } else {
    if (mpfr_round_to_doubledouble(temp,coefficient) == 0) {
      res = 2;
    } else {
      if (mpfr_round_to_tripledouble(temp,coefficient) == 0) {
	res = 3;
      } else {
	res = 4;
      }
    }
  }

  mpfr_clear(temp);
  return res;
}

int determinePrecisions(mpfr_t *coefficients, int *coeffsAutoRound, int degree,
			int *addPrec, int *mulPrec,
			mpfr_t accuracy, rangetype range,
			mp_prec_t prec) {
  int res, i, currentPrec, format, coeffPrec, rounded;
  mpfr_t temp;

  currentPrec = 0;
  coeffPrec = 0;

  /* Recursively determine the precisions needed on the unrounded polynomial */

  res = determinePrecisionsHelper(coefficients, degree, addPrec, mulPrec, accuracy, range, prec);

  /* Check the coefficients' precision, round them if needed or adapt the precision of the steps if needed */

  /* First check if the precisions must be adapted for the grace of forced coefficient formats */

  rounded = 0;

  mpfr_init2(temp,prec);
  for (i=degree;i>=0;i--) {
    if (mulPrec[i] >= 0) {
      currentPrec = mulPrec[i];
      break;
    }
  }
  for (i=degree;i>=0;i--) {

    /* Check if the precision of the next step is at least as great as the one of the previous (multiplication) */
    if (mulPrec[i] >= 0) {
      if (currentPrec > mulPrec[i]) {
	mulPrec[i] = currentPrec;
	printMessage(2,SOLLYA_MSG_PREC_OF_HORNER_STEP_GREATER_THAN_FOR_PREV_ONE,"Information: the precision of a previous Horner step is greater than the one of the next.\n");
	printMessage(2,SOLLYA_MSG_CONTINUATION,"Must adapt the precision for the next step on a multiplication.\n");
      } else currentPrec = mulPrec[i];
    }

    if ((!coeffsAutoRound[i]) && (!mpfr_zero_p(coefficients[i]))) {
      /* The coefficient will not be rounded automatically
	 Its precision must be taken into account
      */
      format = determineCoefficientFormat(coefficients[i]);
      if (format > 3) {
	res = 0;
	printMessage(1,SOLLYA_MSG_NO_AUTO_ROUND_FOR_COEFF_W_PREC_HIGHER_THAN_TD,"Warning: a coefficient's precision is higher than triple-double but no automatic rounding will be performed.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"This should not occur. The coefficient will now be rounded to a triple-double.\n");
	format = 3;
	mpfr_round_to_tripledouble(temp,coefficients[i]);
	mpfr_set(coefficients[i],temp,GMP_RNDN);
      }
      switch (format) {
      case 3:
	coeffPrec = 159;
	break;
      case 2:
	coeffPrec = 102;
	break;
      case 1:
	coeffPrec = 53;
	break;
      default:
	sollyaFprintf(stderr,"Error: in determinePrecisions: unknown expansion format.\n");
      }

      if (coeffPrec > currentPrec) {
	currentPrec = coeffPrec;
	printMessage(1,SOLLYA_MSG_INFERED_COEFF_PREC_HIGHER_THAN_REQUIRED,"Warning: the infered precision of the %dth coefficient of the polynomial is greater than\n",i);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"the necessary precision computed for this step. This may make the automatic determination\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"of precisions useless.\n");
      }
    }

    /* Check if the precision of the next step is at least as great as the one of the previous (addition) */
    if (addPrec[i] >= 0) {
      if (currentPrec > addPrec[i]) {
	printMessage(2,SOLLYA_MSG_PREC_OF_HORNER_STEP_GREATER_THAN_FOR_PREV_ONE,"Information: the precision of a previous Horner step is greater than the one of the next.\n");
	printMessage(2,SOLLYA_MSG_CONTINUATION,"Must adapt the precision for the next step on an addition.\n");
	addPrec[i] = currentPrec;
      } else currentPrec = addPrec[i];
    }

  }

  currentPrec = 50;

  /* Second, round automatically the coefficients for which the precision is computed automatically */
  for (i=degree;i>=0;i--) {
    if (coeffsAutoRound[i]) {
      /* Automatically round the coefficient to the computed necessary precision */
      if (addPrec[i] >= 0)
	currentPrec = addPrec[i];
      else {
	if ((i > 0) && (mulPrec[i-1] >= 0)) currentPrec = mulPrec[i-1];
      }
      if (currentPrec > 102) {
	/* Round to triple-double */
	if (mpfr_round_to_tripledouble(temp, coefficients[i]) != 0) {
	  rounded = 1;
	  printMessage(2,SOLLYA_MSG_COEFF_HAS_BEEN_ROUNDED_TO_TRIPLE_DOUBLE,"Information: the %dth coefficient of the polynomial has automatically been rounded to a triple-double.\n",i);
	}
	if (mpfr_set(coefficients[i],temp,GMP_RNDN) != 0) {
	  printMessage(1,SOLLYA_MSG_ERROR_ON_HANDLING_A_COEFFICIENT,"Warning: there was an error during the internal handling of a coefficient.\n");
	  res = 0;
	}
      } else {
	if (currentPrec > 53) {
	  /* Round to double-double */
	  if (mpfr_round_to_doubledouble(temp, coefficients[i]) != 0) {
	    rounded = 1;
	    printMessage(2,SOLLYA_MSG_COEFF_HAS_BEEN_ROUNDED_TO_DOUBLE_DOUBLE,"Information: the %dth coefficient of the polynomial has automatically been rounded to a double-double.\n",i);
	  }
	  if (mpfr_set(coefficients[i],temp,GMP_RNDN) != 0) {
	    printMessage(1,SOLLYA_MSG_ERROR_ON_HANDLING_A_COEFFICIENT,"Warning: there was an error during the internal handling of a coefficient.\n");
	    res = 0;
	  }
	} else {
	  /* Round to double */
	  if (mpfr_round_to_double(temp, coefficients[i]) != 0) {
	    rounded = 1;
	    printMessage(2,SOLLYA_MSG_COEFF_HAS_BEEN_ROUNDED_TO_DOUBLE,"Information: the %dth coefficient of the polynomial has automatically been rounded to a double.\n",i);
	  }
	  if (mpfr_set(coefficients[i],temp,GMP_RNDN) != 0) {
	    printMessage(1,SOLLYA_MSG_ERROR_ON_HANDLING_A_COEFFICIENT,"Warning: there was an error during the internal handling of a coefficient.\n");
	    res = 0;
	  }
	}
      }
    }
  }

  if (rounded) {
    if (!noRoundingWarnings) {
      printMessage(1,SOLLYA_MSG_IMPLEMENTED_POLY_DIFFERS_FROM_ORIGINAL_ONE,"Warning: at least one of the coefficients of the given polynomial has been rounded in a way\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"that the target precision can be achieved at lower cost. Nevertheless, the implemented polynomial\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"is different from the given one.\n");
    }
  }

  mpfr_clear(temp);

  return res;
}


int implementPowers(int *powPrec, int degree, int variablePrecision, FILE *fd, char *name, int *overlaps, int *varNum, chain **gappaAssign) {
  int i, k, l, res, issuedCode, issuedVariables, c, t, c2, t2;
  int *powers, *operand1, *operand2;
  char *code, *variables, *codeIssue, *variablesIssue, *buffer1, *buffer2, *operand1Name, *operand2Name, *resultName;
  gappaAssignment *newAssign;
  int op1format, op2format;

  op1format = -1;
  op2format = -1;

  res = 1;

  code = (char *) safeCalloc(CODESIZE,sizeof(char));
  variables = (char *) safeCalloc(CODESIZE,sizeof(char));
  buffer1 = (char *) safeCalloc(CODESIZE,sizeof(char));
  buffer2 = (char *) safeCalloc(CODESIZE,sizeof(char));

  resultName = NULL;
  operand1Name = NULL;
  operand2Name = NULL;
  if (gappaAssign != NULL) {
    resultName = (char *) safeCalloc(CODESIZE,sizeof(char));
    operand1Name = (char *) safeCalloc(CODESIZE,sizeof(char));
    operand2Name = (char *) safeCalloc(CODESIZE,sizeof(char));
  }

  codeIssue = code;
  variablesIssue = variables;
  issuedCode = 0;
  issuedVariables = 0;

  powers = (int *) safeCalloc(degree,sizeof(int));
  operand1 = (int *) safeCalloc(degree,sizeof(int));
  operand2 = (int *) safeCalloc(degree,sizeof(int));
  for (i=0;i<degree;i++) powers[i] = powPrec[i];

  for (i=degree-1;i>0;i--) {
    if (powers[i] >= 0) {
      if ((i % 2) == 1) {
	if (powers[i] > powers[(i+1)/2-1]) powers[(i+1)/2-1] = powers[i];
	operand1[i] = (i+1)/2 - 1;
	operand2[i] = (i+1)/2 - 1;
      } else {
	for (k=i-1;k>0;k--) {
	  if (powers[k] >= 0) break;
	}
	l = i - k - 1;
	if (powers[i] > powers[k]) powers[k] = powers[i];
	if (powers[i] > powers[l]) powers[l] = powers[i];
	operand1[i] = k;
	operand2[i] = l;
      }
    }
  }

  for (i=1;i<degree;i++) {
    if (powers[i] >= 0) {
      /* Test whether we must produce a double, a double-double or a triple-double */
      if (powers[i] > 102) {
	/* Produce a triple-double or an exact result for x^2 with x as a double */

	if (operand1[i] == 0) {
	  /* The first operand is x */
	  if (operand2[i] == 0) {
	    /* The second operand is x, too */
	    switch (variablePrecision) {
	    case 1:
	      /* Produce an exact double-double x^2 instead of a triple-double */

	      /* The operation's precision is always infinite because of the operator */

	      c = sollya_snprintf(buffer1,CODESIZE,
                                  "Mul12(&%s_%s_%d_pow2h,&%s_%s_%d_pow2m,%s,%s);",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1],((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      c = sollya_snprintf(buffer2,CODESIZE,
                                  "double %s_%s_%d_pow2h, %s_%s_%d_pow2m;",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      overlaps[i] = 53;
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		newAssign = newGappaOperation(GAPPA_MUL_EXACT, -1, 2, 53, resultName, 1, 1, operand1Name, 1, 1, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	      break;
	    case 2:
	      /* Produce a triple-double x^2 out of two double-double x's */

	      /* The operation's precision is fixed because of the operands */

	      c = sollya_snprintf(buffer1,CODESIZE,
                                  "Mul23(&%s_%s_%d_pow2h,&%s_%s_%d_pow2m,&%s_%s_%d_pow2l,%sh,%sm,%sh,%sm);",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1],
                                  ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      c = sollya_snprintf(buffer2,CODESIZE,
                                  "double %s_%s_%d_pow2h, %s_%s_%d_pow2m, %s_%s_%d_pow2l;",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      overlaps[i] = 49;
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		newAssign = newGappaOperation(GAPPA_MUL_REL, 149, 3, overlaps[i], resultName, 2, 2, operand1Name, 2, 2, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	      break;
	    case 3:
	      /* Produce a triple-double x^2 out of two triple-double x's */

	      /* The operation's precision is fixed because the operands are renormalized x's */

	      c = sollya_snprintf(buffer1,CODESIZE,
                                  "Mul33(&%s_%s_%d_pow2h,&%s_%s_%d_pow2m,&%s_%s_%d_pow2l,%sh,%sm,%sl,%sh,%sm,%sl);",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1],
                                  ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      c = sollya_snprintf(buffer2,CODESIZE,
                                  "double %s_%s_%d_pow2h, %s_%s_%d_pow2m, %s_%s_%d_pow2l;",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      overlaps[i] = 48;
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		newAssign = newGappaOperation(GAPPA_MUL_REL, 140, 3, overlaps[i], resultName, 3, 3, operand1Name, 3, 3, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	      break;
	    default:
	      res = 0;
	    }
	  } else {
	    /* The first operand is x and the second is x^? as a triple-double */
	    switch (variablePrecision) {
	    case 1:
	      if (operand2[i] == 1) {
		/* Produce a triple-double out if a double x and an exact double-double x^2 */

		/* The operation's precision is fixed because of the operands */

		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul123(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s,%s_%s_%d_pow2h,%s_%s_%d_pow2m);",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                    ((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		overlaps[i] = 47;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]);
		  newAssign = newGappaOperation(GAPPA_MUL_REL, 154, 3, overlaps[i], resultName, 1, 1, operand1Name, 2, 2, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      } else {
		/* Produce a triple-double out of a double x and a triple-double x^? */

		/* The operation's precision depends on the overlap of the triple-double x^?
		   We must check if this value must be renormalized.

		   The precision is roughly 100 + overlap bits.
		*/

		c = 0; c2 = 0;
		if (overlaps[operand2[i]] + 100 < powers[i]) {
		  /* If we are here, we must renormalize the operand */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  varNum[operand2[i]]++;
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                       name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  overlaps[operand2[i]] = 52;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]-1,operand2[i]+1);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand2[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		t = c; t2 = c2;
		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul133(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                    ((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		overlaps[i] = overlaps[operand2[i]] - 5;
		if (overlaps[i] > 47) overlaps[i] = 47;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  newAssign = newGappaOperation(GAPPA_MUL_REL, overlaps[operand2[i]] + 100, 3, overlaps[i], resultName, 1, 1, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }
	      break;
	    case 2:
	      /* Produce a triple-double out of a double-double x and a triple-double x^? */

	      /* The operation's precision depends on the overlap of the triple-double x^?
		 We must check if this value must be renormalized.

		 The precision is roughly 96 + overlap bits.
	      */

	      c = 0; c2 = 0;
	      if (overlaps[operand2[i]] + 96 < powers[i]) {
		/* If we are here, we must renormalize the operand */
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		varNum[operand2[i]]++;
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c2 = sollya_snprintf(buffer2,CODESIZE,
                                     "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                     name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		overlaps[operand2[i]] = 52;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]-1,operand2[i]+1);
		  newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand2[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }

	      t = c; t2 = c2;
	      c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                  "Mul233(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%sh,%sm,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                  ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
	      if ((c < 0) || (c >= CODESIZE-t)) res = 0;
	      c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                  "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
	      if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
	      overlaps[i] = overlaps[operand2[i]] - 4;
	      if (overlaps[i] > 48) overlaps[i] = 48;
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		newAssign = newGappaOperation(GAPPA_MUL_REL, overlaps[operand2[i]] + 96, 3, overlaps[i], resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	      break;
	    case 3:
	      /* Produce a triple-double out of a triple-double x and a triple-double x^? */

	      /* The operation's precision depends on the overlap of the triple-double x^?
		 The triple-double x is supposed to be renormalized anytime.
		 We must check if this value must be renormalized.

		 The precision is roughly 98 + overlap bits.
	      */

	      c = 0; c2 = 0;
	      if (overlaps[operand2[i]] + 98 < powers[i]) {
		/* If we are here, we must renormalize the operand */
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		varNum[operand2[i]]++;
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c2 = sollya_snprintf(buffer2,CODESIZE,
                                     "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                     name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		overlaps[operand2[i]] = 52;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]-1,operand2[i]+1);
		  newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand2[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }

	      t = c; t2 = c2;
	      c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                  "Mul33(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%sh,%sm,%sl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                  ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
	      if ((c < 0) || (c >= CODESIZE-t)) res = 0;
	      c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                  "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
	      if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
	      overlaps[i] = overlaps[operand2[i]] - 4;
	      if (overlaps[i] > 48) overlaps[i] = 48;
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		newAssign = newGappaOperation(GAPPA_MUL_REL, overlaps[operand2[i]] + 98, 3, overlaps[i], resultName, 3, 3, operand1Name, 3, 3, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	      break;
	    default:
	      res = 0;
	    }
	  }
	} else {
	  /* The first operand is not x */
	  if (operand2[i] == 0) {
	    /* The second operand is x and the first is x^? as a triple-double */
	    switch (variablePrecision) {
	    case 1:
	      if (operand1[i] == 1) {
		/* Produce a triple-double out an exact double-double x^2 and a double x */
		/* The operation's precision is fixed because of the operands */
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul123(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s,%s_%s_%d_pow2h,%s_%s_%d_pow2m);",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                    ((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		overlaps[i] = 47;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]);
		  newAssign = newGappaOperation(GAPPA_MUL_REL, 154, 3, overlaps[i], resultName, 1, 1, operand1Name, 2, 2, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      } else {
		/* Produce a triple-double out of a triple-double x^? and a double x*/

		/* The operation's precision depends on the overlap of the triple-double x^?
		   We must check if this value must be renormalized.

		   The precision is roughly 100 + overlap bits.
		*/
		c = 0; c2 = 0;
		if (overlaps[operand1[i]] + 100 < powers[i]) {
		  /* If we are here, we must renormalize the operand */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  varNum[operand1[i]]++;
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                       name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  overlaps[operand1[i]] = 52;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]-1,operand1[i]+1);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand1[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		t = c; t2 = c2;
		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul133(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                    ((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		overlaps[i] = overlaps[operand1[i]] - 5;
		if (overlaps[i] > 47) overlaps[i] = 47;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  newAssign = newGappaOperation(GAPPA_MUL_REL, overlaps[operand1[i]] + 100, 3, overlaps[i], resultName, 1, 1, operand1Name, 2, 2, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }
	      break;
	    case 2:
	      /* Produce a triple-double out of a triple-double x^? and a double-double x */

	      /* The operation's precision depends on the overlap of the triple-double x^?
		 We must check if this value must be renormalized.

		 The precision is roughly 96 + overlap bits.
	      */
	      c = 0; c2 = 0;
	      if (overlaps[operand1[i]] + 96 < powers[i]) {
		/* If we are here, we must renormalize the operand */
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		varNum[operand1[i]]++;
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c2 = sollya_snprintf(buffer2,CODESIZE,
                                     "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                     name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		overlaps[operand1[i]] = 52;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]-1,operand1[i]+1);
		  newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand1[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }

	      t = c; t2 = c2;
	      c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                  "Mul233(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%sh,%sm,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                  ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
	      if ((c < 0) || (c >= CODESIZE-t)) res = 0;
	      c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                  "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
	      if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
	      overlaps[i] = overlaps[operand1[i]] - 4;
	      if (overlaps[i] > 48) overlaps[i] = 48;
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		newAssign = newGappaOperation(GAPPA_MUL_REL, overlaps[operand1[i]] + 96, 3, overlaps[i], resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	      break;
	    case 3:
	      /* Produce a triple-double out of a triple-double x^? and a triple-double x */
	      /* The operation's precision depends on the overlap of the triple-double x^?
		 We must check if this value must be renormalized.

		 The precision is roughly 98 + overlap bits.
	      */
	      c = 0; c2 = 0;
	      if (overlaps[operand1[i]] + 98 < powers[i]) {
		/* If we are here, we must renormalize the operand */
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		varNum[operand1[i]]++;
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c2 = sollya_snprintf(buffer2,CODESIZE,
                                     "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                     name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		overlaps[operand1[i]] = 52;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]-1,operand1[i]+1);
		  newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand1[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }

	      t = c; t2 = c2;
	      c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                  "Mul33(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%sh,%sm,%sl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                  ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
	      if ((c < 0) || (c >= CODESIZE-t)) res = 0;
	      c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                  "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      overlaps[i] = overlaps[operand1[i]] - 4;
	      if (overlaps[i] > 48) overlaps[i] = 48;
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		newAssign = newGappaOperation(GAPPA_MUL_REL, overlaps[operand1[i]] + 98, 3, overlaps[i], resultName, 3, 3, operand1Name, 3, 3, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	      break;
	    default:
	      res = 0;
	    }
	  } else {
	    /* None of the opernands is x */
	    if (variablePrecision == 1) {
	      if (operand1[i] == 1) {
		/* The first operand is a double-double x^2 */
		if (operand2[i] == 1) {
		  /* The second operand is a double-double x^2 */
		  /* Produce a triple-double x^4 out of two double-double x^2 */
		  /* The operation's precision is fixed because of the operands */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Mul23(&%s_%s_%d_pow4h,&%s_%s_%d_pow4m,&%s_%s_%d_pow4l,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2h,%s_%s_%d_pow2m);",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[3],name,((variablename == NULL) ? "_x_" : variablename),varNum[3],name,((variablename == NULL) ? "_x_" : variablename),varNum[3],
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_%s_%d_pow4h, %s_%s_%d_pow4m, %s_%s_%d_pow4l;",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[3],name,((variablename == NULL) ? "_x_" : variablename),varNum[3],name,((variablename == NULL) ? "_x_" : variablename),varNum[3]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  overlaps[i] = 49;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow4",name,((variablename == NULL) ? "_x_" : variablename),varNum[3]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		    newAssign = newGappaOperation(GAPPA_MUL_REL, 149, 3, overlaps[i], resultName, 2, 2, operand1Name, 2, 2, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		} else {
		  /* Produce a triple-double out of a double-double x^2 and a triple-double x^? */

		  /* The operation's precision depends on the overlap of the triple-double x^?
		     We must check if this value must be renormalized.

		     The precision is roughly 96 + overlap bits.
		  */
		  c = 0; c2 = 0;
		  if (overlaps[operand2[i]] + 96 < powers[i]) {
		    /* If we are here, we must renormalize the operand */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    varNum[operand2[i]]++;
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                         name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    overlaps[operand2[i]] = 52;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]-1,operand2[i]+1);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand2[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }

		  t = c; t2 = c2;
		  c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                      "Mul233(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1],
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		  c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                      "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		  if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		  overlaps[i] = overlaps[operand2[i]] - 4;
		  if (overlaps[i] > 48) overlaps[i] = 48;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_REL, overlaps[operand2[i]] + 96, 3, overlaps[i], resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
	      } else {
		/* The first operand is surely a triple-double */
		if (operand2[i] == 1) {
		  /* The second operand is a double-double x^2 */
		  /* Produce a triple-double out of a triple-double x^? and a double-double x^2 */

		  /* The operation's precision depends on the overlap of the triple-double x^?
		     We must check if this value must be renormalized.

		     The precision is roughly 96 + overlap bits.
		  */
		  c = 0; c2 = 0;
		  if (overlaps[operand1[i]] + 96 < powers[i]) {
		    /* If we are here, we must renormalize the operand */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    varNum[operand1[i]]++;
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                         name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    overlaps[operand1[i]] = 52;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]-1,operand1[i]+1);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand1[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }

		  t = c; t2 = c2;
		  c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                      "Mul233(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1],
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		  c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                      "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		  if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		  overlaps[i] = overlaps[operand1[i]] - 4;
		  if (overlaps[i] > 48) overlaps[i] = 48;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_REL, overlaps[operand1[i]] + 96, 3, overlaps[i], resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		} else {
		  /* Both operands are surely triple-doubles; we produce a triple-double */

		  /* The operation's precision depends on the overlap of *both* triple-double x^?
		     We must check if one or two of the values must be renormalized.

		     The precision is roughly 97 + min(overlaps of both)

		  */
		  t = 0; c2 = 0; t2 = 0;
		  if (MIN(overlaps[operand1[i]],overlaps[operand2[i]]) + 97 < powers[i]) {
		    /* We renormalize first the operand with the higher overlap (i.e. lower value) */
		    if (overlaps[operand1[i]] < overlaps[operand2[i]]) {
		      /* Renormalize first opernand1[i] */
		      c = sollya_snprintf(buffer1,CODESIZE,
                                          "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                          name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                          name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                          name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                          name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                          name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                          name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		      varNum[operand1[i]]++;
		      if ((c < 0) || (c >= CODESIZE)) res = 0;
		      c2 = sollya_snprintf(buffer2,CODESIZE,
                                           "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                           name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		      if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		      overlaps[operand1[i]] = 52;
		      if (gappaAssign != NULL) {
			sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
			sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]-1,operand1[i]+1);
			newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand1[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
			*gappaAssign = addElement(*gappaAssign,newAssign);
		      }
		    } else {
		      /* Renormalize first opernand2[i] */
		      c = sollya_snprintf(buffer1,CODESIZE,
                                          "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                          name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                          name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                          name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                          name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                          name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                          name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		      varNum[operand2[i]]++;
		      if ((c < 0) || (c >= CODESIZE)) res = 0;
		      c2 = sollya_snprintf(buffer2,CODESIZE,
                                           "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                           name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		      if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		      overlaps[operand2[i]] = 52;
		      if (gappaAssign != NULL) {
			sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
			sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]-1,operand2[i]+1);
			newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand2[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
			*gappaAssign = addElement(*gappaAssign,newAssign);
		      }
		    }
		    t += c; t2 += c2;

		    /* Check once again the precision */
		    if (MIN(overlaps[operand1[i]],overlaps[operand2[i]]) + 97 < powers[i]) {
		      /* If we are here, we must renormalize also the other operand.
			 Since the overlap value of the other is now greater, we renormalize the
			 operand with the higher overlap as before.
		      */
		      if (overlaps[operand1[i]] < overlaps[operand2[i]]) {
			/* Renormalize first opernand1[i] */
			c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                            "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                            name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                            name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                            name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                            name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                            name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                            name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
			varNum[operand1[i]]++;
			if ((c < 0) || (c >= CODESIZE-t)) res = 0;
			c2 = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                             "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                             name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
			if ((c2 < 0) || (c2 >= CODESIZE-t2)) res = 0;
			overlaps[operand1[i]] = 52;
			if (gappaAssign != NULL) {
			  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
			  sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]-1,operand1[i]+1);
			  newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand1[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
			  *gappaAssign = addElement(*gappaAssign,newAssign);
			}
		      } else {
			/* Renormalize first opernand2[i] */
			c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                            "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                            name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                            name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                            name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                            name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                            name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                            name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
			varNum[operand2[i]]++;
			if ((c < 0) || (c >= CODESIZE-t)) res = 0;
			c2 = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                             "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                             name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
			if ((c2 < 0) || (c2 >= CODESIZE-t2)) res = 0;
			overlaps[operand2[i]] = 52;
			if (gappaAssign != NULL) {
			  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
			  sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]-1,operand2[i]+1);
			  newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand2[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
			  *gappaAssign = addElement(*gappaAssign,newAssign);
			}
		      }
		      t += c; t2 += c2;
		    }
		  }

		  c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                      "Mul33(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		  c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                      "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		  if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		  overlaps[i] = overlaps[operand1[i]] - 4;
		  if (overlaps[i] > overlaps[operand2[i]] - 4) overlaps[i] = overlaps[operand2[i]] - 4;
		  if (overlaps[i] > 48) overlaps[i] = 48;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_REL, MIN(overlaps[operand1[i]],overlaps[operand2[i]]) + 97, 3, overlaps[i], resultName, 3, 3, operand1Name, 3, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
	      }
	    } else {
	      /* Both operands are surely triple-doubles; we produce a triple-double */
	      /* The operation's precision depends on the overlap of *both* triple-double x^?
		 We must check if one or two of the values must be renormalized.

		 The precision is roughly 97 + min(overlaps of both)

	      */
	      t = 0; t2 = 0;
	      if (MIN(overlaps[operand1[i]],overlaps[operand2[i]]) + 97 < powers[i]) {
		/* We renormalize first the operand with the higher overlap (i.e. lower value) */
		if (overlaps[operand1[i]] < overlaps[operand2[i]]) {
		  /* Renormalize first opernand1[i] */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  varNum[operand1[i]]++;
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                       name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  overlaps[operand1[i]] = 52;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]-1,operand1[i]+1);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand1[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		} else {
		  /* Renormalize first opernand2[i] */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  varNum[operand2[i]]++;
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                       name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  overlaps[operand2[i]] = 52;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]-1,operand2[i]+1);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand2[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
		t += c; t2 += c2;

		/* Check once again the precision */
		if (MIN(overlaps[operand1[i]],overlaps[operand2[i]]) + 97 < powers[i]) {
		  /* If we are here, we must renormalize also the other operand.
		     Since the overlap value of the other is now greater, we renormalize the
		     operand with the higher overlap as before.
		  */
		  if (overlaps[operand1[i]] < overlaps[operand2[i]]) {
		    /* Renormalize first opernand1[i] */
		    c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                        "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    varNum[operand1[i]]++;
		    if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		    c2 = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                         "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                         name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    if ((c2 < 0) || (c2 >= CODESIZE-t2)) res = 0;
		    overlaps[operand1[i]] = 52;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]-1,operand1[i]+1);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand1[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  } else {
		    /* Renormalize first opernand2[i] */
		    c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                        "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    varNum[operand2[i]]++;
		    if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		    c2 = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                         "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                         name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    if ((c2 < 0) || (c2 >= CODESIZE-t2)) res = 0;
		    overlaps[operand2[i]] = 52;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]-1,operand2[i]+1);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand2[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }
		  t += c; t2 += c2;
		}
	      }

	      c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                  "Mul33(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
	      if ((c < 0) || (c >= CODESIZE-t)) res = 0;
	      c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                  "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
	      if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
	      overlaps[i] = overlaps[operand1[i]] - 4;
	      if (overlaps[i] > overlaps[operand2[i]] - 4) overlaps[i] = overlaps[operand2[i]] - 4;
	      if (overlaps[i] > 48) overlaps[i] = 48;
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		newAssign = newGappaOperation(GAPPA_MUL_REL, MIN(overlaps[operand1[i]],overlaps[operand2[i]]) + 97, 3, overlaps[i], resultName, 3, 3, operand1Name, 3, 3, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	    }
	  }
	}
      } else {
	if (powers[i] > 53) {
	  overlaps[i] = 53;
	  /* Produce a double-double */
	  if (operand1[i] == 0) {
	    /* The first operand is x */
	    if (operand2[i] == 0) {
	      /* The second operand is x */
	      switch (variablePrecision) {
	      case 1:
		/* Produce a double-double x^2 out of a double x and a double x */
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul12(&%s_%s_%d_pow2h,&%s_%s_%d_pow2m,%s,%s);",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1],((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_%s_%d_pow2h, %s_%s_%d_pow2m;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  newAssign = newGappaOperation(GAPPA_MUL_EXACT, -1, 2, 53, resultName, 1, 1, operand1Name, 1, 1, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      case 2:
	      case 3:
		/* Produce a double-double x^2 out of a double-double or better x and a double-double or better x */
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul22(&%s_%s_%d_pow2h,&%s_%s_%d_pow2m,%sh,%sm,%sh,%sm);",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1],((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_%s_%d_pow2h, %s_%s_%d_pow2m;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[1],name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 2, variablePrecision, operand1Name, 2, variablePrecision, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      default:
		res = 0;
	      }
	    } else {
	      /* The first operand is x and the second is x^? as a double-double or better */
	      switch (variablePrecision) {
	      case 1:
		/* Produce a double-double out of a double x and a double-double or better x^? */

		/* If x^? is actually a triple-double, its higher overlap affects the precision of the
		   operation. We check if overlap[operand] is less than 53 (only triple-doubles can be like that)
		   and renormalize the whole triple-double (and adjust its overlap) if 53 + overlap[operand]
		   is less than powers[i].
		*/
		c = 0; c2 = 0; op2format = 2;
		if (overlaps[operand2[i]] < 53) {
		  op2format = 3;
		  /* We must perhaps renormalize */
		  if (overlaps[operand2[i]] + 53 < powers[i]) {
		    /* We renormalize */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    varNum[operand2[i]]++;
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                         name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    overlaps[operand2[i]] = 52;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]-1,operand2[i]+1);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand2[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }
		}

		t = c; t2 = c2;
		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul122(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,%s,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm);",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                    ((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 1, 1, operand1Name, 2, op2format, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      case 2:
	      case 3:
		/* Produce a double-double out of a double-double or better x and a double-double or better x^? */

		/* If x^? is actually a triple-double, its higher overlap affects the precision of the
		   operation. We check if overlap[operand] is less than 53 (only triple-doubles can be like that)
		   and renormalize the whole triple-double (and adjust its overlap) if 53 + overlap[operand]
		   is less than powers[i].
		   The usage of a triple-double x as a double-double is not critical because
		   x is supposed to be renormalized in this case.
		*/
		c = 0; c2 = 0; op2format = 2;
		if (overlaps[operand2[i]] < 53) {
		  op2format = 3;
		  /* We must perhaps renormalize */
		  if (overlaps[operand2[i]] + 53 < powers[i]) {
		    /* We renormalize */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    varNum[operand2[i]]++;
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                         name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    overlaps[operand2[i]] = 52;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]-1,operand2[i]+1);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand2[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }
		}

		t = c; t2 = c2;
		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul22(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,%sh,%sm,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm);",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                    ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 2, variablePrecision, operand1Name, 2, op2format, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      default:
		res = 0;
	      }
	    }
	  } else {
	    /* The first opernand is x^? as a double-double or better */
	    if (operand2[i] == 0) {
	      /* The second operand is x */
	      switch (variablePrecision) {
	      case 1:
		/* Produce a double-double out of a double-double or better x^? and a double x */
		/* If x^? is actually a triple-double, its higher overlap affects the precision of the
		   operation. We check if overlap[operand] is less than 53 (only triple-doubles can be like that)
		   and renormalize the whole triple-double (and adjust its overlap) if 53 + overlap[operand]
		   is less than powers[i].
		*/
		c = 0; c2 = 0; op2format = 2;
		if (overlaps[operand1[i]] < 53) {
		  op2format = 3;
		  /* We must perhaps renormalize */
		  if (overlaps[operand1[i]] + 53 < powers[i]) {
		    /* We renormalize */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    varNum[operand1[i]]++;
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                         name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    overlaps[operand1[i]] = 52;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]-1,operand1[i]+1);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand1[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }
		}

		t = c; t2 = c2;
		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul122(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,%s,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm);",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                    ((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 1, 1, operand1Name, 2, op2format, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      case 2:
	      case 3:
		/* Produce a double-double out of a double-double or better x^? and a double-double or better x */

		/* If x^? is actually a triple-double, its higher overlap affects the precision of the
		   operation. We check if overlap[operand] is less than 53 (only triple-doubles can be like that)
		   and renormalize the whole triple-double (and adjust its overlap) if 53 + overlap[operand]
		   is less than powers[i].
		   The usage of a triple-double x as a double-double is not critical because
		   x is supposed to be renormalized in this case.
		*/
		c = 0; c2 = 0; op2format = 2;
		if (overlaps[operand1[i]] < 53) {
		  op2format = 3;
		  /* We must perhaps renormalize */
		  if (overlaps[operand1[i]] + 53 < powers[i]) {
		    /* We renormalize */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    varNum[operand1[i]]++;
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                         name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    overlaps[operand1[i]] = 52;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]-1,operand1[i]+1);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand1[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }
		}

		t = c; t2 = c2;
		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul22(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,%sh,%sm,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm);",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                    ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 2, variablePrecision, operand1Name, 2, op2format, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      default:
		res = 0;
	      }
	    } else {
	      /* None of the operands is x and thus both double-doubles or better */
	      /* Produce a double-double out of two double-doubles or better */

	      /* If operands are actually triple-doubles, their higher overlaps affect the precision of the
                 operation. We check if overlap[operand] is less than 53 (only triple-doubles can be like that)
                 and renormalize the whole triple-double (and adjust its overlap) if 53 + overlap[operand]
                 is less than powers[i]. We do this for both one after the other.
	      */

	      t = 0; t2 = 0; op1format = 2;
	      c = 0; c2 = 0; op2format = 2;
	      if (overlaps[operand1[i]] < 53) {
		op1format = 3;
		/* We must perhaps renormalize */
		if (overlaps[operand1[i]] + 53 < powers[i]) {
		  /* We renormalize */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]+1,operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  varNum[operand1[i]]++;
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                       name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  overlaps[operand1[i]] = 52;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]]-1,operand1[i]+1);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand1[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
	      }
	      t += c; t2 += c2;

	      c = 0; c2 = 0;
	      if (overlaps[operand2[i]] < 53) {
		op2format = 3;
		/* We must perhaps renormalize */
		if (overlaps[operand2[i]] + 53 < powers[i]) {
		  /* We renormalize */
		  c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                      "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]+1,operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  varNum[operand2[i]]++;
		  if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		  c2 = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                       "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                       name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  if ((c2 < 0) || (c2 >= CODESIZE-t2)) res = 0;
		  overlaps[operand2[i]] = 52;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]]-1,operand2[i]+1);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, overlaps[operand2[i]], resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
	      }
	      t += c; t2 += c2;

	      c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                  "Mul22(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm);",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
	      if ((c < 0) || (c >= CODESIZE-t)) res = 0;
	      c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                  "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm;",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
	      if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 2, op1format, operand1Name, 2, op2format, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	    }
	  }
	} else {
	  /* Produce a double */
	  overlaps[i] = 53;
	  if (operand1[i] == 0) {
	    /* The first operand is x */
	    if (operand2[i] == 0) {
	      /* The second operand is x */
	      if (variablePrecision == 1) {
		/* Produce x^2 as a double out of x as a double */
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "%s_%s_%d_pow2h = %s * %s;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[1],((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_%s_%d_pow2h;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, variablePrecision, operand1Name, 1, variablePrecision, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      } else {
		/* Produce x^2 as a double out of x as a double-double or better */
		/* Here the usage of a triple-double x as a double is
		   not critical because we suppose that x is renormalized.
		*/
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "%s_%s_%d_pow2h = %sh * %sh;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_%s_%d_pow2h;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),varNum[1]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, variablePrecision, operand1Name, 1, variablePrecision, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }
	    } else {
	      /* The first operand is x, the second is x^? as a double or better */
	      if (variablePrecision == 1) {
		/* Produce a double out of a double x and a double or better x^? */

		/* If x^? is a triple-double (overlaps[operand] < 53) that we want to
		   use as a double, we must check if overlaps[operand] is not less than
		   the precision needed (powers[i]). If this is the case, since we do not
		   want to renormalize the whole triple-double, we use a rounded sum of
		   the higher and middle value.
		*/
		if ((overlaps[operand2[i]] < 53) && (overlaps[operand2[i]] < powers[i])) {
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_%s_%d_pow%dh = %s * (%s_%s_%d_pow%dh + %s_%s_%d_pow%dm);",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, 1, operand1Name, 2, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		} else {
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_%s_%d_pow%dh = %s * %s_%s_%d_pow%dh;",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, 1, operand1Name, 1, 2, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_%s_%d_pow%dh;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
	      } else {
		/* Produce a double out of a double-double or better x and a double or better x^? */

		/* If x^? is a triple-double (overlaps[operand] < 53) that we want to
		   use as a double, we must check if overlaps[operand] is not less than
		   the precision needed (powers[i]). If this is the case, since we do not
		   want to renormalize the whole triple-double, we use a rounded sum of
		   the higher and middle value.
		*/

		if ((overlaps[operand2[i]] < 53) && (overlaps[operand2[i]] < powers[i])) {
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_%s_%d_pow%dh = %sh * (%s_%s_%d_pow%dh + %s_%s_%d_pow%dm);",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, variablePrecision, operand1Name, 2, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		} else {
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_%s_%d_pow%dh = %sh * %s_%s_%d_pow%dh;",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, variablePrecision, operand1Name, 1, 2, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_%s_%d_pow%dh;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
	      }
	    }
	  } else {
	    /* The first operand is x^? as a double or better */
	    if (operand2[i] == 0) {
	      /* The second operand is x */
	      if (variablePrecision == 1) {
		/* Produce a double out of a double or better x^? and a double x */

		/* If x^? is a triple-double (overlaps[operand] < 53) that we want to
		   use as a double, we must check if overlaps[operand] is not less than
		   the precision needed (powers[i]). If this is the case, since we do not
		   want to renormalize the whole triple-double, we use a rounded sum of
		   the higher and middle value.
		*/
		if ((overlaps[operand1[i]] < 53) && (overlaps[operand1[i]] < powers[i])) {
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_%s_%d_pow%dh = %s * (%s_%s_%d_pow%dh + %s_%s_%d_pow%dm);",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, 1, operand1Name, 2, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		} else {
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_%s_%d_pow%dh = %s * %s_%s_%d_pow%dh;",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, 1, operand1Name, 1, 2, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_%s_%d_pow%dh;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
	      } else {
		/* Produce a double out of a double or better x^? and a double-double or better x */

		/* If x^? is a triple-double (overlaps[operand] < 53) that we want to
		   use as a double, we must check if overlaps[operand] is not less than
		   the precision needed (powers[i]). If this is the case, since we do not
		   want to renormalize the whole triple-double, we use a rounded sum of
		   the higher and middle value.
		   The usage of a triple-double x as a double is not a problem because
		   this value is supposed to be renormalized in this case.
		*/
		if ((overlaps[operand1[i]] < 53) && (overlaps[operand1[i]] < powers[i])) {
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_%s_%d_pow%dh = %sh * (%s_%s_%d_pow%dh + %s_%s_%d_pow%dm);",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, variablePrecision, operand1Name, 2, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		} else {
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_%s_%d_pow%dh = %sh * %s_%s_%d_pow%dh;",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,((variablename == NULL) ? "_x_" : variablename),name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, variablePrecision, operand1Name, 1, 2, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_%s_%d_pow%dh;",
                                    name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
	      }
	    } else {
	      /* Produce a double out of two doubles or better */
	      /* If one of the operands is a triple-double (overlaps[operand] < 53) that we want to
		 use as a double, we must check if overlaps[operand] is not less than
		 the precision needed (powers[i]). If this is the case, since we do not
		 want to renormalize the whole triple-double, we use a rounded sum of
		 the higher and middle value.
	      */

	      if ((overlaps[operand1[i]] < 53) && (overlaps[operand1[i]] < powers[i])) {
		if ((overlaps[operand2[i]] < 53) && (overlaps[operand2[i]] < powers[i])) {
		  /* Both operands are low precision triple-doubles */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_%s_%d_pow%dh = (%s_%s_%d_pow%dh + %s_%s_%d_pow%dm) * (%s_%s_%d_pow%dh + %s_%s_%d_pow%dm);",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 2, 3, operand1Name, 2, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		} else {
		  /* Only the first operand is a low precision triple-double */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_%s_%d_pow%dh = (%s_%s_%d_pow%dh + %s_%s_%d_pow%dm) * %s_%s_%d_pow%dh;",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 2, 3, operand1Name, 1, 2, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
	      } else {
		if ((overlaps[operand2[i]] < 53) && (overlaps[operand2[i]] < powers[i])) {
		  /* Only the second operand is a low precision triple-double */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_%s_%d_pow%dh = (%s_%s_%d_pow%dh + %s_%s_%d_pow%dm) * %s_%s_%d_pow%dh;",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1,
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 2, 2, operand1Name, 1, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		} else {
		  /* Both operands can be truncated to a double without problems */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_%s_%d_pow%dh = %s_%s_%d_pow%dh * %s_%s_%d_pow%dh;",
                                      name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1,name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand1[i]],operand1[i]+1);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),varNum[operand2[i]],operand2[i]+1);
		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, 2, operand1Name, 1, 2, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
	      }
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      c = sollya_snprintf(buffer2,CODESIZE,
                                  "double %s_%s_%d_pow%dh;",
                                  name,((variablename == NULL) ? "_x_" : variablename),varNum[i],i+1);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	    }
	  }
	}
      }

      /* Issue the buffers to code and variable buffers */
      c = sollya_snprintf(codeIssue,CODESIZE-issuedCode,"%s\n",buffer1);
      if (c < 0) {
	res = 0;
	c = 0;
      }
      if (c >= CODESIZE-issuedCode) {
	res = 0;
	c = CODESIZE-issuedCode;
      }
      issuedCode += c;
      codeIssue += c;
      c = sollya_snprintf(variablesIssue,CODESIZE-issuedVariables,"%s\n",buffer2);
      if (c < 0) {
	res = 0;
	c = 0;
      }
      if (c >= CODESIZE-issuedVariables) {
	res = 0;
	c = CODESIZE-issuedVariables;
      }
      issuedVariables += c;
      variablesIssue += c;

    } /* end if powers[i] >= 0 */
  } /* end loop */


  /* Issue the variable definitions and the code */
  if (sollyaFprintf(fd,"%s\n\n%s\n\n",variables,code) < 0) res = 0;

  safeFree(powers);
  safeFree(operand1);
  safeFree(operand2);
  safeFree(code);
  safeFree(variables);
  safeFree(buffer1);
  safeFree(buffer2);
  safeFree(operand1Name);
  safeFree(operand2Name);
  safeFree(resultName);
  return res;
}

int implementCoefficients(mpfr_t *coefficients, int degree, FILE *fd, char *name, mp_prec_t prec, chain **gappaAssign) {
  int res, i, format;
  double current, constHi, constMi, constLo;
  mpfr_t temp, temp2;
  gappaAssignment *newAssignment;
  char *resultVariable;

  res = 1;
  mpfr_init2(temp,prec);
  mpfr_init2(temp2,prec);

  for (i=0;i<=degree;i++) {
    if (!mpfr_zero_p(coefficients[i])) {
      constHi = 0.0;
      constMi = 0.0;
      constLo = 0.0;
      if ((format = determineCoefficientFormat(coefficients[i])) > 3) {
	printMessage(1,SOLLYA_MSG_COEFF_DOES_NOT_EVEN_HOLD_ON_TRIPLE_DOUBLE,"Warning: tried to implement a coefficient that cannot even be written on a triple-double.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"This should not occur. The coefficient will be rounded to a triple-double.\n");
	format = 3;
      }
      if (mpfr_set(temp,coefficients[i],GMP_RNDN) != 0) {
	if (!noRoundingWarnings) {
	  printMessage(1,SOLLYA_MSG_ROUNDING_ON_INTERNAL_HANDLING_OF_A_COEFFICIENT,"Warning: a rounding occurred on internal handling (on copying) of the %dth coefficient.\n");
	}
	res = 0;
      }
      current = sollya_mpfr_get_d(temp,GMP_RNDN);
      if (mpfr_set_d(temp2,current,GMP_RNDN) != 0) {
	if (!noRoundingWarnings) {
	  printMessage(1,SOLLYA_MSG_ROUNDING_ON_INTERNAL_HANDLING_OF_A_COEFFICIENT,"Warning: a rounding occurred on internal handling (on recasting) of the %dth coefficient.\n");
	}
	res = 0;
      }
      if (mpfr_sub(temp,temp,temp2,GMP_RNDN) != 0) {
	if (!noRoundingWarnings) {
	  printMessage(1,SOLLYA_MSG_ROUNDING_ON_INTERNAL_HANDLING_OF_A_COEFFICIENT,"Warning: a rounding occurred on internal handling (on a substraction) of the %dth coefficient.\n");
	}
	res = 0;
      }
      sollyaFprintf(fd,"#define %s_coeff_%dh %1.80e\n",name,i,current);
      constHi = current;
      current = sollya_mpfr_get_d(temp,GMP_RNDN);
      if (current != 0.0) {
	if (mpfr_set_d(temp2,current,GMP_RNDN) != 0) {
	  if (!noRoundingWarnings) {
	    printMessage(1,SOLLYA_MSG_ROUNDING_ON_INTERNAL_HANDLING_OF_A_COEFFICIENT,"Warning: a rounding occurred on internal handling (on recasting) of the %dth coefficient.\n");
	  }
	  res = 0;
	}
	if (mpfr_sub(temp,temp,temp2,GMP_RNDN) != 0) {
	  if (!noRoundingWarnings) {
	    printMessage(1,SOLLYA_MSG_ROUNDING_ON_INTERNAL_HANDLING_OF_A_COEFFICIENT,"Warning: a rounding occurred on internal handling (on a substraction) of the %dth coefficient.\n");
	  }
	  res = 0;
	}
	sollyaFprintf(fd,"#define %s_coeff_%dm %1.80e\n",name,i,current);
	constMi = current;
	current = sollya_mpfr_get_d(temp,GMP_RNDN);
	if (current != 0.0) {
	  if (mpfr_set_d(temp2,current,GMP_RNDN) != 0) {
	    if (!noRoundingWarnings) {
	      printMessage(1,SOLLYA_MSG_ROUNDING_ON_INTERNAL_HANDLING_OF_A_COEFFICIENT,"Warning: a rounding occurred on internal handling (on recasting) of the %dth coefficient.\n");
	    }
	    res = 0;
	  }
	  if (mpfr_sub(temp,temp,temp2,GMP_RNDN) != 0) {
	    if (!noRoundingWarnings) {
	      printMessage(1,SOLLYA_MSG_ROUNDING_ON_INTERNAL_HANDLING_OF_A_COEFFICIENT,"Warning: a rounding occurred on internal handling (on a substraction) of the %dth coefficient.\n");
	    }
	    res = 0;
	  }
	  sollyaFprintf(fd,"#define %s_coeff_%dl %1.80e\n",name,i,current);
	  constLo = current;
	}
      }

      if (gappaAssign != NULL) {
	resultVariable = (char *) safeCalloc(CODESIZE,sizeof(char));
	sprintf(resultVariable,"%s_coeff_%d",name,i);
	newAssignment = newGappaConstant(format, resultVariable, constHi, constMi, constLo);
	safeFree(resultVariable);
	*gappaAssign = addElement(*gappaAssign,newAssignment);
      }
    }
  }

  sollyaFprintf(fd,"\n\n");

  mpfr_clear(temp);
  mpfr_clear(temp2);
  return res;
}

int implementHorner(mpfr_t *coefficients, int *addPrec, int *mulPrec,
		    int degree, int variablePrecision, FILE *fd, char *name, int *powerOverlaps, int *powVarNum, chain **gappaAssign) {
  int res, i, k, variableNumber, comingFormat, producedFormat, issuedCode, issuedVariables, c, c2, t2;
  int coeffFormat, currOverlap, t, oldCurrOverlap;
  char *code, *variables, *codeIssue, *variablesIssue, *buffer1, *buffer2;
  int *tempVarNum;
  char *resultName, *operand1Name, *operand2Name, *operand3Name;
  int op2format;
  gappaAssignment *newAssign;

  op2format = -1;

  resultName = NULL;
  operand1Name = NULL;
  operand2Name = NULL;
  operand3Name = NULL;
  if (gappaAssign != NULL) {
    resultName = (char *) safeCalloc(CODESIZE,sizeof(char));
    operand1Name = (char *) safeCalloc(CODESIZE,sizeof(char));
    operand2Name = (char *) safeCalloc(CODESIZE,sizeof(char));
    operand3Name = (char *) safeCalloc(CODESIZE,sizeof(char));
  }

  res = 1;

  code = (char *) safeCalloc(CODESIZE,sizeof(char));
  variables = (char *) safeCalloc(CODESIZE,sizeof(char));
  buffer1 = (char *) safeCalloc(CODESIZE,sizeof(char));
  buffer2 = (char *) safeCalloc(CODESIZE,sizeof(char));

  tempVarNum = (int *) safeCalloc((2* degree) + 3,sizeof(int));

  codeIssue = code;
  variablesIssue = variables;
  issuedCode = 0;
  issuedVariables = 0;

  currOverlap = 53;

  /* Initialise with the first step */

  variableNumber = 1;
  for (i=degree;((i>=0) && (mpfr_zero_p(coefficients[i])));i--);
  switch (producedFormat = determineCoefficientFormat(coefficients[i])) {
  case 3:
    c = sollya_snprintf(buffer1,CODESIZE,
                        "%s_t_%d_%dh = %s_coeff_%dh; %s_t_%d_%dm = %s_coeff_%dm; %s_t_%d_%dl = %s_coeff_%dl;",
                        name,variableNumber,tempVarNum[variableNumber],name,i,
                        name,variableNumber,tempVarNum[variableNumber],name,i,
                        name,variableNumber,tempVarNum[variableNumber],name,i);
    if ((c < 0) || (c >= CODESIZE)) res = 0;
    c = sollya_snprintf(buffer2,CODESIZE,
                        "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                        name,variableNumber,tempVarNum[variableNumber],
                        name,variableNumber,tempVarNum[variableNumber],
                        name,variableNumber,tempVarNum[variableNumber]);
    if ((c < 0) || (c >= CODESIZE)) res = 0;
    variableNumber++;
    /* The overlap should be 53 since we have correctly rounded coefficients
       But: there is the case of double renormalization in the firststep in strange honorcoeffprec cases.
    */
    currOverlap = 52;
    if (gappaAssign != NULL) {
      sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
      sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
      newAssign = newGappaOperation(GAPPA_COPY, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
      *gappaAssign = addElement(*gappaAssign,newAssign);
    }
    break;
  case 2:
    c = sollya_snprintf(buffer1,CODESIZE,
                        "%s_t_%d_%dh = %s_coeff_%dh; %s_t_%d_%dm = %s_coeff_%dm;",
                        name,variableNumber,tempVarNum[variableNumber],name,i,
                        name,variableNumber,tempVarNum[variableNumber],name,i);
    if ((c < 0) || (c >= CODESIZE)) res = 0;
    c = sollya_snprintf(buffer2,CODESIZE,
                        "double %s_t_%d_%dh, %s_t_%d_%dm;",
                        name,variableNumber,tempVarNum[variableNumber],
                        name,variableNumber,tempVarNum[variableNumber]);
    if ((c < 0) || (c >= CODESIZE)) res = 0;
    variableNumber++;
    /* The overlap is 53 since we have correctly rounded coefficients */
    currOverlap = 53;
    if (gappaAssign != NULL) {
      sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
      sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
      newAssign = newGappaOperation(GAPPA_COPY, -1, 2, currOverlap, resultName, 2, 2, operand1Name, 0, 0, NULL);
      *gappaAssign = addElement(*gappaAssign,newAssign);
    }
    break;
  case 1:
    c = sollya_snprintf(buffer1,CODESIZE,
                        "%s_t_%d_%dh = %s_coeff_%dh;",
                        name,variableNumber,tempVarNum[variableNumber],name,i);
    if ((c < 0) || (c >= CODESIZE)) res = 0;
    c = sollya_snprintf(buffer2,CODESIZE,
                        "double %s_t_%d_%dh;",
                        name,variableNumber,tempVarNum[variableNumber]);
    if ((c < 0) || (c >= CODESIZE)) res = 0;
    variableNumber++;
    /* The overlap is 53 since we have correctly rounded coefficients */
    currOverlap = 53;
    if (gappaAssign != NULL) {
      sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
      sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
      newAssign = newGappaOperation(GAPPA_COPY, -1, 1, -1, resultName, 1, 1, operand1Name, 0, 0, NULL);
      *gappaAssign = addElement(*gappaAssign,newAssign);
    }
    break;
  default:
    printMessage(1,SOLLYA_MSG_A_COEFF_COULD_NOT_BE_STORED_IN_ANY_KNOWN_FORMAT,"Warning: a coefficient could not be stored in a known format. The implementation may be wrong.\n");
    producedFormat = 1;
    res = 0;
  }

  comingFormat = producedFormat;

  c = sollya_snprintf(codeIssue,CODESIZE-issuedCode,"%s\n",buffer1);
  if (c < 0) {
    res = 0;
    c = 0;
  }
  if (c >= CODESIZE-issuedCode) {
    res = 0;
    c = CODESIZE-issuedCode;
  }
  issuedCode += c;
  codeIssue += c;
  c = sollya_snprintf(variablesIssue,CODESIZE-issuedVariables,"%s\n",buffer2);
  if (c < 0) {
    res = 0;
    c = 0;
  }
  if (c >= CODESIZE-issuedVariables) {
    res = 0;
    c = CODESIZE-issuedVariables;
  }
  issuedVariables += c;
  variablesIssue += c;

  /* Continue with the normal steps */

  while (i>=0) {
    i--;
    k = 1;
    while ((i>=0) && (mpfr_zero_p(coefficients[i]))) {
      i--;
      k++;
    }
    if (i>=0) {

      coeffFormat = determineCoefficientFormat(coefficients[i]);

      /* Special case: fused addition and multiplication */
      /* We have two special operators:

         MulAdd212 and MulAdd22

         We can use them if
         - 53 < addPrec[i] <= 102
         - 53 < mulPrec[i] <= 102
         - comingFormat = 2
         - coeffFormat = 2

	 The value for x^k will either be completely correct (k = 1, variablePrecision = 1) or
	 can be rounded down because of the target accuracy.

      */
      if ((53 < addPrec[i]) && (addPrec[i] <= 102) &&
	  (53 < mulPrec[i]) && (mulPrec[i] <= 102) &&
	  (comingFormat == 2) &&
	  (coeffFormat == 2)) {

	producedFormat = 2;
	if (k == 1) {
	  /* Multiplication by a pure x, two possible cases: x as a double or a double-double (or better) */
	  if (variablePrecision == 1) {
	    /* Multiplication by x stored as a double */
	    c = sollya_snprintf(buffer1,CODESIZE,
                                "MulAdd212(&%s_t_%d_%dh,&%s_t_%d_%dm,%s_coeff_%dh,%s_coeff_%dm,%s,%s_t_%d_%dh,%s_t_%d_%dm);",
                                name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                name,i,name,i,
                                ((variablename == NULL) ? "_x_" : variablename),
                                name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
	    if ((c < 0) || (c >= CODESIZE)) res = 0;
	    c = sollya_snprintf(buffer2,CODESIZE,
                                "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
	    if ((c < 0) || (c >= CODESIZE)) res = 0;
	    if (gappaAssign != NULL) {
	      sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
	      sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
	      sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
	      sollya_snprintf(operand3Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
	      newAssign = newGappaOperation(GAPPA_FMA_REL, 100, 2, 53, resultName, 2, 2, operand1Name, 1, 1, operand2Name);
	      newAssign->operand3UsedType = 2;
	      newAssign->operand3ComingType = 2;
	      newAssign->operand3Variable = (char *) safeCalloc(strlen(operand3Name)+1,sizeof(char));
	      strcpy(newAssign->operand3Variable,operand3Name);
	      *gappaAssign = addElement(*gappaAssign,newAssign);
	    }
	  } else {
	    /* Multiplication by x stored as a double-double (or better) */
	    c = sollya_snprintf(buffer1,CODESIZE,
                                "MulAdd22(&%s_t_%d_%dh,&%s_t_%d_%dm,%s_coeff_%dh,%s_coeff_%dm,%sh,%sm,%s_t_%d_%dh,%s_t_%d_%dm);",
                                name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                name,i,name,i,
                                ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),
                                name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
	    if ((c < 0) || (c >= CODESIZE)) res = 0;
	    c = sollya_snprintf(buffer2,CODESIZE,
                                "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
	    if ((c < 0) || (c >= CODESIZE)) res = 0;
	    if (gappaAssign != NULL) {
	      sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
	      sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
	      sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
	      sollya_snprintf(operand3Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
	      newAssign = newGappaOperation(GAPPA_FMA_REL, 100, 2, 53, resultName, 2, 2, operand1Name, 2, variablePrecision, operand2Name);
	      newAssign->operand3UsedType = 2;
	      newAssign->operand3ComingType = 2;
	      newAssign->operand3Variable = (char *) safeCalloc(strlen(operand3Name)+1,sizeof(char));
	      strcpy(newAssign->operand3Variable,operand3Name);
	      *gappaAssign = addElement(*gappaAssign,newAssign);
	    }
	  }
	} else {
	  /* Multiplication by x^k, which will be in any case at least a double-double */

	  /* We have to check that if x^k is actually a triple-double that is read as a double-double
	     that the precision obtained is sufficient regardless of the overlap in the triple-double
	     The obtained precision is roughly 53 + overlap value. If it is not sufficient,
	     we renormalize the whole triple-double value.
	  */

	  t = 0; t2 = 0;
	  if ((powerOverlaps[k-1] < 53) && (mulPrec[i] > (53 + powerOverlaps[k-1]))) {
	    /* We must renormalize the power */
	    c = sollya_snprintf(buffer1,CODESIZE,
                                "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,
                                name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
	    powVarNum[k-1]++;
	    if ((c < 0) || (c >= CODESIZE)) res = 0;
	    c2 = sollya_snprintf(buffer2,CODESIZE,
                                 "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                 name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
	    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
	    powerOverlaps[k-1] = 52;
	    t = c; t2 = c2;
	    if (gappaAssign != NULL) {
	      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
	      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]-1,k);
	      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[k-1], resultName, 3, 3, operand1Name, 0, 0, NULL);
	      *gappaAssign = addElement(*gappaAssign,newAssign);
	    }
	  }
	  c = sollya_snprintf(buffer1+t,CODESIZE-t,
                              "MulAdd22(&%s_t_%d_%dh,&%s_t_%d_%dm,%s_coeff_%dh,%s_coeff_%dm,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_t_%d_%dh,%s_t_%d_%dm);",
                              name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                              name,i,name,i,
                              name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,
                              name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
	  if ((c < 0) || (c >= CODESIZE-t)) res = 0;
	  c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                              "double %s_t_%d_%dh, %s_t_%d_%dm;",
                              name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
	  if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
	  if (gappaAssign != NULL) {
	    if (powerOverlaps[k-1] < 53) op2format = 3; else op2format = 2;
	    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
	    sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
	    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
	    sollya_snprintf(operand3Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
	    newAssign = newGappaOperation(GAPPA_FMA_REL, 100, 2, 53, resultName, 2, 2, operand1Name, 2, op2format, operand2Name);
	    newAssign->operand3UsedType = 2;
	    newAssign->operand3ComingType = 2;
	    newAssign->operand3Variable = (char *) safeCalloc(strlen(operand3Name)+1,sizeof(char));
	    strcpy(newAssign->operand3Variable,operand3Name);
	    *gappaAssign = addElement(*gappaAssign,newAssign);
	  }
	}

	variableNumber++;
	comingFormat = producedFormat;

	/* Issue the generated buffers to memory */
	c = sollya_snprintf(codeIssue,CODESIZE-issuedCode,"%s\n",buffer1);
	if (c < 0) {
	  res = 0;
	  c = 0;
	}
	if (c >= CODESIZE-issuedCode) {
	  res = 0;
	  c = CODESIZE-issuedCode;
	}
	issuedCode += c;
	codeIssue += c;
	c = sollya_snprintf(variablesIssue,CODESIZE-issuedVariables,"%s\n",buffer2);
	if (c < 0) {
	  res = 0;
	  c = 0;
	}
	if (c >= CODESIZE-issuedVariables) {
	  res = 0;
	  c = CODESIZE-issuedVariables;
	}
	issuedVariables += c;
	variablesIssue += c;

	/* The overlap is 53 since we have always double-double operations */
	currOverlap = 53;

      } else {
	/* General case: multiplication followed by addition */


	/* Generate first the multiplication by x or the correspondant power of x in the buffer */
	/* mulPrec[i] determines the format to produce and influences on the
	   precision of x or the power of x
	*/

	if (mulPrec[i] > 102) {
	  /* Produce a triple-double (or a double-double exactly if comingFormat = 1 and x as a double */
	  if (k == 1) {
	    /* Multiply by pure x as a double, double-double or triple-double */
	    switch (variablePrecision) {
	    case 3:
	      /* Multiply comingFormat by a triple-double x, produce a triple-double */
	      producedFormat = 3;
	      switch (comingFormat) {
	      case 3:
		/* Multiply the triple-double temporary by a triple-double x, produce a triple-double */

		/* We have to check the precision of the operation which depends
		   on the overlap of the entering triple-double operands.
		   The overlap of x is fixed by hypothesis, so the precision
		   depends only on the overlap of the entering temporary.
		   If the precision is not sufficient, we renormalize.
		*/
		t = 0; t2 = 0;
		if (mulPrec[i] > (97 + currOverlap)) {
		  /* We must renormalize the temporary */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                      name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  tempVarNum[variableNumber-1]++;
		  currOverlap = 52;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                       name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  t = c; t2 = c2;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul33(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%sh,%sm,%sl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		oldCurrOverlap = currOverlap;
		currOverlap = MIN(48,currOverlap-4);
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 97 + oldCurrOverlap, 3, currOverlap, resultName, 3, 3, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      case 2:
		/* Multiply the double-double temporary by a triple-double x, produce a triple-double */

		/* The precision is fixed because of the operands' formats:
		   - x is supposed to be non-overlapping by hypothesis
		   - the other operand is a double-double
		*/

		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul233(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%sh,%sm,%sl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],
                                    ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 48;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 149, 3, currOverlap, resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      default:
		/* Multiply the double temporary by a triple-double x, produce a triple-double */

		/* The precision is fixed because of the operands' formats:
		   - x is supposed to be non-overlapping by hypothesis
		   - the other operand is a double
		*/

		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul133(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%sh,%sm,%sl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],
                                    ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 47;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 152, 3, currOverlap, resultName, 1, 1, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }
	      break;
	    case 2:
	      producedFormat = 3;
	      switch (comingFormat) {
	      case 3:
		/* Multiply the triple-double temporary by a double-double x, produce a triple-double */

		/* We have to check the precision of the operation which depends
		   on the overlap of the entering triple-double operands.
		   The overlap of x is fixed by hypothesis, so the precision
		   depends only on the overlap of the entering temporary.
		   If the precision is not sufficient, we renormalize.
		*/
		t = 0; t2 = 0;
		if (mulPrec[i] > (97 + currOverlap)) {
		  /* We must renormalize the temporary */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                      name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  currOverlap = 52;
		  tempVarNum[variableNumber-1]++;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                       name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  t = c; t2 = c2;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul233(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%sh,%sm,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE+t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		oldCurrOverlap = currOverlap;
		currOverlap = MIN(48,currOverlap-4);
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 97 + oldCurrOverlap, 3, currOverlap, resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      case 2:
		/* Multiply the double-double temporary by a double-double x, produce a triple-double */

		/* The precision is fixed because of the operands' formats:
		   both operands are double-doubles
		*/

		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul23(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%sh,%sm,%s_t_%d_%dh,%s_t_%d_%dm);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 49;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 149, 3, currOverlap, resultName, 2, 2, operand1Name, 2, 2, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      default:
		/* Multiply the double temporary by a double-double x, produce a triple-double */

		/* The precision is fixed because of the operands' formats:
		   the operands are double and double-double
		*/

		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul123(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%sh,%sm);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,variableNumber-1,tempVarNum[variableNumber-1],
                                    ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 47;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 154, 3, currOverlap, resultName, 1, 1, operand1Name, 2, 2, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }
	      break;
	    case 1:
	      switch (comingFormat) {
	      case 3:
		/* Multiply the triple-double temporary by a double x, produce a triple-double */

		/* We have to check the precision of the operation which depends
		   on the overlap of the entering triple-double operands.
		   The overlap of x is fixed by hypothesis, so the precision
		   depends only on the overlap of the entering temporary.
		   If the precision is not sufficient, we renormalize.
		*/
		t = 0; t2 = 0;
		if (mulPrec[i] > (100 + currOverlap)) {
		  /* We must renormalize the temporary */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                      name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  currOverlap = 52;
		  tempVarNum[variableNumber-1]++;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                       name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  t = c; t2 = c2;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		producedFormat = 3;
		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul133(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    ((variablename == NULL) ? "_x_" : variablename),
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		oldCurrOverlap = currOverlap;
		currOverlap = MIN(47,currOverlap-5);
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 100 + oldCurrOverlap, 3, currOverlap, resultName, 1, 1, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      case 2:
		/* Multiply the double-double temporary by a double x, produce a triple-double */

		/* The precision is fixed because of the operands' formats:
		   the operands are double and double-double
		*/

		producedFormat = 3;
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul123(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s,%s_t_%d_%dh,%s_t_%d_%dm);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    ((variablename == NULL) ? "_x_" : variablename),
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 47;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 154, 3, currOverlap, resultName, 1, 1, operand1Name, 2, 2, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      default:
		/* Multiply the double temporary by a double x, produce a double-double */

		/* The precision is fixed because of the operands' formats:
		   both operands are doubles, we produce an exact double-double
		*/

		producedFormat = 2;
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul12(&%s_t_%d_%dh,&%s_t_%d_%dm,%s,%s_t_%d_%dh);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    ((variablename == NULL) ? "_x_" : variablename),
                                    name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 53;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		  newAssign = newGappaOperation(GAPPA_MUL_EXACT, -1, 2, 53, resultName, 1, 1, operand1Name, 1, 1, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }
	      break;
	    default:
	      printMessage(1,SOLLYA_MSG_IMPLEMENTPOLY_FREE_VAR_HAS_UNKNOWN_FORMAT,"Warning: the variable %s has an unknown format. This should not occur.\n",((variablename == NULL) ? "_x_" : variablename));
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
	      res = 0;
	      producedFormat = 1;
	    }
	  } else {
	    producedFormat = 3;
	    if (k == 2) {
	      /* Multiply by x^2, which is a double-double if x is a double or a triple-double otherwise */
	      if (variablePrecision == 1) {
		/* Multiply comingFormat by a double-double x^2, produce a triple-double */
		switch (comingFormat) {
		case 3:
		  /* Multiply the triple-double temporary by a double-double x^2, produce a triple-double */

		  /* We have to check the precision of the operation which depends
		     on the overlap of the entering triple-double operands.
		     The second operand is x^2 as a double-double, so the precision
		     depends only on the overlap of the entering temporary.
		     If the precision is not sufficient, we renormalize.
		  */
		  t = 0; t2 = 0;
		  if (mulPrec[i] > (97 + currOverlap)) {
		    /* We must renormalize the temporary */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                        name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                        name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    currOverlap = 52;
		    tempVarNum[variableNumber-1]++;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                         name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    t = c; t2 = c2;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }

		  c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                      "Mul233(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		  c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		  oldCurrOverlap = currOverlap;
		  currOverlap = MIN(48,currOverlap-4);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 97 + oldCurrOverlap, 3, currOverlap, resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		case 2:
		  /* Multiply the double-double temporary by a double-double x^2, produce a triple-double */

		  /* The precision is fixed because of the operands' formats:
		     both operands are double-doubles
		  */

		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Mul23(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_t_%d_%dh,%s_t_%d_%dm);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  currOverlap = 49;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 149, 3, currOverlap, resultName, 2, 2, operand1Name, 2, 2, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		default:
		  /* Multiply the double temporary by a double-double x^2, produce a triple-double */

		  /* The precision is fixed because of the operands' formats:
		     the operands are a double and a double-double
		  */

		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Mul123(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_%s_%d_pow2h,%s_%s_%d_pow2m);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  currOverlap = 47;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 154, 3, currOverlap, resultName, 1, 1, operand1Name, 2, 2, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
	      } else {
		/* Multiply comingFormat by a triple-double x^2, produce a triple-double */
		switch (comingFormat) {
		case 3:
		  /* Multiply the triple-double temporary by a triple-double x^2, produce a triple-double */

		  /* We have to check the precision of the operation which depends
		     on the overlap of the entering triple-double operands.

		     The precision is roughly 97 + min(overlaps) bits.
		     If it is not sufficient, we renormalize first the operands with
		     the higher overlap (lower value), check again and renormalize once
		     again if needed.
		  */

		  t = 0; t2 = 0;
		  if (mulPrec[i] > (97 + MIN(currOverlap,powerOverlaps[1]))) {
		    /* The precision is not sufficient, we have to renormalize at least one operand */
		    if (currOverlap < powerOverlaps[1]) {
		      /* We have to renormalize first the temporary */
		      c = sollya_snprintf(buffer1,CODESIZE,
                                          "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                          name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                          name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		      if ((c < 0) || (c >= CODESIZE)) res = 0;
		      tempVarNum[variableNumber-1]++;
		      c2 = sollya_snprintf(buffer2,CODESIZE,
                                           "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                           name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		      if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		      t = c; t2 = c2;
		      currOverlap = 52;
		      if (gappaAssign != NULL) {
			sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
			sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
			newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
			*gappaAssign = addElement(*gappaAssign,newAssign);
		      }
		    } else {
		      /* We have to renormalize first x^2 */
		      c = sollya_snprintf(buffer1,CODESIZE,
                                          "Renormalize3(&%s_%s_%d_pow2h,&%s_%s_%d_pow2m,&%s_%s_%d_pow2l,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2l);\n",
                                          name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,
                                          name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		      powVarNum[1]++;
		      if ((c < 0) || (c >= CODESIZE)) res = 0;
		      c2 = sollya_snprintf(buffer2,CODESIZE,
                                           "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                           name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
		      if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		      t = c; t2 = c2;
		      powerOverlaps[1] = 52;
		      if (gappaAssign != NULL) {
			sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
			sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]-1,2);
			newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[1], resultName, 3, 3, operand1Name, 0, 0, NULL);
			*gappaAssign = addElement(*gappaAssign,newAssign);
		      }
		    }
		    if (mulPrec[i] > (97 + MIN(currOverlap,powerOverlaps[1]))) {
		      /* The precision is still not sufficient, we have to renormalize the other operand */
		      if (currOverlap <= powerOverlaps[1]) {
			/* We have to renormalize the temporary */
			c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                            "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                            name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                            name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
			if ((c < 0) || (c >= CODESIZE-t)) res = 0;
			tempVarNum[variableNumber-1]++;
			t += c;
			currOverlap = 52;
			c2 = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                             "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                             name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
			if ((c2 < 0) || (c2 >= CODESIZE-t2)) res = 0;
			t2 += c2;
			if (gappaAssign != NULL) {
			  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
			  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
			  newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
			  *gappaAssign = addElement(*gappaAssign,newAssign);
			}
		      } else {
			/* We have to renormalize x^2 */
			c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                            "Renormalize3(&%s_%s_%d_pow2h,&%s_%s_%d_pow2m,&%s_%s_%d_pow2l,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2l);\n",
                                            name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,
                                            name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
			powVarNum[1]++;
			if ((c < 0) || (c >= CODESIZE-t)) res = 0;
			c2 = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                             "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                             name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
			if ((c2 < 0) || (c2 >= CODESIZE-t2)) res = 0;
			t += c; t2 += c2;
			powerOverlaps[1] = 52;
			if (gappaAssign != NULL) {
			  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
			  sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]-1,2);
			  newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[1], resultName, 3, 3, operand1Name, 0, 0, NULL);
			  *gappaAssign = addElement(*gappaAssign,newAssign);
			}
		      }
		    }
		  }

		  c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                      "Mul33(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2l,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		  c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		  oldCurrOverlap = currOverlap;
		  currOverlap = MIN(48,MIN(currOverlap,powerOverlaps[1])-4);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, (97 + MIN(oldCurrOverlap,powerOverlaps[1])), 3, currOverlap, resultName, 3, 3, operand1Name, 3, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		case 2:
		  /* Multiply the double-double temporary by a triple-double x^2, produce a triple-double */

		  /* We have to check the precision of the operation which depends
		     on the overlap of the entering triple-double operands.
		     The temporary is a double-double, so the precision only depends
		     on the triple-double x^2
		     If the precision is not sufficient, we renormalize.
		  */
		  t = 0; t2 = 0;
		  if (mulPrec[i] > (97 + powerOverlaps[1])) {
		    /* We must renormalize the power */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_%s_%d_pow2h,&%s_%s_%d_pow2m,&%s_%s_%d_pow2l,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2l);\n",
                                        name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    powVarNum[1]++;
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                         name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    powerOverlaps[1] = 52;
		    t = c; t2 = c2;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]-1,2);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[1], resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }

		  c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                      "Mul233(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2l);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		  if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		  c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		  currOverlap = MIN(48,powerOverlaps[1]-4);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 97 + powerOverlaps[1], 3, currOverlap, resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		default:
		  /* Multiply the double temporary by a triple-double x^2, produce a triple-double */

		  /* We have to check the precision of the operation which depends
		     on the overlap of the entering triple-double operands.
		     The temporary is a double, so the precision only depends
		     on the triple-double x^2
		     If the precision is not sufficient, we renormalize.
		  */
		  t = 0; t2 = 0;
		  if (mulPrec[i] > (100 + powerOverlaps[1])) {
		    /* We must renormalize the power */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_%s_%d_pow2h,&%s_%s_%d_pow2m,&%s_%s_%d_pow2l,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2l);\n",
                                        name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    powVarNum[1]++;
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                         name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    powerOverlaps[1] = 52;
		    t = c; t2 = c2;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]-1,2);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[1], resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }

		  c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                      "Mul133(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2l);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		  if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		  c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		  currOverlap = MIN(47,powerOverlaps[1] - 5);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 100 + powerOverlaps[1], 3, currOverlap, resultName, 1, 1, operand1Name, 3, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
	      }
	    } else {
	      /* Multiply by x^k, which is in any case a triple-double, produce a triple-double */
	      switch (comingFormat) {
	      case 3:
		/* Multiply the triple-double temporary by a triple-double x^k, produce a triple-double */

		/* We have to check the precision of the operation which depends
		   on the overlap of the entering triple-double operands.

		   The precision is roughly 97 + min(overlaps) bits.
		   If it is not sufficient, we renormalize first the operands with
		   the higher overlap (lower value), check again and renormalize once
		   again if needed.
		*/

		t = 0; t2 = 0;
		if (mulPrec[i] > (97 + MIN(currOverlap,powerOverlaps[k-1]))) {
		  /* The precision is not sufficient, we have to renormalize at least one operand */
		  if (currOverlap < powerOverlaps[k-1]) {
		    /* We have to renormalize first the temporary */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                        name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                        name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    t = c;
		    tempVarNum[variableNumber-1]++;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                         name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    t2 = c2;
		    currOverlap = 52;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  } else {
		    /* We have to renormalize first x^k */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                        name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,
                                        name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		    powVarNum[k-1]++;
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                         name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    t = c; t2 = c2;
		    powerOverlaps[k-1] = 52;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]-1,k);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[k-1], resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }
		  if (mulPrec[i] > (97 + MIN(currOverlap,powerOverlaps[k-1]))) {
		    /* The precision is still not sufficient, we have to renormalize the other operand */
		    if (currOverlap <= powerOverlaps[k-1]) {
		      /* We have to renormalize the temporary */
		      c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                          "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                          name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                          name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		      if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		      t += c;
		      tempVarNum[variableNumber-1]++;
		      c2 = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                           "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                           name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		      if ((c2 < 0) || (c2 >= CODESIZE-t2)) res = 0;
		      t2 += c2;
		      currOverlap = 52;
		      if (gappaAssign != NULL) {
			sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
			sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
			newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
			*gappaAssign = addElement(*gappaAssign,newAssign);
		      }
		    } else {
		      /* We have to renormalize x^k */
		      c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                          "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                          name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,
                                          name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		      powVarNum[k-1]++;
		      if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		      c2 = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                           "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                           name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		      if ((c2 < 0) || (c2 >= CODESIZE-t2)) res = 0;
		      t += c; t2 += c2;
		      powerOverlaps[k-1] = 52;
		      if (gappaAssign != NULL) {
			sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
			sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]-1,k);
			newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[k-1], resultName, 3, 3, operand1Name, 0, 0, NULL);
			*gappaAssign = addElement(*gappaAssign,newAssign);
		      }
		    }
		  }
		}

		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul33(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		oldCurrOverlap = currOverlap;
		currOverlap = MIN(48,MIN(currOverlap,powerOverlaps[k-1])-4);
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 97 + MIN(oldCurrOverlap,powerOverlaps[k-1]), 3, currOverlap, resultName, 3, 3, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      case 2:
		/* Multiply the double-double temporary by a triple-double x^k, produce a triple-double */

		/* We have to check the precision of the operation which depends
		   on the overlap of the entering triple-double operands.
		   The temporary is a double-double, so the precision only depends
		   on the triple-double x^k
		   If the precision is not sufficient, we renormalize.
		*/
		t = 0; t2 = 0;
		if (mulPrec[i] > (97 + powerOverlaps[k-1])) {
		  /* We must renormalize the power */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  powVarNum[k-1]++;
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                       name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  powerOverlaps[k-1] = 52;
		  t = c; t2 = c2;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]-1,k);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[k-1], resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul233(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],
                                    name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		currOverlap = MIN(48,powerOverlaps[k-1]-4);
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 97 + powerOverlaps[k-1], 3, currOverlap, resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      default:
		/* Multiply the double temporary by a triple-double x^k, produce a triple-double */

		/* We have to check the precision of the operation which depends
		   on the overlap of the entering triple-double operands.
		   The temporary is a double-double, so the precision only depends
		   on the triple-double x^k
		   If the precision is not sufficient, we renormalize.
		*/
		t = 0; t2 = 0;
		if (mulPrec[i] > (100 + powerOverlaps[k-1])) {
		  /* We must renormalize the power */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  powVarNum[k-1]++;
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                       name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  powerOverlaps[k-1] = 52;
		  t = c; t2 = c2;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]-1,k);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[k-1], resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul133(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,variableNumber-1,tempVarNum[variableNumber-1],
                                    name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		currOverlap = MIN(47,powerOverlaps[k-1]-5);
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 100 + powerOverlaps[k-1], 3, currOverlap, resultName, 1, 1, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }
	    }
	  }
	} else {
	  if (mulPrec[i] > 53) {
	    /* Produce a double-double */
	    producedFormat = 2;
	    currOverlap = 53;
	    if (k == 1) {
	      /* Multiply comingFormat by x as a double or double-double (or better), produce a double-double */
	      switch (variablePrecision) {
	      case 3:
	      case 2:
		/* Multiply comingFormat by x as a double-double (or better), produce a double-double */
		switch (comingFormat) {
		case 3:
		  printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions. This should not occur.\n");
		  printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		  res = 0;
		  break;
		case 2:
		  /* Multiply the double-double temporary by x as double-double (or better), produce a double-double */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Mul22(&%s_t_%d_%dh,&%s_t_%d_%dm,%s_t_%d_%dh,%s_t_%d_%dm,%sh,%sm);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],
                                      ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 2, 2, operand1Name, 2, variablePrecision, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		default:
		  /* Multiply the double temporary by x as a double-double (or better), produce a double-double */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Mul122(&%s_t_%d_%dh,&%s_t_%d_%dm,%s_t_%d_%dh,%sh,%sm);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],
                                      ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 1, 1, operand1Name, 2, variablePrecision, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
		break;
	      case 1:
		/* Multiply comingFormat by x as a double, produce a double-double */
		switch (comingFormat) {
		case 3:
		  printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions. This should not occur.\n");
		  printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		  res = 0;
		  break;
		case 2:
		  /* Multiply the double-double temporary by x as double, produce a double-double */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Mul122(&%s_t_%d_%dh,&%s_t_%d_%dm,%s,%s_t_%d_%dh,%s_t_%d_%dm);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      ((variablename == NULL) ? "_x_" : variablename),
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 1, 1, operand1Name, 2, 2, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		default:
		  /* Multiply the double temporary by x as a double, produce a double-double */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Mul12(&%s_t_%d_%dh,&%s_t_%d_%dm,%s,%s_t_%d_%dh);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      ((variablename == NULL) ? "_x_" : variablename),
                                      name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    newAssign = newGappaOperation(GAPPA_MUL_EXACT, -1, 2, 53, resultName, 1, 1, operand1Name, 1, 1, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
		break;
	      default:
		printMessage(1,SOLLYA_MSG_IMPLEMENTPOLY_FREE_VAR_HAS_UNKNOWN_FORMAT,"Warning: the variable %s has an unknown format. This should not occur.\n",((variablename == NULL) ? "_x_" : variablename));
		printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		res = 0;
	      }
	    } else {
	      /* Multiply comingFormat by x^k which should be at least a double-double in any case */
	      switch (comingFormat) {
	      case 3:
		printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions. This should not occur.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		res = 0;
		break;
	      case 2:
		/* Multiply the double-double temporary by x^k as double-double, produce a double-double */

		/* We have to check that if x^k is actually a triple-double that is read as a double-double
		   that the precision obtained is sufficient regardless of the overlap in the triple-double
		   The obtained precision is roughly 53 + overlap value. If it is not sufficient,
		   we renormalize the whole triple-double value.
		*/

		t = 0; t2 = 0;
		if ((powerOverlaps[k-1] < 53) && (mulPrec[i] > (53 + powerOverlaps[k-1]))) {
		  /* We must renormalize the power */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  powVarNum[k-1]++;
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                       name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  powerOverlaps[k-1] = 52;
		  t = c; t2 = c2;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]-1,k);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[k-1], resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul22(&%s_t_%d_%dh,&%s_t_%d_%dm,%s_t_%d_%dh,%s_t_%d_%dm,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],
                                    name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		if (gappaAssign != NULL) {
		  if (powerOverlaps[k-1] < 53) op2format = 3; else op2format = 2;
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 2, 2, operand1Name, 2, op2format, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      default:
		/* Multiply the double temporary by x^k as a double-double, produce a double-double */

		/* We have to check that if x^k is actually a triple-double that is read as a double-double
		   that the precision obtained is sufficient regardless of the overlap in the triple-double
		   The obtained precision is roughly 53 + overlap value. If it is not sufficient,
		   we renormalize the whole triple-double value.
		*/

		t = 0; t2 = 0;
		if ((powerOverlaps[k-1] < 53) && (mulPrec[i] > (53 + powerOverlaps[k-1]))) {
		  /* We must renormalize the power */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  powVarNum[k-1]++;
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  powerOverlaps[k-1] = 52;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                       name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  t = c; t2 = c2;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]-1,k);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[k-1], resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul122(&%s_t_%d_%dh,&%s_t_%d_%dm,%s_t_%d_%dh,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,variableNumber-1,tempVarNum[variableNumber-1],
                                    name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		if (gappaAssign != NULL) {
		  if (powerOverlaps[k-1] < 53) op2format = 3; else op2format = 2;
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 1, 1, operand1Name, 2, op2format, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }
	    }
	  } else {
	    /* Produce a double */
	    producedFormat = 1;
	    currOverlap = 53;
	    if (k == 1) {
	      /* Multiply by x as a double (or better) */
	      if (comingFormat == 1) {
		switch (variablePrecision) {
		case 3:
		case 2:
		  /* Multiply the double temporary by x as a double-double (or better) read as a double,
		     produce a double
		  */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_t_%d_%dh = %s_t_%d_%dh * %sh;",
                                      name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],
                                      ((variablename == NULL) ? "_x_" : variablename));
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh;",
                                      name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));

		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, 1, operand1Name, 1, variablePrecision, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		case 1:
		  /* Multiply the double temporary by x as a double, produce a double */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_t_%d_%dh = %s_t_%d_%dh * %s;",
                                      name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],
                                      ((variablename == NULL) ? "_x_" : variablename));
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh;",
                                      name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));

		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, 1, operand1Name, 1, 1, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		default:
		  printMessage(1,SOLLYA_MSG_IMPLEMENTPOLY_FREE_VAR_HAS_UNKNOWN_FORMAT,"Warning: the variable %s has an unknown format. This should not occur.\n",((variablename == NULL) ? "_x_" : variablename));
		  printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		  res = 0;
		}
	      } else {
		printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions. This should not occur.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		res = 0;
	      }
	    } else {
	      if (comingFormat == 1) {
		/* Multiply the double temporary by x^k as a double (or better) */

		/* We have to check that if x^k is actually a triple-double that is read as a double
		   that the precision obtained is sufficient regardless of the overlap in the triple-double
		   The obtained precision is roughly the overlap value. If it is not sufficient,
		   we use valueh + valuem instead of valueh.
		*/

		if ((powerOverlaps[k-1] < 53) && (mulPrec[i] > (53 + powerOverlaps[k-1]))) {
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_t_%d_%dh = %s_t_%d_%dh * (%s_%s_%d_pow%dh + %s_%s_%d_pow%dm);",
                                      name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);

		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, 1, operand1Name, 2, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		} else {
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_t_%d_%dh = %s_t_%d_%dh * %s_%s_%d_pow%dh;",
                                      name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  if (gappaAssign != NULL) {
		    if (powerOverlaps[k-1] < 53) op2format = 3; else op2format = 2;
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);

		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, 1, operand1Name, 1, op2format, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh;",
                                    name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
	      } else {
		printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions. This should not occur.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		res = 0;
	      }
	    }
	  }
	}

	variableNumber++;
	comingFormat = producedFormat;

	/* Issue the multiplication to memory */
	c = sollya_snprintf(codeIssue,CODESIZE-issuedCode,"%s\n",buffer1);
	if (c < 0) {
	  res = 0;
	  c = 0;
	}
	if (c >= CODESIZE-issuedCode) {
	  res = 0;
	  c = CODESIZE-issuedCode;
	}
	issuedCode += c;
	codeIssue += c;
	c = sollya_snprintf(variablesIssue,CODESIZE-issuedVariables,"%s\n",buffer2);
	if (c < 0) {
	  res = 0;
	  c = 0;
	}
	if (c >= CODESIZE-issuedVariables) {
	  res = 0;
	  c = CODESIZE-issuedVariables;
	}
	issuedVariables += c;
	variablesIssue += c;

	/* Generate the addition with the next coefficient in the buffer */
	/* addPrec[i] indicates the format to produce
	   coeffFormat = determineCoefficientFormat(coefficients[i]) indicates
	   the format of the coefficient
	*/

	if (addPrec[i] > 102) {
	  /* Produce a triple-double or an exact double-double result
	     The result is a double-double if comingFormat is a double and the coefficient is a double
	  */
	  switch (comingFormat) {
	  case 3:
	    /* Add the coefficient to the triple-double temporary, produce a triple-double */
	    producedFormat = 3;
	    switch (coeffFormat) {
	    case 3:
	      /* Add the triple-double coefficient to the triple-double temporary, produce a triple-double */

	      /* We have to check the precision of the operation which depends
		 on the overlap of the entering triple-double operands.
		 The overlap of the coefficient is zero because the coefficient is correctly rounded.
		 The precision depends thus only on the overlap of the coming temporary value.
		 If the precision is not sufficient, we renormalize.
	      */
	      t = 0; t2 = 0;
	      if (addPrec[i] > (97 + currOverlap)) {
		/* We must renormalize the temporary */
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                    name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 52;
		tempVarNum[variableNumber-1]++;
		c2 = sollya_snprintf(buffer2,CODESIZE,
                                     "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                     name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		t = c; t2 = c2;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
		  newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }

	      c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                  "Add33(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_coeff_%dh,%s_coeff_%dm,%s_coeff_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                  name,i,name,i,name,i,
                                  name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
	      if ((c < 0) || (c >= CODESIZE-t)) res = 0;
	      c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                  "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
	      if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
	      oldCurrOverlap = currOverlap;
	      currOverlap = currOverlap - 5;
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
		sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		newAssign = newGappaOperation(GAPPA_ADD_REL, 97 + oldCurrOverlap, 3, currOverlap, resultName, 3, 3, operand1Name, 3, 3, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	      break;
	    case 2:
	      /* Add the double-double coefficient to the triple-double temporary, produce a triple-double */

	      /* We have to check the precision of the operation which depends
		 on the overlap of the entering triple-double operands.
		 The overlap of the coefficient is zero because the coefficient is correctly rounded.
		 The precision depends thus only on the overlap of the coming temporary value.
		 If the precision is not sufficient, we renormalize.
	      */
	      t = 0; t2 = 0;
	      if (addPrec[i] > (103 + currOverlap)) {
		/* We must renormalize the temporary */
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                    name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 52;
		tempVarNum[variableNumber-1]++;
		c2 = sollya_snprintf(buffer2,CODESIZE,
                                     "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                     name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		t = c; t2 = c2;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
		  newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }

	      c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                  "Add233(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_coeff_%dh,%s_coeff_%dm,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                  name,i,name,i,
                                  name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
	      if ((c < 0) || (c >= CODESIZE+t)) res = 0;
	      c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                  "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
	      if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
	      oldCurrOverlap = currOverlap;
	      currOverlap = MIN(45,currOverlap - 5);
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
		sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		newAssign = newGappaOperation(GAPPA_ADD_REL, 103 + oldCurrOverlap, 3, currOverlap, resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	      break;
	    case 1:
	      /* Add the double coefficient to the triple-double temporary, produce a triple-double */

	      /* We have to check the precision of the operation which depends
		 on the overlap of the entering triple-double operands.
		 The overlap of the coefficient is zero because the coefficient is correctly rounded.
		 The precision depends thus only on the overlap of the coming temporary value.
		 If the precision is not sufficient, we renormalize.
	      */
	      t = 0; t2 = 0;
	      if (addPrec[i] > (104 + currOverlap)) {
		/* We must renormalize the temporary */
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                    name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 52;
		tempVarNum[variableNumber-1]++;
		c2 = sollya_snprintf(buffer2,CODESIZE,
                                     "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                     name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		t = c; t2 = c2;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
		  newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }

	      c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                  "Add133(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_coeff_%dh,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                  name,i,
                                  name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
	      if ((c < 0) || (c >= CODESIZE-t)) res = 0;
	      c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                  "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
	      if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
	      oldCurrOverlap = currOverlap;
	      currOverlap = MIN(47,currOverlap - 2);
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
		sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		newAssign = newGappaOperation(GAPPA_ADD_REL, 104 + oldCurrOverlap, 3, currOverlap, resultName, 1, 1, operand1Name, 3, 3, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }

	      break;
	    default:
	      printMessage(1,SOLLYA_MSG_A_COEFF_COULD_NOT_BE_STORED_IN_ANY_KNOWN_FORMAT,"Warning: a coefficient could not be stored in a known format. The implementation may be wrong.\n");
	      res = 0;
	    }
	    break;
	  case 2:
	    /* Add the coefficient to the double-double temporary, produce a triple-double */
	    producedFormat = 3;
	    switch (coeffFormat) {
	    case 3:
	      /* Add the triple-double coefficient to the double-double temporary, produce a triple-double */

	      /* The precision of the following operation is fixed because the temporary is a double-double
		 and the coefficient is correctly rounded.
	      */

	      c = sollya_snprintf(buffer1,CODESIZE,
                                  "Add233Cond(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_coeff_%dh,%s_coeff_%dm,%s_coeff_%dl);",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                  name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],
                                  name,i,name,i,name,i);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      c = sollya_snprintf(buffer2,CODESIZE,
                                  "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      currOverlap = 45; /* TODO: Verify this value */
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		sollya_snprintf(operand2Name,CODESIZE,"%s_coeff_%d",name,i);
		sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		newAssign = newGappaOperation(GAPPA_ADD_REL, 152, 3, currOverlap, resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }

	      break;
	    case 2:
	      /* Add the double-double coefficient to the double-double temporary, produce a triple-double */

	      /* The precision of the following operation is fixed because the temporary is a double-double
		 and the coefficient is correctly rounded.
	      */

	      c = sollya_snprintf(buffer1,CODESIZE,
                                  "Add23(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_coeff_%dh,%s_coeff_%dm,%s_t_%d_%dh,%s_t_%d_%dm);",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                  name,i,name,i,
                                  name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      c = sollya_snprintf(buffer2,CODESIZE,
                                  "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      currOverlap = 45; /* TODO: verify this value and precision bound below */
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
		sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		newAssign = newGappaOperation(GAPPA_ADD_REL, 140, 3, currOverlap, resultName, 2, 2, operand1Name, 2, 2, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	      break;
	    case 1:
	      /* Add the double coefficient to the double-double temporary, produce a triple-double */

	      /* The precision of the following operation is fixed because the temporary is a double-double
		 and the coefficient is a double.
	      */

	      c = sollya_snprintf(buffer1,CODESIZE,
                                  "Add123(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_coeff_%dh,%s_t_%d_%dh,%s_t_%d_%dm);",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                  name,i,
                                  name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      c = sollya_snprintf(buffer2,CODESIZE,
                                  "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      currOverlap = 52;
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
		sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		newAssign = newGappaOperation(GAPPA_ADD_REL, 159, 3, currOverlap, resultName, 1, 1, operand1Name, 2, 2, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	      break;
	    default:
	      printMessage(1,SOLLYA_MSG_A_COEFF_COULD_NOT_BE_STORED_IN_ANY_KNOWN_FORMAT,"Warning: a coefficient could not be stored in a known format. The implementation may be wrong.\n");
	      res = 0;
	    }
	    break;
	  default:
	    /* Add the coefficient to the double temporary, produce a triple-double or a double-double */
	    switch (coeffFormat) {
	    case 3:
	      /* Add the triple-double coefficient to the double temporary, produce a triple-double */

	      /* The precision of the following operation is fixed because the temporary is a double-double
		 and the coefficient is correctly rounded.
	      */

	      producedFormat = 3;
	      c = sollya_snprintf(buffer1,CODESIZE,
                                  "Add133Cond(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_coeff_%dh,%s_coeff_%dm,%s_coeff_%dl);",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                  name,variableNumber-1,tempVarNum[variableNumber-1],
                                  name,i,name,i,name,i);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      c = sollya_snprintf(buffer2,CODESIZE,
                                  "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      currOverlap = 47; /* TODO: Verify this value and the precision bound below */
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		sollya_snprintf(operand2Name,CODESIZE,"%s_coeff_%d",name,i);
		sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		newAssign = newGappaOperation(GAPPA_ADD_REL, 140, 3, currOverlap, resultName, 1, 1, operand1Name, 3, 3, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	      break;
	    case 2:
	      /* Add the double-double coefficient to the double temporary, produce a triple-double */
	      producedFormat = 3;

	      /* The precision of the following operation is fixed because the temporary is a double
		 and the coefficient is correctly rounded.
	      */

	      c = sollya_snprintf(buffer1,CODESIZE,
                                  "Add213(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_coeff_%dh,%s_coeff_%dm,%s_t_%d_%dh);",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                  name,i,name,i,
                                  name,variableNumber-1,tempVarNum[variableNumber-1]);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      c = sollya_snprintf(buffer2,CODESIZE,
                                  "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      currOverlap = 47; /* TODO: Verify this value */
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
		sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		newAssign = newGappaOperation(GAPPA_ADD_REL, 159, 3, currOverlap, resultName, 2, 2, operand1Name, 1, 1, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	      break;
	    case 1:
	      /* Add the double coefficient to the double temporary, produce a double-double */

	      /* The precision of the following operation is fixed because it is exact. */

	      producedFormat = 2;
	      c = sollya_snprintf(buffer1,CODESIZE,
                                  "Add12(%s_t_%d_%dh,%s_t_%d_%dm,%s_coeff_%dh,%s_t_%d_%dh);",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                  name,i,
                                  name,variableNumber-1,tempVarNum[variableNumber-1]);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      c = sollya_snprintf(buffer2,CODESIZE,
                                  "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                  name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
	      if ((c < 0) || (c >= CODESIZE)) res = 0;
	      currOverlap = 53;
	      if (gappaAssign != NULL) {
		sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
		sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		newAssign = newGappaOperation(GAPPA_ADD_EXACT, -1, 2, currOverlap, resultName, 1, 1, operand1Name, 1, 1, operand2Name);
		*gappaAssign = addElement(*gappaAssign,newAssign);
	      }
	      break;
	    default:
	      printMessage(1,SOLLYA_MSG_A_COEFF_COULD_NOT_BE_STORED_IN_ANY_KNOWN_FORMAT,"Warning: a coefficient could not be stored in a known format. The implementation may be wrong.\n");
	      res = 0;
	    }
	  }
	} else {
	  if (addPrec[i] > 53) {
	    producedFormat = 2;
	    currOverlap = 53;
	    /* Produce a double-double */
	    switch (comingFormat) {
	    case 3:
	      printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions. This should not occur.\n");
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
	      res = 0;
	      break;
	    case 2:
	      /* Add the coefficient to the double-double temporary, produce a double-double */
	      switch (coeffFormat) {
	      case 3:
		printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions in coefficient rounding. This should not occur.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		res = 0;
		break;
	      case 2:
		/* Add the double-double coefficient to the double-double temporary, produce a double-double */
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Add22(&%s_t_%d_%dh,&%s_t_%d_%dm,%s_coeff_%dh,%s_coeff_%dm,%s_t_%d_%dh,%s_t_%d_%dm);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,i,name,i,
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		  newAssign = newGappaOperation(GAPPA_ADD_REL, 102, 2, currOverlap, resultName, 2, 2, operand1Name, 2, 2, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      case 1:
		/* Add the double coefficient to the double-double temporary, produce a double-double */

		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Add122(&%s_t_%d_%dh,&%s_t_%d_%dm,%s_coeff_%dh,%s_t_%d_%dh,%s_t_%d_%dm);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,i,
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		/* TODO: verify the following precision bound */
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		  newAssign = newGappaOperation(GAPPA_ADD_REL, 102, 2, currOverlap, resultName, 1, 1, operand1Name, 2, 2, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      default:
		printMessage(1,SOLLYA_MSG_A_COEFF_COULD_NOT_BE_STORED_IN_ANY_KNOWN_FORMAT,"Warning: a coefficient could not be stored in a known format. The implementation may be wrong.\n");
		res = 0;
	      }
	      break;
	    default:
	      /* Add the coefficient to the double temporary, produce a double-double */
	      switch (coeffFormat) {
	      case 3:
		printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions in coefficient rounding. This should not occur.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		res = 0;
		break;
	      case 2:
		/* Add the double-double coefficient to the double temporary, produce a double-double */

		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Add212(&%s_t_%d_%dh,&%s_t_%d_%dm,%s_coeff_%dh,%s_coeff_%dm,%s_t_%d_%dh);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,i,name,i,
                                    name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		/* TODO: verify the following precision bound */
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		  newAssign = newGappaOperation(GAPPA_ADD_REL, 102, 2, currOverlap, resultName, 2, 2, operand1Name, 1, 1, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      case 1:
		/* Add the double coefficient to the double temporary, produce a double-double */
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Add12(%s_t_%d_%dh,%s_t_%d_%dm,%s_coeff_%dh,%s_t_%d_%dh);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,i,
                                    name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		  newAssign = newGappaOperation(GAPPA_ADD_EXACT, -1, 2, currOverlap, resultName, 1, 1, operand1Name, 1, 1, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      default:
		printMessage(1,SOLLYA_MSG_A_COEFF_COULD_NOT_BE_STORED_IN_ANY_KNOWN_FORMAT,"Warning: a coefficient could not be stored in a known format. The implementation may be wrong.\n");
		res = 0;
	      }
	    }
	  } else {
	    /* Produce a double */
	    producedFormat = 1;
	    currOverlap = 53;
	    if (comingFormat == 1) {
	      if (coeffFormat == 1) {
		/* Add the double coefficient to the double temporary, produce a double */
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "%s_t_%d_%dh = %s_coeff_%dh + %s_t_%d_%dh;",
                                    name,variableNumber,tempVarNum[variableNumber],
                                    name,i,
                                    name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh;",
                                    name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_coeff_%d",name,i);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		  newAssign = newGappaOperation(GAPPA_ADD_DOUBLE, 53, 1, -1, resultName, 1, 1, operand1Name, 1, 1, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      } else {
		printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions in coefficient rounding. This should not occur.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		res = 0;
	      }
	    } else {
	      printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions. This should not occur.\n");
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
	      res = 0;
	    }
	  }
	}

	variableNumber++;
	comingFormat = producedFormat;

	/* Issue the addition to memory */
	c = sollya_snprintf(codeIssue,CODESIZE-issuedCode,"%s\n",buffer1);
	if (c < 0) {
	  res = 0;
	  c = 0;
	}
	if (c >= CODESIZE-issuedCode) {
	  res = 0;
	  c = CODESIZE-issuedCode;
	}
	issuedCode += c;
	codeIssue += c;
	c = sollya_snprintf(variablesIssue,CODESIZE-issuedVariables,"%s\n",buffer2);
	if (c < 0) {
	  res = 0;
	  c = 0;
	}
	if (c >= CODESIZE-issuedVariables) {
	  res = 0;
	  c = CODESIZE-issuedVariables;
	}
	issuedVariables += c;
	variablesIssue += c;

      } /* Special fused or normal case */

    } else {
      k--;
      if (k > 0) {
	/* The evaluation ends with the last multiplication by x or a power */
	i = 0;

	if (mulPrec[i] > 102) {
	  /* Produce a triple-double (or a double-double exactly if comingFormat = 1 and x as a double */
	  if (k == 1) {
	    /* Multiply by pure x as a double, double-double or triple-double */
	    switch (variablePrecision) {
	    case 3:
	      /* Multiply comingFormat by a triple-double x, produce a triple-double */
	      producedFormat = 3;
	      switch (comingFormat) {
	      case 3:
		/* Multiply the triple-double temporary by a triple-double x, produce a triple-double */

		/* We have to check the precision of the operation which depends
		   on the overlap of the entering triple-double operands.
		   The overlap of x is fixed by hypothesis, so the precision
		   depends only on the overlap of the entering temporary.
		   If the precision is not sufficient, we renormalize.
		*/
		t = 0; t2 = 0;
		if (mulPrec[i] > (97 + currOverlap)) {
		  /* We must renormalize the temporary */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                      name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  currOverlap = 52;
		  tempVarNum[variableNumber-1]++;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                       name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  t = c; t2 = c2;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul33(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%sh,%sm,%sl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		oldCurrOverlap = currOverlap;
		currOverlap = MIN(48,currOverlap-4);
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 97 + oldCurrOverlap, 3, currOverlap, resultName, 3, 3, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      case 2:
		/* Multiply the double-double temporary by a triple-double x, produce a triple-double */

		/* The precision is fixed because of the operands' formats:
		   - x is supposed to be non-overlapping by hypothesis
		   - the other operand is a double-double
		*/

		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul233(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%sh,%sm,%sl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],
                                    ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 48;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 149, 3, currOverlap, resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      default:
		/* Multiply the double temporary by a triple-double x, produce a triple-double */

		/* The precision is fixed because of the operands' formats:
		   - x is supposed to be non-overlapping by hypothesis
		   - the other operand is a double
		*/

		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul133(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%sh,%sm,%sl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],
                                    ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 47;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 149, 3, currOverlap, resultName, 1, 1, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }
	      break;
	    case 2:
	      producedFormat = 3;
	      switch (comingFormat) {
	      case 3:
		/* Multiply the triple-double temporary by a double-double x, produce a triple-double */

		/* We have to check the precision of the operation which depends
		   on the overlap of the entering triple-double operands.
		   The overlap of x is fixed by hypothesis, so the precision
		   depends only on the overlap of the entering temporary.
		   If the precision is not sufficient, we renormalize.
		*/
		t = 0; t2 = 0;
		if (mulPrec[i] > (97 + currOverlap)) {
		  /* We must renormalize the temporary */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                      name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  currOverlap = 52;
		  tempVarNum[variableNumber-1]++;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                       name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  t = c; t2 = c2;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul233(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%sh,%sm,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE+t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		oldCurrOverlap = currOverlap;
		currOverlap = MIN(48,currOverlap-4);
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 97 + oldCurrOverlap, 3, currOverlap, resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      case 2:
		/* Multiply the double-double temporary by a double-double x, produce a triple-double */

		/* The precision is fixed because of the operands' formats:
		   both operands are double-doubles
		*/

		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul23(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%sh,%sm,%s_t_%d_%dh,%s_t_%d_%dm);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 49;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 149, 3, currOverlap, resultName, 2, 2, operand1Name, 2, 2, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      default:
		/* Multiply the double temporary by a double-double x, produce a triple-double */

		/* The precision is fixed because of the operands' formats:
		   the operands are double and double-double
		*/

		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul123(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%sh,%sm);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,variableNumber-1,tempVarNum[variableNumber-1],
                                    ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 47;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 154, 3, currOverlap, resultName, 1, 1, operand1Name, 2, 2, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }
	      break;
	    case 1:
	      switch (comingFormat) {
	      case 3:
		/* Multiply the triple-double temporary by a double x, produce a triple-double */

		/* We have to check the precision of the operation which depends
		   on the overlap of the entering triple-double operands.
		   The overlap of x is fixed by hypothesis, so the precision
		   depends only on the overlap of the entering temporary.
		   If the precision is not sufficient, we renormalize.
		*/
		t = 0; t2 = 0;
		if (mulPrec[i] > (100 + currOverlap)) {
		  /* We must renormalize the temporary */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                      name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  currOverlap = 52;
		  tempVarNum[variableNumber-1]++;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                       name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  t = c; t2 = c2;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		producedFormat = 3;
		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul133(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    ((variablename == NULL) ? "_x_" : variablename),
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		oldCurrOverlap = currOverlap;
		currOverlap = MIN(47,currOverlap-5);
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 100 + oldCurrOverlap, 3, currOverlap, resultName, 1, 1, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      case 2:
		/* Multiply the double-double temporary by a double x, produce a triple-double */

		/* The precision is fixed because of the operands' formats:
		   the operands are double and double-double
		*/

		producedFormat = 3;
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul123(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s,%s_t_%d_%dh,%s_t_%d_%dm);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    ((variablename == NULL) ? "_x_" : variablename),
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 47;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 154, 3, currOverlap, resultName, 1, 1, operand1Name, 2, 2, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      default:
		/* Multiply the double temporary by a double x, produce a double-double */

		/* The precision is fixed because of the operands' formats:
		   both operands are doubles, we produce an exact double-double
		*/

		producedFormat = 2;
		c = sollya_snprintf(buffer1,CODESIZE,
                                    "Mul12(&%s_t_%d_%dh,&%s_t_%d_%dm,%s,%s_t_%d_%dh);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    ((variablename == NULL) ? "_x_" : variablename),
                                    name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		currOverlap = 53;
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		  newAssign = newGappaOperation(GAPPA_MUL_EXACT, -1, 2, 53, resultName, 1, 1, operand1Name, 1, 1, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }
	      break;
	    default:
	      printMessage(1,SOLLYA_MSG_IMPLEMENTPOLY_FREE_VAR_HAS_UNKNOWN_FORMAT,"Warning: the variable %s has an unknown format. This should not occur.\n",((variablename == NULL) ? "_x_" : variablename));
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
	      res = 0;
	      producedFormat = 1;
	    }
	  } else {
	    producedFormat = 3;
	    if (k == 2) {
	      /* Multiply by x^2, which is a double-double if x is a double or a triple-double otherwise */
	      if (variablePrecision == 1) {
		/* Multiply comingFormat by a double-double x^2, produce a triple-double */
		switch (comingFormat) {
		case 3:
		  /* Multiply the triple-double temporary by a double-double x^2, produce a triple-double */

		  /* We have to check the precision of the operation which depends
		     on the overlap of the entering triple-double operands.
		     The second operand is x^2 as a double-double, so the precision
		     depends only on the overlap of the entering temporary.
		     If the precision is not sufficient, we renormalize.
		  */
		  t = 0; t2 = 0;
		  if (mulPrec[i] > (97 + currOverlap)) {
		    /* We must renormalize the temporary */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                        name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                        name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    currOverlap = 52;
		    tempVarNum[variableNumber-1]++;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                         name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    t = c; t2 = c2;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }

		  c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                      "Mul233(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		  c = sollya_snprintf(buffer2+t2,CODESIZE+t2,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		  oldCurrOverlap = currOverlap;
		  currOverlap = MIN(48,currOverlap-4);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 97 + oldCurrOverlap, 3, currOverlap, resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		case 2:
		  /* Multiply the double-double temporary by a double-double x^2, produce a triple-double */

		  /* The precision is fixed because of the operands' formats:
		     both operands are double-doubles
		  */

		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Mul23(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_t_%d_%dh,%s_t_%d_%dm);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  currOverlap = 49;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 149, 3, currOverlap, resultName, 2, 2, operand1Name, 2, 2, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		default:
		  /* Multiply the double temporary by a double-double x^2, produce a triple-double */

		  /* The precision is fixed because of the operands' formats:
		     the operands are a double and a double-double
		  */

		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Mul123(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_%s_%d_pow2h,%s_%s_%d_pow2m);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  currOverlap = 47;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 154, 3, currOverlap, resultName, 1, 1, operand1Name, 2, 2, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
	      } else {
		/* Multiply comingFormat by a triple-double x^2, produce a triple-double */
		switch (comingFormat) {
		case 3:
		  /* Multiply the triple-double temporary by a triple-double x^2, produce a triple-double */

		  /* We have to check the precision of the operation which depends
		     on the overlap of the entering triple-double operands.

		     The precision is roughly 97 + min(overlaps) bits.
		     If it is not sufficient, we renormalize first the operands with
		     the higher overlap (lower value), check again and renormalize once
		     again if needed.
		  */

		  t = 0; t2 = 0;
		  if (mulPrec[i] > (97 + MIN(currOverlap,powerOverlaps[1]))) {
		    /* The precision is not sufficient, we have to renormalize at least one operand */
		    if (currOverlap < powerOverlaps[1]) {
		      /* We have to renormalize first the temporary */
		      c = sollya_snprintf(buffer1,CODESIZE,
                                          "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                          name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                          name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		      if ((c < 0) || (c >= CODESIZE)) res = 0;
		      t = c;
		      tempVarNum[variableNumber-1]++;
		      c2 = sollya_snprintf(buffer2,CODESIZE,
                                           "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                           name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		      if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		      t2 = c2;
		      currOverlap = 52;
		      if (gappaAssign != NULL) {
			sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
			sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
			newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
			*gappaAssign = addElement(*gappaAssign,newAssign);
		      }
		    } else {
		      /* We have to renormalize first x^2 */
		      c = sollya_snprintf(buffer1,CODESIZE,
                                          "Renormalize3(&%s_%s_%d_pow2h,&%s_%s_%d_pow2m,&%s_%s_%d_pow2l,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2l);\n",
                                          name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,
                                          name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		      powVarNum[1]++;
		      if ((c < 0) || (c >= CODESIZE)) res = 0;
		      c2 = sollya_snprintf(buffer2,CODESIZE,
                                           "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                           name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
		      if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		      t = c; t2 = c2;
		      powerOverlaps[1] = 52;
		      if (gappaAssign != NULL) {
			sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
			sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]-1,2);
			newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[1], resultName, 3, 3, operand1Name, 0, 0, NULL);
			*gappaAssign = addElement(*gappaAssign,newAssign);
		      }
		    }
		    if (mulPrec[i] > (97 + MIN(currOverlap,powerOverlaps[1]))) {
		      /* The precision is still not sufficient, we have to renormalize the other operand */
		      if (currOverlap <= powerOverlaps[1]) {
			/* We have to renormalize the temporary */
			c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                            "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                            name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                            name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
			if ((c < 0) || (c >= CODESIZE-t)) res = 0;
			t += c;
			tempVarNum[variableNumber-1]++;
			c2 = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                             "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                             name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
			if ((c2 < 0) || (c2 >= CODESIZE-t2)) res = 0;
			currOverlap = 52;
			t2 += c2;
			if (gappaAssign != NULL) {
			  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
			  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
			  newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
			  *gappaAssign = addElement(*gappaAssign,newAssign);
			}
		      } else {
			/* We have to renormalize x^2 */
			c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                            "Renormalize3(&%s_%s_%d_pow2h,&%s_%s_%d_pow2m,&%s_%s_%d_pow2l,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2l);\n",
                                            name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,
                                            name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
			powVarNum[1]++;
			if ((c < 0) || (c >= CODESIZE-t)) res = 0;
			c2 = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                             "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                             name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
			if ((c2 < 0) || (c2 >= CODESIZE-t2)) res = 0;
			t += c; t2 += c2;
			powerOverlaps[1] = 52;
			if (gappaAssign != NULL) {
			  sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
			  sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]-1,2);
			  newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[1], resultName, 3, 3, operand1Name, 0, 0, NULL);
			  *gappaAssign = addElement(*gappaAssign,newAssign);
			}
		      }
		    }
		  }

		  c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                      "Mul33(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2l,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		  c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		  oldCurrOverlap = currOverlap;
		  currOverlap = MIN(48,MIN(currOverlap,powerOverlaps[1])-4);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, (97 + MIN(oldCurrOverlap,powerOverlaps[1])), 3, currOverlap, resultName, 3, 3, operand1Name, 3, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		case 2:
		  /* Multiply the double-double temporary by a triple-double x^2, produce a triple-double */

		  /* We have to check the precision of the operation which depends
		     on the overlap of the entering triple-double operands.
		     The temporary is a double-double, so the precision only depends
		     on the triple-double x^2
		     If the precision is not sufficient, we renormalize.
		  */
		  t = 0; t2 = 0;
		  if (mulPrec[i] > (97 + powerOverlaps[1])) {
		    /* We must renormalize the power */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_%s_%d_pow2h,&%s_%s_%d_pow2m,&%s_%s_%d_pow2l,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2l);\n",
                                        name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    powVarNum[1]++;
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                         name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    powerOverlaps[1] = 52;
		    t = c; t2 = c2;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]-1,2);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[1], resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }

		  c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                      "Mul233(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2l);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		  if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		  c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  currOverlap = MIN(48,powerOverlaps[1]-4);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 97 + powerOverlaps[1], 3, currOverlap, resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		default:
		  /* Multiply the double temporary by a triple-double x^2, produce a triple-double */

		  /* We have to check the precision of the operation which depends
		     on the overlap of the entering triple-double operands.
		     The temporary is a double, so the precision only depends
		     on the triple-double x^2
		     If the precision is not sufficient, we renormalize.
		  */
		  t = 0; t2 = 0;
		  if (mulPrec[i] > (100 + powerOverlaps[1])) {
		    /* We must renormalize the power */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_%s_%d_pow2h,&%s_%s_%d_pow2m,&%s_%s_%d_pow2l,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2l);\n",
                                        name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]+1,
                                        name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    powVarNum[1]++;
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                         name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    powerOverlaps[1] = 52;
		    t = c; t2 = c2;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],2);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]-1,2);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[1], resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }

		  c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                      "Mul133(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_%s_%d_pow2h,%s_%s_%d_pow2m,%s_%s_%d_pow2l);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1],name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		  if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		  c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		  currOverlap = MIN(48,powerOverlaps[1]-4);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow2",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[1]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 97 + powerOverlaps[1], 3, currOverlap, resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }

		}
	      }
	    } else {
	      /* Multiply by x^k, which is in any case a triple-double, produce a triple-double */
	      switch (comingFormat) {
	      case 3:
		/* Multiply the triple-double temporary by a triple-double x^k, produce a triple-double */

		/* We have to check the precision of the operation which depends
		   on the overlap of the entering triple-double operands.

		   The precision is roughly 97 + min(overlaps) bits.
		   If it is not sufficient, we renormalize first the operands with
		   the higher overlap (lower value), check again and renormalize once
		   again if needed.
		*/

		t = 0; t2 = 0;
		if (mulPrec[i] > (97 + MIN(currOverlap,powerOverlaps[k-1]))) {
		  /* The precision is not sufficient, we have to renormalize at least one operand */
		  if (currOverlap < powerOverlaps[k-1]) {
		    /* We have to renormalize first the temporary */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                        name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                        name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    tempVarNum[variableNumber-1]++;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                         name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    t = c; t2 = c2;
		    currOverlap = 52;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  } else {
		    /* We have to renormalize first x^k */
		    c = sollya_snprintf(buffer1,CODESIZE,
                                        "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                        name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,
                                        name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		    powVarNum[k-1]++;
		    if ((c < 0) || (c >= CODESIZE)) res = 0;
		    c2 = sollya_snprintf(buffer2,CODESIZE,
                                         "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                         name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		    if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		    t = c; t2 = c2;
		    powerOverlaps[k-1] = 52;
		    if (gappaAssign != NULL) {
		      sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		      sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]-1,k);
		      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[k-1], resultName, 3, 3, operand1Name, 0, 0, NULL);
		      *gappaAssign = addElement(*gappaAssign,newAssign);
		    }
		  }
		  if (mulPrec[i] > (97 + MIN(currOverlap,powerOverlaps[k-1]))) {
		    /* The precision is still not sufficient, we have to renormalize the other operand */
		    if (currOverlap <= powerOverlaps[k-1]) {
		      /* We have to renormalize the temporary */
		      c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                          "Renormalize3(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);\n",
                                          name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,name,variableNumber-1,tempVarNum[variableNumber-1]+1,
                                          name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		      if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		      tempVarNum[variableNumber-1]++;
		      t += c;
		      c2 = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                           "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;\n",
                                           name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		      if ((c2 < 0) || (c2 >= CODESIZE-t2)) res = 0;
		      t2 += c2;
		      currOverlap = 52;
		      if (gappaAssign != NULL) {
			sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
			sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]-1);
			newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, currOverlap, resultName, 3, 3, operand1Name, 0, 0, NULL);
			*gappaAssign = addElement(*gappaAssign,newAssign);
		      }
		    } else {
		      /* We have to renormalize x^k */
		      c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                          "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                          name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,
                                          name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		      powVarNum[k-1]++;
		      if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		      c2 = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                           "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                           name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		      if ((c2 < 0) || (c2 >= CODESIZE-t2)) res = 0;
		      t += c; t2 += c2;
		      powerOverlaps[k-1] = 52;
		      if (gappaAssign != NULL) {
			sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
			sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]-1,k);
			newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[k-1], resultName, 3, 3, operand1Name, 0, 0, NULL);
			*gappaAssign = addElement(*gappaAssign,newAssign);
		      }
		    }
		  }
		}

		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul33(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		oldCurrOverlap = currOverlap;
		currOverlap = MIN(48,MIN(currOverlap,powerOverlaps[k-1])-4);
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 97 + MIN(oldCurrOverlap,powerOverlaps[k-1]), 3, currOverlap, resultName, 3, 3, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      case 2:
		/* Multiply the double-double temporary by a triple-double x^k, produce a triple-double */

		/* We have to check the precision of the operation which depends
		   on the overlap of the entering triple-double operands.
		   The temporary is a double-double, so the precision only depends
		   on the triple-double x^k
		   If the precision is not sufficient, we renormalize.
		*/
		t = 0; t2 = 0;
		if (mulPrec[i] > (97 + powerOverlaps[k-1])) {
		  /* We must renormalize the power */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  powVarNum[k-1]++;
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                       name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  powerOverlaps[k-1] = 52;
		  t = c; t2 = c2;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]-1,k);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[k-1], resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul233(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_t_%d_%dm,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],
                                    name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		currOverlap = MIN(48,powerOverlaps[k-1]-4);
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 97 + powerOverlaps[k-1], 3, currOverlap, resultName, 2, 2, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}

		break;
	      default:
		/* Multiply the double temporary by a triple-double x^k, produce a triple-double */

		/* We have to check the precision of the operation which depends
		   on the overlap of the entering triple-double operands.
		   The temporary is a double-double, so the precision only depends
		   on the triple-double x^k
		   If the precision is not sufficient, we renormalize.
		*/
		t = 0; t2 = 0;
		if (mulPrec[i] > (100 + powerOverlaps[k-1])) {
		  /* We must renormalize the power */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  powVarNum[k-1]++;
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                       name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  powerOverlaps[k-1] = 52;
		  t = c; t2 = c2;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]-1,k);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[k-1], resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul133(&%s_t_%d_%dh,&%s_t_%d_%dm,&%s_t_%d_%dl,%s_t_%d_%dh,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,variableNumber-1,tempVarNum[variableNumber-1],
                                    name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm, %s_t_%d_%dl;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		currOverlap = MIN(47,powerOverlaps[k-1]-5);
		if (gappaAssign != NULL) {
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 100 + powerOverlaps[k-1], 3, currOverlap, resultName, 1, 1, operand1Name, 3, 3, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }
	    }
	  }
	} else {
	  if (mulPrec[i] > 53) {
	    /* Produce a double-double */
	    producedFormat = 2;
	    currOverlap = 53;
	    if (k == 1) {
	      /* Multiply comingFormat by x as a double or double-double (or better), produce a double-double */
	      switch (variablePrecision) {
	      case 3:
	      case 2:
		/* Multiply comingFormat by x as a double-double (or better), produce a double-double */
		switch (comingFormat) {
		case 3:
		  printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions. This should not occur.\n");
		  printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		  res = 0;
		  break;
		case 2:
		  /* Multiply the double-double temporary by x as double-double (or better), produce a double-double */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Mul22(&%s_t_%d_%dh,&%s_t_%d_%dm,%s_t_%d_%dh,%s_t_%d_%dm,%sh,%sm);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],
                                      ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 2, 2, operand1Name, 2, variablePrecision, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		default:
		  /* Multiply the double temporary by x as a double-double (or better), produce a double-double */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Mul122(&%s_t_%d_%dh,&%s_t_%d_%dm,%s_t_%d_%dh,%sh,%sm);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],
                                      ((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename));
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 1, 1, operand1Name, 2, variablePrecision, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
		break;
	      case 1:
		/* Multiply comingFormat by x as a double, produce a double-double */
		switch (comingFormat) {
		case 3:
		  printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions. This should not occur.\n");
		  printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		  res = 0;
		  break;
		case 2:
		  /* Multiply the double-double temporary by x as double, produce a double-double */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Mul122(&%s_t_%d_%dh,&%s_t_%d_%dm,%s,%s_t_%d_%dh,%s_t_%d_%dm);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      ((variablename == NULL) ? "_x_" : variablename),
                                      name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		    newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 1, 1, operand1Name, 2, 2, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		default:
		  /* Multiply the double temporary by x as a double, produce a double-double */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Mul12(&%s_t_%d_%dh,&%s_t_%d_%dm,%s,%s_t_%d_%dh);",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                      ((variablename == NULL) ? "_x_" : variablename),
                                      name,variableNumber-1,tempVarNum[variableNumber-1]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                      name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));
		    sollya_snprintf(operand2Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    newAssign = newGappaOperation(GAPPA_MUL_EXACT, -1, 2, 53, resultName, 1, 1, operand1Name, 1, 1, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
		break;
	      default:
		printMessage(1,SOLLYA_MSG_IMPLEMENTPOLY_FREE_VAR_HAS_UNKNOWN_FORMAT,"Warning: the variable %s has an unknown format. This should not occur.\n",((variablename == NULL) ? "_x_" : variablename));
		printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		res = 0;
	      }
	    } else {
	      /* Multiply comingFormat by x^k which should be at least a double-double in any case */
	      switch (comingFormat) {
	      case 3:
		printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions. This should not occur.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		res = 0;
		break;
	      case 2:
		/* Multiply the double-double temporary by x^k as double-double, produce a double-double */

		/* We have to check that if x^k is actually a triple-double that is read as a double-double
		   that the precision obtained is sufficient regardless of the overlap in the triple-double
		   The obtained precision is roughly 53 + overlap value. If it is not sufficient,
		   we renormalize the whole triple-double value.
		*/

		t = 0; t2 = 0;
		if ((powerOverlaps[k-1] < 53) && (mulPrec[i] > (53 + powerOverlaps[k-1]))) {
		  /* We must renormalize the power */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  powVarNum[k-1]++;
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  powerOverlaps[k-1] = 52;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                       name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  t = c; t2 = c2;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]-1,k);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[k-1], resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul22(&%s_t_%d_%dh,&%s_t_%d_%dm,%s_t_%d_%dh,%s_t_%d_%dm,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,variableNumber-1,tempVarNum[variableNumber-1],name,variableNumber-1,tempVarNum[variableNumber-1],
                                    name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		if (gappaAssign != NULL) {
		  if (powerOverlaps[k-1] < 53) op2format = 3; else op2format = 2;
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 2, 2, operand1Name, 2, op2format, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
		break;
	      default:
		/* Multiply the double temporary by x^k as a double-double, produce a double-double */

		/* We have to check that if x^k is actually a triple-double that is read as a double-double
		   that the precision obtained is sufficient regardless of the overlap in the triple-double
		   The obtained precision is roughly 53 + overlap value. If it is not sufficient,
		   we renormalize the whole triple-double value.
		*/

		t = 0; t2 = 0;
		if ((powerOverlaps[k-1] < 53) && (mulPrec[i] > (53 + powerOverlaps[k-1]))) {
		  /* We must renormalize the power */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "Renormalize3(&%s_%s_%d_pow%dh,&%s_%s_%d_pow%dm,&%s_%s_%d_pow%dl,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm,%s_%s_%d_pow%dl);\n",
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]+1,k,
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  powVarNum[k-1]++;
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  powerOverlaps[k-1] = 52;
		  c2 = sollya_snprintf(buffer2,CODESIZE,
                                       "double %s_%s_%d_pow%dh, %s_%s_%d_pow%dm, %s_%s_%d_pow%dl;\n",
                                       name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  if ((c2 < 0) || (c2 >= CODESIZE)) res = 0;
		  t = c; t2 = c2;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1]-1,k);
		    newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, powerOverlaps[k-1], resultName, 3, 3, operand1Name, 0, 0, NULL);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}

		c = sollya_snprintf(buffer1+t,CODESIZE-t,
                                    "Mul122(&%s_t_%d_%dh,&%s_t_%d_%dm,%s_t_%d_%dh,%s_%s_%d_pow%dh,%s_%s_%d_pow%dm);",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber],
                                    name,variableNumber-1,tempVarNum[variableNumber-1],
                                    name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		if ((c < 0) || (c >= CODESIZE-t)) res = 0;
		c = sollya_snprintf(buffer2+t2,CODESIZE-t2,
                                    "double %s_t_%d_%dh, %s_t_%d_%dm;",
                                    name,variableNumber,tempVarNum[variableNumber],name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE-t2)) res = 0;
		if (gappaAssign != NULL) {
		  if (powerOverlaps[k-1] < 53) op2format = 3; else op2format = 2;
		  sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		  sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);

		  newAssign = newGappaOperation(GAPPA_MUL_REL, 102, 2, 53, resultName, 1, 1, operand1Name, 2, op2format, operand2Name);
		  *gappaAssign = addElement(*gappaAssign,newAssign);
		}
	      }
	    }
	  } else {
	    /* Produce a double */
	    producedFormat = 1;
	    currOverlap = 53;
	    if (k == 1) {
	      /* Multiply by x as a double (or better) */
	      if (comingFormat == 1) {
		switch (variablePrecision) {
		case 3:
		case 2:
		  /* Multiply the double temporary by x as a double-double (or better) read as a double,
		     produce a double
		  */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_t_%d_%dh = %s_t_%d_%dh * %sh;",
                                      name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],
                                      ((variablename == NULL) ? "_x_" : variablename));
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh;",
                                      name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));

		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, 1, operand1Name, 1, variablePrecision, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		case 1:
		  /* Multiply the double temporary by x as a double, produce a double */
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_t_%d_%dh = %s_t_%d_%dh * %s;",
                                      name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],
                                      ((variablename == NULL) ? "_x_" : variablename));
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  c = sollya_snprintf(buffer2,CODESIZE,
                                      "double %s_t_%d_%dh;",
                                      name,variableNumber,tempVarNum[variableNumber]);
		  if ((c < 0) || (c >= CODESIZE)) res = 0;
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s",((variablename == NULL) ? "_x_" : variablename));

		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, 1, operand1Name, 1, 1, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		  break;
		default:
		  printMessage(1,SOLLYA_MSG_IMPLEMENTPOLY_FREE_VAR_HAS_UNKNOWN_FORMAT,"Warning: the variable %s has an unknown format. This should not occur.\n",((variablename == NULL) ? "_x_" : variablename));
		  printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		  res = 0;
		}
	      } else {
		printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions. This should not occur.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		res = 0;
	      }
	    } else {
	      if (comingFormat == 1) {
		/* Multiply the double temporary by x^k as a double (or better) */

		/* We have to check that if x^k is actually a triple-double that is read as a double
		   that the precision obtained is sufficient regardless of the overlap in the triple-double
		   The obtained precision is roughly the overlap value. If it is not sufficient,
		   we use valueh + valuem instead of valueh.
		*/

		if ((powerOverlaps[k-1] < 53) && (mulPrec[i] > (53 + powerOverlaps[k-1]))) {
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_t_%d_%dh = %s_t_%d_%dh * (%s_%s_%d_pow%dh + %s_%s_%d_pow%dm);",
                                      name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k,
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  if (gappaAssign != NULL) {
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);

		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, 1, operand1Name, 2, 3, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		} else {
		  c = sollya_snprintf(buffer1,CODESIZE,
                                      "%s_t_%d_%dh = %s_t_%d_%dh * %s_%s_%d_pow%dh;",
                                      name,variableNumber,tempVarNum[variableNumber],
                                      name,variableNumber-1,tempVarNum[variableNumber-1],
                                      name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);
		  if (gappaAssign != NULL) {
		    if (powerOverlaps[k-1] < 53) op2format = 3; else op2format = 2;
		    sollya_snprintf(resultName,CODESIZE,"%s_t_%d_%d",name,variableNumber,tempVarNum[variableNumber]);
		    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
		    sollya_snprintf(operand2Name,CODESIZE,"%s_%s_%d_pow%d",name,((variablename == NULL) ? "_x_" : variablename),powVarNum[k-1],k);

		    newAssign = newGappaOperation(GAPPA_MUL_DOUBLE, 53, 1, -1, resultName, 1, 1, operand1Name, 1, op2format, operand2Name);
		    *gappaAssign = addElement(*gappaAssign,newAssign);
		  }
		}
		if ((c < 0) || (c >= CODESIZE)) res = 0;
		c = sollya_snprintf(buffer2,CODESIZE,
                                    "double %s_t_%d_%dh;",
                                    name,variableNumber,tempVarNum[variableNumber]);
		if ((c < 0) || (c >= CODESIZE)) res = 0;
	      } else {
		printMessage(1,SOLLYA_MSG_ERROR_IN_PRECISION_MANAGEMENT,"Warning: error in the management of precisions. This should not occur.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
		res = 0;
	      }
	    }
	  }
	}

	variableNumber++;
	comingFormat = producedFormat;

	/* Issue the buffers to memory */
	c = sollya_snprintf(codeIssue,CODESIZE-issuedCode,"%s\n",buffer1);
	if (c < 0) {
	  res = 0;
	  c = 0;
	}
	if (c >= CODESIZE-issuedCode) {
	  res = 0;
	  c = CODESIZE-issuedCode;
	}
	issuedCode += c;
	codeIssue += c;
	c = sollya_snprintf(variablesIssue,CODESIZE-issuedVariables,"%s\n",buffer2);
	if (c < 0) {
	  res = 0;
	  c = 0;
	}
	if (c >= CODESIZE-issuedVariables) {
	  res = 0;
	  c = CODESIZE-issuedVariables;
	}
	issuedVariables += c;
	variablesIssue += c;

	/* The evaluation is now complete, issue code for copying to the result variables */

	switch (comingFormat) {
	case 3:
	  /* If we are not renormalized, we renormalize, otherwise we copy */
	  if (currOverlap < 52) {
	    c = sollya_snprintf(buffer1,CODESIZE,
                                "Renormalize3(%s_resh,%s_resm,%s_resl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                name,name,name,
                                name,variableNumber-1,tempVarNum[variableNumber-1],
                                name,variableNumber-1,tempVarNum[variableNumber-1],
                                name,variableNumber-1,tempVarNum[variableNumber-1]);
	    if (gappaAssign != NULL) {
	      sollya_snprintf(resultName,CODESIZE,"%s_res",name);
	      sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
	      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, 52, resultName, 3, 3, operand1Name, 0, 0, NULL);
	      *gappaAssign = addElement(*gappaAssign,newAssign);
	    }
	  } else {
	    c = sollya_snprintf(buffer1,CODESIZE,
                                "*%s_resh = %s_t_%d_%dh; *%s_resm = %s_t_%d_%dm; *%s_resl = %s_t_%d_%dl;",
                                name,name,variableNumber-1,tempVarNum[variableNumber-1],
                                name,name,variableNumber-1,tempVarNum[variableNumber-1],
                                name,name,variableNumber-1,tempVarNum[variableNumber-1]);
	    if (gappaAssign != NULL) {
	      sollya_snprintf(resultName,CODESIZE,"%s_res",name);
	      sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
	      newAssign = newGappaOperation(GAPPA_COPY, -1, 3, -1, resultName, 3, 3, operand1Name, 0, 0, NULL);
	      *gappaAssign = addElement(*gappaAssign,newAssign);
	    }
	  }
	  if ((c < 0) || (c >= CODESIZE)) res = 0;
	  c = sollya_snprintf(buffer2,CODESIZE," ");
	  if ((c < 0) || (c >= CODESIZE)) res = 0;
	  break;
	case 2:
	  c = sollya_snprintf(buffer1,CODESIZE,
                              "*%s_resh = %s_t_%d_%dh; *%s_resm = %s_t_%d_%dm;",
                              name,name,variableNumber-1,tempVarNum[variableNumber-1],
                              name,name,variableNumber-1,tempVarNum[variableNumber-1]);
	  if ((c < 0) || (c >= CODESIZE)) res = 0;
	  c = sollya_snprintf(buffer2,CODESIZE," ");
	  if ((c < 0) || (c >= CODESIZE)) res = 0;
	  if (gappaAssign != NULL) {
	    sollya_snprintf(resultName,CODESIZE,"%s_res",name);
	    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
	    newAssign = newGappaOperation(GAPPA_COPY, -1, 2, -1, resultName, 2, 2, operand1Name, 0, 0, NULL);
	    *gappaAssign = addElement(*gappaAssign,newAssign);
	  }
	  break;
	default:
	  c = sollya_snprintf(buffer1,CODESIZE,
                              "*%s_resh = %s_t_%d_%dh;",
                              name,name,variableNumber-1,tempVarNum[variableNumber-1]);
	  if ((c < 0) || (c >= CODESIZE)) res = 0;
	  c = sollya_snprintf(buffer2,CODESIZE," ");
	  if ((c < 0) || (c >= CODESIZE)) res = 0;
	  if (gappaAssign != NULL) {
	    sollya_snprintf(resultName,CODESIZE,"%s_res",name);
	    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
	    newAssign = newGappaOperation(GAPPA_COPY, -1, 1, -1, resultName, 1, 1, operand1Name, 0, 0, NULL);
	    *gappaAssign = addElement(*gappaAssign,newAssign);
	  }
	}

	i = -1;

      } else {
	/* The evaluation is already complete, issue code for copying to the result variables */

	switch (comingFormat) {
	case 3:
	  /* If we are not renormalized, we renormalize, otherwise we copy */
	  if (currOverlap < 52) {
	    c = sollya_snprintf(buffer1,CODESIZE,
                                "Renormalize3(%s_resh,%s_resm,%s_resl,%s_t_%d_%dh,%s_t_%d_%dm,%s_t_%d_%dl);",
                                name,name,name,
                                name,variableNumber-1,tempVarNum[variableNumber-1],
                                name,variableNumber-1,tempVarNum[variableNumber-1],
                                name,variableNumber-1,tempVarNum[variableNumber-1]);
	    if (gappaAssign != NULL) {
	      sollya_snprintf(resultName,CODESIZE,"%s_res",name);
	      sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
	      newAssign = newGappaOperation(GAPPA_RENORMALIZE, -1, 3, 52, resultName, 3, 3, operand1Name, 0, 0, NULL);
	      *gappaAssign = addElement(*gappaAssign,newAssign);
	    }
	  } else {
	    c = sollya_snprintf(buffer1,CODESIZE,
                                "*%s_resh = %s_t_%d_%dh; *%s_resm = %s_t_%d_%dm; *%s_resl = %s_t_%d_%dl;",
                                name,name,variableNumber-1,tempVarNum[variableNumber-1],
                                name,name,variableNumber-1,tempVarNum[variableNumber-1],
                                name,name,variableNumber-1,tempVarNum[variableNumber-1]);
	    if (gappaAssign != NULL) {
	      sollya_snprintf(resultName,CODESIZE,"%s_res",name);
	      sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
	      newAssign = newGappaOperation(GAPPA_COPY, -1, 3, -1, resultName, 3, 3, operand1Name, 0, 0, NULL);
	      *gappaAssign = addElement(*gappaAssign,newAssign);
	    }
	  }
	  if ((c < 0) || (c >= CODESIZE)) res = 0;
	  c = sollya_snprintf(buffer2,CODESIZE," ");
	  if ((c < 0) || (c >= CODESIZE)) res = 0;
	  break;
	case 2:
	  c = sollya_snprintf(buffer1,CODESIZE,
                              "*%s_resh = %s_t_%d_%dh; *%s_resm = %s_t_%d_%dm;",
                              name,name,variableNumber-1,tempVarNum[variableNumber-1],
                              name,name,variableNumber-1,tempVarNum[variableNumber-1]);
	  if ((c < 0) || (c >= CODESIZE)) res = 0;
	  c = sollya_snprintf(buffer2,CODESIZE," ");
	  if ((c < 0) || (c >= CODESIZE)) res = 0;
	  if (gappaAssign != NULL) {
	    sollya_snprintf(resultName,CODESIZE,"%s_res",name);
	    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
	    newAssign = newGappaOperation(GAPPA_COPY, -1, 2, -1, resultName, 2, 2, operand1Name, 0, 0, NULL);
	    *gappaAssign = addElement(*gappaAssign,newAssign);
	  }
	  break;
	default:
	  c = sollya_snprintf(buffer1,CODESIZE,
                              "*%s_resh = %s_t_%d_%dh;",
                              name,name,variableNumber-1,tempVarNum[variableNumber-1]);
	  if ((c < 0) || (c >= CODESIZE)) res = 0;
	  c = sollya_snprintf(buffer2,CODESIZE," ");
	  if ((c < 0) || (c >= CODESIZE)) res = 0;
	  if (gappaAssign != NULL) {
	    sollya_snprintf(resultName,CODESIZE,"%s_res",name);
	    sollya_snprintf(operand1Name,CODESIZE,"%s_t_%d_%d",name,variableNumber-1,tempVarNum[variableNumber-1]);
	    newAssign = newGappaOperation(GAPPA_COPY, -1, 1, -1, resultName, 1, 1, operand1Name, 0, 0, NULL);
	    *gappaAssign = addElement(*gappaAssign,newAssign);
	  }
	}
      }
      /* Issue the buffers to memory */
      c = sollya_snprintf(codeIssue,CODESIZE-issuedCode,"%s\n",buffer1);
      if (c < 0) {
	res = 0;
	c = 0;
      }
      if (c >= CODESIZE-issuedCode) {
	res = 0;
	c = CODESIZE-issuedCode;
      }
      issuedCode += c;
      codeIssue += c;
      c = sollya_snprintf(variablesIssue,CODESIZE-issuedVariables,"%s\n",buffer2);
      if (c < 0) {
	res = 0;
	c = 0;
      }
      if (c >= CODESIZE-issuedVariables) {
	res = 0;
	c = CODESIZE-issuedVariables;
      }
      issuedVariables += c;
      variablesIssue += c;
    } /* End else to if normal or last step */
  } /* End loop on degrees */

  /* Issue the variable definitions and the code to the file */
  if (sollyaFprintf(fd,"%s\n\n%s\n\n",variables,code) < 0) res = 0;

  safeFree(code);
  safeFree(variables);
  safeFree(buffer1);
  safeFree(buffer2);

  safeFree(tempVarNum);

  if (gappaAssign != NULL) {
    safeFree(resultName);
    safeFree(operand1Name);
    safeFree(operand2Name);
    safeFree(operand3Name);
  }

  return res;
}

int accurToVarType(mpfr_t accur) {
  mpfr_t temp;
  int res;

  mpfr_init2(temp,mpfr_get_prec(accur));
  mpfr_set_d(temp,1.0,GMP_RNDN);
  mpfr_div_2ui(temp,temp,52,GMP_RNDN);

  res = 1;

  if (mpfr_less_p(accur,temp)) res++;

  mpfr_div_2ui(temp,temp,50,GMP_RNDN);

  if (mpfr_less_p(accur,temp)) res++;

  mpfr_clear(temp);

  return res;
}


node *implementpoly(node *func, rangetype range, mpfr_t *accur, int variablePrecision,
		    FILE *fd, char *name, int honorCoeffPrec, mp_prec_t prec, FILE *gappaFD) {
  mpfr_t temp, tempValue;
  node *simplifiedFunc, *implementedPoly;
  int degree, i;
  node **coefficients;
  node *tempTree;
  mpfr_t *fpCoefficients;
  int *addPrec, *mulPrec, *powPrec, *overlapsPowers, *powVarNum;
  int *fpCoeffRoundAutomatically;
  int targetPrec;
  gappaProof *proof;
  chain *assignments, *tempChain;
  chain **assignmentsPtr;
  char resultnamebuf[80];

  proof = NULL;

  if (prec < 159) {
    printMessage(1,SOLLYA_MSG_CURRENT_PREC_INSUFFICIENT_FOR_TD_CODE,"Warning: the current tool's precision (%d bits) is not sufficient for implementing triple-double code.\n",prec);
    printMessage(1,SOLLYA_MSG_CONTINUATION,"Will temporarily increase the precision to 159 bits.\n");
    prec = 159;
  }

  if (!isPolynomial(func)) {
    printMessage(1,SOLLYA_MSG_GIVEN_FUNCTION_IS_NO_POLYNOMIAL,"Warning: the function given is not a polynomial.\n");
    return NULL;
  }

  mpfr_init2(temp,prec);
  mpfr_set_d(temp,1.0,GMP_RNDN);

  if (mpfr_greaterequal_p(*accur,temp)) {
    printMessage(1,SOLLYA_MSG_TARGET_ACCURACY_GREATER_OR_EQUAL_THAN_ONE,"Warning: the target accuracy is greater or equal to 1 = 2^0.\n");
    printMessage(1,SOLLYA_MSG_CONTINUATION,"Implementation of a such a function makes no sense.\n");
    mpfr_clear(temp);
    return NULL;
  }

  mpfr_div_2ui(temp,temp,140,GMP_RNDN);

  if (mpfr_less_p(*accur,temp)) {
    printMessage(1,SOLLYA_MSG_TARGET_ACCURACY_LESS_THAN_140_BITS,"Warning: the target accuracy is less than 2^(-140).\n");
    printMessage(1,SOLLYA_MSG_CONTINUATION,"Implementation is currently restrained to maximally triple-double precision.\n");
    mpfr_clear(temp);
    return NULL;
  }

  mpfr_div_2ui(*accur,*accur,1,GMP_RNDN);

  if (accurToVarType(*accur) < variablePrecision) {
    printMessage(1,SOLLYA_MSG_INFERED_OUTPUT_PREC_LESS_THAN_VARIABLE_PREC,"Warning: the infered output expansion type is less from the given variable type.\n");
    printMessage(1,SOLLYA_MSG_CONTINUATION,"Implementation cannot handle this case.\n");
    mpfr_clear(temp);
    return NULL;
  }

  simplifiedFunc = simplifyTreeErrorfree(func);

  if (gappaFD != NULL) {
    proof = (gappaProof *) safeCalloc(1,sizeof(gappaProof));
    proof->variableName = (char *) safeCalloc(strlen(((variablename == NULL) ? "_x_" : variablename))+1,sizeof(char));
    strcpy(proof->variableName,((variablename == NULL) ? "_x_" : variablename));
    sprintf(resultnamebuf,"%s_res",name);
    proof->resultName = (char *) safeCalloc(strlen(resultnamebuf)+1,sizeof(char));
    strcpy(proof->resultName,resultnamebuf);
    proof->variableType = variablePrecision;
    proof->polynomToImplement = copyTree(simplifiedFunc);
    mpfr_init2(proof->a,mpfr_get_prec(*(range.a)));
    mpfr_init2(proof->b,mpfr_get_prec(*(range.b)));
    mpfr_set(proof->a,*(range.a),GMP_RNDD);
    mpfr_set(proof->b,*(range.b),GMP_RNDU);
    mpfr_init2(proof->eps, mpfr_get_prec(*accur));
    mpfr_set(proof->eps, *accur, GMP_RNDN);
    assignments = NULL;
    assignmentsPtr = &assignments;
  } else {
    assignmentsPtr = NULL;
  }

  getCoefficients(&degree,&coefficients,simplifiedFunc);

  if (degree < 0) {
    sollyaFprintf(stderr,"Error: implementpoly: an error occurred. Could not extract the coefficients of the given polynomial.\n");
    exit(1);
  }

  fpCoefficients = (mpfr_t *) safeCalloc(degree+1,sizeof(mpfr_t));
  fpCoeffRoundAutomatically = (int *) safeCalloc(degree+1,sizeof(int));

  mpfr_init2(tempValue,prec);
  mpfr_set_d(tempValue,1.0,GMP_RNDN);

  for (i=0;i<=degree;i++) {
    mpfr_init2(fpCoefficients[i],prec);
    fpCoeffRoundAutomatically[i] = 0;

    if (coefficients[i] != NULL) {
      tempTree = simplifyTreeErrorfree(coefficients[i]);
      free_memory(coefficients[i]);
      if (!isConstant(tempTree)) {
	sollyaFprintf(stderr,"Error: implementpoly: an error occurred. A polynomial coefficient is not constant.\n");
	exit(1);
      }
      if (accessThruMemRef(tempTree)->nodeType != CONSTANT) {
	printMessage(1,SOLLYA_MSG_COEFF_DOES_NOT_HOLD_ON_TD_USING_FAITHFUL_EVAL,"Warning: the %dth coefficient of the polynomial to implement is neither a floating point\n",i);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"constant nor is able to be evaluated without rounding to a floating point constant.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"Will evaluate it in round-to-nearest with the current precision (%d bits) before rounding to\n",prec);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"the target precision. A double rounding issue may occur.\n");
	evaluateFaithful(fpCoefficients[i], tempTree, tempValue, prec);
	fpCoeffRoundAutomatically[i] = 1;
      } else {
	if (mpfr_set(fpCoefficients[i],*(accessThruMemRef(tempTree)->value),GMP_RNDN) != 0) {
	  if (!noRoundingWarnings) {
	    printMessage(1,SOLLYA_MSG_ROUNDING_ON_INTERNAL_HANDLING_OF_A_COEFFICIENT,"Warning: rounding occurred on internal handling of a coefficient of the given polynomial.\n");
	  }
	  fpCoeffRoundAutomatically[i] = 1;
	}
      }
      free_memory(tempTree);
    } else {
      mpfr_set_d(fpCoefficients[i],0.0,GMP_RNDN);
    }
  }
  safeFree(coefficients);
  mpfr_clear(tempValue);

  if (honorCoeffPrec) {
    for (i=0;i<=degree;i++) {
      if (mpfr_round_to_tripledouble(temp, fpCoefficients[i]) != 0) {
	if (!noRoundingWarnings) {
	  printMessage(2,SOLLYA_MSG_COEFF_DOES_NOT_HOLD_ON_TD_USING_FAITHFUL_EVAL,"Information: the %dth coefficient of the polynomial given cannot even be stored without rounding on a\n",i);
	  printMessage(2,SOLLYA_MSG_CONTINUATION,"triple-double floating point variable. Automatic rounding will be used for maximally triple-double precision.\n");
	}
	fpCoeffRoundAutomatically[i] = 1;
      }
    }
  } else {
    for (i=0;i<=degree;i++) {
      fpCoeffRoundAutomatically[i] = 1;
    }
  }

  addPrec = (int *) safeCalloc(degree+1,sizeof(int));
  mulPrec = (int *) safeCalloc(degree+1,sizeof(int));

  if (!determinePrecisions(fpCoefficients, fpCoeffRoundAutomatically, degree, addPrec, mulPrec, *accur, range, prec)) {
    printMessage(1,SOLLYA_MSG_ERROR_ON_DETERMINING_THE_REQUIRED_PRECISIONS,"Warning: a problem has been encountered during the determination of the precisions needed.\n");
    printMessage(1,SOLLYA_MSG_CONTINUATION,"The produced implementation may be incorrect.\n");
  }


  implementedPoly = makePolynomial(fpCoefficients,degree);
  printMessage(2,SOLLYA_MSG_THE_POLY_THAT_GETS_IMPLEMENTED_IS,"Information: the polynomial that will be implemented is:\n%b\n",implementedPoly);

  powPrec = (int *) safeCalloc(degree,sizeof(int));
  overlapsPowers = (int *) safeCalloc(degree+1,sizeof(int));
  powVarNum = (int *) safeCalloc(degree+1,sizeof(int));

  if (!determinePowers(fpCoefficients, degree, mulPrec, powPrec)) {
    printMessage(1,SOLLYA_MSG_ERROR_ON_DETERMINING_THE_REQUIRED_POWERS,"Warning: a problem has been encountered during the determination of the powers needed.\n");
    printMessage(1,SOLLYA_MSG_CONTINUATION,"The produced implementation may be incorrect.\n");
  }

  emitLegalNoticeAndDisclaimer(fd);

  if (!implementCoefficients(fpCoefficients, degree, fd, name, prec, assignmentsPtr)) {
    printMessage(1,SOLLYA_MSG_ERROR_ON_CODE_GENERATION_FOR_COEFFICIENTS,"Warning: a problem has been encountered during the generation of the code for the coefficients.\n");
    printMessage(1,SOLLYA_MSG_CONTINUATION,"The produced implementation may be incorrect.\n");
  }

  sollyaFprintf(fd,"void %s(",name);
  mpfr_log2(temp,*accur,GMP_RNDD);
  targetPrec = -mpfr_get_si(temp,GMP_RNDN);

  if (targetPrec >= 102) {
    if (sollyaFprintf(fd,"double *%s_resh, double *%s_resm, double *%s_resl, ",name,name,name) < 0)
      printMessage(1,SOLLYA_MSG_COULD_NOT_WRITE_TO_THE_IMPLEMENTATION_FILE,"Warning: could not write to the file for the implementation.\n");
    if (gappaFD != NULL) proof->resultType = 3;
  } else {
    if (targetPrec >= 54) {
      if (sollyaFprintf(fd,"double *%s_resh, double *%s_resm, ",name,name) < 0)
	printMessage(1,SOLLYA_MSG_COULD_NOT_WRITE_TO_THE_IMPLEMENTATION_FILE,"Warning: could not write to the file for the implementation.\n");
      if (gappaFD != NULL) proof->resultType = 2;
    } else {
      if (sollyaFprintf(fd,"double *%s_resh, ",name) < 0)
	printMessage(1,SOLLYA_MSG_COULD_NOT_WRITE_TO_THE_IMPLEMENTATION_FILE,"Warning: could not write to the file for the implementation.\n");
      if (gappaFD != NULL) proof->resultType = 1;
    }
  }

  switch (variablePrecision) {
  case 3:
    if (sollyaFprintf(fd,"double %sh, double %sm, double %sl) {\n",((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename)) < 0)
      printMessage(1,SOLLYA_MSG_COULD_NOT_WRITE_TO_THE_IMPLEMENTATION_FILE,"Warning: could not write to the file for the implementation.\n");
    break;
  case 2:
    if (sollyaFprintf(fd,"double %sh, double %sm) {\n",((variablename == NULL) ? "_x_" : variablename),((variablename == NULL) ? "_x_" : variablename)) < 0)
      printMessage(1,SOLLYA_MSG_COULD_NOT_WRITE_TO_THE_IMPLEMENTATION_FILE,"Warning: could not write to the file for the implementation.\n");
    break;
  case 1:
    if (sollyaFprintf(fd,"double %s) {\n",((variablename == NULL) ? "_x_" : variablename)) < 0)
      printMessage(1,SOLLYA_MSG_COULD_NOT_WRITE_TO_THE_IMPLEMENTATION_FILE,"Warning: could not write to the file for the implementation.\n");
    break;
  default:
    printMessage(1,SOLLYA_MSG_IMPLEMENTPOLY_FREE_VAR_HAS_UNKNOWN_FORMAT,"Warning: the variable %s has an unknown format. This should not occur.\n",((variablename == NULL) ? "_x_" : variablename));
    printMessage(1,SOLLYA_MSG_CONTINUATION,"The implementation will be wrong.\n");
  }

  if (!implementPowers(powPrec, degree, variablePrecision, fd, name, overlapsPowers, powVarNum, assignmentsPtr)) {
    printMessage(1,SOLLYA_MSG_ERROR_ON_CODE_GENERATION_FOR_POWERS_OF_FREE_VAR,"Warning: a problem has been encountered during the generation of the code for the powers of %s.\n",
		 ((variablename == NULL) ? "_x_" : variablename));
    printMessage(1,SOLLYA_MSG_CONTINUATION,"The produced implementation may be incorrect.\n");
  }

  if (!implementHorner(fpCoefficients, addPrec, mulPrec, degree, variablePrecision, fd, name, overlapsPowers, powVarNum, assignmentsPtr)) {
    printMessage(1,SOLLYA_MSG_ERROR_ON_CODE_GENERATION_FOR_HORNER_SCHEME,"Warning: a problem has been encountered during the generation of the code for the horner scheme.\n");
    printMessage(1,SOLLYA_MSG_CONTINUATION,"The produced implementation may be incorrect.\n");
  }

  if (sollyaFprintf(fd,"}\n") < 0)
    printMessage(1,SOLLYA_MSG_COULD_NOT_WRITE_TO_THE_IMPLEMENTATION_FILE,"Warning: could not write to the file for the implementation.\n");

  if (gappaFD != NULL) {
    proof->polynomImplemented = copyTree(implementedPoly);
    proof->assignmentsNumber = lengthChain(assignments);
    proof->assignments = (gappaAssignment **) safeCalloc(proof->assignmentsNumber,sizeof(gappaAssignment *));
    i = proof->assignmentsNumber - 1;
    while (assignments != NULL) {
      proof->assignments[i] = ((gappaAssignment *) (assignments->value));
      i--;
      tempChain = assignments->next;
      safeFree(assignments);
      assignments = tempChain;
    }
    fprintGappaProof(gappaFD, proof);
    freeGappaProof(proof);
  }

  for (i=0;i<=degree;i++) mpfr_clear(fpCoefficients[i]);
  safeFree(fpCoefficients);
  safeFree(fpCoeffRoundAutomatically);
  safeFree(addPrec);
  safeFree(mulPrec);
  safeFree(powPrec);
  safeFree(overlapsPowers);
  safeFree(powVarNum);
  free_memory(simplifiedFunc);
  mpfr_clear(temp);

  return implementedPoly;
}
