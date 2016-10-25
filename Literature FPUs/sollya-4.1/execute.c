/*

  Copyright 2007-2013 by

  Laboratoire de l'Informatique du Parallelisme,
  UMR CNRS - ENS Lyon - UCB Lyon 1 - INRIA 5668,

  LORIA (CNRS, INPL, INRIA, UHP, U-Nancy 2),

  Laboratoire d'Informatique de Paris 6, equipe PEQUAN,
  UPMC Universite Paris 06 - CNRS - UMR 7606 - LIP6, Paris, France,

  and by

  Centre de recherche INRIA Sophia-Antipolis Mediterranee, equipe APICS,
  Sophia Antipolis, France.

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

#include <mpfr.h>
#include "mpfi-compat.h"
#include <gmp.h>
#include "execute.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <sys/time.h>
#include <time.h>
#include <limits.h>
#include "general.h"
#include "expression.h"
#include "infnorm.h"
#include "assignment.h"
#include "autodiff.h"
#include "library.h"
#include "external.h"
#include "plot.h"
#include "remez.h"
#include "fpminimax.h"
#include "integral.h"
#include "double.h"
#include "worstcase.h"
#include "implement.h"
#include "implementconst.h"
#include "taylor.h"
#include "taylorform.h"
#include "chebyshevform.h"
#include "supnorm.h"
#include "xml.h"
#include "miniparser.h"
#include "match.h"
#include "sollya-messaging.h"
#include <setjmp.h>

#define READBUFFERSIZE 16000


extern int internyyparse(void *);
extern void internyylex_destroy(void *);
extern int internyylex_init(void **);
extern void internyyset_in(FILE *, void *);

extern int miniyylex_init(void **);
extern void miniyyset_in(FILE *, void *);
extern void miniyylex_destroy(void *);

extern void *startMiniparser(void *scanner, char *str);
extern void endMiniparser(void *buf, void *scanner);

extern void initSignalHandlerCounted();
extern void blockSignalsCounted();

node *makeExternalProcedureUsage(libraryProcedure *);
node *copyThing(node *);
node *evaluateThingInner(node *);
node *evaluateThing(node *);
void *copyThingOnVoid(void *);
void *evaluateEntryOnVoid(void *ptr);


void freeDoNothing(void *ptr) {
  UNUSED_PARAM(ptr);
  return;
}

/* Performs a fast check if a < b or a > b
//
// Returns 1 on success, 0 on failure
//
// Sets res to -1 if a < b and to +1 if a > b
//
*/
int checkInequalityFast(int *res, node *a, node *b) {
  sollya_mpfi_t aI, bI;
  mpfr_t ahi, alo, bhi, blo;
  int okay;

  if (!(isConstant(a) && isConstant(b))) return 0;

  sollya_mpfi_init2(aI, 12);
  sollya_mpfi_init2(bI, 12);
  mpfr_init2(ahi, 12);
  mpfr_init2(alo, 12);
  mpfr_init2(bhi, 12);
  mpfr_init2(blo, 12);

  okay = 0;

  evaluateConstantExpressionToInterval(aI, a);
  evaluateConstantExpressionToInterval(bI, b);

  if (sollya_mpfi_is_empty(aI) ||
      sollya_mpfi_is_empty(bI)) {
    mpfr_clear(blo);
    mpfr_clear(bhi);
    mpfr_clear(alo);
    mpfr_clear(ahi);
    sollya_mpfi_clear(bI);
    sollya_mpfi_clear(aI);
    return 0;
  }

  sollya_mpfi_get_left(alo, aI);
  sollya_mpfi_get_right(ahi, aI);
  sollya_mpfi_get_left(blo, bI);
  sollya_mpfi_get_right(bhi, bI);

  if (mpfr_number_p(alo) &&
      mpfr_number_p(ahi) &&
      mpfr_number_p(blo) &&
      mpfr_number_p(bhi)) {
    if (mpfr_cmp(ahi,blo) < 0) {
      okay = 1;
      *res = -1;
    } else {
      if (mpfr_cmp(bhi,alo) < 0) {
        okay = 1;
        *res = 1;
      }
    }
  }

  mpfr_clear(blo);
  mpfr_clear(bhi);
  mpfr_clear(alo);
  mpfr_clear(ahi);
  sollya_mpfi_clear(bI);
  sollya_mpfi_clear(aI);

  return okay;
}

int isElliptic(node *);

/* Sets up the random access data-structure on a LIST or
   FINALELLIPTICLIST object, if it has not yet been set up.

   The function does nothing if:

   * The object is NULL
   * The object is neither a LIST nor a FINALELLIPTICLIST
   * The object has the random-access already set up
   * The list contains ellipses that still need to be
   expanded before we know its length.

*/
void setupRandomAccessOnLists(node *obj) {
  chain *curr;
  int i;

  if (obj == NULL) return;

  switch (obj->nodeType) {
  case MEMREF:
    setupRandomAccessOnLists(obj->child1);
    break;
  case LIST:
  case FINALELLIPTICLIST:
    if (obj->argArray != NULL) return;
    obj->argArraySize = lengthChain(obj->arguments);
    if (obj->argArraySize < 1) {
      obj->argArraySize = 0;
      return;
    }
    obj->argArrayAllocSize = ((size_t) (obj->argArraySize)) * sizeof(node *);
    obj->argArray = (node **) safeMalloc(obj->argArrayAllocSize);
    for (curr=obj->arguments, i=0; curr != NULL; curr=curr->next, i++) {
      if (!isElliptic((node *) (curr->value))) {
	(obj->argArray)[(obj->argArraySize - 1) - i] = (node *) (curr->value);
      } else {
	safeFree(obj->argArray);
	obj->argArray = NULL;
	obj->argArraySize = 0;
	obj->argArrayAllocSize = 0;
	return;
      }
    }
    break;
  default:
    return;
    break;
  }
}

int parseStringCheckExcessCharacters(char *str) {
  char *curr;

  for (curr=str; *curr != '\0'; curr++) {
    if (!((*curr == ' ') ||
	  (*curr == '\n') ||
	  (*curr == '\t'))) return 0;
  }

  return 1;
}

node *parseStringInternal(char *str) {
  node *result;
  node *oldMinitree;
  int oldMiniparserCharactersRead;
  int oldMiniparserEofReached;
  int oldMiniparserSemicolonAtEnd;
  void *myScanner;
  void *buffer;
  char *myStr;

  blockSignalsCounted();
  myStr = (char *) safeCalloc(strlen(str)+1,sizeof(char));
  strcpy(myStr,str);
  oldMinitree = minitree;
  oldMiniparserCharactersRead = miniparserCharactersRead;
  oldMiniparserEofReached = miniparserEofReached;
  oldMiniparserSemicolonAtEnd = miniparserSemicolonAtEnd;
  miniparserCharactersRead = 0;
  miniparserEofReached = 0;
  miniparserSemicolonAtEnd = 0;
  minitree = NULL;
  miniyylex_init(&myScanner);
  miniyyset_in(stdin, myScanner);
  buffer = startMiniparser(myScanner,myStr);
  (void) buffer;
  if (!miniyyparse(myScanner)) {
    if (minitree != NULL) {
      if (miniparserEofReached ||
	  (miniparserSemicolonAtEnd &&
	   ((miniparserCharactersRead <= (int) strlen(myStr)) && parseStringCheckExcessCharacters(myStr+miniparserCharactersRead)))) {
	result = evaluateThing(minitree);
      } else {
	printMessage(1,SOLLYA_MSG_SYNTAX_ERROR_ENCOUNTERED_WHILE_PARSING,
		     "Warning: syntax error parsing \"%s\" because of unexpected excess characters at the end of the input.\n",
		     myStr);
	result = NULL;
      }
      freeThing(minitree);
    } else {
      result = NULL;
    }
  } else {
    result = NULL;
  }
  miniyylex_destroy(myScanner);
  minitree = oldMinitree;
  miniparserCharactersRead = oldMiniparserCharactersRead;
  miniparserEofReached = oldMiniparserEofReached;
  miniparserSemicolonAtEnd = oldMiniparserSemicolonAtEnd;
  safeFree(myStr);
  initSignalHandlerCounted();

  return result;
}

node *parseString(char *str) {
  node *res;

  res = parseStringInternal(str);
  if (res != NULL) return res;

  printMessage(1,SOLLYA_MSG_STRING_CANNOT_BE_PARSED_BY_MINIPARSER,"Warning: the string \"%s\" could not be parsed by the miniparser.\n",str);
  return makeError();
}

rangetype guessDegreeWrapper(node *func, node *weight, mpfr_t a, mpfr_t b, mpfr_t eps, int bound) {
  rangetype result;
  int oldVerbosity;
  int oldPoints;

  oldVerbosity = verbosity;
  oldPoints = defaultpoints;
  result = guessDegree(func, weight, a, b, eps, bound);
  verbosity = oldVerbosity;
  defaultpoints = oldPoints;

  return result;
}



void executeFile(FILE *fd) {
  node *oldParsedThingIntern;
  void *myScanner = NULL;
  int parseAbort;
  chain *commands, *commands2;
  node *tempThing;
  int res;

  commands = NULL;

  blockSignalsCounted();
  oldParsedThingIntern = parsedThingIntern;
  internyylex_init(&myScanner);
  internyyset_in(fd, myScanner);

  while (1) {
    parsedThingIntern = NULL;
    parseAbort = internyyparse(myScanner);
    if (parsedThingIntern != NULL) {
      commands = addElement(commands,parsedThingIntern);
    }
    if (parseAbort) break;
  }

  internyylex_destroy(myScanner);
  parsedThingIntern = oldParsedThingIntern;
  initSignalHandlerCounted();

  commands2 = copyChain(commands, copyThingOnVoid);
  freeChain(commands, freeThingOnVoid);
  commands = commands2;

  tempThing = makeCommandList(commands);

  res = executeCommand(tempThing);

  if (res) {
    printMessage(1,SOLLYA_MSG_FILE_EXECUTION_ASKED_FOR_QUIT_NOT_QUITTING,"Warning: the execution of a file read by execute demanded stopping the interpretation but it is not stopped.\n");
  }

  freeThing(tempThing);

}


char *readFileIntoString(FILE *fd) {
  char *readBuf, *newString, *tempString;
  size_t readChars, i;

  readBuf = (char *) safeCalloc(READBUFFERSIZE,sizeof(char));

  newString = NULL;

  while (1) {
    readChars = fread(readBuf,sizeof(char),READBUFFERSIZE,fd);
    for (i=0;i<readChars;i=i+sizeof(char)) {
      if (readBuf[i] == 0) readBuf[i] = '?';
    }
    if (readChars > 0) {
      if (newString == NULL) {
	newString = (char *) safeCalloc(readChars + 1,sizeof(char));
	strncpy(newString,readBuf,readChars * sizeof(char));
      } else {
	i = strlen(newString);
	tempString = (char *) safeCalloc(i + readChars + 1,sizeof(char));
	strcpy(tempString,newString);
	safeFree(newString);
	newString = tempString;
	tempString = newString + i;
	strncpy(tempString,readBuf,readChars * sizeof(char));
      }
    }
    if (readChars < READBUFFERSIZE) break;
  }

  if (newString == NULL) newString = safeCalloc(1,sizeof(char));

  safeFree(readBuf);

  return newString;
}

node *copyThingInner(node *);

node *copyThing(node *tree) {
  return addMemRef(copyThingInner(tree));
}

node *copyThingInner(node *tree) {
  node *copy;

  if (tree == NULL) return NULL;

  if (tree->nodeType == MEMREF) {
    tree->libFunDeriv++;
    return tree;
  }

  copy = (node *) safeMalloc(sizeof(node));
  copy->nodeType = tree->nodeType;

  switch (tree->nodeType) {
  case VARIABLE:
    break;
  case CONSTANT:
    copy->value = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
    mpfr_init2(*(copy->value),mpfr_get_prec(*(tree->value)));
    mpfr_set(*(copy->value),*(tree->value),GMP_RNDN);
    break;
  case ADD:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case SUB:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case MUL:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case DIV:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case SQRT:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case EXP:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case LOG:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case LOG_2:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case LOG_10:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case SIN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case COS:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case TAN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case ASIN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case ACOS:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case ATAN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case SINH:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case COSH:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case TANH:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case ASINH:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case ACOSH:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case ATANH:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case POW:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case NEG:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case ABS:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case DOUBLE:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case SINGLE:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case HALFPRECISION:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case QUAD:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case DOUBLEDOUBLE:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case TRIPLEDOUBLE:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case ERF:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case ERFC:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case LOG_1P:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case EXP_M1:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case DOUBLEEXTENDED:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case LIBRARYFUNCTION:
    copy->libFun = tree->libFun;
    copy->libFunDeriv = tree->libFunDeriv;
    copy->child1 = copyThingInner(tree->child1);
    break;
  case LIBRARYCONSTANT:
    copy->libFun = tree->libFun;
    break;
  case PROCEDUREFUNCTION:
    copy->libFunDeriv = tree->libFunDeriv;
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case CEIL:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case FLOOR:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case NEARESTINT:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case PI_CONST:
    break;
  case COMMANDLIST:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case WHILE:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case IFELSE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case IF:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case FOR:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case FORIN:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case QUIT:
    break;
  case FALSEQUIT:
    break;
  case FALSERESTART:
    break;
  case RESTART:
    break;
  case PRINT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case SUPPRESSMESSAGE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case UNSUPPRESSMESSAGE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case VARIABLEDECLARATION:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case NOP:
    break;
  case NOPARG:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case NEWFILEPRINT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    copy->child1 = copyThingInner(tree->child1);
    break;
  case APPENDFILEPRINT:
    copy->child1 = copyThingInner(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case PLOT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case PRINTHEXA:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case PRINTFLOAT:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case PRINTBINARY:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case PRINTEXPANSION:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case BASHEXECUTE:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case EXTERNALPLOT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case WRITE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case NEWFILEWRITE:
    copy->child1 = copyThingInner(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case APPENDFILEWRITE:
    copy->child1 = copyThingInner(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case ASCIIPLOT:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case PRINTXML:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case PRINTXMLNEWFILE:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case PRINTXMLAPPENDFILE:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case WORSTCASE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case RENAME:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case AUTOPRINT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case EXTERNALPROC:
    copy->child1 = copyThingInner(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyIntPtrOnVoid);
    break;
  case ASSIGNMENT:
    copy->child1 = copyThingInner(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case FLOATASSIGNMENT:
    copy->child1 = copyThingInner(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case LIBRARYBINDING:
    copy->child1 = copyThingInner(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case LIBRARYCONSTANTBINDING:
    copy->child1 = copyThingInner(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case PRECASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case POINTSASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case DIAMASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case DISPLAYASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case VERBOSITYASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case CANONICALASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case AUTOSIMPLIFYASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case SHOWMESSAGENUMBERSASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case TAYLORRECURSASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case TIMINGASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case FULLPARENASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case MIDPOINTASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case DIEONERRORMODEASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case RATIONALMODEASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case SUPPRESSWARNINGSASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case HOPITALRECURSASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case PRECSTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case POINTSSTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case DIAMSTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case DISPLAYSTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case VERBOSITYSTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case CANONICALSTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case AUTOSIMPLIFYSTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case SHOWMESSAGENUMBERSSTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case TAYLORRECURSSTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case TIMINGSTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case FULLPARENSTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case MIDPOINTSTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case DIEONERRORMODESTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case RATIONALMODESTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case SUPPRESSWARNINGSSTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case HOPITALRECURSSTILLASSIGN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case AND:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case OR:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case NEGATION:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case INDEX:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case COMPAREEQUAL:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case COMPAREIN:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case COMPARELESS:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case COMPAREGREATER:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case COMPARELESSEQUAL:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case COMPAREGREATEREQUAL:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case COMPARENOTEQUAL:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case CONCAT:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case ADDTOLIST:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case PREPEND:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case APPEND:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case ON:
    break;
  case OFF:
    break;
  case DYADIC:
    break;
  case POWERS:
    break;
  case BINARY:
    break;
  case HEXADECIMAL:
    break;
  case FILESYM:
    break;
  case POSTSCRIPT:
    break;
  case POSTSCRIPTFILE:
    break;
  case PERTURB:
    break;
  case ROUNDDOWN:
    break;
  case ROUNDUP:
    break;
  case ROUNDTOZERO:
    break;
  case ROUNDTONEAREST:
    break;
  case HONORCOEFF:
    break;
  case TRUE:
    break;
  case UNIT:
    break;
  case FALSE:
    break;
  case DEFAULT:
    break;
  case DECIMAL:
    break;
  case ABSOLUTESYM:
    break;
  case RELATIVESYM:
    break;
  case FIXED:
    break;
  case FLOATING:
    break;
  case ERRORSPECIAL:
    break;
  case DOUBLESYMBOL:
    break;
  case SINGLESYMBOL:
    break;
  case QUADSYMBOL:
    break;
  case HALFPRECISIONSYMBOL:
    break;
  case DOUBLEEXTENDEDSYMBOL:
    break;
  case DOUBLEDOUBLESYMBOL:
    break;
  case TRIPLEDOUBLESYMBOL:
    break;
  case STRING:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case TABLEACCESS:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case ISBOUND:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case TABLEACCESSWITHSUBSTITUTE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case STRUCTACCESS:
    copy->child1 = copyThingInner(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case APPLY:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    copy->child1 = copyThingInner(tree->child1);
    break;
  case DECIMALCONSTANT:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case MIDPOINTCONSTANT:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case DYADICCONSTANT:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case HEXCONSTANT:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case HEXADECIMALCONSTANT:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case BINARYCONSTANT:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case EMPTYLIST:
    break;
  case LIST:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    copy->argArray = NULL;
    copy->argArraySize = 0;
    copy->argArrayAllocSize = 0;
    break;
  case STRUCTURE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyEntryOnVoid);
    break;
  case FINALELLIPTICLIST:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    copy->argArray = NULL;
    copy->argArraySize = 0;
    copy->argArrayAllocSize = 0;
    break;
  case ELLIPTIC:
    break;
  case RANGE:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case DEBOUNDMAX:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case DEBOUNDMIN:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case DEBOUNDMID:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case EVALCONST:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case DIFF:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case BASHEVALUATE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case GETSUPPRESSEDMESSAGES:
    break;
  case DIRTYSIMPLIFY:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case SIMPLIFYSAFE:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case TIME:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case REMEZ:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case MATCH:
    copy->child1 = copyThingInner(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case MATCHELEMENT:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case MIN:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case MAX:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case FPMINIMAX:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case HORNER:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case CANONICAL:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case EXPAND:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case TAYLOR:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case TAYLORFORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case CHEBYSHEVFORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case AUTODIFF:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case DEGREE:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case NUMERATOR:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case DENOMINATOR:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case SUBSTITUTE:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case COMPOSEPOLYNOMIALS:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case COEFF:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case SUBPOLY:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case ROUNDCOEFFICIENTS:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case RATIONALAPPROX:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case ACCURATEINFNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case ROUNDTOFORMAT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case EVALUATE:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case PARSE:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case READXML:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case EXECUTE:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case INFNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case SUPNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case FINDZEROS:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case FPFINDZEROS:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case DIRTYINFNORM:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case NUMBERROOTS:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case INTEGRAL:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case DIRTYINTEGRAL:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case IMPLEMENTPOLY:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case IMPLEMENTCONST:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case CHECKINFNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case ZERODENOMINATORS:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case ISEVALUABLE:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case SEARCHGAL:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case GUESSDEGREE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case ASSIGNMENTININDEXING:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case FLOATASSIGNMENTININDEXING:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case ASSIGNMENTINSTRUCTURE:
    copy->child1 = copyThingInner(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case FLOATASSIGNMENTINSTRUCTURE:
    copy->child1 = copyThingInner(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case PROTOASSIGNMENTINSTRUCTURE:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case PROTOFLOATASSIGNMENTINSTRUCTURE:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case DIRTYFINDZEROS:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    break;
  case HEAD:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case ROUNDCORRECTLY:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case READFILE:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case REVERT:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case SORT:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case MANTISSA:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case EXPONENT:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case PRECISION:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case TAIL:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case LENGTH:
    copy->child1 = copyThingInner(tree->child1);
    break;
  case EXTERNALPROCEDUREUSAGE:
    copy->libProc = tree->libProc;
    break;
  case PROC:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case BIND:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case PROCILLIM:
    copy->child1 = copyThingInner(tree->child1);
    copy->child2 = copyThingInner(tree->child2);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case PRECDEREF:
    break;
  case POINTSDEREF:
    break;
  case DIAMDEREF:
    break;
  case DISPLAYDEREF:
    break;
  case VERBOSITYDEREF:
    break;
  case CANONICALDEREF:
    break;
  case AUTOSIMPLIFYDEREF:
    break;
  case SHOWMESSAGENUMBERSDEREF:
    break;
  case TAYLORRECURSDEREF:
    break;
  case TIMINGDEREF:
    break;
  case FULLPARENDEREF:
    break;
  case MIDPOINTDEREF:
    break;
  case DIEONERRORMODEDEREF:
    break;
  case RATIONALMODEDEREF:
    break;
  case SUPPRESSWARNINGSDEREF:
    break;
  case HOPITALRECURSDEREF:
    break;
  default:
    sollyaFprintf(stderr,"Error: copyThingInner: unknown identifier (%d) in the tree\n",tree->nodeType);
    exit(1);
  }

  return copy;
}

void *deepCopyThingOnVoid(void *);
void *deepCopyEntryOnVoid(void *);

node *deepCopyThing(node *tree) {
  node *copy;

  if (tree == NULL) return NULL;

  if (tree->nodeType == MEMREF) {
    return deepCopyThing(tree->child1);
  }

  copy = (node *) safeMalloc(sizeof(node));
  copy->nodeType = tree->nodeType;

  switch (tree->nodeType) {
  case VARIABLE:
    break;
  case CONSTANT:
    copy->value = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
    mpfr_init2(*(copy->value),mpfr_get_prec(*(tree->value)));
    mpfr_set(*(copy->value),*(tree->value),GMP_RNDN);
    break;
  case ADD:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case SUB:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case MUL:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case DIV:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case SQRT:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case EXP:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case LOG:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case LOG_2:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case LOG_10:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case SIN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case COS:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case TAN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case ASIN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case ACOS:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case ATAN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case SINH:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case COSH:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case TANH:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case ASINH:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case ACOSH:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case ATANH:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case POW:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case NEG:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case ABS:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case DOUBLE:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case SINGLE:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case HALFPRECISION:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case QUAD:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case DOUBLEDOUBLE:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case TRIPLEDOUBLE:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case ERF:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case ERFC:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case LOG_1P:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case EXP_M1:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case DOUBLEEXTENDED:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case LIBRARYFUNCTION:
    copy->libFun = tree->libFun;
    copy->libFunDeriv = tree->libFunDeriv;
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case LIBRARYCONSTANT:
    copy->libFun = tree->libFun;
    break;
  case PROCEDUREFUNCTION:
    copy->libFunDeriv = tree->libFunDeriv;
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case CEIL:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case FLOOR:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case NEARESTINT:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case PI_CONST:
    break;
  case COMMANDLIST:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case WHILE:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case IFELSE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case IF:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case FOR:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case FORIN:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case QUIT:
    break;
  case FALSEQUIT:
    break;
  case FALSERESTART:
    break;
  case RESTART:
    break;
  case PRINT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case SUPPRESSMESSAGE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case UNSUPPRESSMESSAGE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case VARIABLEDECLARATION:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case NOP:
    break;
  case NOPARG:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case NEWFILEPRINT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case APPENDFILEPRINT:
    copy->child1 = deepCopyThing(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case PLOT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case PRINTHEXA:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case PRINTFLOAT:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case PRINTBINARY:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case PRINTEXPANSION:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case BASHEXECUTE:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case EXTERNALPLOT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case WRITE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case NEWFILEWRITE:
    copy->child1 = deepCopyThing(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case APPENDFILEWRITE:
    copy->child1 = deepCopyThing(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case ASCIIPLOT:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case PRINTXML:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case PRINTXMLNEWFILE:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case PRINTXMLAPPENDFILE:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case WORSTCASE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case RENAME:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case AUTOPRINT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case EXTERNALPROC:
    copy->child1 = deepCopyThing(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyIntPtrOnVoid);
    break;
  case ASSIGNMENT:
    copy->child1 = deepCopyThing(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case FLOATASSIGNMENT:
    copy->child1 = deepCopyThing(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case LIBRARYBINDING:
    copy->child1 = deepCopyThing(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case LIBRARYCONSTANTBINDING:
    copy->child1 = deepCopyThing(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case PRECASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case POINTSASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case DIAMASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case DISPLAYASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case VERBOSITYASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case CANONICALASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case AUTOSIMPLIFYASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case SHOWMESSAGENUMBERSASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case TAYLORRECURSASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case TIMINGASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case FULLPARENASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case MIDPOINTASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case DIEONERRORMODEASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case RATIONALMODEASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case SUPPRESSWARNINGSASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case HOPITALRECURSASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case PRECSTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case POINTSSTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case DIAMSTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case DISPLAYSTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case VERBOSITYSTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case CANONICALSTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case AUTOSIMPLIFYSTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case SHOWMESSAGENUMBERSSTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case TAYLORRECURSSTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case TIMINGSTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case FULLPARENSTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case MIDPOINTSTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case DIEONERRORMODESTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case RATIONALMODESTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case SUPPRESSWARNINGSSTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case HOPITALRECURSSTILLASSIGN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case AND:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case OR:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case NEGATION:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case INDEX:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case COMPAREEQUAL:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case COMPAREIN:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case COMPARELESS:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case COMPAREGREATER:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case COMPARELESSEQUAL:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case COMPAREGREATEREQUAL:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case COMPARENOTEQUAL:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case CONCAT:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case ADDTOLIST:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case PREPEND:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case APPEND:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case ON:
    break;
  case OFF:
    break;
  case DYADIC:
    break;
  case POWERS:
    break;
  case BINARY:
    break;
  case HEXADECIMAL:
    break;
  case FILESYM:
    break;
  case POSTSCRIPT:
    break;
  case POSTSCRIPTFILE:
    break;
  case PERTURB:
    break;
  case ROUNDDOWN:
    break;
  case ROUNDUP:
    break;
  case ROUNDTOZERO:
    break;
  case ROUNDTONEAREST:
    break;
  case HONORCOEFF:
    break;
  case TRUE:
    break;
  case UNIT:
    break;
  case FALSE:
    break;
  case DEFAULT:
    break;
  case DECIMAL:
    break;
  case ABSOLUTESYM:
    break;
  case RELATIVESYM:
    break;
  case FIXED:
    break;
  case FLOATING:
    break;
  case ERRORSPECIAL:
    break;
  case DOUBLESYMBOL:
    break;
  case SINGLESYMBOL:
    break;
  case QUADSYMBOL:
    break;
  case HALFPRECISIONSYMBOL:
    break;
  case DOUBLEEXTENDEDSYMBOL:
    break;
  case DOUBLEDOUBLESYMBOL:
    break;
  case TRIPLEDOUBLESYMBOL:
    break;
  case STRING:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case TABLEACCESS:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case ISBOUND:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case TABLEACCESSWITHSUBSTITUTE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case STRUCTACCESS:
    copy->child1 = deepCopyThing(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case APPLY:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case DECIMALCONSTANT:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case MIDPOINTCONSTANT:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case DYADICCONSTANT:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case HEXCONSTANT:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case HEXADECIMALCONSTANT:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case BINARYCONSTANT:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case EMPTYLIST:
    break;
  case LIST:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    copy->argArray = NULL;
    copy->argArraySize = 0;
    copy->argArrayAllocSize = 0;
    break;
  case STRUCTURE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyEntryOnVoid);
    break;
  case FINALELLIPTICLIST:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    copy->argArray = NULL;
    copy->argArraySize = 0;
    copy->argArrayAllocSize = 0;
    break;
  case ELLIPTIC:
    break;
  case RANGE:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case DEBOUNDMAX:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case DEBOUNDMIN:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case DEBOUNDMID:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case EVALCONST:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case DIFF:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case BASHEVALUATE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case GETSUPPRESSEDMESSAGES:
    break;
  case DIRTYSIMPLIFY:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case SIMPLIFYSAFE:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case TIME:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case REMEZ:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case MATCH:
    copy->child1 = deepCopyThing(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case MATCHELEMENT:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case MIN:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case MAX:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case FPMINIMAX:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case HORNER:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case CANONICAL:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case EXPAND:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case TAYLOR:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case TAYLORFORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case CHEBYSHEVFORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case AUTODIFF:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case DEGREE:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case NUMERATOR:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case DENOMINATOR:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case SUBSTITUTE:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case COMPOSEPOLYNOMIALS:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case COEFF:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case SUBPOLY:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case ROUNDCOEFFICIENTS:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case RATIONALAPPROX:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case ACCURATEINFNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case ROUNDTOFORMAT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case EVALUATE:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case PARSE:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case READXML:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case EXECUTE:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case INFNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case SUPNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case FINDZEROS:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case FPFINDZEROS:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case DIRTYINFNORM:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case NUMBERROOTS:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case INTEGRAL:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case DIRTYINTEGRAL:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case IMPLEMENTPOLY:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case IMPLEMENTCONST:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case CHECKINFNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case ZERODENOMINATORS:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case ISEVALUABLE:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case SEARCHGAL:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case GUESSDEGREE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case ASSIGNMENTININDEXING:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case FLOATASSIGNMENTININDEXING:
    copy->arguments = copyChainWithoutReversal(tree->arguments, deepCopyThingOnVoid);
    break;
  case ASSIGNMENTINSTRUCTURE:
    copy->child1 = deepCopyThing(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case FLOATASSIGNMENTINSTRUCTURE:
    copy->child1 = deepCopyThing(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case PROTOASSIGNMENTINSTRUCTURE:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case PROTOFLOATASSIGNMENTINSTRUCTURE:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case DIRTYFINDZEROS:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    break;
  case HEAD:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case ROUNDCORRECTLY:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case READFILE:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case REVERT:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case SORT:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case MANTISSA:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case EXPONENT:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case PRECISION:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case TAIL:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case LENGTH:
    copy->child1 = deepCopyThing(tree->child1);
    break;
  case EXTERNALPROCEDUREUSAGE:
    copy->libProc = tree->libProc;
    break;
  case PROC:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case BIND:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case PROCILLIM:
    copy->child1 = deepCopyThing(tree->child1);
    copy->child2 = deepCopyThing(tree->child2);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case PRECDEREF:
    break;
  case POINTSDEREF:
    break;
  case DIAMDEREF:
    break;
  case DISPLAYDEREF:
    break;
  case VERBOSITYDEREF:
    break;
  case CANONICALDEREF:
    break;
  case AUTOSIMPLIFYDEREF:
    break;
  case SHOWMESSAGENUMBERSDEREF:
    break;
  case TAYLORRECURSDEREF:
    break;
  case TIMINGDEREF:
    break;
  case FULLPARENDEREF:
    break;
  case MIDPOINTDEREF:
    break;
  case DIEONERRORMODEDEREF:
    break;
  case RATIONALMODEDEREF:
    break;
  case SUPPRESSWARNINGSDEREF:
    break;
  case HOPITALRECURSDEREF:
    break;
  default:
    sollyaFprintf(stderr,"Error: deepCopyThing: unknown identifier (%d) in the tree\n",tree->nodeType);
    exit(1);
  }

  return copy;
}

void *deepCopyThingOnVoid(void *tree) {
  return (void *) deepCopyThing((node *) tree);
}

void *copyThingOnVoid(void *tree) {
  return (void *) copyThing((node *) tree);
}

void *copyEntryOnVoid(void *ptr) {
  entry *copy;
  copy = (entry *) safeMalloc(sizeof(entry));
  copy->name = (char *) safeCalloc(strlen(((entry *) ptr)->name)+1,sizeof(char));
  strcpy(copy->name,((entry *) ptr)->name);
  copy->value = copyThing((node *) (((entry *) ptr)->value));
  return copy;
}

void *deepCopyEntryOnVoid(void *ptr) {
  entry *copy;
  copy = (entry *) safeMalloc(sizeof(entry));
  copy->name = (char *) safeCalloc(strlen(((entry *) ptr)->name)+1,sizeof(char));
  strcpy(copy->name,((entry *) ptr)->name);
  copy->value = deepCopyThing((node *) (((entry *) ptr)->value));
  return copy;
}

void *evaluateEntryOnVoid(void *ptr) {
  entry *copy;
  copy = (entry *) safeMalloc(sizeof(entry));
  copy->name = (char *) safeCalloc(strlen(((entry *) ptr)->name)+1,sizeof(char));
  strcpy(copy->name,((entry *) ptr)->name);
  copy->value = evaluateThing((node *) (((entry *) ptr)->value));
  return copy;
}

void freeEntryOnVoid(void *ptr) {
  safeFree(((entry *) ptr)->name);
  freeThing((node *) (((entry *) ptr)->value));
  safeFree(ptr);
}


char *getTimingStringForThing(node *tree) {
  char *constString, *newString;

  if (tree == NULL) return NULL;

  if (tree->nodeType == MEMREF) {
    return getTimingStringForThing(tree->child1);
  }

  switch (tree->nodeType) {
  case VARIABLE:
    constString = NULL;
    break;
  case CONSTANT:
    constString = NULL;
    break;
  case ADD:
    constString = NULL;
    break;
  case SUB:
    constString = NULL;
    break;
  case MUL:
    constString = NULL;
    break;
  case DIV:
    constString = NULL;
    break;
  case SQRT:
    constString = NULL;
    break;
  case EXP:
    constString = NULL;
    break;
  case LOG:
    constString = NULL;
    break;
  case LOG_2:
    constString = NULL;
    break;
  case LOG_10:
    constString = NULL;
    break;
  case SIN:
    constString = NULL;
    break;
  case COS:
    constString = NULL;
    break;
  case TAN:
    constString = NULL;
    break;
  case ASIN:
    constString = NULL;
    break;
  case ACOS:
    constString = NULL;
    break;
  case ATAN:
    constString = NULL;
    break;
  case SINH:
    constString = NULL;
    break;
  case COSH:
    constString = NULL;
    break;
  case TANH:
    constString = NULL;
    break;
  case ASINH:
    constString = NULL;
    break;
  case ACOSH:
    constString = NULL;
    break;
  case ATANH:
    constString = NULL;
    break;
  case POW:
    constString = NULL;
    break;
  case NEG:
    constString = NULL;
    break;
  case ABS:
    constString = NULL;
    break;
  case DOUBLE:
    constString = NULL;
    break;
  case SINGLE:
    constString = NULL;
    break;
  case QUAD:
    constString = NULL;
    break;
  case HALFPRECISION:
    constString = NULL;
    break;
  case DOUBLEDOUBLE:
    constString = NULL;
    break;
  case TRIPLEDOUBLE:
    constString = NULL;
    break;
  case ERF:
    constString = NULL;
    break;
  case ERFC:
    constString = NULL;
    break;
  case LOG_1P:
    constString = NULL;
    break;
  case EXP_M1:
    constString = NULL;
    break;
  case DOUBLEEXTENDED:
    constString = NULL;
    break;
  case LIBRARYFUNCTION:
    constString = NULL;
    break;
  case LIBRARYCONSTANT:
    constString = NULL;
    break;
  case PROCEDUREFUNCTION:
    constString = NULL;
    break;
  case CEIL:
    constString = NULL;
    break;
  case FLOOR:
    constString = NULL;
    break;
  case NEARESTINT:
    constString = NULL;
    break;
  case PI_CONST:
    constString = NULL;
    break;
  case COMMANDLIST:
    constString = "begin-end statement";
    break;
  case WHILE:
    constString = "while loop";
    break;
  case IFELSE:
    constString = "if-then-else statement";
    break;
  case IF:
    constString = "if-then statement";
    break;
  case FOR:
    constString = "for loop";
    break;
  case FORIN:
    constString = "for-in loop";
    break;
  case QUIT:
    constString = NULL;
    break;
  case NOP:
    constString = NULL;
    break;
  case NOPARG:
    constString = "doing nothing";
    break;
  case FALSEQUIT:
    constString = NULL;
    break;
  case FALSERESTART:
    constString = NULL;
    break;
  case RESTART:
    constString = NULL;
    break;
  case PRINT:
    constString = "print statement";
    break;
  case SUPPRESSMESSAGE:
    constString = "suppressing a message";
    break;
  case UNSUPPRESSMESSAGE:
    constString = "unsuppressing a message";
    break;
  case VARIABLEDECLARATION:
    constString = NULL;
    break;
  case NEWFILEPRINT:
    constString = "print-into-new-file statement";
    break;
  case APPENDFILEPRINT:
    constString = "print-into-file statement";
    break;
  case PLOT:
    constString = "plot statement";
    break;
  case PRINTHEXA:
    constString = "printdouble statement";
    break;
  case PRINTFLOAT:
    constString = "printsingle statement";
    break;
  case PRINTBINARY:
    constString = "printbinary statement";
    break;
  case PRINTEXPANSION:
    constString = "printexpansion statement";
    break;
  case BASHEXECUTE:
    constString = "bashexecute statement";
    break;
  case EXTERNALPLOT:
    constString = "externalplot statement";
    break;
  case WRITE:
    constString = "write statement";
    break;
  case NEWFILEWRITE:
    constString = "write-into-new-file statement";
    break;
  case APPENDFILEWRITE:
    constString = "write-into-file statement";
    break;
  case ASCIIPLOT:
    constString = "asciiplot statement";
    break;
  case PRINTXML:
    constString = "printing in xml mode";
    break;
  case PRINTXMLNEWFILE:
    constString = "printing in xml mode into a new file";
    break;
  case PRINTXMLAPPENDFILE:
    constString = "printing in xml mode into a file";
    break;
  case WORSTCASE:
    constString = "worstcase statement";
    break;
  case RENAME:
    constString = "rename statement";
    break;
  case AUTOPRINT:
    constString = "automatic printing of expressions";
    break;
  case ASSIGNMENT:
    constString = "assignment";
    break;
  case FLOATASSIGNMENT:
    constString = "floating-point assignment";
    break;
  case EXTERNALPROC:
    constString = "binding of an external procedure";
    break;
  case LIBRARYBINDING:
    constString = "binding of a library function";
    break;
  case LIBRARYCONSTANTBINDING:
    constString = "binding of a library constant";
    break;
  case PRECASSIGN:
    constString = "assigning the precision";
    break;
  case POINTSASSIGN:
    constString = "assigning the point number";
    break;
  case DIAMASSIGN:
    constString = "assigning the diameter";
    break;
  case DISPLAYASSIGN:
    constString = "assigning the display mode";
    break;
  case VERBOSITYASSIGN:
    constString = "assigning the verbosity";
    break;
  case CANONICALASSIGN:
    constString = "assigning the canonical printing mode";
    break;
  case AUTOSIMPLIFYASSIGN:
    constString = "assigning the automatic simplification mode";
    break;
  case SHOWMESSAGENUMBERSASSIGN:
    constString = "assigning the show-message-numbers mode";
    break;
  case TAYLORRECURSASSIGN:
    constString = "assigning the number of recursions for Taylor";
    break;
  case TIMINGASSIGN:
    constString = "assigning the timing mode";
    break;
  case FULLPARENASSIGN:
    constString = "full parenthezation mode";
    break;
  case MIDPOINTASSIGN:
    constString = "assigning the midpoint printing mode";
    break;
  case DIEONERRORMODEASSIGN:
    constString = "assigning the die-on-error mode";
    break;
  case RATIONALMODEASSIGN:
    constString = "assigning the midpoint printing mode";
    break;
  case SUPPRESSWARNINGSASSIGN:
    constString = "assigning the warning activation";
    break;
  case HOPITALRECURSASSIGN:
    constString = "assigning the number of recursions for Hopital";
    break;
  case PRECSTILLASSIGN:
    constString = NULL;
    break;
  case POINTSSTILLASSIGN:
    constString = NULL;
    break;
  case DIAMSTILLASSIGN:
    constString = NULL;
    break;
  case DISPLAYSTILLASSIGN:
    constString = NULL;
    break;
  case VERBOSITYSTILLASSIGN:
    constString = NULL;
    break;
  case CANONICALSTILLASSIGN:
    constString = NULL;
    break;
  case AUTOSIMPLIFYSTILLASSIGN:
    constString = NULL;
    break;
  case SHOWMESSAGENUMBERSSTILLASSIGN:
    constString = NULL;
    break;
  case TAYLORRECURSSTILLASSIGN:
    constString = NULL;
    break;
  case TIMINGSTILLASSIGN:
    constString = NULL;
    break;
  case FULLPARENSTILLASSIGN:
    constString = NULL;
    break;
  case MIDPOINTSTILLASSIGN:
    constString = NULL;
    break;
  case DIEONERRORMODESTILLASSIGN:
    constString = NULL;
    break;
  case RATIONALMODESTILLASSIGN:
    constString = NULL;
    break;
  case SUPPRESSWARNINGSSTILLASSIGN:
    constString = NULL;
    break;
  case HOPITALRECURSSTILLASSIGN:
    constString = NULL;
    break;
  case AND:
    constString = NULL;
    break;
  case OR:
    constString = NULL;
    break;
  case NEGATION:
    constString = NULL;
    break;
  case INDEX:
    constString = "indexing in a string or list";
    break;
  case COMPAREEQUAL:
    constString = "compare equal";
    break;
  case COMPAREIN:
    constString = "compare if in interval";
    break;
  case COMPARELESS:
    constString = "compare less";
    break;
  case COMPAREGREATER:
    constString = "compare greater";
    break;
  case COMPARELESSEQUAL:
    constString = "compare less or equal";
    break;
  case COMPAREGREATEREQUAL:
    constString = "compare greater or equal";
    break;
  case COMPARENOTEQUAL:
    constString = "compare not equal";
    break;
  case CONCAT:
    constString = "concatenation of strings or lists";
    break;
  case ADDTOLIST:
    constString = "adding an element to a list";
    break;
  case APPEND:
    constString = "appending an element to a list";
    break;
  case PREPEND:
    constString = "prepending an element to a list";
    break;
  case ON:
    constString = NULL;
    break;
  case OFF:
    constString = NULL;
    break;
  case DYADIC:
    constString = NULL;
    break;
  case POWERS:
    constString = NULL;
    break;
  case BINARY:
    constString = NULL;
    break;
  case HEXADECIMAL:
    constString = NULL;
    break;
  case FILESYM:
    constString = NULL;
    break;
  case POSTSCRIPT:
    constString = NULL;
    break;
  case POSTSCRIPTFILE:
    constString = NULL;
    break;
  case PERTURB:
    constString = NULL;
    break;
  case ROUNDDOWN:
    constString = NULL;
    break;
  case ROUNDUP:
    constString = NULL;
    break;
  case ROUNDTOZERO:
    constString = NULL;
    break;
  case ROUNDTONEAREST:
    constString = NULL;
    break;
  case HONORCOEFF:
    constString = NULL;
    break;
  case TRUE:
    constString = NULL;
    break;
  case UNIT:
    constString = NULL;
    break;
  case FALSE:
    constString = NULL;
    break;
  case DEFAULT:
    constString = NULL;
    break;
  case DECIMAL:
    constString = NULL;
    break;
  case ABSOLUTESYM:
    constString = NULL;
    break;
  case RELATIVESYM:
    constString = NULL;
    break;
  case FIXED:
    constString = NULL;
    break;
  case FLOATING:
    constString = NULL;
    break;
  case ERRORSPECIAL:
    constString = NULL;
    break;
  case DOUBLESYMBOL:
    constString = NULL;
    break;
  case SINGLESYMBOL:
    constString = NULL;
    break;
  case QUADSYMBOL:
    constString = NULL;
    break;
  case HALFPRECISIONSYMBOL:
    constString = NULL;
    break;
  case DOUBLEEXTENDEDSYMBOL:
    constString = NULL;
    break;
  case DOUBLEDOUBLESYMBOL:
    constString = NULL;
    break;
  case TRIPLEDOUBLESYMBOL:
    constString = NULL;
    break;
  case STRING:
    constString = NULL;
    break;
  case TABLEACCESS:
    constString = "dereferencing an identifier";
    break;
  case ISBOUND:
    constString = "testing if an identifier is bound";
    break;
  case TABLEACCESSWITHSUBSTITUTE:
    constString = "dereferencing an identifier and substituting";
    break;
  case STRUCTACCESS:
    constString = "accessing a member of a structure";
    break;
  case APPLY:
    constString = "applying something to something";
    break;
  case DECIMALCONSTANT:
    constString = "reading a decimal constant";
    break;
  case MIDPOINTCONSTANT:
    constString = "reading a midpoint constant";
    break;
  case DYADICCONSTANT:
    constString = "reading a dyadic constant";
    break;
  case HEXCONSTANT:
    constString = "reading a hexadecimal constant";
    break;
  case HEXADECIMALCONSTANT:
    constString = "reading a hexadecimal constant";
    break;
  case BINARYCONSTANT:
    constString = "reading a binary constant";
    break;
  case EMPTYLIST:
    constString = NULL;
    break;
  case LIST:
    constString = "handling a list";
    break;
  case STRUCTURE:
    constString = "handling a structure";
    break;
  case FINALELLIPTICLIST:
    constString = "handling a finally elliptic list";
    break;
  case ELLIPTIC:
    constString = NULL;
    break;
  case RANGE:
    constString = "handling a range";
    break;
  case DEBOUNDMAX:
    constString = NULL;
    break;
  case DEBOUNDMIN:
    constString = NULL;
    break;
  case DEBOUNDMID:
    constString = NULL;
    break;
  case EVALCONST:
    constString = "floating-point evaluation of a constant expression";
    break;
  case DIFF:
    constString = "differentiation";
    break;
  case BASHEVALUATE:
    constString = "evaluating a string as a bash command";
    break;
  case GETSUPPRESSEDMESSAGES:
    constString = "getting the list of suppressed messages";
    break;
  case DIRTYSIMPLIFY:
    constString = "simplifying with floating-point evaluation";
    break;
  case SIMPLIFYSAFE:
    constString = "simplifying";
    break;
  case TIME:
    constString = "timing a command";
    break;
  case REMEZ:
    constString = "computing a minimax approximation";
    break;
  case MATCH:
    constString = "matching an expression";
  case MATCHELEMENT:
    constString = NULL;
    break;
  case MIN:
    constString = "computing a minimum";
    break;
  case MAX:
    constString = "computing a maximum";
    break;
  case FPMINIMAX:
    constString = "computing a fpminimax approximation";
    break;
  case HORNER:
    constString = "conversion to horner notation";
    break;
  case CANONICAL:
    constString = "conversion to canonical notation";
    break;
  case EXPAND:
    constString = "expanding an expression";
    break;
  case TAYLOR:
    constString = "taylor";
    break;
  case TAYLORFORM:
    constString = "taylorform";
    break;
  case CHEBYSHEVFORM:
    constString = "chebyshevform";
    break;
  case AUTODIFF:
    constString = "autodiff";
    break;
  case DEGREE:
    constString = "getting the degree";
    break;
  case NUMERATOR:
    constString = "getting the numerator";
    break;
  case DENOMINATOR:
    constString = "getting the denominator";
    break;
  case SUBSTITUTE:
    constString = "substituting";
    break;
  case COMPOSEPOLYNOMIALS:
    constString = "composing two polynomials";
    break;
  case COEFF:
    constString = "getting a coefficient";
    break;
  case SUBPOLY:
    constString = "getting a sub-polynomial";
    break;
  case ROUNDCOEFFICIENTS:
    constString = "rounding coefficients";
    break;
  case RATIONALAPPROX:
    constString = "computing a rational approximation";
    break;
  case ACCURATEINFNORM:
    constString = "computing an accurate infinity norm";
    break;
  case ROUNDTOFORMAT:
    constString = "rounding to a format";
    break;
  case EVALUATE:
    constString = "evaluating";
    break;
  case PARSE:
    constString = "parsing a mini-expression";
    break;
  case READXML:
    constString = "reading a XML-tree";
    break;
  case EXECUTE:
    constString = "executing a file";
    break;
  case INFNORM:
    constString = "computing an infinity norm";
    break;
  case SUPNORM:
    constString = "computing a supremum norm";
    break;
  case FINDZEROS:
    constString = "bounding zeros";
    break;
  case FPFINDZEROS:
    constString = "searching zeros";
    break;
  case DIRTYINFNORM:
    constString = "computing an infinity norm dirtily";
    break;
  case NUMBERROOTS:
    constString = "computing the number of real roots of a polynomial";
    break;
  case INTEGRAL:
    constString = "computing an integral";
    break;
  case DIRTYINTEGRAL:
    constString = "computing an integral dirtily";
    break;
  case IMPLEMENTPOLY:
    constString = "implementing a polynomial";
    break;
  case IMPLEMENTCONST:
    constString = "implementing a constant";
    break;
  case CHECKINFNORM:
    constString = "checking an infinity norm";
    break;
  case ZERODENOMINATORS:
    constString = "searching zeros of denominators";
    break;
  case ISEVALUABLE:
    constString = "testing if evaluable";
    break;
  case SEARCHGAL:
    constString = "searching a Gal value";
    break;
  case GUESSDEGREE:
    constString = "guessing a degree for Remez";
    break;
  case ASSIGNMENTININDEXING:
    constString = "assigning to an indexed element of a list";
    break;
  case FLOATASSIGNMENTININDEXING:
    constString = "assigning a floating-point value to an indexed element of a list";
    break;
  case ASSIGNMENTINSTRUCTURE:
    constString = "assigning an element to a structure";
    break;
  case FLOATASSIGNMENTINSTRUCTURE:
    constString = "assigning a floating-point valued element to a structure";
    break;
  case PROTOASSIGNMENTINSTRUCTURE:
    constString = NULL;
    break;
  case PROTOFLOATASSIGNMENTINSTRUCTURE:
    constString = NULL;
    break;
  case DIRTYFINDZEROS:
    constString = "searching zeros dirtily";
    break;
  case HEAD:
    constString = NULL;
    break;
  case ROUNDCORRECTLY:
    constString = "rounding a range to a value";
    break;
  case READFILE:
    constString = "reading a file into a string";
    break;
  case REVERT:
    constString = "reverting a list";
    break;
  case SORT:
    constString = "sorting a list";
    break;
  case EXPONENT:
    constString = "computing the exponent of a value";
    break;
  case MANTISSA:
    constString = "computing the integer mantissa of a value";
    break;
  case PRECISION:
    constString = "computing the effective precision of a value";
    break;
  case TAIL:
    constString = NULL;
    break;
  case LENGTH:
    constString = "computing the length of a list";
    break;
  case EXTERNALPROCEDUREUSAGE:
    constString = "executing an external procedure";
    break;
  case PROC:
    constString = "executing a procedure";
    break;
  case BIND:
    constString = "binding an argument of a procedure";
    break;
  case PROCILLIM:
    constString = "executing a procedure";
    break;
  case PRECDEREF:
    constString = "dereferencing the precision of the tool";
    break;
  case POINTSDEREF:
    constString = "dereferencing the number of points of the tool";
    break;
  case DIAMDEREF:
    constString = "dereferencing the diameter of the tool";
    break;
  case DISPLAYDEREF:
    constString = "dereferencing the display mode";
    break;
  case VERBOSITYDEREF:
    constString = "dereferencing the verbosity of the tool";
    break;
  case CANONICALDEREF:
    constString = "dereferencing the canonical mode state of the tool";
    break;
  case AUTOSIMPLIFYDEREF:
    constString = "dereferencing the automatic simplification mode state of the tool";
    break;
  case SHOWMESSAGENUMBERSDEREF:
    constString = "dereferencing the show-message-numbers mode state of the tool";
    break;
  case TAYLORRECURSDEREF:
    constString = "dereferencing the number of recursions for Taylor";
    break;
  case TIMINGDEREF:
    constString = "dereferencing the timing mode state of the tool";
    break;
  case FULLPARENDEREF:
    constString = "dereferencing the full parenthezation mode state of the tool";
    break;
  case MIDPOINTDEREF:
    constString = "dereferencing the midpoint mode state of the tool";
    break;
  case DIEONERRORMODEDEREF:
    constString = "dereferencing the die-on-error mode state of the tool";
    break;
  case RATIONALMODEDEREF:
    constString = "dereferencing the rational number mode state of the tool";
    break;
  case SUPPRESSWARNINGSDEREF:
    constString = "dereferencing the warning activation state of the tool";
    break;
  case HOPITALRECURSDEREF:
    constString = "dereferencing the numbers of recursions for Hopital";
    break;
  default:
    sollyaFprintf(stderr,"Error: getTimingStringForThing: unknown identifier (%d) in the tree\n",tree->nodeType);
    exit(1);
  }

  if (constString == NULL) return NULL;

  newString = (char *) safeCalloc(strlen(constString) + 1,sizeof(char));
  strcpy(newString,constString);

  return newString;
}



int isPureTree(node *tree) {
  switch (tree->nodeType) {
  case MEMREF:
    return isPureTree(tree->child1);
    break;
  case VARIABLE:
    return 1;
    break;
  case CONSTANT:
    return 1;
    break;
  case ADD:
    return (isPureTree(tree->child1) && isPureTree(tree->child2));
    break;
  case SUB:
    return (isPureTree(tree->child1) && isPureTree(tree->child2));
    break;
  case MUL:
    return (isPureTree(tree->child1) && isPureTree(tree->child2));
    break;
  case DIV:
    return (isPureTree(tree->child1) && isPureTree(tree->child2));
    break;
  case SQRT:
    return isPureTree(tree->child1);
    break;
  case EXP:
    return isPureTree(tree->child1);
    break;
  case LOG:
    return isPureTree(tree->child1);
    break;
  case LOG_2:
    return isPureTree(tree->child1);
    break;
  case LOG_10:
    return isPureTree(tree->child1);
    break;
  case SIN:
    return isPureTree(tree->child1);
    break;
  case COS:
    return isPureTree(tree->child1);
    break;
  case TAN:
    return isPureTree(tree->child1);
    break;
  case ASIN:
    return isPureTree(tree->child1);
    break;
  case ACOS:
    return isPureTree(tree->child1);
    break;
  case ATAN:
    return isPureTree(tree->child1);
    break;
  case SINH:
    return isPureTree(tree->child1);
    break;
  case COSH:
    return isPureTree(tree->child1);
    break;
  case TANH:
    return isPureTree(tree->child1);
    break;
  case ASINH:
    return isPureTree(tree->child1);
    break;
  case ACOSH:
    return isPureTree(tree->child1);
    break;
  case ATANH:
    return isPureTree(tree->child1);
    break;
  case POW:
    return (isPureTree(tree->child1) && isPureTree(tree->child2));
    break;
  case NEG:
    return isPureTree(tree->child1);
    break;
  case ABS:
    return isPureTree(tree->child1);
    break;
  case DOUBLE:
    return isPureTree(tree->child1);
    break;
  case SINGLE:
    return isPureTree(tree->child1);
    break;
  case QUAD:
    return isPureTree(tree->child1);
    break;
  case HALFPRECISION:
    return isPureTree(tree->child1);
    break;
  case DOUBLEDOUBLE:
    return isPureTree(tree->child1);
    break;
  case TRIPLEDOUBLE:
    return isPureTree(tree->child1);
    break;
  case ERF:
    return isPureTree(tree->child1);
    break;
  case ERFC:
    return isPureTree(tree->child1);
    break;
  case LOG_1P:
    return isPureTree(tree->child1);
    break;
  case EXP_M1:
    return isPureTree(tree->child1);
    break;
  case DOUBLEEXTENDED:
    return isPureTree(tree->child1);
    break;
  case LIBRARYFUNCTION:
    return isPureTree(tree->child1);
    break;
  case LIBRARYCONSTANT:
    return 1;
    break;
  case PROCEDUREFUNCTION:
    return isPureTree(tree->child1);
    break;
  case CEIL:
    return isPureTree(tree->child1);
    break;
  case FLOOR:
    return isPureTree(tree->child1);
    break;
  case NEARESTINT:
    return isPureTree(tree->child1);
    break;
  case PI_CONST:
    return 1;
    break;
  default:
    return 0;
  }
}

int isExtendedPureTree(node *tree) {
  switch (tree->nodeType) {
  case MEMREF:
    return isExtendedPureTree(tree->child1);
    break;
  case DEFAULT:
    return 1;
    break;
  case VARIABLE:
    return 1;
    break;
  case TABLEACCESS:
    return 1;
    break;
  case TABLEACCESSWITHSUBSTITUTE:
    if (tree->arguments == NULL) return 0;
    if (tree->arguments->next != NULL) return 0;
    return 1;
    break;
  case APPLY:
    if (tree->child1->nodeType != VARIABLE) {
      if (variablename == NULL) return 0;
      if (tree->child1->nodeType != TABLEACCESS) return 0;
      if (strcmp(variablename,tree->child1->string)) return 0;
    }
    if (tree->arguments == NULL) return 0;
    if (tree->arguments->next != NULL) return 0;
    return 1;
    break;
  case CONSTANT:
    return 1;
    break;
  case ADD:
    return (isExtendedPureTree(tree->child1) && isExtendedPureTree(tree->child2));
    break;
  case SUB:
    return (isExtendedPureTree(tree->child1) && isExtendedPureTree(tree->child2));
    break;
  case MUL:
    return (isExtendedPureTree(tree->child1) && isExtendedPureTree(tree->child2));
    break;
  case DIV:
    return (isExtendedPureTree(tree->child1) && isExtendedPureTree(tree->child2));
    break;
  case SQRT:
    return isExtendedPureTree(tree->child1);
    break;
  case EXP:
    return isExtendedPureTree(tree->child1);
    break;
  case LOG:
    return isExtendedPureTree(tree->child1);
    break;
  case LOG_2:
    return isExtendedPureTree(tree->child1);
    break;
  case LOG_10:
    return isExtendedPureTree(tree->child1);
    break;
  case SIN:
    return isExtendedPureTree(tree->child1);
    break;
  case COS:
    return isExtendedPureTree(tree->child1);
    break;
  case TAN:
    return isExtendedPureTree(tree->child1);
    break;
  case ASIN:
    return isExtendedPureTree(tree->child1);
    break;
  case ACOS:
    return isExtendedPureTree(tree->child1);
    break;
  case ATAN:
    return isExtendedPureTree(tree->child1);
    break;
  case SINH:
    return isExtendedPureTree(tree->child1);
    break;
  case COSH:
    return isExtendedPureTree(tree->child1);
    break;
  case TANH:
    return isExtendedPureTree(tree->child1);
    break;
  case ASINH:
    return isExtendedPureTree(tree->child1);
    break;
  case ACOSH:
    return isExtendedPureTree(tree->child1);
    break;
  case ATANH:
    return isExtendedPureTree(tree->child1);
    break;
  case POW:
    return (isExtendedPureTree(tree->child1) && isExtendedPureTree(tree->child2));
    break;
  case NEG:
    return isExtendedPureTree(tree->child1);
    break;
  case ABS:
    return isExtendedPureTree(tree->child1);
    break;
  case DOUBLE:
    return isExtendedPureTree(tree->child1);
    break;
  case SINGLE:
    return isExtendedPureTree(tree->child1);
    break;
  case QUAD:
    return isExtendedPureTree(tree->child1);
    break;
  case HALFPRECISION:
    return isExtendedPureTree(tree->child1);
    break;
  case DOUBLEDOUBLE:
    return isExtendedPureTree(tree->child1);
    break;
  case TRIPLEDOUBLE:
    return isExtendedPureTree(tree->child1);
    break;
  case ERF:
    return isExtendedPureTree(tree->child1);
    break;
  case ERFC:
    return isExtendedPureTree(tree->child1);
    break;
  case LOG_1P:
    return isExtendedPureTree(tree->child1);
    break;
  case EXP_M1:
    return isExtendedPureTree(tree->child1);
    break;
  case DOUBLEEXTENDED:
    return isExtendedPureTree(tree->child1);
    break;
  case LIBRARYFUNCTION:
    return isExtendedPureTree(tree->child1);
    break;
  case LIBRARYCONSTANT:
    return 1;
    break;
  case PROCEDUREFUNCTION:
    return isExtendedPureTree(tree->child1);
    break;
  case CEIL:
    return isExtendedPureTree(tree->child1);
    break;
  case FLOOR:
    return isExtendedPureTree(tree->child1);
    break;
  case NEARESTINT:
    return isExtendedPureTree(tree->child1);
    break;
  case PI_CONST:
    return 1;
    break;
  default:
    return 0;
  }
}

int isMatchable(node *);

int isMatchableList(node *tree) {
  chain *curr;
  if (tree->nodeType == MEMREF) return isMatchableList(tree->child1);
  if (isEmptyList(tree)) return 1;
  if (!(isPureList(tree) || isPureFinalEllipticList(tree))) return 0;
  for (curr=tree->arguments;curr!=NULL;curr=curr->next) {
    if (!isMatchable((node *) (curr->value))) return 0;
  }
  return 1;
}

int isString(node *);

int isMatchableConcat(node *tree) {
  if (tree->nodeType == MEMREF) return isMatchableConcat(tree->child1);
  if (tree->nodeType != CONCAT) return 0;
  if (((tree->child1->nodeType == TABLEACCESS) || (tree->child1->nodeType == DEFAULT)) &&
      ((tree->child2->nodeType == TABLEACCESS) || (tree->child2->nodeType == DEFAULT))) return 0;

  if (((isMatchableList(tree->child1) && (!isPureFinalEllipticList(tree->child1))) ||
       (tree->child1->nodeType == TABLEACCESS) || (tree->child1->nodeType == DEFAULT) || isString(tree->child1) ||
       isMatchablePrepend(tree->child1) || isMatchableAppend(tree->child1) ||
       isMatchableConcat(tree->child1)) &&
      (isMatchableList(tree->child2) ||
       (tree->child2->nodeType == TABLEACCESS) || (tree->child2->nodeType == DEFAULT) || isString(tree->child2) ||
       isMatchablePrepend(tree->child2) || isMatchableAppend(tree->child2) ||
       isMatchableConcat(tree->child2))) {
    if (isString(tree->child1) &&
	(!((tree->child2->nodeType == TABLEACCESS) || (tree->child2->nodeType == DEFAULT) || isString(tree->child2) || isMatchableConcat(tree->child2)))) return 0;
    if (isString(tree->child2) &&
	(!((tree->child1->nodeType == TABLEACCESS) || (tree->child1->nodeType == DEFAULT) || isString(tree->child1) || isMatchableConcat(tree->child1)))) return 0;
    return 1;
  }
  return 0;
}

int isMatchablePrepend(node *tree) {
  if (tree->nodeType == MEMREF) return isMatchablePrepend(tree->child1);
  if (tree->nodeType != PREPEND) return 0;
  if (isMatchable(tree->child1) &&
      (isMatchableList(tree->child2) ||
       (tree->child2->nodeType == TABLEACCESS) ||
       isMatchablePrepend(tree->child2) ||
       isMatchableAppend(tree->child2) ||
       isMatchableConcat(tree->child2))) return 1;
  return 0;
}

int isMatchableAppend(node *tree) {
  if (tree->nodeType == MEMREF) return isMatchableAppend(tree->child1);
  if (tree->nodeType != APPEND) return 0;
  if (isMatchable(tree->child2) &&
      ((isMatchableList(tree->child1) && (!isPureFinalEllipticList(tree->child1))) ||
       (tree->child1->nodeType == TABLEACCESS) ||
       isMatchablePrepend(tree->child1) ||
       isMatchableAppend(tree->child1) ||
       isMatchableConcat(tree->child1))) return 1;
  return 0;
}

int isMatchableStructure(node *tree) {
  chain *curr;
  if (tree->nodeType == MEMREF) return isMatchableStructure(tree->child1);
  if (tree->nodeType != STRUCTURE) return 0;
  if (associationContainsDoubleEntries(tree->arguments)) return 0;
  for (curr=tree->arguments; curr != NULL; curr = curr->next) {
    if (!isMatchable((node *) (((entry *) (curr->value))->value))) return 0;
  }
  return 1;
}

int isMatchable(node *tree) {
  if (tree->nodeType == MEMREF) return isMatchable(tree->child1);
  if (isExtendedPureTree(tree)) return 1;
  if (isCorrectlyTypedBaseSymbol(tree)) return 1;
  if ((tree->nodeType == RANGE) &&
      ((tree->child1->nodeType == CONSTANT) ||
       (tree->child1->nodeType == TABLEACCESS) ||
       (tree->child1->nodeType == DEFAULT)) &&
      ((tree->child2->nodeType == CONSTANT) ||
       (tree->child2->nodeType == TABLEACCESS) ||
       (tree->child2->nodeType == DEFAULT))) return 1;
  if (isMatchableList(tree)) return 1;
  if (isMatchableConcat(tree)) return 1;
  if (isMatchablePrepend(tree)) return 1;
  if (isMatchableAppend(tree)) return 1;
  if (isMatchableStructure(tree)) return 1;
  return 0;
}

int isDefault(node *tree) {
  if (tree->nodeType == MEMREF) return isDefault(tree->child1);
  return (tree->nodeType == DEFAULT);
}

int isString(node *tree) {
  if (tree->nodeType == MEMREF) return isString(tree->child1);
  return (tree->nodeType == STRING);
}

int isList(node *tree) {
  if (tree->nodeType == MEMREF) return isList(tree->child1);
  return (tree->nodeType == LIST);
}

int isMatchElement(node *tree) {
  if (tree->nodeType == MEMREF) return isMatchElement(tree->child1);
  return (tree->nodeType == MATCHELEMENT);
}

int isStructure(node *tree) {
  if (tree->nodeType == MEMREF) return isStructure(tree->child1);
  return (tree->nodeType == STRUCTURE);
}

int isEmptyList(node *tree) {
  if (tree->nodeType == MEMREF) return isEmptyList(tree->child1);
  return (tree->nodeType == EMPTYLIST);
}

int isElliptic(node *tree) {
  if (tree->nodeType == MEMREF) return isElliptic(tree->child1);
  return (tree->nodeType == ELLIPTIC);
}


int isPureList(node *tree) {
  chain *curr;

  if (tree->nodeType == MEMREF) return isPureList(tree->child1);

  if (!isList(tree)) return 0;

  if (tree->argArray != NULL) return 1;

  curr = tree->arguments;
  while (curr != NULL) {
    if (isElliptic((node *) (curr->value))) return 0;
    curr = curr->next;
  }

  return 1;
}

int isFinalEllipticList(node *tree) {
  if (tree->nodeType == MEMREF) return isFinalEllipticList(tree->child1);
  return (tree->nodeType == FINALELLIPTICLIST);
}

int isPureFinalEllipticList(node *tree) {
  chain *curr;

  if (tree->nodeType == MEMREF) return isPureFinalEllipticList(tree->child1);

  if (!isFinalEllipticList(tree)) return 0;

  if (tree->argArray != NULL) return 1;

  curr = tree->arguments;
  while (curr != NULL) {
    if (isElliptic((node *) (curr->value))) return 0;
    curr = curr->next;
  }

  return 1;
}




int isRange(node *tree) {
  if (tree->nodeType == MEMREF) return isRange(tree->child1);
  if (tree->nodeType != RANGE) return 0;
  if (tree->child1->nodeType != CONSTANT) return 0;
  if (tree->child2->nodeType != CONSTANT) return 0;
  return 1;
}

int isRangeNonEmpty(node *tree) {
  if (tree->nodeType == MEMREF) return isRangeNonEmpty(tree->child1);
  if (!isRange(tree)) return 0;
  if (mpfr_nan_p(*(tree->child1->value)) ||
      mpfr_nan_p(*(tree->child2->value))) return 1;
  if (mpfr_cmp(*(tree->child1->value),*(tree->child2->value)) > 0) return 0;
  return 1;
}


int isError(node *tree) {
  if (tree->nodeType == MEMREF) return isError(tree->child1);
  if (tree->nodeType == ERRORSPECIAL) return 1;
  return 0;
}


int isBoolean(node *tree) {
  if (tree->nodeType == MEMREF) return isBoolean(tree->child1);
  if (tree->nodeType == TRUE) return 1;
  if (tree->nodeType == FALSE) return 1;
  return 0;
}

int isUnit(node *tree) {
  if (tree->nodeType == MEMREF) return isUnit(tree->child1);
  if (tree->nodeType == UNIT) return 1;
  return 0;
}

int isQuit(node *tree) {
  if (tree->nodeType == MEMREF) return isQuit(tree->child1);
  if (tree->nodeType == QUIT) return 1;
  return 0;
}

int isRestart(node *tree) {
  if (tree->nodeType == MEMREF) return isRestart(tree->child1);
  if (tree->nodeType == RESTART) return 1;
  return 0;
}

int isFalseQuit(node *tree) {
  if (tree->nodeType == MEMREF) return isFalseQuit(tree->child1);
  if (tree->nodeType == FALSEQUIT) return 1;
  return 0;
}

int isFalseRestart(node *tree) {
  if (tree->nodeType == MEMREF) return isFalseRestart(tree->child1);
  if (tree->nodeType == FALSERESTART) return 1;
  return 0;
}


int isExternalProcedureUsage(node *tree) {
  if (tree->nodeType == MEMREF) return isExternalProcedureUsage(tree->child1);
  if (tree->nodeType == EXTERNALPROCEDUREUSAGE) return 1;
  return 0;
}

int isProcedure(node *tree) {
  if (tree->nodeType == MEMREF) return isProcedure(tree->child1);
  if (tree->nodeType == PROC) return 1;
  if (tree->nodeType == PROCILLIM) return 1;
  return 0;
}

int isProcedureNotIllim(node *tree) {
  if (tree->nodeType == MEMREF) return isProcedureNotIllim(tree->child1);
  if (tree->nodeType == PROC) return 1;
  return 0;
}

int isHonorcoeffprec(node *tree) {
  if (tree->nodeType == MEMREF) return isHonorcoeffprec(tree->child1);
  if (tree->nodeType == HONORCOEFF) return 1;
  return 0;
}


int isOnOff(node *tree) {
  if (tree->nodeType == MEMREF) return isOnOff(tree->child1);
  if (tree->nodeType == ON) return 1;
  if (tree->nodeType == OFF) return 1;
  return 0;
}

int isDisplayMode(node *tree) {
  if (tree->nodeType == MEMREF) return isDisplayMode(tree->child1);
  if (tree->nodeType == DECIMAL) return 1;
  if (tree->nodeType == DYADIC) return 1;
  if (tree->nodeType == POWERS) return 1;
  if (tree->nodeType == BINARY) return 1;
  if (tree->nodeType == HEXADECIMAL) return 1;
  return 0;
}

int isRoundingSymbol(node *tree) {
  if (tree->nodeType == MEMREF) return isRoundingSymbol(tree->child1);
  if (tree->nodeType == ROUNDTONEAREST) return 1;
  if (tree->nodeType == ROUNDDOWN) return 1;
  if (tree->nodeType == ROUNDUP) return 1;
  if (tree->nodeType == ROUNDTOZERO) return 1;
  return 0;
}

int isExpansionFormat(node *tree) {
  if (tree->nodeType == MEMREF) return isExpansionFormat(tree->child1);
  if (tree->nodeType == SINGLESYMBOL) return 1;
  if (tree->nodeType == HALFPRECISIONSYMBOL) return 1;
  if (tree->nodeType == QUADSYMBOL) return 1;
  if (tree->nodeType == DOUBLESYMBOL) return 1;
  if (tree->nodeType == DOUBLEDOUBLESYMBOL) return 1;
  if (tree->nodeType == TRIPLEDOUBLESYMBOL) return 1;
  if (tree->nodeType == DOUBLEEXTENDEDSYMBOL) return 1;
  return 0;
}

int isExtendedExpansionFormat(node *tree) {
  if (tree->nodeType == MEMREF) return isExtendedExpansionFormat(tree->child1);
  if (tree->nodeType == SINGLESYMBOL) return 1;
  if (tree->nodeType == HALFPRECISIONSYMBOL) return 1;
  if (tree->nodeType == QUADSYMBOL) return 1;
  if (tree->nodeType == DOUBLESYMBOL) return 1;
  if (tree->nodeType == DOUBLEDOUBLESYMBOL) return 1;
  if (tree->nodeType == TRIPLEDOUBLESYMBOL) return 1;
  if (tree->nodeType == DOUBLEEXTENDEDSYMBOL) return 1;
  if (isPureTree(tree) && isConstant(tree)) return 1;
  return 0;
}


int isRestrictedExpansionFormat(node *tree) {
  if (tree->nodeType == MEMREF) return isRestrictedExpansionFormat(tree->child1);
  if (tree->nodeType == DOUBLESYMBOL) return 1;
  if (tree->nodeType == DOUBLEDOUBLESYMBOL) return 1;
  if (tree->nodeType == TRIPLEDOUBLESYMBOL) return 1;
  return 0;
}


int isFilePostscriptFile(node *tree) {
  if (tree->nodeType == MEMREF) return isFilePostscriptFile(tree->child1);
  if (tree->nodeType == FILESYM) return 1;
  if (tree->nodeType == POSTSCRIPT) return 1;
  if (tree->nodeType == POSTSCRIPTFILE) return 1;
  return 0;
}

int isExternalPlotMode(node *tree) {
  if (tree->nodeType == MEMREF) return isExternalPlotMode(tree->child1);
  if (tree->nodeType == ABSOLUTESYM) return 1;
  if (tree->nodeType == RELATIVESYM) return 1;
  return 0;
}

int evaluateThingToPureTree(node **result, node *tree) {
  node *evaluatedResult;

  evaluatedResult = evaluateThing(tree);

  if (isPureTree(evaluatedResult)) {
    *result = evaluatedResult;
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}

int dirtyIsConstant(node *tree) {
  mpfr_t tempY, tempX, value, step, pseudozero;
  int res, i;

  mpfr_init2(tempY, tools_precision);
  mpfr_init2(tempX, tools_precision);
  mpfr_init2(value, tools_precision);
  mpfr_init2(step, tools_precision);
  mpfr_init2(pseudozero, tools_precision);

  mpfr_set_d(step,2.0,GMP_RNDN);
  mpfr_div_ui(step, step, defaultpoints, GMP_RNDN);
  mpfr_set_d(tempX, -1.0, GMP_RNDN);

  mpfr_set_d(pseudozero,1.0,GMP_RNDN);
  mpfr_div_2ui(pseudozero, pseudozero, tools_precision >> 1, GMP_RNDN);

  res = 1;
  evaluate(value, tree, tempX, tools_precision);
  mpfr_add(tempX, tempX, step, GMP_RNDN);
  for (i=1; i<defaultpoints; i++) {
    evaluate(tempY, tree, tempX, tools_precision);
    mpfr_sub(tempY, tempY, value, GMP_RNDN);
    if (mpfr_cmp_abs(tempY, pseudozero) > 0) {
      res = 0;
      break;
    }
    mpfr_add(tempX, tempX, step, GMP_RNDN);
  }

  mpfr_clear(pseudozero);
  mpfr_clear(step);
  mpfr_clear(value);
  mpfr_clear(tempX);
  mpfr_clear(tempY);

  return res;
}

/* Attention: we don't really understand the semantics of the
   parameter 'silent' any more. So we added an additional parameter
   superSilent. Probably, this should be unified. In any case, please
   don't add a parameter 'superSuperSilent' with the same reason.
*/
int evaluateThingToConstant(mpfr_t result, node *tree, mpfr_t *defaultVal, int silent, int superSilent) {
  node *evaluatedResult, *simplified, *simplified2;
  mpfr_t tempMpfr, tempResult;
  int res, noMessage;
  int exact, notfaithful;
  rangetype xrange, yrange;
  int okaySign, sign;

  notfaithful = 0;
  exact = 0;

  evaluatedResult = evaluateThing(tree);

  if ((defaultVal != NULL) && (isDefault(evaluatedResult))) {
    mpfr_set_prec(result,mpfr_get_prec(*defaultVal));
    simplifyMpfrPrec(result, *defaultVal);
    freeThing(evaluatedResult);
    return 1;
  }

  if (isPureTree(evaluatedResult)) {

    if (treeSize(evaluatedResult) <= MAXHORNERTREESIZE) {
      simplified2 = horner(evaluatedResult);
      freeThing(evaluatedResult);
      evaluatedResult = simplified2;
    }

    simplified = simplifyTreeErrorfree(evaluatedResult);
    free_memory(evaluatedResult);

    mpfr_init2(tempMpfr,53);
    mpfr_set_d(tempMpfr,1.0,GMP_RNDN);

    mpfr_init2(tempResult,mpfr_get_prec(result));

    simplified2 = simplifyTree(simplified);

    if (!isConstant(simplified2)) {
      if (dirtyIsConstant(simplified2)) {
	if ((!noRoundingWarnings) && (!superSilent)) {
	  printMessage(1,SOLLYA_MSG_EXPR_SHOULD_BE_CONSTANT_AND_SEEMS_CONSTANT,"Warning: the given expression should be constant in this context.\n");
	  printMessage(1,SOLLYA_MSG_CONTINUATION,"The expression actually seems to be constant but no proof could be established.\n");
	  printMessage(1,SOLLYA_MSG_CONTINUATION,"The resulting syntax error might be unjustified.\n");
	}
      }
      mpfr_clear(tempResult);
      mpfr_clear(tempMpfr);
      freeThing(simplified);
      freeThing(simplified2);
      return 0;
    }

    freeThing(simplified2);

    noMessage = 0;

    if (!isConstant(simplified)) {
      if ((!noRoundingWarnings) && (!superSilent)) {
	printMessage(1,SOLLYA_MSG_EXPR_SHOULD_BE_CONSTANT_AND_IS_CONSTANT_ON_FP,"Warning: the given expression should be constant in this context.\nIt proves constant under floating point evaluation.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"In this evaluation, %s will be set to 1 when evaluating the expression to a constant.\n",((variablename == NULL) ? "_x_" : variablename));
	noMessage = 1;
      }
    }

    if (accessThruMemRef(simplified)->nodeType == CONSTANT) {
      if (mpfr_get_prec(*(accessThruMemRef(simplified)->value)) > mpfr_get_prec(result)) {
	mpfr_set_prec(tempResult, mpfr_get_prec(*(accessThruMemRef(simplified)->value)));
	mpfr_set_prec(result, mpfr_get_prec(*(accessThruMemRef(simplified)->value)));
      }
      mpfr_set(tempResult,*(accessThruMemRef(simplified)->value),GMP_RNDN);
      exact = 1;
      res = 1;
    } else {
      res = evaluateFaithful(tempResult, simplified, tempMpfr, defaultprecision);
    }

    if (!res) {
      okaySign = evaluateSign(&sign,simplified);
      if (okaySign && (sign == 0)) {
	mpfr_set_ui(tempResult,0,GMP_RNDN);
	exact = 1;
	res = 1;
      } else {
	xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	mpfr_init2(*(xrange.a),tools_precision);
	mpfr_init2(*(xrange.b),tools_precision);
	mpfr_init2(*(yrange.a),tools_precision * 256);
	mpfr_init2(*(yrange.b),tools_precision * 256);
	mpfr_set_ui(*(xrange.a),1.0,GMP_RNDD);
	mpfr_set_ui(*(xrange.b),1.0,GMP_RNDU);
	evaluateRangeFunction(yrange, simplified, xrange, tools_precision * 256 + 10);
	if (mpfr_number_p(*(yrange.a)) &&
	    mpfr_number_p(*(yrange.b)) &&
	    (mpfr_sgn(*(yrange.a)) * mpfr_sgn(*(yrange.b)) < 0)) {
	  mpfr_set_ui(tempResult,0,GMP_RNDN);
	  if (!noMessage) {
	    if ((!noRoundingWarnings) && (!superSilent)) {
	      printMessage(1,SOLLYA_MSG_EXPR_SHOULD_BE_CONSTANT_AND_IS_NOT_FAITHFUL,"Warning: the given expression is not a constant but an expression to evaluate\n");
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"and a faithful evaluation is not possible. Will consider the constant to be 0.\n");
	    }
	  } else {
	    if ((!noRoundingWarnings) && (!superSilent)) {
	      printMessage(1,SOLLYA_MSG_SOME_EVALUATION_IS_NOT_FAITHFUL,"Warning: the expression could not be faithfully evaluated.\n");
	    }
	  }
	} else {
	  if (!noMessage) {
	    if ((!noRoundingWarnings) && (!superSilent)) {
	      printMessage(1,SOLLYA_MSG_EXPR_SHOULD_BE_CONSTANT_NO_FAITHFUL_PLAIN_FP,"Warning: the given expression is not a constant but an expression to evaluate\n");
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"and a faithful evaluation is not possible.\n");
              printMessage(1,SOLLYA_MSG_CONTINUATION,"Will use a plain floating-point evaluation, which might yield a completely wrong value.\n");
	    }
	  } else {
	    if ((!noRoundingWarnings) && (!superSilent)) {
	      printMessage(1,SOLLYA_MSG_SOME_EVALUATION_IS_NOT_FAITHFUL,"Warning: the expression could not be faithfully evaluated.\n");
	    }
	  }
	  evaluate(tempResult, simplified, tempMpfr, defaultprecision * 256);
	}
	mpfr_clear(*(xrange.a));
	mpfr_clear(*(xrange.b));
	mpfr_clear(*(yrange.a));
	mpfr_clear(*(yrange.b));
	safeFree(xrange.a);
	safeFree(xrange.b);
	safeFree(yrange.a);
	safeFree(yrange.b);
	notfaithful = 1;
      }
    } else {
      if (accessThruMemRef(simplified)->nodeType != CONSTANT) {
	if (!noMessage) {
	  if ((!noRoundingWarnings) && (!silent) && (!superSilent)) {
	    printMessage(1,SOLLYA_MSG_FAITHFUL_ROUNDING_FOR_EXPR_THAT_SHOULD_BE_CONST,"Warning: the given expression is not a constant but an expression to evaluate. A faithful evaluation to %d bits will be used.\n", mpfr_get_prec(tempResult));
	  }
	}
      }
    }

    free_memory(simplified);
    mpfr_set(result,tempResult,GMP_RNDN);
    simplifyMpfrPrec(result,tempResult);

    mpfr_clear(tempMpfr);
    mpfr_clear(tempResult);

    if (notfaithful) {
      return 3;
    } else {
      if (exact) return 2; else return 1;
    }
  } else {
    freeThing(evaluatedResult);
  }

  return 0;
}


int evaluateThingToInteger(int *result, node *tree, int *defaultVal) {
  mpfr_t *defaultValMpfr, resultMpfr, resultMpfr2, resInt;
  int res, tempResult;

  if (defaultVal != NULL) {
    defaultValMpfr = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
    mpfr_init2(*defaultValMpfr,sizeof(int)*8);
    mpfr_set_si(*defaultValMpfr,*defaultVal,GMP_RNDN);
  } else {
    defaultValMpfr = NULL;
  }

  mpfr_init2(resultMpfr,sizeof(int)*16);
  mpfr_init2(resultMpfr2,sizeof(int)*16);

  res = evaluateThingToConstant(resultMpfr, tree, defaultValMpfr, 0, 0);

  if (res) {
    tempResult = mpfr_get_si(resultMpfr, GMP_RNDN);

    mpfr_sub_si(resultMpfr2, resultMpfr, tempResult, GMP_RNDN);

    if (!mpfr_zero_p(resultMpfr2)) {
      mpfr_init2(resInt,8 * sizeof(int) + 10);
      mpfr_set_si(resInt,tempResult,GMP_RNDN);

      if (mpfr_sgn(resInt) != mpfr_sgn(resultMpfr)) {
	if (mpfr_sgn(resultMpfr) == 0) {
	  tempResult = 0;
	} else {
	  if (mpfr_sgn(resultMpfr) > 0) {
	    tempResult = INT_MAX;
	  } else {
	    tempResult = INT_MIN;
	  }
	}
      }

      mpfr_clear(resInt);

      if (!noRoundingWarnings) {
	printMessage(1,SOLLYA_MSG_CONSTANT_IS_NOT_MACHINE_INTEGER_WILL_ROUND,"Warning: the given expression does not evaluate to a machine integer.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"Will round it to the nearest machine integer.\n");
      }
    }

    *result = tempResult;
  }

  if (defaultValMpfr != NULL) {
    mpfr_clear(*defaultValMpfr);
    safeFree(defaultValMpfr);
  }

  mpfr_clear(resultMpfr);
  mpfr_clear(resultMpfr2);

  return res;
}

int evaluateThingToString(char **result, node *tree) {
  node *evaluatedResult;

  evaluatedResult = evaluateThing(tree);

  if (isString(evaluatedResult)) {
    *result = (char *) safeCalloc(strlen(accessThruMemRef(evaluatedResult)->string)+1,sizeof(char));
    strcpy(*result,accessThruMemRef(evaluatedResult)->string);
    freeThing(evaluatedResult);
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}

int evaluateThingToStringWithDefault(char **result, node *tree, char *defaultVal) {
  node *evaluatedResult;

  evaluatedResult = evaluateThing(tree);

  if (isString(evaluatedResult)) {
    *result = (char *) safeCalloc(strlen(accessThruMemRef(evaluatedResult)->string)+1,sizeof(char));
    strcpy(*result,accessThruMemRef(evaluatedResult)->string);
    freeThing(evaluatedResult);
    return 1;
  }

  if (isDefault(evaluatedResult)) {
    *result = (char *) safeCalloc(strlen(defaultVal)+1,sizeof(char));
    strcpy(*result,defaultVal);
    freeThing(evaluatedResult);
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}

int evaluateThingToRange(mpfr_t a, mpfr_t b, node *tree) {
  node *evaluatedResult;

  evaluatedResult = evaluateThing(tree);

  if (isRange(evaluatedResult)) {
    mpfr_set_prec(a,mpfr_get_prec(*((mpfr_t *) (accessThruMemRef(evaluatedResult)->child1->value))));
    mpfr_set_prec(b,mpfr_get_prec(*((mpfr_t *) (accessThruMemRef(evaluatedResult)->child2->value))));
    mpfr_set(a,*((mpfr_t *) (accessThruMemRef(evaluatedResult)->child1->value)),GMP_RNDN);
    mpfr_set(b,*((mpfr_t *) (accessThruMemRef(evaluatedResult)->child2->value)),GMP_RNDN);
    freeThing(evaluatedResult);
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}

int evaluateThingToBoolean(int *result, node *tree, int *defaultVal) {
  node *evaluatedResult;

  evaluatedResult = evaluateThing(tree);

  if ((defaultVal != NULL) && isDefault(evaluatedResult)) {
    *result = *defaultVal;
    freeThing(evaluatedResult);
    return 1;
  }

  if (isBoolean(evaluatedResult)) {
    if (accessThruMemRef(evaluatedResult)->nodeType == TRUE)
      *result = 1;
    else
      *result = 0;
    freeThing(evaluatedResult);
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}


int evaluateThingToOnOff(int *result, node *tree, int *defaultVal) {
  node *evaluatedResult;

  evaluatedResult = evaluateThing(tree);

  if ((defaultVal != NULL) && isDefault(evaluatedResult)) {
    *result = *defaultVal;
    freeThing(evaluatedResult);
    return 1;
  }

  if (isOnOff(evaluatedResult)) {
    if (accessThruMemRef(evaluatedResult)->nodeType == ON)
      *result = 1;
    else
      *result = 0;
    freeThing(evaluatedResult);
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}

int evaluateThingToExternalPlotMode(int *result, node *tree, int *defaultVal) {
  node *evaluatedResult;

  evaluatedResult = evaluateThing(tree);

  if ((defaultVal != NULL) && isDefault(evaluatedResult)) {
    *result = *defaultVal;
    freeThing(evaluatedResult);
    return 1;
  }

  if (isExternalPlotMode(evaluatedResult)) {
    switch (accessThruMemRef(evaluatedResult)->nodeType) {
    case ABSOLUTESYM:
      *result = ABSOLUTE;
      break;
    case RELATIVESYM:
      *result = RELATIVE;
      break;
    }
    freeThing(evaluatedResult);
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}

int evaluateThingToDisplayMode(int *result, node *tree, int *defaultVal) {
  node *evaluatedResult;

  evaluatedResult = evaluateThing(tree);

  if ((defaultVal != NULL) && isDefault(evaluatedResult)) {
    *result = *defaultVal;
    freeThing(evaluatedResult);
    return 1;
  }

  if (isDisplayMode(evaluatedResult)) {
    switch (accessThruMemRef(evaluatedResult)->nodeType) {
    case DECIMAL:
      *result = 0;
      break;
    case DYADIC:
      *result = 1;
      break;
    case POWERS:
      *result = 2;
      break;
    case BINARY:
      *result = 3;
      break;
    case HEXADECIMAL:
      *result = 4;
      break;
    }
    freeThing(evaluatedResult);
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}


int evaluateThingToRoundingSymbol(int *result, node *tree, int *defaultVal) {
  node *evaluatedResult;

  evaluatedResult = evaluateThing(tree);

  if ((defaultVal != NULL) && isDefault(evaluatedResult)) {
    *result = *defaultVal;
    freeThing(evaluatedResult);
    return 1;
  }

  if (isRoundingSymbol(evaluatedResult)) {
    switch (accessThruMemRef(evaluatedResult)->nodeType) {
    case ROUNDTONEAREST:
      *result = GMP_RNDN;
      break;
    case ROUNDDOWN:
      *result = GMP_RNDD;
      break;
    case ROUNDUP:
      *result = GMP_RNDU;
      break;
    case ROUNDTOZERO:
      *result = GMP_RNDZ;
      break;
    }
    freeThing(evaluatedResult);
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}

int evaluateThingToExpansionFormat(int *result, node *tree) {
  node *evaluatedResult;

  evaluatedResult = evaluateThing(tree);

  if (isExpansionFormat(evaluatedResult)) {
    switch (accessThruMemRef(evaluatedResult)->nodeType) {
    case DOUBLESYMBOL:
      *result = 1;
      break;
    case DOUBLEDOUBLESYMBOL:
      *result = 2;
      break;
    case TRIPLEDOUBLESYMBOL:
      *result = 3;
      break;
    case DOUBLEEXTENDEDSYMBOL:
      *result = 4;
      break;
    case SINGLESYMBOL:
      *result = 5;
      break;
    case HALFPRECISIONSYMBOL:
      *result = 6;
      break;
    case QUADSYMBOL:
      *result = 7;
      break;
    }
    freeThing(evaluatedResult);
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}

int evaluateThingToExtendedExpansionFormat(int *result, node *tree) {
  node *evaluatedResult;
  int resA;

  evaluatedResult = evaluateThing(tree);

  if (isPureTree(evaluatedResult) && isConstant(evaluatedResult)) {
    if (!evaluateThingToInteger(&resA,evaluatedResult,NULL)) {
      freeThing(evaluatedResult);
      return 0;
    }
    if (resA < 2) {
      printMessage(1,SOLLYA_MSG_PRECISION_OF_NUMBERS_MUST_BE_AT_LEAST_TWO_BITS,"Warning: the precision of numbers must be at least 2 bits.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"Will change the precision indication to 2 bits.\n");
      resA = 2;
    }
    *result = resA + 6; /* WHAT THE F**K? Look at line 1002 in double.c to understand. */
    freeThing(evaluatedResult);
    return 1;
  }

  if (isExtendedExpansionFormat(evaluatedResult)) {
    switch (accessThruMemRef(evaluatedResult)->nodeType) {
    case DOUBLESYMBOL:
      *result = 1;
      break;
    case DOUBLEDOUBLESYMBOL:
      *result = 2;
      break;
    case TRIPLEDOUBLESYMBOL:
      *result = 3;
      break;
    case DOUBLEEXTENDEDSYMBOL:
      *result = 4;
      break;
    case SINGLESYMBOL:
      *result = 5;
      break;
    case HALFPRECISIONSYMBOL:
      *result = 6;
      break;
    case QUADSYMBOL:
      *result = 7;
      break;
    }
    freeThing(evaluatedResult);
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}


int evaluateThingToRestrictedExpansionFormat(int *result, node *tree) {
  node *evaluatedResult;

  evaluatedResult = evaluateThing(tree);

  if (isRestrictedExpansionFormat(evaluatedResult)) {
    switch (accessThruMemRef(evaluatedResult)->nodeType) {
    case DOUBLESYMBOL:
      *result = 1;
      break;
    case DOUBLEDOUBLESYMBOL:
      *result = 2;
      break;
    case TRIPLEDOUBLESYMBOL:
      *result = 3;
      break;
    }
    freeThing(evaluatedResult);
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}


int evaluateThingToPureListOfThings(chain **ch, node *tree) {
  node *evaluatedResult;

  evaluatedResult = evaluateThing(tree);

  if (isPureList(evaluatedResult)) {
    setupRandomAccessOnLists(evaluatedResult);
    *ch = copyChainWithoutReversal(accessThruMemRef(evaluatedResult)->arguments, copyThingOnVoid);
    freeThing(evaluatedResult);
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}

int evaluateThingToPureListOfPureTrees(chain **ch, node *tree) {
  node *evaluatedResult;
  chain *curr;

  evaluatedResult = evaluateThing(tree);

  if (isPureList(evaluatedResult)) {
    setupRandomAccessOnLists(evaluatedResult);
    *ch = copyChainWithoutReversal(accessThruMemRef(evaluatedResult)->arguments, copyThingOnVoid);
    freeThing(evaluatedResult);
    curr = *ch;
    while (curr != NULL) {
      if (!isPureTree((node *) (curr->value))) {
	freeChain(*ch,freeThingOnVoid);
	return 0;
      }
      curr = curr->next;
    }
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}


int evaluateThingToIntegerList(chain **ch, int *finalelliptic, node *tree) {
  node *evaluatedResult;
  chain *curr;
  int *arrayRes, *resPtr;
  int i, resA;

  evaluatedResult = evaluateThing(tree);

  if (finalelliptic == NULL) {
    if (isPureList(evaluatedResult)) {
      setupRandomAccessOnLists(evaluatedResult);
      curr = accessThruMemRef(evaluatedResult)->arguments;
      i = 0;
      while (curr != NULL) {
	if (!isPureTree((node *) (curr->value))) {
	  freeThing(evaluatedResult);
	  return 0;
	}
	i++;
	curr = curr->next;
      }
      arrayRes = (int *) safeCalloc(i,sizeof(int));
      curr = accessThruMemRef(evaluatedResult)->arguments; i = 0;
      while (curr != NULL) {
	if (!evaluateThingToInteger(&resA,(node *) (curr->value),NULL)) {
	  freeThing(evaluatedResult);
	  safeFree(arrayRes);
	  return 0;
	} else {
	  arrayRes[i] = resA;
	}
	i++;
	curr = curr->next;
      }
      curr = NULL;
      for (i--;i>=0;i--) {
	resPtr = (int *) safeMalloc(sizeof(int));
	*resPtr = arrayRes[i];
	curr = addElement(curr, resPtr);
      }
      safeFree(arrayRes);
      *ch = curr;
      freeThing(evaluatedResult);
      return 1;
    }
  } else {
    if (isPureList(evaluatedResult) || isPureFinalEllipticList(evaluatedResult)) {
      setupRandomAccessOnLists(evaluatedResult);
      if (isList(evaluatedResult)) *finalelliptic = 0; else *finalelliptic = 1;
      curr = accessThruMemRef(evaluatedResult)->arguments;
      i = 0;
      while (curr != NULL) {
	if (!isPureTree((node *) (curr->value))) {
	  freeThing(evaluatedResult);
	  return 0;
	}
	i++;
	curr = curr->next;
      }
      arrayRes = (int *) safeCalloc(i,sizeof(int));
      curr = accessThruMemRef(evaluatedResult)->arguments; i = 0;
      while (curr != NULL) {
	if (!evaluateThingToInteger(&resA,(node *) (curr->value),NULL)) {
	  freeThing(evaluatedResult);
	  safeFree(arrayRes);
	  return 0;
	} else {
	  arrayRes[i] = resA;
	}
	i++;
	curr = curr->next;
      }
      curr = NULL;
      for (i--;i>=0;i--) {
	resPtr = (int *) safeMalloc(sizeof(int));
	*resPtr = arrayRes[i];
	curr = addElement(curr, resPtr);
      }
      safeFree(arrayRes);
      freeThing(evaluatedResult);
      *ch = curr;
      return 1;
    }
  }

  freeThing(evaluatedResult);
  return 0;
}


int evaluateThingToBooleanList(chain **ch, node *tree) {
  node *evaluatedResult;
  chain *curr;
  int *arrayRes, *resPtr;
  int i, resA;

  evaluatedResult = evaluateThing(tree);

  if (isPureList(evaluatedResult)) {
    setupRandomAccessOnLists(evaluatedResult);
    curr = accessThruMemRef(evaluatedResult)->arguments;
    i = 0;
    while (curr != NULL) {
      if (!isPureTree((node *) (curr->value))) {
	freeThing(evaluatedResult);
	return 0;
      }
      i++;
      curr = curr->next;
    }
    arrayRes = (int *) safeCalloc(i,sizeof(int));
    curr = accessThruMemRef(evaluatedResult)->arguments; i = 0;
    while (curr != NULL) {
      if (!evaluateThingToBoolean(&resA,(node *) (curr->value),NULL)) {
	freeThing(evaluatedResult);
	safeFree(arrayRes);
	return 0;
      } else {
	arrayRes[i] = resA;
      }
      i++;
      curr = curr->next;
    }
    curr = NULL;
    for (i--;i>=0;i--) {
      resPtr = (int *) safeMalloc(sizeof(int));
      *resPtr = arrayRes[i];
      curr = addElement(curr, resPtr);
    }
    safeFree(arrayRes);
    *ch = curr;
    freeThing(evaluatedResult);
    return 1;
  }

  freeThing(evaluatedResult);
  return 0;
}


int evaluateThingToExpansionFormatList(chain **ch, node *tree) {
  node *evaluatedResult;
  chain *curr;
  int *arrayRes, *resPtr;
  int i, resA, k;
  int finalelliptic;

  evaluatedResult = evaluateThing(tree);

  if (isPureList(evaluatedResult) || isPureFinalEllipticList(evaluatedResult)) {
    setupRandomAccessOnLists(evaluatedResult);
    if (isList(evaluatedResult)) finalelliptic = 0; else finalelliptic = 1;
    curr = accessThruMemRef(evaluatedResult)->arguments;
    i = 0;
    while (curr != NULL) {
      if (!isExpansionFormat((node *) (curr->value))) {
	freeThing(evaluatedResult);
	return 0;
      }
      i++;
      curr = curr->next;
    }
    arrayRes = (int *) safeCalloc(i,sizeof(int));
    curr = accessThruMemRef(evaluatedResult)->arguments; i = 0;
    while (curr != NULL) {
      if (!evaluateThingToExpansionFormat(&resA,(node *) (curr->value))) {
	freeThing(evaluatedResult);
	safeFree(arrayRes);
	return 0;
      } else {
	arrayRes[i] = resA;
      }
      i++;
      curr = curr->next;
    }
    curr = NULL;
    for (k=0;k<i;k++) {
      resPtr = (int *) safeMalloc(sizeof(int));
      *resPtr = arrayRes[k];
      curr = addElement(curr, resPtr);
    }
    if (finalelliptic) {
      resPtr = (int *) safeMalloc(sizeof(int));
      *resPtr = -1;
      curr = addElement(curr, resPtr);
    }
    safeFree(arrayRes);
    freeThing(evaluatedResult);
    *ch = curr;
    return 1;
  }


  freeThing(evaluatedResult);
  return 0;
}

int evaluateThingToExtendedExpansionFormatList(chain **ch, node *tree) {
  node *evaluatedResult;
  chain *curr;
  int *arrayRes, *resPtr;
  int i, resA, k;
  int finalelliptic;

  evaluatedResult = evaluateThing(tree);

  if (isPureList(evaluatedResult) || isPureFinalEllipticList(evaluatedResult)) {
    setupRandomAccessOnLists(evaluatedResult);
    if (isList(evaluatedResult)) finalelliptic = 0; else finalelliptic = 1;
    curr = accessThruMemRef(evaluatedResult)->arguments;
    i = 0;
    while (curr != NULL) {
      if (!isExtendedExpansionFormat((node *) (curr->value))) {
	freeThing(evaluatedResult);
	return 0;
      }
      i++;
      curr = curr->next;
    }
    arrayRes = (int *) safeCalloc(i,sizeof(int));
    curr = accessThruMemRef(evaluatedResult)->arguments; i = 0;
    while (curr != NULL) {
      if (!evaluateThingToExtendedExpansionFormat(&resA,(node *) (curr->value))) {
	freeThing(evaluatedResult);
	safeFree(arrayRes);
	return 0;
      } else {
	arrayRes[i] = resA;
      }
      i++;
      curr = curr->next;
    }
    curr = NULL;
    for (k=0;k<i;k++) {
      resPtr = (int *) safeMalloc(sizeof(int));
      *resPtr = arrayRes[k];
      curr = addElement(curr, resPtr);
    }
    if (finalelliptic) {
      resPtr = (int *) safeMalloc(sizeof(int));
      *resPtr = -1;
      curr = addElement(curr, resPtr);
    }
    safeFree(arrayRes);
    freeThing(evaluatedResult);
    *ch = curr;
    return 1;
  }


  freeThing(evaluatedResult);
  return 0;
}


void printThingWithFullStrings(node *thing) {
  char *temp;
  chain *curr;

  if (isPureTree(thing)) {
    printTree(thing);
  } else {
    if (isRange(thing)) {
      if (midpointMode && (dyadic == 0)) {
	temp = sprintMidpointMode(*(accessThruMemRef(thing)->child1->value), *(accessThruMemRef(thing)->child2->value));
	if (temp != NULL) {
	  sollyaPrintf("%s",temp);
	  safeFree(temp);
	} else {
	  sollyaPrintf("[");
	  printValue(accessThruMemRef(thing)->child1->value);
	  sollyaPrintf(";");
	  printValue(accessThruMemRef(thing)->child2->value);
	  sollyaPrintf("]");
	}
      } else {
	sollyaPrintf("[");
	printValue(accessThruMemRef(thing)->child1->value);
	sollyaPrintf(";");
	printValue(accessThruMemRef(thing)->child2->value);
	sollyaPrintf("]");
      }
    } else {
      if (isList(thing)) {
	setupRandomAccessOnLists(thing);
	curr = accessThruMemRef(thing)->arguments;
	sollyaPrintf("[|");
	while (curr != NULL) {
	  printThingWithFullStrings((node *) (curr->value));
	  if (curr->next != NULL) sollyaPrintf(", ");
	  curr = curr->next;
	}
	sollyaPrintf("|]");
      } else {
	if (isFinalEllipticList(thing)) {
	  setupRandomAccessOnLists(thing);
	  curr = accessThruMemRef(thing)->arguments;
	  sollyaPrintf("[|");
	  while (curr != NULL) {
	    printThingWithFullStrings((node *) (curr->value));
	    if (curr->next != NULL) sollyaPrintf(", ");
	    curr = curr->next;
	  }
	  sollyaPrintf("...|]");
	} else {
	  if (isStructure(thing)) {
	    sollyaPrintf("{ ");
	    curr = accessThruMemRef(thing)->arguments;
	    while (curr != NULL) {
	      sollyaPrintf(".%s = ", ((entry *) (curr->value))->name);
	      printThingWithFullStrings((node *) (((entry *) (curr->value))->value));
	      if (curr->next != NULL) sollyaPrintf(", ");
	      curr = curr->next;
	    }
	    sollyaPrintf(" }");
	  } else {
	    rawPrintThing(thing);
	  }
	}
      }
    }
  }
}


void printThing(node *thing) {
  char *temp;
  chain *curr;

  if (isPureTree(thing)) {
    printTree(thing);
  } else {
    if (isRange(thing)) {
      if (midpointMode && (dyadic == 0)) {
	temp = sprintMidpointMode(*(accessThruMemRef(thing)->child1->value), *(accessThruMemRef(thing)->child2->value));
	if (temp != NULL) {
	  sollyaPrintf("%s",temp);
	  safeFree(temp);
	} else {
	  sollyaPrintf("[");
	  printValue(accessThruMemRef(thing)->child1->value);
	  sollyaPrintf(";");
	  printValue(accessThruMemRef(thing)->child2->value);
	  sollyaPrintf("]");
	}
      } else {
	sollyaPrintf("[");
	printValue(accessThruMemRef(thing)->child1->value);
	sollyaPrintf(";");
	printValue(accessThruMemRef(thing)->child2->value);
	sollyaPrintf("]");
      }
    } else {
      if (isList(thing)) {
	setupRandomAccessOnLists(thing);
	curr = accessThruMemRef(thing)->arguments;
	sollyaPrintf("[|");
	while (curr != NULL) {
	  printThingWithFullStrings((node *) (curr->value));
	  if (curr->next != NULL) sollyaPrintf(", ");
	  curr = curr->next;
	}
	sollyaPrintf("|]");
      } else {
	if (isFinalEllipticList(thing)) {
	  setupRandomAccessOnLists(thing);
	  curr = accessThruMemRef(thing)->arguments;
	  sollyaPrintf("[|");
	  while (curr != NULL) {
	    printThingWithFullStrings((node *) (curr->value));
	    if (curr->next != NULL) sollyaPrintf(", ");
	    curr = curr->next;
	  }
	  sollyaPrintf("...|]");
	} else {
	  if (isString(thing)) {
	    sollyaPrintf("%s",accessThruMemRef(thing)->string);
	  } else {
	    if (isStructure(thing)) {
	      sollyaPrintf("{ ");
	      curr = accessThruMemRef(thing)->arguments;
	      while (curr != NULL) {
		sollyaPrintf(".%s = ", ((entry *) (curr->value))->name);
		printThingWithFullStrings((node *) (((entry *) (curr->value))->value));
		if (curr->next != NULL) sollyaPrintf(", ");
		curr = curr->next;
	      }
	      sollyaPrintf(" }");
	    } else {
	      rawPrintThing(thing);
	    }
	  }
	}
      }
    }
  }
}

char *newString(char *str) {
  char *newStr;

  newStr = (char *) safeCalloc(strlen(str) + 1, sizeof(char));
  strcpy(newStr, str);

  return newStr;
}

char *concatAndFree(char *str1, char *str2) {
  char *newStr;

  newStr = (char *) safeCalloc(strlen(str1) + strlen(str2) + 1, sizeof(char));
  sprintf(newStr,"%s%s", str1, str2);

  safeFree(str1);
  safeFree(str2);

  return newStr;
}

char *sRawPrintThing(node *tree) {
  int i;
  chain *curr;
  char *res;

  if (tree == NULL) {
    res = (char *) safeCalloc(1, sizeof(char));
    return res;
  }

  if (tree->nodeType == MEMREF) {
    return sRawPrintThing(tree->child1);
  }

  switch (tree->nodeType) {
  case VARIABLE:
    if (variablename == NULL) {
      res = newString("_x_");
    } else {
      res = newString(variablename);
    }
    break;
  case CONSTANT:
    res = sprintValue(tree->value);
    break;
  case ADD:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") + ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case SUB:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") - ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case MUL:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") * ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case DIV:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") / ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case SQRT:
    res = concatAndFree(newString("sqrt("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case EXP:
    res = concatAndFree(newString("exp("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case LOG:
    res = concatAndFree(newString("log("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case LOG_2:
    res = concatAndFree(newString("log2("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case LOG_10:
    res = concatAndFree(newString("log10("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case SIN:
    res = concatAndFree(newString("sin("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case COS:
    res = concatAndFree(newString("cos("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case TAN:
    res = concatAndFree(newString("tan("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case ASIN:
    res = concatAndFree(newString("asin("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case ACOS:
    res = concatAndFree(newString("acos("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case ATAN:
    res = concatAndFree(newString("atan("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case SINH:
    res = concatAndFree(newString("sinh("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case COSH:
    res = concatAndFree(newString("cosh("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case TANH:
    res = concatAndFree(newString("tanh("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case ASINH:
    res = concatAndFree(newString("asinh("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case ACOSH:
    res = concatAndFree(newString("acosh("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case ATANH:
    res = concatAndFree(newString("atanh("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case POW:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") ^ ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case NEG:
    res = concatAndFree(newString("-("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case ABS:
    res = concatAndFree(newString("abs("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case DOUBLE:
    res = concatAndFree(newString("double("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case SINGLE:
    res = concatAndFree(newString("single("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case HALFPRECISION:
    res = concatAndFree(newString("halfprecision("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case QUAD:
    res = concatAndFree(newString("quad("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case DOUBLEDOUBLE:
    res = concatAndFree(newString("doubledouble("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case TRIPLEDOUBLE:
    res = concatAndFree(newString("tripledouble("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case ERF:
    res = concatAndFree(newString("erf("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case ERFC:
    res = concatAndFree(newString("erfc("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case LOG_1P:
    res = concatAndFree(newString("log1p("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case EXP_M1:
    res = concatAndFree(newString("expm1("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case DOUBLEEXTENDED:
    res = concatAndFree(newString("doubleextended("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case LIBRARYFUNCTION:
    {
      if (isPureTree(tree->child1) && (accessThruMemRef(tree->child1)->nodeType == VARIABLE)) {
        res = newString("");
        for (i=1;i<=tree->libFunDeriv;i++) {
          res = concatAndFree(res,newString("diff("));
        }
        res = concatAndFree(res, newString(tree->libFun->functionName));
        for (i=1;i<=tree->libFunDeriv;i++) {
          res = concatAndFree(res, newString(")"));
        }
      } else {
	if (tree->libFunDeriv == 0) {
	  res = newString(tree->libFun->functionName);
	  res = concatAndFree(res, newString("("));
	  res = concatAndFree(res, sRawPrintThing(tree->child1));
	  res = concatAndFree(res, newString(")"));
	} else {
	  res = newString("(");
	  for (i=1;i<=tree->libFunDeriv;i++) {
	    res = concatAndFree(res,newString("diff("));
	  }
	  res = concatAndFree(res,newString(tree->libFun->functionName));
	  for (i=1;i<=tree->libFunDeriv;i++) {
	    res = concatAndFree(res, newString(")"));
	  }
	  res = concatAndFree(res, newString(")("));
	  res = concatAndFree(res, sRawPrintThing(tree->child1));
	  res = concatAndFree(res, newString(")"));
	}
      }
    }
    break;
  case PROCEDUREFUNCTION:
    {
      if (isPureTree(tree->child1) && (accessThruMemRef(tree->child1)->nodeType == VARIABLE)) {
        res = newString("");
        for (i=1;i<=tree->libFunDeriv;i++) {
          res = concatAndFree(res,newString("diff("));
        }
        res = concatAndFree(res, newString("function("));
        res = concatAndFree(res, sRawPrintThing(tree->child2));
        res = concatAndFree(res, newString(")"));
        for (i=1;i<=tree->libFunDeriv;i++) {
          res = concatAndFree(res, newString(")"));
        }
      } else {
	if (tree->libFunDeriv == 0) {
	  res = newString("(function(");
	  res = concatAndFree(res, sRawPrintThing(tree->child2));
	  res = concatAndFree(res, newString("))("));
	  res = concatAndFree(res, sRawPrintThing(tree->child1));
	  res = concatAndFree(res, newString(")"));
	} else {
	  res = newString("(");
	  for (i=1;i<=tree->libFunDeriv;i++) {
	    res = concatAndFree(res,newString("diff("));
	  }
	  res = concatAndFree(res,newString("function("));
	  res = concatAndFree(res, sRawPrintThing(tree->child2));
	  res = concatAndFree(res,newString(")"));
	  for (i=1;i<=tree->libFunDeriv;i++) {
	    res = concatAndFree(res, newString(")"));
	  }
	  res = concatAndFree(res, newString(")("));
	  res = concatAndFree(res, sRawPrintThing(tree->child1));
	  res = concatAndFree(res, newString(")"));
	}
      }
    }
    break;
  case LIBRARYCONSTANT:
    res = newString(tree->libFun->functionName);
    break;
  case CEIL:
    res = concatAndFree(newString("ceil("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case FLOOR:
    res = concatAndFree(newString("floor("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case NEARESTINT:
    res = concatAndFree(newString("nearestint("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case PI_CONST:
    res = newString("pi");
    break;
  case COMMANDLIST:
    res = newString("{\n");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res,
			  sRawPrintThing((node *) (curr->value)));
      res = concatAndFree(res,newString(";\n"));
      curr = curr->next;
    }
    res = concatAndFree(res,newString("}"));
    break;
  case WHILE:
    res = newString("while ");
    res = concatAndFree(res,
			sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(" do "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    break;
  case IFELSE:
    res = newString("if ");
    curr = tree->arguments;
    res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
    curr = curr->next;
    res = concatAndFree(res, newString(" then\n"));
    res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
    res = concatAndFree(res, newString("\nelse\n"));
    curr = curr->next;
    res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
    break;
  case IF:
    res = newString("if ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(" then\n"));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    break;
  case FOR:
    res = newString("for ");
    res = concatAndFree(res, newString(tree->string));
    res = concatAndFree(res, newString(" from "));
    curr = tree->arguments;
    res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
    res = concatAndFree(res, newString(" to "));
    curr = curr->next;
    res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
    res = concatAndFree(res, newString(" by "));
    curr = curr->next;
    res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
    res = concatAndFree(res, newString(" do\n"));
    curr = curr->next;
    res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
    break;
  case FORIN:
    res = newString("for ");
    res = concatAndFree(res, newString(tree->string));
    res = concatAndFree(res, newString(" in "));
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(" do\n"));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    break;
  case QUIT:
    res = newString("quit");
    break;
  case NOP:
    res = newString("nop");
    break;
  case NOPARG:
    res = newString("nop(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(")\n"));
    break;
  case FALSEQUIT:
    res = newString("quit");
    break;
  case FALSERESTART:
    res = newString("restart");
    break;
  case RESTART:
    res = newString("restart");
    break;
  case VARIABLEDECLARATION:
    res = newString("var ");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, newString((char *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    break;
  case PRINT:
    res = newString("print(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case SUPPRESSMESSAGE:
    res = newString("suppressmessage(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case UNSUPPRESSMESSAGE:
    res = newString("unsuppressmessage(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case NEWFILEPRINT:
    res = newString("print(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(") > "));
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case APPENDFILEPRINT:
    res = newString("print(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(") >> "));
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case PLOT:
    res = newString("plot(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case PRINTHEXA:
    res = concatAndFree(newString("printdouble("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case PRINTFLOAT:
    res = concatAndFree(newString("printsingle("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case PRINTBINARY:
    res = concatAndFree(newString("printbinary("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case PRINTEXPANSION:
    res = concatAndFree(newString("printexpansion("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case BASHEXECUTE:
    res = concatAndFree(newString("bashexecute("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case EXTERNALPLOT:
    res = newString("externalplot(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case WRITE:
    res = newString("write(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case NEWFILEWRITE:
    res = newString("write(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(") > "));
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case APPENDFILEWRITE:
    res = newString("write(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(") >> "));
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case ASCIIPLOT:
    res = newString("asciiplot(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(","));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case PRINTXML:
    res = concatAndFree(newString("printxml("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case PRINTXMLNEWFILE:
    res = newString("printxml(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(") > "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    break;
  case PRINTXMLAPPENDFILE:
    res = newString("printxml(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(") >> "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    break;
  case WORSTCASE:
    res = newString("worstcase(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case RENAME:
    res = newString("rename(");
    res = concatAndFree(res, newString(tree->string));
    res = concatAndFree(res, newString(","));
    res = concatAndFree(res, newString((char *) (tree->arguments->value)));
    res = concatAndFree(res, newString(")"));
    break;
  case AUTOPRINT:
    res = newString("");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    break;
  case ASSIGNMENT:
    res = newString(tree->string);
    res = concatAndFree(res, newString(" = "));
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case FLOATASSIGNMENT:
    res = newString(tree->string);
    res = concatAndFree(res, newString(" := "));
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case EXTERNALPROC:
    res = newString("externalproc(");
    res = concatAndFree(res, newString(tree->string));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    curr = tree->arguments->next;
    if (*((int *) (curr->value)) == VOID_TYPE) {
      res = concatAndFree(res, newString("void"));
    } else {
      res = concatAndFree(res, newString("("));
      while (curr != NULL) {
	switch (*((int *) (curr->value))) {
	case VOID_TYPE:
	  res = concatAndFree(res, newString("void"));
	  break;
	case CONSTANT_TYPE:
	  res = concatAndFree(res, newString("constant"));
	  sollyaPrintf("constant");
	  break;
	case FUNCTION_TYPE:
	  res = concatAndFree(res, newString("function"));
	  break;
	case OBJECT_TYPE:
	  res = concatAndFree(res, newString("object"));
	  break;
	case RANGE_TYPE:
	  res = concatAndFree(res, newString("range"));
	  break;
	case INTEGER_TYPE:
	  res = concatAndFree(res, newString("integer"));
	  break;
	case STRING_TYPE:
	  res = concatAndFree(res, newString("string"));
	  break;
	case BOOLEAN_TYPE:
	  res = concatAndFree(res, newString("boolean"));
	  break;
	case CONSTANT_LIST_TYPE:
	  res = concatAndFree(res, newString("list of constant"));
	  break;
	case FUNCTION_LIST_TYPE:
	  res = concatAndFree(res, newString("list of function"));
	  break;
	case OBJECT_LIST_TYPE:
	  res = concatAndFree(res, newString("list of object"));
	  break;
	case RANGE_LIST_TYPE:
	  res = concatAndFree(res, newString("list of range"));
	  break;
	case INTEGER_LIST_TYPE:
	  res = concatAndFree(res, newString("list of integer"));
	  break;
	case STRING_LIST_TYPE:
	  res = concatAndFree(res, newString("list of string"));
	  break;
	case BOOLEAN_LIST_TYPE:
	  res = concatAndFree(res, newString("list of boolean"));
	  break;
	default:
	  res = concatAndFree(res, newString("unknown type"));
	}
	if (curr->next != NULL) res = concatAndFree(res, newString(", "));
	curr = curr->next;
      }
      res = concatAndFree(res, newString(")"));
    }
    res = concatAndFree(res, newString(" -> "));
    switch (*((int *) (tree->arguments->value))) {
    case VOID_TYPE:
      res = concatAndFree(res, newString("void"));
      break;
    case CONSTANT_TYPE:
      res = concatAndFree(res, newString("constant"));
      break;
    case FUNCTION_TYPE:
      res = concatAndFree(res, newString("function"));
      break;
    case OBJECT_TYPE:
      res = concatAndFree(res, newString("object"));
      break;
    case RANGE_TYPE:
      res = concatAndFree(res, newString("range"));
      break;
    case INTEGER_TYPE:
      res = concatAndFree(res, newString("integer"));
      break;
    case STRING_TYPE:
      res = concatAndFree(res, newString("string"));
      break;
    case BOOLEAN_TYPE:
      res = concatAndFree(res, newString("boolean"));
      break;
    case CONSTANT_LIST_TYPE:
      res = concatAndFree(res, newString("list of constant"));
      break;
    case FUNCTION_LIST_TYPE:
      res = concatAndFree(res, newString("list of function"));
      break;
    case OBJECT_LIST_TYPE:
      res = concatAndFree(res, newString("list of object"));
      break;
    case RANGE_LIST_TYPE:
      res = concatAndFree(res, newString("list of range"));
      break;
    case INTEGER_LIST_TYPE:
      res = concatAndFree(res, newString("list of integer"));
      break;
    case STRING_LIST_TYPE:
      res = concatAndFree(res, newString("list of string"));
      break;
    case BOOLEAN_LIST_TYPE:
      res = concatAndFree(res, newString("list of boolean"));
      break;
    default:
      res = concatAndFree(res, newString("unknown type"));
    }
    res = concatAndFree(res, newString(")"));
    break;
  case LIBRARYBINDING:
    res = newString(tree->string);
    res = concatAndFree(res, newString(" = library("));
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(")"));
    break;
  case LIBRARYCONSTANTBINDING:
    res = newString(tree->string);
    res = concatAndFree(res, newString(" = libraryconstant("));
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(")"));
    break;
  case PRECASSIGN:
    res = newString("prec = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case POINTSASSIGN:
    res = newString("points = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case DIAMASSIGN:
    res = newString("diam = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case DISPLAYASSIGN:
    res = newString("display = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case VERBOSITYASSIGN:
    res = newString("verbosity = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case CANONICALASSIGN:
    res = newString("canonical = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case AUTOSIMPLIFYASSIGN:
    res = newString("autosimplify = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case SHOWMESSAGENUMBERSASSIGN:
    res = newString("showmessagenumbers = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case TAYLORRECURSASSIGN:
    res = newString("taylorrecursions = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case TIMINGASSIGN:
    res = newString("timing = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case FULLPARENASSIGN:
    res = newString("fullparentheses = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case MIDPOINTASSIGN:
    res = newString("midpointmode = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case DIEONERRORMODEASSIGN:
    res = newString("dieonerrormode = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case RATIONALMODEASSIGN:
    res = newString("rationalmode = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case SUPPRESSWARNINGSASSIGN:
    res = newString("roundingwarnings = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case HOPITALRECURSASSIGN:
    res = newString("hopitalrecursions = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case PRECSTILLASSIGN:
    res = newString("prec = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case POINTSSTILLASSIGN:
    res = newString("diam = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case DIAMSTILLASSIGN:
    res = newString("diam = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case DISPLAYSTILLASSIGN:
    res = newString("display = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case VERBOSITYSTILLASSIGN:
    res = newString("verbosity = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case CANONICALSTILLASSIGN:
    res = newString("canonical = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case AUTOSIMPLIFYSTILLASSIGN:
    res = newString("autosimplify = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case SHOWMESSAGENUMBERSSTILLASSIGN:
    res = newString("showmessagenumbers = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case TAYLORRECURSSTILLASSIGN:
    res = newString("taylorrecursions = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case TIMINGSTILLASSIGN:
    res = newString("timing = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case FULLPARENSTILLASSIGN:
    res = newString("fullparentheses = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case MIDPOINTSTILLASSIGN:
    res = newString("midpointmode = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case DIEONERRORMODESTILLASSIGN:
    res = newString("dieonerrormode = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case RATIONALMODESTILLASSIGN:
    res = newString("midpointmode = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case SUPPRESSWARNINGSSTILLASSIGN:
    res = newString("roundingwarnings = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case HOPITALRECURSSTILLASSIGN:
    res = newString("hopitalrecursions = ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString("!"));
    break;
  case AND:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") && ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case OR:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") || ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case NEGATION:
    res = concatAndFree(newString("!("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case INDEX:
    res = concatAndFree(sRawPrintThing(tree->child1),newString("["));
    res = concatAndFree(res,sRawPrintThing(tree->child2));
    res = concatAndFree(res,newString("]"));
    break;
  case COMPAREEQUAL:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") == ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case COMPAREIN:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") in ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case COMPARELESS:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") < ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case COMPAREGREATER:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") > ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case COMPARELESSEQUAL:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") <= ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case COMPAREGREATEREQUAL:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") >= ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case COMPARENOTEQUAL:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") != ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case CONCAT:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") @ ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case ADDTOLIST:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") :: ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case APPEND:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") :. ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case PREPEND:
    res = concatAndFree(newString("("),
			concatAndFree(sRawPrintThing(tree->child1),
				      concatAndFree(newString(") .: ("),
						    concatAndFree(sRawPrintThing(tree->child2),
								  newString(")")))));
    break;
  case ON:
    res = newString("on");
    break;
  case OFF:
    res = newString("off");
    break;
  case DYADIC:
    res = newString("dyadic");
    break;
  case POWERS:
    res = newString("powers");
    break;
  case BINARY:
    res = newString("binary");
    break;
  case HEXADECIMAL:
    res = newString("hexadecimal");
    break;
  case FILESYM:
    res = newString("file");
    break;
  case POSTSCRIPT:
    res = newString("postscript");
    break;
  case POSTSCRIPTFILE:
    res = newString("postscriptfile");
    break;
  case PERTURB:
    res = newString("perturb");
    break;
  case ROUNDDOWN:
    res = newString("RD");
    break;
  case ROUNDUP:
    res = newString("RU");
    break;
  case ROUNDTOZERO:
    res = newString("RZ");
    break;
  case ROUNDTONEAREST:
    res = newString("RN");
    break;
  case HONORCOEFF:
    res = newString("honorcoeffprec");
    break;
  case TRUE:
    res = newString("true");
    break;
  case UNIT:
    res = newString("void");
    break;
  case FALSE:
    res = newString("false");
    break;
  case DEFAULT:
    res = newString("default");
    break;
  case DECIMAL:
    res = newString("decimal");
    break;
  case ABSOLUTESYM:
    res = newString("absolute");
    break;
  case RELATIVESYM:
    res = newString("relative");
    break;
  case FIXED:
    res = newString("fixed");
    break;
  case FLOATING:
    res = newString("floating");
    break;
  case ERRORSPECIAL:
    res = newString("error");
    break;
  case DOUBLESYMBOL:
    res = newString("double");
    break;
  case SINGLESYMBOL:
    res = newString("single");
    break;
  case HALFPRECISIONSYMBOL:
    res = newString("halfprecision");
    break;
  case QUADSYMBOL:
    res = newString("quad");
    break;
  case DOUBLEEXTENDEDSYMBOL:
    res = newString("doubleextended");
    break;
  case DOUBLEDOUBLESYMBOL:
    res = newString("doubledouble");
    break;
  case TRIPLEDOUBLESYMBOL:
    res = newString("tripledouble");
    break;
  case STRING:
    res = concatAndFree(newString("\""),concatAndFree(maskString(tree->string),newString("\"")));
    break;
  case TABLEACCESS:
    res = newString(tree->string);
    break;
  case ISBOUND:
    res = concatAndFree(newString("isbound("),concatAndFree(newString(tree->string),newString(")")));
    break;
  case TABLEACCESSWITHSUBSTITUTE:
    res = concatAndFree(newString(tree->string),newString("("));
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res,sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case STRUCTACCESS:
    res = concatAndFree(sRawPrintThing(tree->child1),newString("."));
    res = concatAndFree(res, newString(tree->string));
    break;
  case APPLY:
    res = concatAndFree(concatAndFree(concatAndFree(newString("("),sRawPrintThing(tree->child1)), newString(")")),newString("("));
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res,sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case DECIMALCONSTANT:
    res = newString(tree->string);
    break;
  case MIDPOINTCONSTANT:
    res = newString(tree->string);
    break;
  case DYADICCONSTANT:
    res = newString(tree->string);
    break;
  case HEXCONSTANT:
    res = newString(tree->string);
    break;
  case HEXADECIMALCONSTANT:
    res = newString(tree->string);
    break;
  case BINARYCONSTANT:
    res = concatAndFree(newString(tree->string),newString("_2"));
    break;
  case EMPTYLIST:
    res = newString("[| |]");
    break;
  case LIST:
    setupRandomAccessOnLists(tree);
    res = newString("[|");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res,sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString("|]"));
    break;
  case STRUCTURE:
    res = newString("{ ");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res,concatAndFree(newString("."),newString(((entry *) (curr->value))->name)));
      res = concatAndFree(res,newString(" = "));
      res = concatAndFree(res,sRawPrintThing((node *) (((entry *) (curr->value))->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(" }"));
    break;
  case FINALELLIPTICLIST:
    setupRandomAccessOnLists(tree);
    res = newString("[|");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res,sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString("...|]"));
    break;
  case ELLIPTIC:
    res = newString("...");
    break;
  case RANGE:
    res = newString("[");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(";"));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString("]"));
    break;
  case DEBOUNDMAX:
    res = concatAndFree(newString("sup("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case DEBOUNDMIN:
    res = concatAndFree(newString("inf("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case DEBOUNDMID:
    res = concatAndFree(newString("mid("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case EVALCONST:
    res = concatAndFree(newString("~"),sRawPrintThing(tree->child1));
    break;
  case DIFF:
    res = concatAndFree(newString("diff("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case BASHEVALUATE:
    res = newString("bashevaluate(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case GETSUPPRESSEDMESSAGES:
    res = newString("getsuppressedmessages()");
    break;
  case DIRTYSIMPLIFY:
    res = concatAndFree(newString("dirtysimplify("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case SIMPLIFYSAFE:
    res = concatAndFree(newString("simplify("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case TIME:
    res = concatAndFree(newString("time("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case REMEZ:
    res = newString("remez(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case MATCH:
    res = newString("match ");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(" with\n"));
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      curr = curr->next;
    }
    break;
  case MATCHELEMENT:
    res = concatAndFree(sRawPrintThing(tree->child1),newString(" : {\n"));
    curr = ((node *) (tree->arguments->value))->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      res = concatAndFree(res, newString(";\n"));
      curr = curr->next;
    }
    res = concatAndFree(res, newString("return "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(";\n}\n"));
    break;
  case MIN:
    res = newString("min(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case MAX:
    res = newString("max(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case FPMINIMAX:
    res = newString("fpminimax(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case HORNER:
    res = concatAndFree(newString("horner("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case CANONICAL:
    res = concatAndFree(newString("canonical("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case EXPAND:
    res = concatAndFree(newString("expand("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case TAYLOR:
    res = newString("taylor(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case TAYLORFORM:
    res = newString("taylorform(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case CHEBYSHEVFORM:
    res = newString("chebyshevform(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case AUTODIFF:
    res = newString("autodiff(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case DEGREE:
    res = concatAndFree(newString("degree("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case NUMERATOR:
    res = concatAndFree(newString("numerator("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case DENOMINATOR:
    res = concatAndFree(newString("denominator("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case SUBSTITUTE:
    res = newString("substitute(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case COMPOSEPOLYNOMIALS:
    res = newString("composepolynomials(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case COEFF:
    res = newString("coeff(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case SUBPOLY:
    res = newString("subpoly(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case ROUNDCOEFFICIENTS:
    res = newString("roundcoefficients(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case RATIONALAPPROX:
    res = newString("rationalapprox(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case ACCURATEINFNORM:
    res = newString("accurateinfnorm(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case ROUNDTOFORMAT:
    res = newString("round(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case EVALUATE:
    res = newString("evaluate(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case PARSE:
    res = concatAndFree(newString("parse("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case READXML:
    res = concatAndFree(newString("readxml("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case EXECUTE:
    res = concatAndFree(newString("execute("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case INFNORM:
    res = newString("infnorm(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case SUPNORM:
    res = newString("supnorm(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case FINDZEROS:
    res = newString("findzeros(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case FPFINDZEROS:
    res = newString("fpfindzeros(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case DIRTYINFNORM:
    res = newString("dirtyinfnorm(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case NUMBERROOTS:
    res = newString("numberroots(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case INTEGRAL:
    res = newString("integral(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case DIRTYINTEGRAL:
    res = newString("dirtyintegral(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case IMPLEMENTPOLY:
    res = newString("implementpoly(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case IMPLEMENTCONST:
    res = newString("implementconstant(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case CHECKINFNORM:
    res = newString("checkinfnorm(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case ZERODENOMINATORS:
    res = newString("zerodenominators(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case ISEVALUABLE:
    res = newString("isevaluable(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case SEARCHGAL:
    res = newString("searchgal(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case GUESSDEGREE:
    res = newString("guessdegree(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")"));
    break;
  case ASSIGNMENTININDEXING:
    curr = tree->arguments;
    res = concatAndFree(sRawPrintThing((node *) (curr->value)), newString("["));
    curr = curr->next;
    res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
    res = concatAndFree(res, newString("] = "));
    curr = curr->next;
    res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
    break;
  case FLOATASSIGNMENTININDEXING:
    curr = tree->arguments;
    res = concatAndFree(sRawPrintThing((node *) (curr->value)), newString("["));
    curr = curr->next;
    res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
    res = concatAndFree(res, newString("] := "));
    curr = curr->next;
    res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
    break;
  case ASSIGNMENTINSTRUCTURE:
    curr = tree->arguments;
    res = newString((char *) (curr->value));
    curr = curr->next;
    while (curr != NULL) {
      res = concatAndFree(res, newString("."));
      res = concatAndFree(res, newString((char *) (curr->value)));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(" = "));
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case FLOATASSIGNMENTINSTRUCTURE:
    curr = tree->arguments;
    res = newString((char *) (curr->value));
    curr = curr->next;
    while (curr != NULL) {
      res = concatAndFree(res, newString("."));
      res = concatAndFree(res, newString((char *) (curr->value)));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(" := "));
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    break;
  case PROTOASSIGNMENTINSTRUCTURE:
    res = sRawPrintThing(tree->child1);
    res = concatAndFree(res, newString(" = "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    break;
  case PROTOFLOATASSIGNMENTINSTRUCTURE:
    res = sRawPrintThing(tree->child1);
    res = concatAndFree(res, newString(" := "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    break;
  case DIRTYFINDZEROS:
    res = newString("dirtyfindzeros(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case HEAD:
    res = concatAndFree(newString("head("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case ROUNDCORRECTLY:
    res = concatAndFree(newString("roundcorrectly("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case READFILE:
    res = concatAndFree(newString("readfile("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case REVERT:
    res = concatAndFree(newString("revert("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case SORT:
    res = concatAndFree(newString("sort("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case MANTISSA:
    res = concatAndFree(newString("mantissa("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case EXPONENT:
    res = concatAndFree(newString("exponent("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case PRECISION:
    res = concatAndFree(newString("precision("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case TAIL:
    res = concatAndFree(newString("tail("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case LENGTH:
    res = concatAndFree(newString("length("),
			concatAndFree(sRawPrintThing(tree->child1),
				      newString(")")));
    break;
  case EXTERNALPROCEDUREUSAGE:
    res = newString(tree->libProc->procedureName);
    break;
  case PROC:
    res = newString("proc(");
    curr = tree->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, newString((char *) (curr->value)));
      if (curr->next != NULL) res = concatAndFree(res, newString(", "));
      curr = curr->next;
    }
    res = concatAndFree(res, newString(")\n{\n"));
    curr = tree->child1->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      res = concatAndFree(res, newString(";\n"));
      curr = curr->next;
    }
    res = concatAndFree(res, newString("return "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(";\n}"));
    break;
  case BIND:
    res = newString("bind(");
    res = concatAndFree(res, sRawPrintThing(tree->child1));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, newString(tree->string));
    res = concatAndFree(res, newString(", "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(")"));
    break;
  case PROCILLIM:
    res = newString("proc(");
    curr = tree->arguments;
    res = concatAndFree(res, newString((char *) (curr->value)));
    res = concatAndFree(res, newString(" = ...)\n{\n"));
    curr = tree->child1->arguments;
    while (curr != NULL) {
      res = concatAndFree(res, sRawPrintThing((node *) (curr->value)));
      res = concatAndFree(res, newString(";\n"));
      curr = curr->next;
    }
    res = concatAndFree(res, newString("return "));
    res = concatAndFree(res, sRawPrintThing(tree->child2));
    res = concatAndFree(res, newString(";\n}"));
    break;
  case PRECDEREF:
    res = newString("prec");
    break;
  case POINTSDEREF:
    res = newString("points");
    break;
  case DIAMDEREF:
    res = newString("diam");
    break;
  case DISPLAYDEREF:
    res = newString("display");
    break;
  case VERBOSITYDEREF:
    res = newString("verbosity");
    break;
  case CANONICALDEREF:
    res = newString("canonical");
    break;
  case AUTOSIMPLIFYDEREF:
    res = newString("autosimplify");
    break;
  case SHOWMESSAGENUMBERSDEREF:
    res = newString("showmessagenumbers");
    break;
  case TAYLORRECURSDEREF:
    res = newString("taylorrecursions");
    break;
  case TIMINGDEREF:
    res = newString("timing");
    break;
  case FULLPARENDEREF:
    res = newString("fullparentheses");
    break;
  case MIDPOINTDEREF:
    res = newString("midpointmode");
    break;
  case DIEONERRORMODEDEREF:
    res = newString("dieonerrormode");
    break;
  case RATIONALMODEDEREF:
    res = newString("rationalmode");
    break;
  case SUPPRESSWARNINGSDEREF:
    res = newString("roundingwarnings");
    break;
  case HOPITALRECURSDEREF:
    res = newString("hopitalrecursions");
    break;
  default:
    sollyaFprintf(stderr,"Error: sRawPrintThing: unknown identifier (%d) in the tree\n",tree->nodeType);
    exit(1);
  }
  return res;
}



char *sPrintThingWithFullStrings(node *thing) {
  char *temp;
  chain *curr;
  char *temp1, *temp2;

  if (isPureTree(thing)) {
    return sprintTree(thing);
  } else {
    if (isRange(thing)) {
      if (midpointMode && (dyadic == 0)) {
	temp = sprintMidpointMode(*(accessThruMemRef(thing)->child1->value), *(accessThruMemRef(thing)->child2->value));
	if (temp != NULL) {
	  return temp;
	} else {
	  temp1 = sprintValue(accessThruMemRef(thing)->child1->value);
	  temp2 = sprintValue(accessThruMemRef(thing)->child2->value);
	  temp = (char *) safeCalloc(strlen(temp1) + strlen(temp2) + 3 + 1, sizeof(char));
	  sprintf(temp, "[%s;%s]",temp1,temp2);
	  safeFree(temp1);
	  safeFree(temp2);
	  return temp;
	}
      } else {
	temp1 = sprintValue(accessThruMemRef(thing)->child1->value);
	temp2 = sprintValue(accessThruMemRef(thing)->child2->value);
	temp = (char *) safeCalloc(strlen(temp1) + strlen(temp2) + 3 + 1, sizeof(char));
	sprintf(temp, "[%s;%s]",temp1,temp2);
	safeFree(temp1);
	safeFree(temp2);
	return temp;
      }
    } else {
      if (isList(thing)) {
	setupRandomAccessOnLists(thing);
	curr = accessThruMemRef(thing)->arguments;
	temp = (char *) safeCalloc(2 + 1, sizeof(char));
	sprintf(temp,"[|");
	while (curr != NULL) {
	  temp1 = sPrintThingWithFullStrings((node *) (curr->value));
	  temp2 = (char *) safeCalloc(strlen(temp) + strlen(temp1) + 1, sizeof(char));
	  sprintf(temp2,"%s%s",temp,temp1);
	  safeFree(temp);
	  safeFree(temp1);
	  temp = temp2;
	  if (curr->next != NULL) {
	    temp2 = (char *) safeCalloc(strlen(temp) + 2 + 1, sizeof(char));
	    sprintf(temp2,"%s, ",temp);
	    safeFree(temp);
	    temp = temp2;
	  }
	  curr = curr->next;
	}
	temp2 = (char *) safeCalloc(strlen(temp) + 2 + 1, sizeof(char));
	sprintf(temp2,"%s|]",temp);
	safeFree(temp);
	temp = temp2;
	return temp;
      } else {
	if (isFinalEllipticList(thing)) {
	  setupRandomAccessOnLists(thing);
	  curr = accessThruMemRef(thing)->arguments;
	  temp = (char *) safeCalloc(2 + 1, sizeof(char));
	  sprintf(temp,"[|");
	  while (curr != NULL) {
	    temp1 = sPrintThingWithFullStrings((node *) (curr->value));
	    temp2 = (char *) safeCalloc(strlen(temp) + strlen(temp1) + 1, sizeof(char));
	    sprintf(temp2,"%s%s",temp,temp1);
	    safeFree(temp);
	    safeFree(temp1);
	    temp = temp2;
	    if (curr->next != NULL) {
	      temp2 = (char *) safeCalloc(strlen(temp) + 2 + 1, sizeof(char));
	      sprintf(temp2,"%s, ",temp);
	      safeFree(temp);
	      temp = temp2;
	    }
	    curr = curr->next;
	  }
	  temp2 = (char *) safeCalloc(strlen(temp) + 5 + 1, sizeof(char));
	  sprintf(temp2,"%s...|]",temp);
	  safeFree(temp);
	  temp = temp2;
	  return temp;
	} else {
	  return sRawPrintThing(thing);
	}
      }
    }
  }
}


char *sPrintThing(node *thing) {
  char *temp;
  chain *curr;
  char *temp1, *temp2;

  if (isPureTree(thing)) {
    return sprintTree(thing);
  } else {
    if (isRange(thing)) {
      if (midpointMode && (dyadic == 0)) {
	temp = sprintMidpointMode(*(accessThruMemRef(thing)->child1->value), *(accessThruMemRef(thing)->child2->value));
	if (temp != NULL) {
	  return temp;
	} else {
	  temp1 = sprintValue(accessThruMemRef(thing)->child1->value);
	  temp2 = sprintValue(accessThruMemRef(thing)->child2->value);
	  temp = (char *) safeCalloc(strlen(temp1) + strlen(temp2) + 3 + 1, sizeof(char));
	  sprintf(temp, "[%s;%s]",temp1,temp2);
	  safeFree(temp1);
	  safeFree(temp2);
	  return temp;
	}
      } else {
	temp1 = sprintValue(accessThruMemRef(thing)->child1->value);
	temp2 = sprintValue(accessThruMemRef(thing)->child2->value);
	temp = (char *) safeCalloc(strlen(temp1) + strlen(temp2) + 3 + 1, sizeof(char));
	sprintf(temp, "[%s;%s]",temp1,temp2);
	safeFree(temp1);
	safeFree(temp2);
	return temp;
      }
    } else {
      if (isList(thing)) {
	setupRandomAccessOnLists(thing);
	curr = accessThruMemRef(thing)->arguments;
	temp = (char *) safeCalloc(2 + 1, sizeof(char));
	sprintf(temp,"[|");
	while (curr != NULL) {
	  temp1 = sPrintThingWithFullStrings((node *) (curr->value));
	  temp2 = (char *) safeCalloc(strlen(temp) + strlen(temp1) + 1, sizeof(char));
	  sprintf(temp2,"%s%s",temp,temp1);
	  safeFree(temp);
	  safeFree(temp1);
	  temp = temp2;
	  if (curr->next != NULL) {
	    temp2 = (char *) safeCalloc(strlen(temp) + 2 + 1, sizeof(char));
	    sprintf(temp2,"%s, ",temp);
	    safeFree(temp);
	    temp = temp2;
	  }
	  curr = curr->next;
	}
	temp2 = (char *) safeCalloc(strlen(temp) + 2 + 1, sizeof(char));
	sprintf(temp2,"%s|]",temp);
	safeFree(temp);
	temp = temp2;
	return temp;
      } else {
	if (isFinalEllipticList(thing)) {
	  setupRandomAccessOnLists(thing);
	  curr = accessThruMemRef(thing)->arguments;
	  temp = (char *) safeCalloc(2 + 1, sizeof(char));
	  sprintf(temp,"[|");
	  while (curr != NULL) {
	    temp1 = sPrintThingWithFullStrings((node *) (curr->value));
	    temp2 = (char *) safeCalloc(strlen(temp) + strlen(temp1) + 1, sizeof(char));
	    sprintf(temp2,"%s%s",temp,temp1);
	    safeFree(temp);
	    safeFree(temp1);
	    temp = temp2;
	    if (curr->next != NULL) {
	      temp2 = (char *) safeCalloc(strlen(temp) + 2 + 1, sizeof(char));
	      sprintf(temp2,"%s, ",temp);
	      safeFree(temp);
	      temp = temp2;
	    }
	    curr = curr->next;
	  }
	  temp2 = (char *) safeCalloc(strlen(temp) + 5 + 1, sizeof(char));
	  sprintf(temp2,"%s...|]",temp);
	  safeFree(temp);
	  temp = temp2;
	  return temp;
	} else {
	  if (isString(thing)) {
	    temp = (char *) safeCalloc(strlen(accessThruMemRef(thing)->string) + 1, sizeof(char));
	    sprintf(temp,"%s",accessThruMemRef(thing)->string);
	    return temp;
	  } else {
	    return sRawPrintThing(thing);
	  }
	}
      }
    }
  }
}


void fRawPrintThing(FILE *fd, node *thing);

void fPrintThingWithFullStrings(FILE *fd, node *thing) {
  char *temp;
  chain *curr;

  if (isPureTree(thing)) {
    fprintTreeWithPrintMode(fd,thing);
  } else {
    if (isRange(thing)) {
      if (midpointMode && (dyadic == 0)) {
	temp = sprintMidpointMode(*(accessThruMemRef(thing)->child1->value), *(accessThruMemRef(thing)->child2->value));
	if (temp != NULL) {
	  sollyaFprintf(fd,"%s",temp);
	  safeFree(temp);
	} else {
	  sollyaFprintf(fd,"[");
	  fprintValueWithPrintMode(fd,*(accessThruMemRef(thing)->child1->value));
	  sollyaFprintf(fd,";");
	  fprintValueWithPrintMode(fd,*(accessThruMemRef(thing)->child2->value));
	  sollyaFprintf(fd,"]");
	}
      } else {
	sollyaFprintf(fd,"[");
	fprintValueWithPrintMode(fd,*(accessThruMemRef(thing)->child1->value));
	sollyaFprintf(fd,";");
	fprintValueWithPrintMode(fd,*(accessThruMemRef(thing)->child2->value));
	sollyaFprintf(fd,"]");
      }
    } else {
      if (isList(thing)) {
	setupRandomAccessOnLists(thing);
	curr = accessThruMemRef(thing)->arguments;
	sollyaFprintf(fd,"[|");
	while (curr != NULL) {
	  fPrintThingWithFullStrings(fd,(node *) (curr->value));
	  if (curr->next != NULL) sollyaFprintf(fd,", ");
	  curr = curr->next;
	}
	sollyaFprintf(fd,"|]");
      } else {
	if (isFinalEllipticList(thing)) {
	  setupRandomAccessOnLists(thing);
	  curr = accessThruMemRef(thing)->arguments;
	  sollyaFprintf(fd,"[|");
	  while (curr != NULL) {
	    fPrintThingWithFullStrings(fd,(node *) (curr->value));
	    if (curr->next != NULL) sollyaFprintf(fd,", ");
	    curr = curr->next;
	  }
	  sollyaFprintf(fd,"...|]");
	} else {
	  if (isStructure(thing)) {
	    sollyaFprintf(fd,"{ ");
	    curr = accessThruMemRef(thing)->arguments;
	    while (curr != NULL) {
	      sollyaFprintf(fd,".%s = ", ((entry *) (curr->value))->name);
	      fPrintThingWithFullStrings(fd,(node *) (((entry *) (curr->value))->value));
	      if (curr->next != NULL) sollyaFprintf(fd,", ");
	      curr = curr->next;
	    }
	    sollyaFprintf(fd," }");
	  } else {
	    fRawPrintThing(fd,thing);
	  }
	}
      }
    }
  }
}


void fPrintThing(FILE *fd, node *thing) {
  char *temp;
  chain *curr;

  if (isPureTree(thing)) {
    fprintTreeWithPrintMode(fd,thing);
  } else {
    if (isRange(thing)) {
      if (midpointMode && (dyadic == 0)) {
	temp = sprintMidpointMode(*(accessThruMemRef(thing)->child1->value), *(accessThruMemRef(thing)->child2->value));
	if (temp != NULL) {
	  sollyaFprintf(fd,"%s",temp);
	  safeFree(temp);
	} else {
	  sollyaFprintf(fd,"[");
	  fprintValueWithPrintMode(fd,*(accessThruMemRef(thing)->child1->value));
	  sollyaFprintf(fd,";");
	  fprintValueWithPrintMode(fd,*(accessThruMemRef(thing)->child2->value));
	  sollyaFprintf(fd,"]");
	}
      } else {
	sollyaFprintf(fd,"[");
	fprintValueWithPrintMode(fd,*(accessThruMemRef(thing)->child1->value));
	sollyaFprintf(fd,";");
	fprintValueWithPrintMode(fd,*(accessThruMemRef(thing)->child2->value));
	sollyaFprintf(fd,"]");
      }
    } else {
      if (isList(thing)) {
	setupRandomAccessOnLists(thing);
	curr = accessThruMemRef(thing)->arguments;
	sollyaFprintf(fd,"[|");
	while (curr != NULL) {
	  fPrintThingWithFullStrings(fd,(node *) (curr->value));
	  if (curr->next != NULL) sollyaFprintf(fd,", ");
	  curr = curr->next;
	}
	sollyaFprintf(fd,"|]");
      } else {
	if (isFinalEllipticList(thing)) {
	  setupRandomAccessOnLists(thing);
	  curr = accessThruMemRef(thing)->arguments;
	  sollyaFprintf(fd,"[|");
	  while (curr != NULL) {
	    fPrintThingWithFullStrings(fd,(node *) (curr->value));
	    if (curr->next != NULL) sollyaFprintf(fd,", ");
	    curr = curr->next;
	  }
	  sollyaFprintf(fd,"...|]");
	} else {
	  if (isString(thing)) {
	    sollyaFprintf(fd,"%s",accessThruMemRef(thing)->string);
	  } else {
	    if (isStructure(thing)) {
	      sollyaFprintf(fd,"{ ");
	      curr = accessThruMemRef(thing)->arguments;
	      while (curr != NULL) {
		sollyaFprintf(fd,".%s = ", ((entry *) (curr->value))->name);
		fPrintThingWithFullStrings(fd,(node *) (((entry *) (curr->value))->value));
		if (curr->next != NULL) sollyaFprintf(fd,", ");
		curr = curr->next;
	      }
	      sollyaFprintf(fd," }");
	    } else {
	      fRawPrintThing(fd,thing);
	    }
	  }
	}
      }
    }
  }
}


int assignThingToTable(char *identifier, node *thing) {

  if (((variablename != NULL) && (strcmp(variablename,identifier) == 0)) ||
      (getFunction(identifier) != NULL) ||
      (getConstantFunction(identifier) != NULL) ||
      (getProcedure(identifier) != NULL)) {
    printMessage(1,SOLLYA_MSG_IDENTIFIER_ALREADY_BOUND,"Warning: the identifier \"%s\" is already bound to the free variable, to a library function, library constant or to an external procedure.\nThe command will have no effect.\n", identifier);
    considerDyingOnError();
    return 0;
  }

  if (containsDeclaredEntry(declaredSymbolTable, identifier)) {
    declaredSymbolTable = assignDeclaredEntry(declaredSymbolTable, identifier, thing, copyThingOnVoid, freeThingOnVoid);
    return 1;
  }

  if (containsEntry(symbolTable, identifier)) {
    printMessage(3,SOLLYA_MSG_IDENTIFIER_REASSIGNMENT,"Information: the identifier \"%s\" has already been assigned to. This a reassignment.\n",identifier);
    symbolTable = removeEntry(symbolTable, identifier, freeThingOnVoid);
  }

  symbolTable = addEntry(symbolTable, identifier, thing, copyThingOnVoid);

  return 1;
}

void *returnThingOnVoid(void *ptr) {
  return ptr;
}

/* ATTENTION: This function "eats up" its 2nd argument on success */
int performListPrependInTable(char *ident, node *tree) {

  if (containsDeclaredEntry(declaredSymbolTable, ident)) {
    return performListPrependOnDeclaredEntry(declaredSymbolTable, ident, tree);
  }

  if (containsEntry(symbolTable, ident)) {
    return performListPrependOnEntry(symbolTable, ident, tree);
  }

  return 0;
}

int performListTailInTable(char *ident) {

  if (containsDeclaredEntry(declaredSymbolTable, ident)) {
    return performListTailOnDeclaredEntry(declaredSymbolTable, ident);
  }

  if (containsEntry(symbolTable, ident)) {
    return performListTailOnEntry(symbolTable, ident);
  }

  return 0;
}

node *getThingFromTable(char *identifier, int doCopy, int *didCopy) {
  libraryFunction *tempLibraryFunction;
  libraryProcedure *tempLibraryProcedure;
  node *temp_node;
  int myDoCopy;

  myDoCopy = doCopy;
  if (didCopy == NULL) myDoCopy = 1;

  if ((variablename != NULL) && (strcmp(variablename,identifier) == 0)) {
    if (didCopy != NULL) *didCopy = 1;
    return makeVariable();
  }

  if ((tempLibraryFunction = getFunction(identifier)) != NULL) {
    temp_node = (node *) safeMalloc(sizeof(node));
    temp_node->nodeType = LIBRARYFUNCTION;
    temp_node->libFun = tempLibraryFunction;
    temp_node->libFunDeriv = 0;
    temp_node->child1 = (node *) safeMalloc(sizeof(node));
    temp_node->child1->nodeType = VARIABLE;
    if (didCopy != NULL) *didCopy = 1;
    return temp_node;
  }

  if ((tempLibraryFunction = getConstantFunction(identifier)) != NULL) {
    temp_node = (node *) safeMalloc(sizeof(node));
    temp_node->nodeType = LIBRARYCONSTANT;
    temp_node->libFun = tempLibraryFunction;
    if (didCopy != NULL) *didCopy = 1;
    return temp_node;
  }

  if ((tempLibraryProcedure = getProcedure(identifier)) != NULL) {
    if (didCopy != NULL) *didCopy = 1;
    return makeExternalProcedureUsage(tempLibraryProcedure);
  }

  if (containsDeclaredEntry(declaredSymbolTable, identifier)) {
    if (myDoCopy) {
      if (didCopy != NULL) *didCopy = 1;
      return getDeclaredEntry(declaredSymbolTable, identifier, copyThingOnVoid);
    }
    if (didCopy != NULL) *didCopy = 0;
    return getDeclaredEntry(declaredSymbolTable, identifier, returnThingOnVoid);
  }

  if (!containsEntry(symbolTable, identifier)) return NULL;

  if (myDoCopy) {
    if (didCopy != NULL) *didCopy = 1;
    return (node *) getEntry(symbolTable, identifier, copyThingOnVoid);
  }
  if (didCopy != NULL) *didCopy = 0;
  return (node *) getEntry(symbolTable, identifier, returnThingOnVoid);
}

void printExternalProcedureUsage(node *tree) {
  chain *curr;
  if (isExternalProcedureUsage(tree)) {
    sollyaPrintf("%s(",accessThruMemRef(tree)->libProc->procedureName);
    curr = accessThruMemRef(tree)->libProc->signature->next;
    while (curr != NULL) {
      switch (*((int *) (curr->value))) {
      case VOID_TYPE:
	sollyaPrintf("void");
	break;
      case CONSTANT_TYPE:
	sollyaPrintf("constant");
	break;
      case FUNCTION_TYPE:
	sollyaPrintf("function");
	break;
      case OBJECT_TYPE:
	sollyaPrintf("object");
	break;
      case RANGE_TYPE:
	sollyaPrintf("range");
	break;
      case INTEGER_TYPE:
	sollyaPrintf("integer");
	break;
      case STRING_TYPE:
	sollyaPrintf("string");
	break;
      case BOOLEAN_TYPE:
	sollyaPrintf("boolean");
	break;
      case CONSTANT_LIST_TYPE:
	sollyaPrintf("list of constant");
	break;
      case FUNCTION_LIST_TYPE:
	sollyaPrintf("list of function");
	break;
      case OBJECT_LIST_TYPE:
	sollyaPrintf("list of object");
	break;
      case RANGE_LIST_TYPE:
	sollyaPrintf("list of range");
	break;
      case INTEGER_LIST_TYPE:
	sollyaPrintf("list of integer");
	break;
      case STRING_LIST_TYPE:
	sollyaPrintf("list of string");
	break;
      case BOOLEAN_LIST_TYPE:
	sollyaPrintf("list of boolean");
	break;
      default:
	sollyaPrintf("unknown type");
      }
      if (curr->next != NULL) sollyaPrintf(", ");
      curr = curr->next;
    }
    sollyaPrintf(") -> ");
    switch (*((int *) (accessThruMemRef(tree)->libProc->signature->value))) {
    case VOID_TYPE:
      sollyaPrintf("void");
      break;
    case CONSTANT_TYPE:
      sollyaPrintf("constant");
      break;
    case FUNCTION_TYPE:
      sollyaPrintf("function");
      break;
    case OBJECT_TYPE:
      sollyaPrintf("object");
      break;
    case RANGE_TYPE:
      sollyaPrintf("range");
      break;
    case INTEGER_TYPE:
      sollyaPrintf("integer");
      break;
    case STRING_TYPE:
      sollyaPrintf("string");
      break;
    case BOOLEAN_TYPE:
      sollyaPrintf("boolean");
      break;
    case CONSTANT_LIST_TYPE:
      sollyaPrintf("list of constant");
      break;
    case FUNCTION_LIST_TYPE:
      sollyaPrintf("list of function");
      break;
    case OBJECT_LIST_TYPE:
      sollyaPrintf("list of object");
      break;
    case RANGE_LIST_TYPE:
      sollyaPrintf("list of range");
      break;
    case INTEGER_LIST_TYPE:
      sollyaPrintf("list of integer");
      break;
    case STRING_LIST_TYPE:
      sollyaPrintf("list of string");
      break;
    case BOOLEAN_LIST_TYPE:
      sollyaPrintf("list of boolean");
      break;
    default:
      sollyaPrintf("unknown type");
    }
  }
}

void autoprint(node *thing, int inList, node *func, node *cst) {
  mpfr_t a,b;
  node *temp_node, *tempNode2, *tempNode3, *tempNode4, *tempNode5;
  chain *curr;
  int freeThingAfterwards;
  int okay, shown, shown2, extraMessage;
  rangetype xrange, yrange;
  int okaySign, sign;
  int faithfulAlreadyKnown;
  node *simplCst;
  int infinityCase;
  int deg;
  int counter;

  shown = 0; shown2 = 0;
  if (isPureTree(thing)) {
    if ((treeSize(thing) < CHEAPSIMPLIFYSIZE) || rationalMode) {
      tempNode2 = simplifyTreeErrorfree(thing);
      freeThingAfterwards = 1;
    } else {
      tempNode2 = thing;
      freeThingAfterwards = 0;
    }

    if (isConstant(tempNode2)) {
      if (accessThruMemRef(tempNode2)->nodeType == CONSTANT) {
	printValue(accessThruMemRef(tempNode2)->value);
      } else {
	if (rationalMode &&
	    (accessThruMemRef(tempNode2)->nodeType == DIV) &&
	    (accessThruMemRef(tempNode2)->child1->nodeType == CONSTANT) &&
	    (accessThruMemRef(tempNode2)->child2->nodeType == CONSTANT) &&
	    mpfr_number_p(*(accessThruMemRef(tempNode2)->child1->value)) &&
	    mpfr_number_p(*(accessThruMemRef(tempNode2)->child2->value)) &&
	    (!mpfr_zero_p(*(accessThruMemRef(tempNode2)->child2->value)))) {
          printTree(tempNode2);
	} else {
	  mpfr_init2(a,tools_precision);
	  mpfr_init2(b,tools_precision);
	  mpfr_set_d(b,1.0,GMP_RNDN);
	  faithfulAlreadyKnown = 0;
	  if ((func != NULL) && (cst != NULL)) {
	    simplCst = simplifyTreeErrorfree(cst);
	    if ((accessThruMemRef(simplCst)->nodeType == CONSTANT) &&
		mpfr_number_p(*(accessThruMemRef(simplCst)->value))) {
	      if (evaluateFaithful(a,func,*(accessThruMemRef(simplCst)->value),tools_precision)) {
		faithfulAlreadyKnown = 1;
	      }
	    }
	    freeThing(simplCst);
	  }
	  if (faithfulAlreadyKnown || evaluateFaithful(a,tempNode2,b,tools_precision)) {
	    if (mpfr_number_p(a)) {
	      if (!noRoundingWarnings) {
		if (!shown) {
		  if ((!faithfulAlreadyKnown) || (!mpfr_zero_p(a))) {
		    printMessage(1,SOLLYA_MSG_DISPLAYED_VALUE_IS_FAITHFULLY_ROUNDED,"Warning: rounding has happened. The value displayed is a faithful rounding to %d bits of the true result.\n", mpfr_get_prec(a));
		  }
		}
		shown = 1;
	      }
	    } else {
	      if (mpfr_nan_p(a)) {
		printMessage(1,SOLLYA_MSG_EXPRESSION_UNDEFINED_OR_UNSTABLE,"Warning: the given expression is undefined or numerically unstable.\n");
	      }
	    }
	    printValue(&a);
	  } else {
	    tempNode5 = simplifyRationalErrorfree(tempNode2);
	    if (accessThruMemRef(tempNode5)->nodeType == CONSTANT) {
	      mpfr_set_prec(a,mpfr_get_prec(*(accessThruMemRef(tempNode5)->value)));
	      mpfr_set(a,*(accessThruMemRef(tempNode5)->value),GMP_RNDN);
	    } else {
	      okaySign = evaluateSign(&sign,tempNode2);
	      if (okaySign && (sign == 0)) {
		mpfr_set_ui(a,0,GMP_RNDN);
	      } else {
		xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
		xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
		yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
		yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
		mpfr_init2(*(xrange.a),tools_precision);
		mpfr_init2(*(xrange.b),tools_precision);
		mpfr_init2(*(yrange.a),tools_precision * 256);
		mpfr_init2(*(yrange.b),tools_precision * 256);
		mpfr_set_ui(*(xrange.a),1.0,GMP_RNDD);
		mpfr_set_ui(*(xrange.b),1.0,GMP_RNDU);
		evaluateRangeFunction(yrange, tempNode5, xrange, tools_precision * 256 + 10);
		extraMessage = 0;
		infinityCase = 0;
		if (mpfr_number_p(*(yrange.a)) &&
		    mpfr_number_p(*(yrange.b)) &&
		    (mpfr_sgn(*(yrange.a)) * mpfr_sgn(*(yrange.b)) < 0)) {
		  mpfr_set_ui(a,0,GMP_RNDN);
		  if (!noRoundingWarnings) {
		    if (!shown) {
		      printMessage(1,SOLLYA_MSG_ROUNDING_MAY_HAVE_HAPPENED_AND_NOT_FAITHFUL,"Warning: rounding may have happened.\nIf there is rounding, the displayed value is *NOT* guaranteed to be a faithful rounding of the true result.\n");
		      shown = 1;
		    }
		  }
		} else {
		  if (mpfr_inf_p(*(yrange.a)) &&
		      mpfr_inf_p(*(yrange.b)) &&
		      (mpfr_sgn(*(yrange.a)) == mpfr_sgn(*(yrange.b)))) {
		    mpfr_set(a, *(yrange.a), GMP_RNDN); /* Copying an infinity, no rounding */
		    infinityCase = 1;
		  } else {
		    evaluate(a,tempNode5,b,tools_precision * 256);
		    if (!(mpfr_number_p(*(yrange.a)) && mpfr_number_p(*(yrange.b)))) extraMessage = 1;
		  }
		}
		mpfr_clear(*(xrange.a));
		mpfr_clear(*(xrange.b));
		mpfr_clear(*(yrange.a));
		mpfr_clear(*(yrange.b));
		safeFree(xrange.a);
		safeFree(xrange.b);
		safeFree(yrange.a);
		safeFree(yrange.b);
		if (mpfr_number_p(a)) {
		  if (!noRoundingWarnings) {
		    if (!shown) {
		      printMessage(1,SOLLYA_MSG_ROUNDING_MAY_HAVE_HAPPENED_AND_NOT_FAITHFUL,"Warning: rounding has happened.\nThe displayed value is *NOT* guaranteed to be a faithful rounding of the true result.\n");
		      if (extraMessage) printMessage(1,SOLLYA_MSG_EVALUATION_WITH_PLAIN_FP_ARITHMETIC,"The displayed value has been computed using plain floating-point arithmetic and might be completely wrong.\n");
		      shown = 1;
		    }
		  }
		} else {
		  if (infinityCase) {
		    printMessage(2,SOLLYA_MSG_EXPRESSION_EVALUATES_TO_INFINITY,"Information: the given expression evaluates to infinity.\n");
		  } else {
		    printMessage(1,SOLLYA_MSG_EXPRESSION_UNDEFINED_OR_UNSTABLE,"Warning: the given expression is undefined or numerically unstable.\n");
		    if (!isAffine(tempNode5)) {
		      mpfr_set_nan(a);
		    }
		  }
		}
	      }
	    }
	    printValue(&a);
	    freeThing(tempNode5);
	  }
	  mpfr_clear(a);
	  mpfr_clear(b);
	}
      }
    } else {
      if (rationalMode)
	tempNode3 = simplifyAllButDivision(tempNode2);
      else
	tempNode3 = simplifyTree(tempNode2);

      if (!isSyntacticallyEqual(tempNode3,tempNode2)) {
	if (!noRoundingWarnings) {
	  if (!shown) printMessage(1,SOLLYA_MSG_ROUNDING_MAY_HAVE_HAPPENED_SOMEWHERE,"Warning: rounding may have happened.\n");
	  shown = 1;
	}
      }
      if ((treeSize(tempNode3) > MAXHORNERTREESIZE) || (isPolynomialExtraSafe(tempNode3) && (((deg = getDegreeSilent(tempNode3)) > MAXHORNERDEGREE) || (deg < 0)))) {
	if (canonical)
	  printMessage(1,SOLLYA_MSG_EXPRESSION_TOO_BIG_FOR_CANONICAL_FORM,"Warning: the expression is too big for being written in canonical form.\n");
	else {
	  if (!(isHorner(tempNode3) || isPowerOfVariable(tempNode3))) {
	    printMessage(1,SOLLYA_MSG_EXPRESSION_TOO_BIG_FOR_HORNER_FORM,"Warning: the expression is too big for being written in Horner form.\n");
	  }
	}
	temp_node = copyTree(tempNode3);
      } else {
	okay = 0;
	counter = 0;
	do {
	  if (canonical) temp_node = makeCanonical(tempNode3,tools_precision); else temp_node = horner(tempNode3);
	  if (rationalMode)
	    tempNode4 = simplifyAllButDivision(temp_node);
	  else
	    tempNode4 = simplifyTree(temp_node);
	  if (!isSyntacticallyEqual(tempNode4,temp_node)) {
	    if (!noRoundingWarnings) {
	      if (!shown) printMessage(1,SOLLYA_MSG_ROUNDING_MAY_HAVE_HAPPENED_SOMEWHERE,"Warning: rounding may have happened.\n");
	      shown = 1;
	    }
	    freeThing(temp_node);
	    if (canonical) {
	      if (isCanonical(tempNode4)) {
		okay = 1;
	      }
	    } else {
	      if (isHorner(tempNode4)) {
		okay = 1;
	      }
	    }
	    if (counter > 15) okay = 1;
	    if (!okay) {
	      if (!shown2) printMessage(2,SOLLYA_MSG_DOUBLE_SIMPLIFICATION_NECESSARY,"Information: double simplification necessary\n");
	      shown2 = 1;
	      freeThing(tempNode3);
	      tempNode3 = copyThing(tempNode4);
	    } else {
	      temp_node = copyThing(tempNode4);
	    }
	  } else okay = 1;
	  freeThing(tempNode4);
	  counter++;
	} while (!okay);
      }
      printTree(temp_node);
      free_memory(temp_node);
      free_memory(tempNode3);
    }
    if (freeThingAfterwards) free_memory(tempNode2);
  } else {
    if (isList(thing)) {
      setupRandomAccessOnLists(thing);
      sollyaPrintf("[|");
      curr = accessThruMemRef(thing)->arguments;
      while (curr != NULL) {
	autoprint((node *) (curr->value),1,NULL,NULL);
	if (curr->next != NULL) sollyaPrintf(", ");
	curr = curr->next;
      }
      sollyaPrintf("|]");
    } else {
      if (isFinalEllipticList(thing)) {
	setupRandomAccessOnLists(thing);
	sollyaPrintf("[|");
	curr = accessThruMemRef(thing)->arguments;
	while (curr != NULL) {
	  autoprint((node *) (curr->value),1,NULL,NULL);
	  if (curr->next != NULL) sollyaPrintf(", ");
	  curr = curr->next;
	}
	sollyaPrintf("...|]");
      } else {
	if (isStructure(thing)) {
	  sollyaPrintf("{ ");
	  curr = accessThruMemRef(thing)->arguments;
	  while (curr != NULL) {
	    sollyaPrintf(".%s = ", ((entry *) (curr->value))->name);
	    autoprint((node *) (((entry *) (curr->value))->value),1,NULL,NULL);
	    if (curr->next != NULL) sollyaPrintf(", ");
	    curr = curr->next;
	  }
	  sollyaPrintf(" }");
	} else {
	  if (inList)
	    printThingWithFullStrings(thing);
	  else
	    printThing(thing);
	}
      }
    }
  }
}

void evaluateThingListToThingArray(int *number, node ***array, chain *things) {
  chain *curr;
  int i;

  *number = lengthChain(things);
  *array = (node **) safeCalloc(*number,sizeof(node *));

  curr = things; i = 0;
  while (curr != NULL) {
    (*array)[i] = evaluateThing((node *) (curr->value));
    curr = curr->next;
    i++;
  }
}

int evaluateThingArrayToListOfPureTrees(chain **ch, int number, node **array) {
  chain *curr;
  int i, err;
  node *evaluated;

  err = 0;
  curr = NULL;
  for (i=number-1;i>=0;i--) {
    if (evaluateThingToPureTree(&evaluated, array[i])) {
      curr = addElement(curr,evaluated);
    } else {
      err = 1;
      break;
    }
  }

  if (err) {
    freeChain(curr,freeThingOnVoid);
    return 0;
  }

  *ch = curr;
  return 1;
}

int evaluateThingToConstantList(chain **ch, node *tree) {
  node **arrayTrees;
  chain *newChain;
  int i, number, k;
  node *evaluated;
  mpfr_t **arrayMpfr;

  evaluated = evaluateThing(tree);

  if (isPureList(evaluated)) {
    setupRandomAccessOnLists(evaluated);
    evaluateThingListToThingArray(&number, &arrayTrees, accessThruMemRef(evaluated)->arguments);
    arrayMpfr = (mpfr_t **) safeCalloc(number,sizeof(mpfr_t *));
    for (i=0;i<number;i++) {
      arrayMpfr[i] = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
      mpfr_init2(*(arrayMpfr[i]),tools_precision);
    }
    for (i=0;i<number;i++) {
      if (!evaluateThingToConstant(*(arrayMpfr[i]),arrayTrees[i],NULL,0,0)) {
	for (k=0;k<number;k++) {
	  freeThing(arrayTrees[k]);
	  mpfr_clear(*(arrayMpfr[k]));
	  safeFree(arrayMpfr[k]);
	}
	safeFree(arrayTrees);
	safeFree(arrayMpfr);
	freeThing(evaluated);
	return 0;
      }
    }
    newChain = NULL;
    for (k=number-1;k>=0;k--) {
      newChain = addElement(newChain,arrayMpfr[k]);
    }
    safeFree(arrayMpfr);
    *ch = newChain;
    for (i=0;i<number;i++) freeThing(arrayTrees[i]);
    safeFree(arrayTrees);
    freeThing(evaluated);
    return 1;
  }

  freeThing(evaluated);
  return 0;
}



int evaluateThingToRangeList(chain **ch, node *tree) {
  node **arrayTrees;
  chain *newChain;
  int i, number, k;
  node *evaluated;
  sollya_mpfi_t **arrayMpfi;
  mpfr_t a,b;

  evaluated = evaluateThing(tree);

  if (isPureList(evaluated)) {
    setupRandomAccessOnLists(evaluated);
    mpfr_init2(a, tools_precision);
    mpfr_init2(b, tools_precision);
    evaluateThingListToThingArray(&number, &arrayTrees, accessThruMemRef(evaluated)->arguments);
    arrayMpfi = (sollya_mpfi_t **) safeCalloc(number,sizeof(sollya_mpfi_t *));
    for (i=0;i<number;i++) {
      arrayMpfi[i] = (sollya_mpfi_t *) safeMalloc(sizeof(sollya_mpfi_t));
      sollya_mpfi_init2(*(arrayMpfi[i]),tools_precision);
    }
    for (i=0;i<number;i++) {
      if (!evaluateThingToRange(a,b,arrayTrees[i])) {
	for (k=0;k<number;k++) {
	  freeThing(arrayTrees[k]);
	  sollya_mpfi_clear(*(arrayMpfi[k]));
	  safeFree(arrayMpfi[k]);
	}
	safeFree(arrayTrees);
	safeFree(arrayMpfi);
	freeThing(evaluated);
	mpfr_clear(a);
	mpfr_clear(b);
	return 0;
      } else {
	sollya_mpfi_interv_fr_safe(*(arrayMpfi[i]),a,b); /* ANYONE TO UNDERSTAND THIS LINE? */
      }
    }
    newChain = NULL;
    for (k=number-1;k>=0;k--) {
      newChain = addElement(newChain,arrayMpfi[k]);
    }
    safeFree(arrayMpfi);
    *ch = newChain;
    for (i=0;i<number;i++) freeThing(arrayTrees[i]);
    safeFree(arrayTrees);
    mpfr_clear(a);
    mpfr_clear(b);
    return 1;
  }

  freeThing(evaluated);
  return 0;
}

int evaluateThingToStringList(chain **ch, node *tree) {
  node **arrayTrees;
  chain *newChain;
  int i, number, k;
  node *evaluated;
  char **arrayString;

  evaluated = evaluateThing(tree);

  if (isPureList(evaluated)) {
    setupRandomAccessOnLists(evaluated);
    evaluateThingListToThingArray(&number, &arrayTrees, accessThruMemRef(evaluated)->arguments);
    arrayString = (char **) safeCalloc(number,sizeof(char *));
    for (i=0;i<number;i++) {
      if (!evaluateThingToString(&(arrayString[i]),arrayTrees[i])) {
	for (k=0;k<i;k++) {
	  safeFree(arrayString[k]);
	}
	for (k=0;k<number;k++) {
	  freeThing(arrayTrees[k]);
	}
	safeFree(arrayTrees);
	safeFree(arrayString);
	freeThing(evaluated);
	return 0;
      }
    }
    newChain = NULL;
    for (k=number-1;k>=0;k--) {
      newChain = addElement(newChain,arrayString[k]);
    }
    safeFree(arrayString);
    *ch = newChain;
    for (i=0;i<number;i++) freeThing(arrayTrees[i]);
    safeFree(arrayTrees);
    return 1;
  }

  freeThing(evaluated);
  return 0;
}



int evaluateThingToEmptyList(node *tree) {
  int res;
  node *evaluatedResult;

  evaluatedResult = evaluateThing(tree);

  res = isEmptyList(evaluatedResult);

  freeThing(evaluatedResult);

  return res;
}


int tryPrependOptimization(int *res, node *tree) {
  node *tempNode, *tempNode2;
  int didCopy;

  if ((accessThruMemRef(tree)->nodeType == ASSIGNMENT) &&
      (accessThruMemRef(accessThruMemRef(tree)->child1)->nodeType == PREPEND) &&
      (accessThruMemRef(accessThruMemRef(accessThruMemRef(tree)->child1)->child2)->nodeType == TABLEACCESS) &&
      (!strcmp(accessThruMemRef(tree)->string, accessThruMemRef(accessThruMemRef(accessThruMemRef(tree)->child1)->child2)->string))) {
    didCopy = 0;
    tempNode = getThingFromTable(accessThruMemRef(tree)->string, 0, &didCopy);
    if (didCopy) {
      if (tempNode != NULL) freeThing(tempNode);
      return 0;
    }

    if (tempNode == NULL) return 0;

    if (isList(tempNode) ||
	isFinalEllipticList(tempNode)) {
      tempNode2 = evaluateThing(accessThruMemRef(accessThruMemRef(tree)->child1)->child1);
      if (tempNode2 != NULL) {
	if (performListPrependInTable(accessThruMemRef(tree)->string, tempNode2)) {
	  *res = 0;
	  return 1;
	}
	freeThing(tempNode2);
      }
    }
  }

  return 0;
}

int tryTailOptimization(int *res, node *tree) {
  node *tempNode;
  int didCopy;

  if ((accessThruMemRef(tree)->nodeType == ASSIGNMENT) &&
      (accessThruMemRef(accessThruMemRef(tree)->child1)->nodeType == TAIL) &&
      (accessThruMemRef(accessThruMemRef(accessThruMemRef(tree)->child1)->child1)->nodeType == TABLEACCESS) &&
      (!strcmp(accessThruMemRef(tree)->string, accessThruMemRef(accessThruMemRef(accessThruMemRef(tree)->child1)->child1)->string))) {
    didCopy = 0;
    tempNode = getThingFromTable(accessThruMemRef(tree)->string, 0, &didCopy);
    if (didCopy) {
      if (tempNode != NULL) freeThing(tempNode);
      return 0;
    }

    if (tempNode == NULL) return 0;

    if ((isList(tempNode) ||
	 isFinalEllipticList(tempNode)) &&
	((accessThruMemRef(tempNode)->arguments != NULL) &&
	 (accessThruMemRef(tempNode)->arguments->next != NULL) &&
	 (accessThruMemRef(tempNode)->arguments->next->next != NULL))) {
      if (performListTailInTable(accessThruMemRef(tree)->string)) {
	*res = 0;
	return 1;
      }
    }
  }

  return 0;
}


int tryOptimizedCommandExecution(int *res, node *tree) {
  int (*optimizers[])(int *, node *) = { tryPrependOptimization, tryTailOptimization, NULL };
  int (*optimizer)(int *, node*);
  int i, myRes;

  for (i=0; optimizers[i] != NULL; i++) {
    optimizer = optimizers[i];
    myRes = *res;
    if (optimizer(&myRes, tree)) {
      *res = myRes;
      return 1;
    }
  }

  return 0;
}

int executeCommandInner(node *tree);

int executeCommand(node *tree) {
  int res;

  if (tryOptimizedCommandExecution(&res, tree))
    return res;

  res = executeCommandInner(tree);

  return res;
}

int timeCommand(mpfr_t time, node *tree) {
  int res;
  struct timeval *before;
  struct timeval *after;
  long int seconds, microseconds;
  unsigned int sec, usec;
  mpfr_t tmp;

  before = safeMalloc(sizeof(struct timeval));
  after = safeMalloc(sizeof(struct timeval));
  if(gettimeofday(before,NULL)!=0)
    printMessage(1, SOLLYA_MSG_TIMER_UNUSABLE, "Warning: unable to use the timer. Measures may be untrustable\n");
  res = executeCommand(tree);
  if(gettimeofday(after,NULL)!=0)
    printMessage(1, SOLLYA_MSG_TIMER_UNUSABLE, "Warning: unable to use the timer. Measures may be untrustable\n");

  seconds = (long int)(after->tv_sec) - (long int)(before->tv_sec);
  microseconds = (long int)(after->tv_usec) - (long int)(before->tv_usec);
  safeFree(before);
  safeFree(after);

  if (microseconds < 0) {
    microseconds += 1000000l;
    seconds--;
  }

  sec = seconds;
  usec = microseconds;

  mpfr_init2(tmp,10 + 20 + 8 * sizeof(sec));

  mpfr_set_ui(tmp,sec,GMP_RNDN);
  mpfr_mul_ui(tmp,tmp,1000000,GMP_RNDN);
  mpfr_add_ui(tmp,tmp,usec,GMP_RNDN);
  mpfr_div_ui(tmp,tmp,1000000,GMP_RNDN);

  mpfr_set(time,tmp,GMP_RNDN);
  mpfr_clear(tmp);

  return res;
}

void doNothing(int n) {
  mpfr_t x, y;
  mpfr_t z;
  volatile unsigned long int t;
  int i, j;
  gmp_randstate_t random_state;
  struct timeval buf;
  unsigned long int seed;

  if (gettimeofday(&buf, NULL) == 0) {
    seed = (unsigned long int) (buf.tv_sec);
  } else {
    seed = 17;
  }

  gmp_randinit_default(random_state);
  gmp_randseed_ui(random_state, seed);

  mpfr_init2(x, 10000);
  mpfr_init2(y, 10000);
  mpfr_init2(z, 20000 - 20);

  mpfr_urandomb(x, random_state);
  mpfr_urandomb(y, random_state);

  t = 0;
  for (i=0;i<n;i++) {
    for (j=0;j<171;j++) {
      mpfr_mul(z, x, y, GMP_RNDN);
      t += mpfr_get_ui(z, GMP_RNDN);
    }
  }

  mpfr_clear(x);
  mpfr_clear(y);
  mpfr_clear(z);
  gmp_randclear(random_state);
}

int tryToRewriteLeftHandStructAccessInner(chain **idents, node *thing) {
  int okay;
  char *buf;
  chain *tempChain;

  if (thing->nodeType == MEMREF) {
    return tryToRewriteLeftHandStructAccessInner(idents, thing->child1);
  }

  okay = 0;

  switch (thing->nodeType) {
  case TABLEACCESS:
    buf = (char *) safeCalloc(strlen(thing->string)+1,sizeof(char));
    strcpy(buf,thing->string);
    *idents = addElement(NULL,buf);
    okay = 1;
    break;
  case STRUCTACCESS:
    if (tryToRewriteLeftHandStructAccessInner(&tempChain,thing->child1)) {
      buf = (char *) safeCalloc(strlen(thing->string)+1,sizeof(char));
      strcpy(buf,thing->string);
      *idents = addElement(tempChain,buf);
      okay = 1;
    } else {
      okay = 0;
    }
    break;
  default:
    okay = 0;
  }

  return okay;
}

int tryToRewriteLeftHandStructAccess(chain **idents, node *thing) {
  chain *tempChain, *curr;

  if (tryToRewriteLeftHandStructAccessInner(&tempChain, thing)) {
    *idents = NULL;
    for (curr=tempChain;curr!=NULL;curr=curr->next) {
      *idents = addElement(*idents,curr->value);
    }
    freeChain(tempChain, freeDoNothing);
    return 1;
  }

  return 0;
}

node *createNestedStructure(node *value, chain *idents) {
  node *structure;
  chain *curr;
  chain *assoclist;
  entry *structEntry;
  chain *revertedIdents;

  revertedIdents = NULL;
  for (curr=idents;curr!=NULL;curr=curr->next) {
    revertedIdents = addElement(revertedIdents,curr->value);
  }

  curr = revertedIdents;
  structEntry = (entry *) safeMalloc(sizeof(entry));
  structEntry->name = (char *) safeCalloc(strlen((char *) (curr->value))+1,sizeof(char));
  strcpy(structEntry->name,(char *) (curr->value));
  structEntry->value = copyThing(value);
  assoclist = addElement(NULL,(void *) structEntry);
  structure = makeStructure(assoclist);
  curr = curr->next;
  while (curr != NULL) {
    structEntry = (entry *) safeMalloc(sizeof(entry));
    structEntry->name = (char *) safeCalloc(strlen((char *) (curr->value))+1,sizeof(char));
    strcpy(structEntry->name,(char *) (curr->value));
    structEntry->value = structure;
    assoclist = addElement(NULL,(void *) structEntry);
    structure = makeStructure(assoclist);
    curr = curr->next;
  }

  freeChain(revertedIdents, freeDoNothing);

  return structure;
}


node *recomputeLeftHandSideForAssignmentInStructure(node *oldValue, node *newValue, chain *idents) {
  chain *currentIdent;
  node *currentStruct;
  int okay, found;
  node *res;
  char *myIdent;
  chain *currentAssoc;
  char *otherIdent;
  node *nextStruct;
  entry *newEntry;

  if ((oldValue == NULL) || (isError(oldValue)))
    return createNestedStructure(newValue, idents);

  if (!isStructure(oldValue)) {
    printMessage(1,SOLLYA_MSG_CAN_MODIFY_ONLY_ELEMENTS_OF_STRUCTURES,"Warning: cannot modify an element of something that is not a structure.\n");
    return NULL;
  }

  okay = 1;
  res = deepCopyThing(oldValue);
  currentStruct = res;
  currentIdent = idents;
  while (okay && (currentIdent != NULL)) {
    myIdent = (char *) (currentIdent->value);
    currentAssoc = currentStruct->arguments;
    found = 0;
    while (!found && (currentAssoc != NULL)) {
      otherIdent = (char *) (((entry *) (currentAssoc->value))->name);
      if (!strcmp(otherIdent,myIdent)) {
	found = 1;
      } else {
	currentAssoc = currentAssoc->next;
      }
    }
    if (found) {
      nextStruct = (node *) (((entry *) (currentAssoc->value))->value);
      if (isError(nextStruct)) {
	freeThing(nextStruct);
	if (currentIdent->next == NULL) {
	  ((entry *) (currentAssoc->value))->value = copyThing(newValue);
	} else {
	  ((entry *) (currentAssoc->value))->value = createNestedStructure(newValue, currentIdent->next);
	}
	break;
      } else {
	if (isStructure(nextStruct)) {
	  if (currentIdent->next == NULL) {
	    freeThing(nextStruct);
	    ((entry *) (currentAssoc->value))->value = copyThing(newValue);
	  } else {
	    currentStruct = nextStruct;
	  }
	} else {
	  if (currentIdent->next == NULL) {
	    freeThing(nextStruct);
	    ((entry *) (currentAssoc->value))->value = copyThing(newValue);
	  } else {
	    okay = 0;
	    printMessage(1,SOLLYA_MSG_CAN_MODIFY_ONLY_ELEMENTS_OF_STRUCTURES,"Warning: cannot modify an element of something that is not a structure.\n");
	    break;
	  }
	}
      }
    } else {
      newEntry = (entry *) safeMalloc(sizeof(entry));
      newEntry->name = (char *) safeCalloc(strlen(myIdent)+1,sizeof(char));
      strcpy(newEntry->name,myIdent);
      if (currentIdent->next == NULL) {
	newEntry->value = copyThing(newValue);
      } else {
	newEntry->value = createNestedStructure(newValue, currentIdent->next);
      }
      currentStruct->arguments = addElement(currentStruct->arguments,newEntry);
      break;
    }
    currentIdent = currentIdent->next;
  }

  if (!okay) {
    freeThing(res);
    res = NULL;
  }

  return res;
}

int setMessageSuppressionState(int msgNum, int state) {
  if ((msgNum < 0) || (msgNum == SOLLYA_MSG_NO_MSG) || (msgNum == SOLLYA_MSG_CONTINUATION) || (!messageNumberExists(msgNum))) {
    printMessage(1,SOLLYA_MSG_CANNOT_SUPPRESS_OR_UNSUPPRESS_A_MESSAGE,
		 ((state)?"Warning: the message with the number %d cannot be suppressed.\n":
		  "Warning: the message with the number %d cannot be unsuppressed.\n"), msgNum);
    return 0;
  }
  if (suppressedMessages == NULL) {
    suppressedMessages = initializeBitfield();
  }
  fixBitInBitfield(suppressedMessages, (unsigned int) msgNum, state);

  return 1;
}

int symbolNameAlreadyUsed(char *basename) {

  if ((variablename != NULL) && (strcmp(variablename,basename) == 0)) return 1;
  if (containsEntry(symbolTable, basename) || containsDeclaredEntry(declaredSymbolTable, basename)) return 1;
  if (getProcedure(basename) != NULL) return 1;
  if (getFunction(basename) != NULL) return 1;
  if (getConstantFunction(basename) != NULL) return 1;

  return 0;
}

int executeCommandInner(node *tree) {
  int result, res, intTemp, resA, resB, resC, resD, resE, resF, resG, defaultVal, i;
  chain *curr, *tempList, *tempList2, *tempChain, *tempChain2;
  mpfr_t a, b, c, d, e;
  node *tempNode, *tempNode2, *tempNode3, *tempNode4, *tempNode5, *tempNode6, *tempNode7;
  libraryFunction *tempLibraryFunction;
  libraryProcedure *tempLibraryProcedure;
  char *tempString, *tempString2, *timingString;
  FILE *fd;
  node **array;
  rangetype tempRange;
  int autoprintAlreadyDone, floatingPointEvaluationAlreadyDone;
  int *tempIntPtr;

  /* Make compiler happy */
  fd = NULL;
  /* End of compiler happiness */

  if (tree->nodeType == MEMREF) {
    return executeCommandInner(tree->child1);
  }

  result = 0;

  timingString = NULL;
  if (timecounting) {
    timingString = getTimingStringForThing(tree);
    if (timingString != NULL) pushTimeCounter();
  }

  switch (tree->nodeType) {
  case COMMANDLIST:
    declaredSymbolTable = pushFrame(declaredSymbolTable);
    curr = tree->arguments;
    result = 0;
    while (curr != NULL) {
      res = executeCommand((node *) (curr->value));
      if (res) {
	result = 1;
	break;
      }
      curr = curr->next;
    }
    declaredSymbolTable = popFrame(declaredSymbolTable,freeThingOnVoid);
    break;
  case WHILE:
    result = 0;
    do {
      if (!evaluateThingToBoolean(&intTemp, tree->child1, NULL)) {
	printMessage(1,SOLLYA_MSG_CONTROL_STRUCTURE_NOT_EXECUTABLE_EXPR_NO_BOOLEAN,"Warning: the given expression does not evaluate to a boolean.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"The while loop will not be executed.\n");
        considerDyingOnError();
	break;
      }
      if (!intTemp)
	break;
      res = executeCommand(tree->child2);
      if (res) {
	result = 1;
	break;
      }
    } while (1);
    break;
  case IFELSE:
    result = 0;
    curr = tree->arguments;
    if (!evaluateThingToBoolean(&intTemp, (node *) (curr->value), NULL)) {
      printMessage(1,SOLLYA_MSG_CONTROL_STRUCTURE_NOT_EXECUTABLE_EXPR_NO_BOOLEAN,"Warning: the given expression does not evaluate to a boolean.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"Neither the if nor the else statement will be executed.\n");
      considerDyingOnError();
    } else {
      if (intTemp) {
	curr = curr->next;
	result = executeCommand((node *) (curr->value));
      } else {
	curr = curr->next; curr = curr->next;
	result = executeCommand((node *) (curr->value));
      }
    }
    break;
  case IF:
    result = 0;
    if (!evaluateThingToBoolean(&intTemp, tree->child1, NULL)) {
      printMessage(1,SOLLYA_MSG_CONTROL_STRUCTURE_NOT_EXECUTABLE_EXPR_NO_BOOLEAN,"Warning: the given expression does not evaluate to a boolean.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The if statement will not be executed.\n");
      considerDyingOnError();
    } else {
      if (intTemp) {
	result = executeCommand(tree->child2);
      }
    }
    break;
  case FOR:
    result = 0;
    mpfr_init2(a,tools_precision);
    mpfr_init2(b,tools_precision);
    mpfr_init2(c,tools_precision);
    curr = tree->arguments;
    resA = evaluateThingToConstant(a, (node *) (curr->value), NULL, 0, 0);
    curr = curr->next;
    resB = evaluateThingToConstant(b, (node *) (curr->value), NULL, 0, 0);
    curr = curr->next;
    resC = evaluateThingToConstant(c, (node *) (curr->value), NULL, 0, 0);
    curr = curr->next;
    tempNode4 = (node *) (curr->value);
    if (resA && resB && resC) {
      tempNode = makeConstant(a);
      if (assignThingToTable(tree->string, tempNode)) {
	while (1) {
	  if (mpfr_sgn(c) > 0) {
	    if (mpfr_cmp(a,b) > 0) break;
	  } else {
	    if (mpfr_cmp(a,b) < 0) break;
	  }
	  res = executeCommand(tempNode4);
	  if (res) {
	    result = 1;
	    break;
	  }
	  tempNode2 = getThingFromTable(tree->string, 1, NULL);
	  if (tempNode2 != NULL) {
	    tempNode3 = makeAdd(tempNode2,makeConstant(c));
	    resA = evaluateThingToConstant(a, tempNode3, NULL, 0, 0);
	    freeThing(tempNode3);
	    if (resA) {
	      tempNode3 = makeConstant(a);
	      if (!assignThingToTable(tree->string,tempNode3)) {
		printMessage(1,SOLLYA_MSG_AT_END_OF_FOR_CNTRL_VAR_NO_LONGER_ASSIGNABLE,"Warning: at the end of a for loop, the loop variable \"%s\" cannot longer be assigned to.\n",tree->string);
		printMessage(1,SOLLYA_MSG_CONTINUATION,"The for loop will no longer be executed.\n");
                considerDyingOnError();
		freeThing(tempNode3);
		break;
	      }
	      freeThing(tempNode3);
	    } else {
	      printMessage(1,SOLLYA_MSG_AT_END_OF_FOR_CNTRL_VAR_NO_LONGER_CONSTANT,"Warning: at the end of a for loop, the loop variable \"%s\" decreased by the loop step does no longer evaluate to a constant.\n",tree->string);
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"The for loop will no longer be executed.\n");
              considerDyingOnError();
	      break;
	    }
	  } else {
	    printMessage(1,SOLLYA_MSG_TOOL_HAS_BEEN_RESTARTED_INSIDE_LOOP,"Warning: the tool has been restarted inside a for loop.\n");
	    printMessage(1,SOLLYA_MSG_CONTINUATION,"The for loop will no longer be executed.\n");
            considerDyingOnError();
	    break;
	  }
	}
      } else {
	printMessage(1,SOLLYA_MSG_CNTRL_VAR_OF_LOOP_CANNOT_BE_ASSIGNED,"Warning: the identifier \"%s\" cannot be assigned to.\n",tree->string);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"The for loop will not be executed.\n");
        considerDyingOnError();
      }
      freeThing(tempNode);
    } else {
      printMessage(1,SOLLYA_MSG_ARGS_OF_FOR_LOOP_NOT_CONSTANT,"Warning: one of the arguments of the for loop does not evaluate to a constant.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The for loop will not be executed.\n");
      considerDyingOnError();
    }
    mpfr_clear(a);
    mpfr_clear(b);
    mpfr_clear(c);
    break;
  case FORIN:
    if (evaluateThingToPureListOfThings(&tempList, tree->child1)) {
      curr = tempList;
      while (curr != NULL) {
	if (assignThingToTable(tree->string,(node *) (curr->value))) {
	  res = executeCommand(tree->child2);
	  if (res) {
	    result = 1;
	    break;
	  }
	} else {
	  printMessage(1,SOLLYA_MSG_AT_END_OF_FOR_CNTRL_VAR_NO_LONGER_ASSIGNABLE,"Warning: the identifier \"%s\" can no longer be assigned to.\n",tree->string);
	  printMessage(1,SOLLYA_MSG_CONTINUATION,"The execution of the for loop will be stopped.\n");
          considerDyingOnError();
	  break;
	}
	curr = curr->next;
      }
      freeChain(tempList,freeThingOnVoid);
    } else {
      if (evaluateThingToEmptyList(tree->child1)) {
	printMessage(2,SOLLYA_MSG_FOR_IN_LOOP_OVER_EMPTY_LIST,"Information: executing a for in statement on an empty list.\n");
      } else {
	printMessage(1,SOLLYA_MSG_FOR_IN_LOOP_OVER_END_ELLIPTIC_LIST_NOT_ALLOWED,"Warning: the expression given does not evaluate to a non-elliptic list.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"The loop will not be executed.\n");
        considerDyingOnError();
      }
    }
    break;
  case QUIT:
    result = 1;
    break;
  case NOP:
    result = 0;
    break;
  case NOPARG:
    defaultVal = 1;
    if (evaluateThingToInteger(&resA, tree->child1, &defaultVal)) {
      if (resA < 1) {
	resA = 1;
	printMessage(1,SOLLYA_MSG_AT_LEAST_ONE_OPERATION_MUST_BE_EXECUTED,"Warning: at least 1 operation must be executed.\n");
      }
      doNothing(resA);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    result = 0;
    break;
  case FALSEQUIT:
    printMessage(1,SOLLYA_MSG_QUIT_IN_FILE_READ_INTO_ANOTHER,"Warning: a quit command has been used in a file read into another.\n");
    printMessage(1,SOLLYA_MSG_CONTINUATION,"This quit command will be neglected.\n");
    result = 0;
    break;
  case FALSERESTART:
    printMessage(1,SOLLYA_MSG_RESTART_IN_FILE_READ_INTO_ANOTHER,"Warning: a restart command has been used in a file read into another.\n");
    printMessage(1,SOLLYA_MSG_CONTINUATION,"This restart command will be neglected.\n");
    result = 0;
    break;
  case RESTART:
    restartTool();
    outputMode();
    sollyaPrintf("The tool has been restarted.\n");
    result = 0;
    break;
  case VARIABLEDECLARATION:
    curr = tree->arguments;
    while (curr != NULL) {
      if ((variablename != NULL) && (strcmp(variablename, (char *) (curr->value)) == 0)) {
	printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_FREE_VAR_CANNOT_BE_LOCAL_VAR,"Warning: the identifier \"%s\" is already bound to the current free variable.\nIt cannot be declared as a local variable. The declaration of \"%s\" will have no effect.\n",
		     (char *) (curr->value),(char *) (curr->value));
        considerDyingOnError();
      } else {
	if (getFunction((char *) (curr->value)) != NULL) {
	  printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_LIBRARY_FUNC_CANNOT_BE_LOCAL_VAR,"Warning: the identifier \"%s\" is already bound to a library function.\nIt cannot be declared as a local variable. The declaration of \"%s\" will have no effect.\n",
                       (char *) (curr->value),(char *) (curr->value));
          considerDyingOnError();
	} else {
          if (getConstantFunction((char *) (curr->value)) != NULL) {
            printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_LIBRARY_CONST_CANNOT_BE_LOCAL_VAR,"Warning: the identifier \"%s\" is already bound to a library constant.\nIt cannot be declared as a local variable. The declaration of \"%s\" will have no effect.\n",
                         (char *) (curr->value),(char *) (curr->value));
            considerDyingOnError();
          } else {
            if (getProcedure((char *) (curr->value)) != NULL) {
              printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_EXTERNAL_PROC_CANNOT_BE_LOCAL_VAR,"Warning: the identifier \"%s\" is already bound to an external procedure.\nIt cannot be declared as a local variable. The declaration of \"%s\" will have no effect.\n",
                           (char *) (curr->value),(char *) (curr->value));
              considerDyingOnError();
            } else {
              if (declaredSymbolTable != NULL) {
                tempNode = makeError();
                declaredSymbolTable = declareNewEntry(declaredSymbolTable, (char *) (curr->value), tempNode, copyThingOnVoid);
                freeThing(tempNode);
              } else {
                printMessage(1,SOLLYA_MSG_FRAME_SYSTEM_CORRUPTED_LOCAL_VAR_NOT_DECLARED,"Warning: previous command interruptions have corrupted the frame system.\n");
                printMessage(1,SOLLYA_MSG_CONTINUATION,"Local variable \"%s\" cannot be declared.\n",(char *) (curr->value));
                considerDyingOnError();
              }
            }
          }
        }
      }
      curr = curr->next;
    }
    break;
  case PRINT:
    curr = tree->arguments;
    outputMode();
    while (curr != NULL) {
      tempNode = evaluateThing((node *) (curr->value));
      printThing(tempNode);
      freeThing(tempNode);
      if (curr->next != NULL) sollyaPrintf(" ");
      curr = curr->next;
    }
    sollyaPrintf("\n");
    break;
  case SUPPRESSMESSAGE:
    evaluateThingListToThingArray(&resA, &array, tree->arguments);
    tempChain = NULL;
    for (i=0;i<resA;i++) {
      if (evaluateThingToInteger(&resB, array[i], NULL)) {
	tempIntPtr = (int *) safeMalloc(sizeof(int));
	*tempIntPtr = resB;
	tempChain = addElement(tempChain, tempIntPtr);
      } else {
	tempChain2 = NULL;
	if (evaluateThingToIntegerList(&tempChain2, NULL, array[i])) {
	  tempChain = concatChains(tempChain, tempChain2);
	} else {
	  if (!isEmptyList(array[i])) {
	    freeChain(tempChain,freeIntPtr);
	    tempChain = NULL;
	    printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_INT_OR_LIST_OF_INT,"Warning: the expression given does not evaluate to an integer nor to a list of integers.\n");
	    printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
	    considerDyingOnError();
	    break;
	  }
	}
      }
    }
    for (curr=tempChain;curr!=NULL;curr=curr->next) {
      if (!setMessageSuppressionState(*((int *) (curr->value)), 1)) {
	printMessage(1,SOLLYA_MSG_SUPPRESSION_NUMBER_OMITTED,"Warning: The command will have had no effect for message number %d.\n",*((int *) (curr->value)));
      }
    }
    freeChain(tempChain,freeIntPtr);
    for (i=0;i<resA;i++)
      freeThing(array[i]);
    safeFree(array);
    break;
  case UNSUPPRESSMESSAGE:
    evaluateThingListToThingArray(&resA, &array, tree->arguments);
    tempChain = NULL;
    for (i=0;i<resA;i++) {
      if (evaluateThingToInteger(&resB, array[i], NULL)) {
	tempIntPtr = (int *) safeMalloc(sizeof(int));
	*tempIntPtr = resB;
	tempChain = addElement(tempChain, tempIntPtr);
      } else {
	tempChain2 = NULL;
	if (evaluateThingToIntegerList(&tempChain2, NULL, array[i])) {
	  tempChain = concatChains(tempChain, tempChain2);
	} else {
	  if (!isEmptyList(array[i])) {
	    freeChain(tempChain,freeIntPtr);
	    tempChain = NULL;
	    printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_INT_OR_LIST_OF_INT,"Warning: the expression given does not evaluate to an integer nor to a list of integers.\n");
	    printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
	    considerDyingOnError();
	    break;
	  }
	}
      }
    }
    for (curr=tempChain;curr!=NULL;curr=curr->next) {
      if (!setMessageSuppressionState(*((int *) (curr->value)), 0)) {
	printMessage(1,SOLLYA_MSG_SUPPRESSION_NUMBER_OMITTED,"Warning: The command will have had no effect for message number %d.\n",*((int *) (curr->value)));
      }
    }
    freeChain(tempChain,freeIntPtr);
    for (i=0;i<resA;i++)
      freeThing(array[i]);
    safeFree(array);
    break;
  case NEWFILEPRINT:
    if (evaluateThingToString(&tempString, tree->child1)) {
      fd = fopen(tempString,"w");
      if (fd != NULL) {
	curr = tree->arguments;
	while (curr != NULL) {
	  tempNode = evaluateThing((node *) (curr->value));
	  fPrintThing(fd,tempNode);
	  freeThing(tempNode);
	  if (curr->next != NULL) sollyaFprintf(fd," ");
	  curr = curr->next;
	}
	sollyaFprintf(fd,"\n");
	fclose(fd);
      } else {
	printMessage(1,SOLLYA_MSG_FILE_COULD_NOT_BE_OPENED_FOR_WRITING,"Warning: the file \"%s\" could not be opened for writing.\n",tempString);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
        considerDyingOnError();
      }
      safeFree(tempString);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the expression given does not evaluate to a string.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case APPENDFILEPRINT:
    if (evaluateThingToString(&tempString, tree->child1)) {
      fd = fopen(tempString,"a");
      if (fd != NULL) {
	curr = tree->arguments;
	while (curr != NULL) {
	  tempNode = evaluateThing((node *) (curr->value));
	  fPrintThing(fd,tempNode);
	  freeThing(tempNode);
	  if (curr->next != NULL) sollyaFprintf(fd," ");
	  curr = curr->next;
	}
	sollyaFprintf(fd,"\n");
	fclose(fd);
      } else {
	printMessage(1,SOLLYA_MSG_FILE_COULD_NOT_BE_OPENED_FOR_WRITING,"Warning: the file \"%s\" could not be opened for writing.\n",tempString);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
        considerDyingOnError();
      }
      safeFree(tempString);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the expression given does not evaluate to a string.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case PLOT:
    evaluateThingListToThingArray(&resA, &array, tree->arguments);
    resC = 0;
    if (isFilePostscriptFile(array[resA-2])) {
      if (evaluateThingToString(&tempString, array[resA-1])) {
	resB = resA - 2;
	resC = 1;
	switch ((accessThruMemRef(array[resA-2]))->nodeType) {
	case FILESYM:
	  resD = PLOTFILE;
	  break;
	case POSTSCRIPT:
	  resD = PLOTPOSTSCRIPT;
	  break;
	case POSTSCRIPTFILE:
	  resD = PLOTPOSTSCRIPTFILE;
	  break;
	default:
	  resC = 0;
	}
      } else {
	printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the expression given does not evaluate to a string.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
        considerDyingOnError();
      }
    } else {
      resB = resA;
      resC = 1;
      resD = PLOTFILE;
      tempString = NULL;
    }
    if (resC) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      if (evaluateThingToRange(a, b, array[resB-1])) {
	if (evaluateThingArrayToListOfPureTrees(&tempList, resB-1, array)) {
	  plotTree(tempList, a, b, defaultpoints, tools_precision, tempString, resD);
	  freeChain(tempList,freeThingOnVoid);
	} else {
	  if (isPureList(array[0]) && (resB-1 == 1)) {
	    if (evaluateThingToPureListOfPureTrees(&tempList, array[0])) {
	      plotTree(tempList, a, b, defaultpoints, tools_precision, tempString, resD);
	      freeChain(tempList,freeThingOnVoid);
	    } else {
	      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_LIST_OF_FUNCTIONS,"Warning: the first argument is not a list of pure functions.\n");
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
              considerDyingOnError();
	    }
	  } else {
	    printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_LIST_OF_FUNCTIONS,"Warning: at least one of the given expressions does not evaluate to a pure function.\n");
	    printMessage(1,SOLLYA_MSG_CONTINUATION,"Warning: the first argument is not a list of pure functions.\n");
	    printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
            considerDyingOnError();
	  }
	}
      } else {
	printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_RANGE,"Warning: the expression given does not evaluate to a range.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
        considerDyingOnError();
      }
      mpfr_clear(a);
      mpfr_clear(b);
    }
    if (tempString != NULL) safeFree(tempString);
    for (i=0;i<resA;i++)
      freeThing(array[i]);
    safeFree(array);
    break;
  case IMPLEMENTCONST:
    evaluateThingListToThingArray(&resA, &array, tree->arguments);
    resG = 1;
    resD = 1;
    if (evaluateThingToPureTree(&tempNode, array[0])) {
      if (isConstant(tempNode)) {
	resB = 0;
	resC = 1;
	resE = 0;
	if (resA > 1) {
	  if (evaluateThingToString(&tempString2, array[1])) {
	    fd = fopen(tempString2,"w");
	    if (fd != NULL) {
	      safeFree(tempString2);
	      resB = 1;
	    } else {
	      if (resD) { freeThing(tempNode); resD = 0; }
	      if (resG) {
		for (i=0;i<resA;i++)
		  freeThing(array[i]);
		safeFree(array);
		resG = 0;
	      }
	      printMessage(1,SOLLYA_MSG_FILE_COULD_NOT_BE_OPENED_FOR_WRITING,"Warning: the file \"%s\" could not be opened for writing.\n",tempString2);
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
	      safeFree(tempString2);
	      considerDyingOnError();
	      resC = 0;
	    }
	  } else {
	    if (isDefault(array[1])) {
	      fd = stdout;
	      resB = 0;
	    } else {
	      if (resD) { freeThing(tempNode); resD = 0; }
	      if (resG) {
		for (i=0;i<resA;i++)
		  freeThing(array[i]);
		safeFree(array);
		resG = 0;
	      }
	      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING_NOR_DEFAULT,"Warning: the expression given does not evaluate to a string nor to a default value.\n");
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
	      considerDyingOnError();
	      resC = 0;
	    }
	  }
	  if (resC && (resA > 2)) {
	    if (evaluateThingToStringWithDefault(&tempString, array[2], "const_something")) {
	      resE = 1;
	    } else {
	      if (resD) { freeThing(tempNode); resD = 0; }
	      if (resB) { fclose(fd); resB = 0; }
	      if (resG) {
		for (i=0;i<resA;i++)
		  freeThing(array[i]);
		safeFree(array);
		resG = 0;
	      }
	      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING_NOR_DEFAULT,"Warning: the expression given does not evaluate to a string nor to a default value.\n");
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
	      considerDyingOnError();
	      resC = 0;
	    }
	  } else {
	    tempString2 = "const_something";
	    tempString = (char *) safeCalloc(strlen(tempString2) + 1, sizeof(char));
	    strcpy(tempString, tempString2);
	    resE = 1;
	  }
	} else {
	  tempString2 = "const_something";
	  tempString = (char *) safeCalloc(strlen(tempString2) + 1, sizeof(char));
	  strcpy(tempString, tempString2);
	  resE = 1;
	  fd = stdout;
	  resB = 0;
	}
	if (resC) {
	  if (timingString != NULL) pushTimeCounter();
	  outputMode();
	  resF = implementconst(tempNode, fd, tempString);
	  if (timingString != NULL) popTimeCounter(timingString);
	  if (resF) {
	    if (resB) { fclose(fd); resB = 0; }
	    if (resE) { safeFree(tempString); resE = 0; }
	    if (resD) { freeThing(tempNode); resD = 0; }
	    if (resG) {
	      for (i=0;i<resA;i++)
		freeThing(array[i]);
	      safeFree(array);
	      resG = 0;
	    }
	    printMessage(1,SOLLYA_MSG_IMPLEMENTATION_HAS_NOT_SUCCEEDED,"Warning: the implementation has not succeeded. The command could not be executed.\n");
	    considerDyingOnError();
	  }
	}
	if (resB) { fclose(fd); resB = 0; }
	if (resE) { safeFree(tempString); resE = 0; }
	if (resD) { freeThing(tempNode); resD = 0; }
      } else {
	if (resD) { freeThing(tempNode); resD = 0; }
	if (resG) {
	  for (i=0;i<resA;i++)
	    freeThing(array[i]);
	  safeFree(array);
	  resG = 0;
	}
	printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_CONSTANT,"Warning: the expression given does not evaluate to a constant expression.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
        considerDyingOnError();
      }
    } else {
      if (resG) {
	for (i=0;i<resA;i++)
	  freeThing(array[i]);
	safeFree(array);
	resG = 0;
      }
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_AN_EXPRESSION,"Warning: the expression given does not evaluate to an expression.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    if (resG) {
      for (i=0;i<resA;i++)
	freeThing(array[i]);
      safeFree(array);
    }
    break;
  case PRINTHEXA:
    mpfr_init2(a,tools_precision);
    if (evaluateThingToConstant(a, tree->child1, NULL, 0, 0)) {
      outputMode();
      printDoubleInHexa(a);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_CONSTANT,"Warning: the expression given does not evaluate to a constant value.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    mpfr_clear(a);
    break;
  case PRINTFLOAT:
    mpfr_init2(a,tools_precision);
    if (evaluateThingToConstant(a, tree->child1, NULL, 0, 0)) {
      outputMode();
      printSimpleInHexa(a);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_CONSTANT,"Warning: the expression given does not evaluate to a constant value.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    mpfr_clear(a);
    break;
  case PRINTBINARY:
    mpfr_init2(a,tools_precision);
    if (evaluateThingToConstant(a, tree->child1, NULL, 0, 0)) {
      outputMode();
      printBinary(a); sollyaPrintf("\n");
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_CONSTANT,"Warning: the expression given does not evaluate to a constant value.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    mpfr_clear(a);
    break;
  case PRINTEXPANSION:
    outputMode();
    if (evaluateThingToPureTree(&tempNode, tree->child1)) {
      if (printPolynomialAsDoubleExpansion(tempNode, tools_precision) == 1) {
	if (!noRoundingWarnings) {
	  printMessage(1,SOLLYA_MSG_ROUNDING_WHILE_PRINTING,"\nWarning: rounding occurred while printing.");
	}
      }
      sollyaPrintf("\n");
      freeThing(tempNode);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_A_FUNCTION,"Warning: the given expression does not evaluate to a function.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
      considerDyingOnError();
    }
    break;
  case BASHEXECUTE:
    if (evaluateThingToString(&tempString, tree->child1)) {
      outputMode();
      intTemp = bashExecute(tempString);
      normalMode(); outputMode();
      printMessage(2,SOLLYA_MSG_BASH_RETURNS_A_CERTAIN_RETURN_VALUE,"Information: the bash return value is %d.\n",intTemp);
      safeFree(tempString);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the expression given does not evaluate to a string.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case EXTERNALPLOT:
    evaluateThingListToThingArray(&resA, &array, tree->arguments);
    if (evaluateThingToString(&tempString,array[0])) {
      resB = RELATIVE;
      if (evaluateThingToExternalPlotMode(&resF,array[1],&resB)) {
	if (evaluateThingToPureTree(&tempNode,array[2])) {
	  mpfr_init2(a,tools_precision);
	  mpfr_init2(b,tools_precision);
	  if (evaluateThingToRange(a,b,array[3])) {
	    if (evaluateThingToInteger(&resB, array[4], NULL)) {
	      resC = 0; resD = 0; tempString2 = NULL; resE = PLOTFILE;
	      if (resA >= 6) {
		if ((accessThruMemRef(array[5]))->nodeType == PERTURB) {
		  resC = 1;
		  if (resA >= 8) {
		    if (isFilePostscriptFile(array[6])) {
		      if (evaluateThingToString(&tempString2,array[7])) {
			resD = 1;
			switch ((accessThruMemRef(array[6]))->nodeType) {
			case FILESYM:
			  resE = PLOTFILE;
			  break;
			case POSTSCRIPT:
			  resE = PLOTPOSTSCRIPT;
			  break;
			case POSTSCRIPTFILE:
			  resE = PLOTPOSTSCRIPTFILE;
			  break;
			default:
			  resD = 0;
			}
		      } else {
			printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the expression given does not evaluate to a string.\n");
			printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                        considerDyingOnError();
		      }
		    }
		  } else {
		    resD = 1;
		  }
		} else {
		  if (resA >= 7) {
		    if (isFilePostscriptFile(array[5])) {
		      if (evaluateThingToString(&tempString2,array[6])) {
			resD = 1;
			switch ((accessThruMemRef(array[5]))->nodeType) {
			case FILESYM:
			  resE = PLOTFILE;
			  break;
			case POSTSCRIPT:
			  resE = PLOTPOSTSCRIPT;
			  break;
			case POSTSCRIPTFILE:
			  resE = PLOTPOSTSCRIPTFILE;
			  break;
			default:
			  resD = 0;
			}
		      } else {
			printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the expression given does not evaluate to a string.\n");
			printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                        considerDyingOnError();
		      }
		    }
		  }
		}
	      } else {
		resD = 1;
	      }
	      if (resD) {
		externalPlot(tempString, a, b, (mp_prec_t) resB, resC, tempNode, resF, tools_precision, tempString2, resE);
	      }
	      if (tempString2 != NULL) safeFree(tempString2);
	    } else {
	      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
              considerDyingOnError();
	    }
	  } else {
	    printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_RANGE,"Warning: the expression given does not evaluate to a constant range.\n");
	    printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
            considerDyingOnError();
	  }
	  mpfr_clear(a);
	  mpfr_clear(b);
	  freeThing(tempNode);
	} else {
	  printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_A_FUNCTION,"Warning: the expression given does not evaluate to a function.\n");
	  printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
          considerDyingOnError();
	}
      } else {
	printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ABS_NOR_REL,"Warning: the expression given does not evaluate to one of absolute or relative.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
        considerDyingOnError();
      }
      safeFree(tempString);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the expression given does not evaluate to a string.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    for (i=0;i<resA;i++)
      freeThing(array[i]);
    safeFree(array);
    break;
  case WRITE:
    outputMode();
    curr = tree->arguments;
    while (curr != NULL) {
      tempNode = evaluateThing((node *) (curr->value));
      printThing(tempNode);
      freeThing(tempNode);
      curr = curr->next;
    }
    break;
  case NEWFILEWRITE:
    if (evaluateThingToString(&tempString, tree->child1)) {
      fd = fopen(tempString,"w");
      if (fd != NULL) {
	curr = tree->arguments;
	while (curr != NULL) {
	  tempNode = evaluateThing((node *) (curr->value));
	  fPrintThing(fd,tempNode);
	  freeThing(tempNode);
	  curr = curr->next;
	}
	fclose(fd);
      } else {
	printMessage(1,SOLLYA_MSG_FILE_COULD_NOT_BE_OPENED_FOR_WRITING,"Warning: the file \"%s\" could not be opened for writing.\n",tempString);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
        considerDyingOnError();
      }
      safeFree(tempString);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the expression given does not evaluate to a string.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case APPENDFILEWRITE:
    if (evaluateThingToString(&tempString, tree->child1)) {
      fd = fopen(tempString,"a");
      if (fd != NULL) {
	curr = tree->arguments;
	while (curr != NULL) {
	  tempNode = evaluateThing((node *) (curr->value));
	  fPrintThing(fd,tempNode);
	  freeThing(tempNode);
	  curr = curr->next;
	}
	fclose(fd);
      } else {
	printMessage(1,SOLLYA_MSG_FILE_COULD_NOT_BE_OPENED_FOR_APPENDING,"Warning: the file \"%s\" could not be opened for appending.\n",tempString);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
        considerDyingOnError();
      }
      safeFree(tempString);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the expression given does not evaluate to a string.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case ASCIIPLOT:
    outputMode();
    if (evaluateThingToPureTree(&tempNode, tree->child1)) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      if (evaluateThingToRange(a, b, tree->child2)) {
	asciiPlotTree(tempNode, a, b, tools_precision);
      } else {
	printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_RANGE,"Warning: the given expression does not evaluate to a constant range.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
        considerDyingOnError();
      }
      freeThing(tempNode);
      mpfr_clear(a);
      mpfr_clear(b);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_A_FUNCTION,"Warning: the given expression does not evaluate to a function.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
      considerDyingOnError();
    }
    break;
  case PRINTXML:
    if (evaluateThingToPureTree(&tempNode, tree->child1)) {
      sollyaPrintf("\n");
      outputMode();
      printXml(tempNode);
      freeThing(tempNode);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_A_FUNCTION,"Warning: the given expression does not evaluate to a function.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
      considerDyingOnError();
    }
    break;
  case EXECUTE:
    if (evaluateThingToString(&tempString, tree->child1)) {
      fd = fopen(tempString,"r");
      if (fd != NULL) {
	executeFile(fd);
	fclose(fd);
      } else {
	printMessage(1,SOLLYA_MSG_FILE_COULD_NOT_BE_OPENED_FOR_READING,"Warning: the file \"%s\" could not be opened for reading.\n",tempString);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
        considerDyingOnError();
      }
      safeFree(tempString);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the given expression does not evaluate to a string.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
      considerDyingOnError();
    }
    break;
  case PRINTXMLNEWFILE:
    if (evaluateThingToPureTree(&tempNode, tree->child1)) {
      if (evaluateThingToString(&tempString, tree->child2)) {
	fd = fopen(tempString,"w");
	if (fd != NULL) {
	  fPrintXml(fd,tempNode);
	  fclose(fd);
	} else {
	  printMessage(1,SOLLYA_MSG_FILE_COULD_NOT_BE_OPENED_FOR_WRITING,"Warning: the file \"%s\" could not be opened for writing.\n",tempString);
	  printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
          considerDyingOnError();
	}
	safeFree(tempString);
      } else {
	printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the given expression does not evaluate to a string.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
        considerDyingOnError();
      }
      freeThing(tempNode);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_A_FUNCTION,"Warning: the given expression does not evaluate to a function.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
      considerDyingOnError();
    }
    break;
  case PRINTXMLAPPENDFILE:
    if (evaluateThingToPureTree(&tempNode, tree->child1)) {
      if (evaluateThingToString(&tempString, tree->child2)) {
	fd = fopen(tempString,"a");
	if (fd != NULL) {
	  fPrintXml(fd,tempNode);
	  fclose(fd);
	} else {
	  printMessage(1,SOLLYA_MSG_FILE_COULD_NOT_BE_OPENED_FOR_WRITING,"Warning: the file \"%s\" could not be opened for writing.\n",tempString);
	  printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
          considerDyingOnError();
	}
	safeFree(tempString);
      } else {
	printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the given expression does not evaluate to a string.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
        considerDyingOnError();
      }
      freeThing(tempNode);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_A_FUNCTION,"Warning: the given expression does not evaluate to a function.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
      considerDyingOnError();
    }
    break;
  case WORSTCASE:
    evaluateThingListToThingArray(&resA, &array, tree->arguments);
    resC = 0;
    if ((resA >= 6) && (isString(array[5]))) {
      fd = fopen((accessThruMemRef(array[5]))->string,"w");
      if (fd != NULL) {
	resC = 1;
      } else {
	printMessage(1,SOLLYA_MSG_FILE_COULD_NOT_BE_OPENED_FOR_WRITING,"Warning: the file \"%s\" could not be opened for writing.\n",(array[5])->string);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
        considerDyingOnError();
      }
    } else {
      resC = 1;
      fd = NULL;
    }
    if (resC) {
      if (evaluateThingToPureTree(&tempNode,array[0])) {
	mpfr_init2(a,tools_precision);
	if (evaluateThingToConstant(a,array[1],NULL,0,0)) {
	  mpfr_init2(b,tools_precision);
	  mpfr_init2(c,tools_precision);
	  if (evaluateThingToRange(b,c,array[2])) {
	    mpfr_init2(d,tools_precision);
	    if (evaluateThingToConstant(d,array[3],NULL,0,0)) {
	      mpfr_init2(e,tools_precision);
	      if (evaluateThingToConstant(e,array[4],NULL,0,0)) {
		tempRange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
		tempRange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
		mpfr_init2(*(tempRange.a),tools_precision);
		mpfr_init2(*(tempRange.b),tools_precision);
		mpfr_set(*(tempRange.a),b,GMP_RNDN);
		mpfr_set(*(tempRange.b),c,GMP_RNDN);
		outputMode();
		printWorstCases(tempNode, a, tempRange, d, e, tools_precision, fd);
		mpfr_clear(*(tempRange.a));
		mpfr_clear(*(tempRange.b));
		safeFree(tempRange.a);
		safeFree(tempRange.b);
	      } else {
		printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_CONSTANT,"Warning: the given expression does not evaluate to a constant.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
                considerDyingOnError();
	      }
	      mpfr_clear(e);
	    } else {
	      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_CONSTANT,"Warning: the given expression does not evaluate to a constant.\n");
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
              considerDyingOnError();
	    }
	    mpfr_clear(d);
	  } else {
	    printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_RANGE,"Warning: the given expression does not evaluate to a constant range.\n");
	    printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
            considerDyingOnError();
	  }
	  mpfr_clear(b);
	  mpfr_clear(c);
	} else {
	  printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_CONSTANT,"Warning: the given expression does not evaluate to a constant.\n");
	  printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
          considerDyingOnError();
	}
	mpfr_clear(a);
	freeThing(tempNode);
      } else {
	printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_A_FUNCTION,"Warning: the given expression does not evaluate to a function.\n");
	printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
        considerDyingOnError();
      }
      if (fd != NULL) fclose(fd);
    }
    for (i=0;i<resA;i++)
      freeThing(array[i]);
    safeFree(array);
    sollyaPrintf("\n");
    break;
  case RENAME:
    if (variablename == NULL) {
      variablename = (char *) safeCalloc(strlen((char *) (tree->arguments->value)) + 1,sizeof(char));
      strcpy(variablename,(char *) (tree->arguments->value));
      printMessage(1,SOLLYA_MSG_FREE_VARIABLE_HAS_BEEN_NAMED_SOMEHOW,"Information: the free variable has been named \"%s\".\n", variablename);
    } else {
      if ((strcmp(variablename,tree->string) == 0) || (strcmp("_x_",tree->string) == 0)) {
	tempString = variablename;
	variablename = (char *) safeCalloc(strlen((char *) (tree->arguments->value)) + 1,sizeof(char));
	strcpy(variablename,(char *) (tree->arguments->value));
	printMessage(1,SOLLYA_MSG_FREE_VARIABLE_HAS_BEEN_RENAMED,"Information: the free variable has been renamed from \"%s\" to \"%s\".\n",
		     tempString,(char *) (tree->arguments->value));
	safeFree(tempString);
      } else {
	printMessage(1,SOLLYA_MSG_CAN_RENAME_ONLY_FREE_VARIABLE,"Warning: the current free variable is named \"%s\" and not \"%s\". Can only rename the free variable.\n",
		     variablename,tree->string);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"The last command will have no effect.\n");
        considerDyingOnError();
      }
    }
    break;
  case AUTOPRINT:
    curr = tree->arguments;
    if (curr->next == NULL) {
      tempNode = evaluateThing((node *) (curr->value));
      autoprintAlreadyDone = 0;
      if (isPureTree(tempNode) &&
	  isConstant(tempNode) &&
	  (((accessThruMemRef((node *) (curr->value)))->nodeType == TABLEACCESSWITHSUBSTITUTE) ||
	   ((accessThruMemRef((node *) (curr->value)))->nodeType == APPLY)) &&
	  (lengthChain((accessThruMemRef((node *) (curr->value)))->arguments) == 1)) {
	if ((accessThruMemRef((node *) (curr->value)))->nodeType == APPLY) {
	  tempNode2 = copyThing((accessThruMemRef((node *) (curr->value)))->child1);
	  tempNode3 = copyThing(accessThruMemRef((node *) (((accessThruMemRef((node *) (curr->value)))->arguments)->value)));
	} else {
	  tempNode2 = makeTableAccess((accessThruMemRef((node *) (curr->value)))->string);
	  tempNode3 = copyThing(accessThruMemRef((node *) (((accessThruMemRef((node *) (curr->value)))->arguments)->value)));
	}
	tempNode4 = evaluateThing(tempNode2);
	tempNode5 = evaluateThing(tempNode3);
	if (isPureTree(tempNode4) &&
	    isPureTree(tempNode5) &&
	    (!isConstant(tempNode4)) &&
	    isConstant(tempNode5)) {
          outputMode();
          autoprint(tempNode,0,tempNode4,tempNode5);
          sollyaPrintf("\n");
          autoprintAlreadyDone = 1;
	}
	freeThing(tempNode2);
	freeThing(tempNode3);
	freeThing(tempNode4);
	freeThing(tempNode5);
      }
      if (!autoprintAlreadyDone) {
	if ((!isUnit(tempNode)) || ((verbosity >= 2) && oldVoidPrint)) {
	  if (!isExternalProcedureUsage(tempNode)) {
	    outputMode();
	    autoprint(tempNode,0,NULL,NULL);
	  } else {
	    outputMode();
	    printExternalProcedureUsage(tempNode);
	  }
	  sollyaPrintf("\n");
	}
      }
      freeThing(tempNode);
    } else {
      while (curr != NULL) {
	tempNode = evaluateThing((node *) (curr->value));
	autoprintAlreadyDone = 0;
	if (isPureTree(tempNode) &&
	    isConstant(tempNode) &&
	    (((accessThruMemRef((node *) (curr->value)))->nodeType == TABLEACCESSWITHSUBSTITUTE) ||
	     ((accessThruMemRef((node *) (curr->value)))->nodeType == APPLY)) &&
	    (lengthChain((accessThruMemRef((node *) (curr->value)))->arguments) == 1)) {
	  if ((accessThruMemRef((node *) (curr->value)))->nodeType == APPLY) {
	    tempNode2 = copyThing((accessThruMemRef((node *) (curr->value)))->child1);
	    tempNode3 = copyThing(accessThruMemRef((node *) (((accessThruMemRef((node *) (curr->value)))->arguments)->value)));
	  } else {
	    tempNode2 = makeTableAccess((accessThruMemRef((node *) (curr->value)))->string);
	    tempNode3 = copyThing(accessThruMemRef((node *) (((accessThruMemRef((node *) (curr->value)))->arguments)->value)));
	  }
	  tempNode4 = evaluateThing(tempNode2);
	  tempNode5 = evaluateThing(tempNode3);
	  if (isPureTree(tempNode4) &&
	      isPureTree(tempNode5) &&
	      (!isConstant(tempNode4)) &&
	      isConstant(tempNode5)) {
	    outputMode();
	    autoprint(tempNode,0,tempNode4,tempNode5);
	    autoprintAlreadyDone = 1;
	  }
	  freeThing(tempNode2);
	  freeThing(tempNode3);
	  freeThing(tempNode4);
	  freeThing(tempNode5);
	}
	if (!autoprintAlreadyDone) {
	  outputMode();
	  if (!isExternalProcedureUsage(tempNode))
	    autoprint(tempNode,0,NULL,NULL);
	  else
	    printExternalProcedureUsage(tempNode);
	  freeThing(tempNode);
	}
	if (oldAutoPrint) {
	  if (curr->next != NULL) sollyaPrintf(", ");
	}
	curr = curr->next;
      }
      sollyaPrintf("\n");
    }
    break;
  case EXTERNALPROC:
    if ((variablename != NULL) && (strcmp(variablename,tree->string) == 0)) {
      printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_FREE_VAR_CANNOT_BE_EXTERNAL,"Warning: the identifier \"%s\" is already be bound as the current free variable.\n",variablename);
      printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to an external procedure. This command will have no effect.\n");
      considerDyingOnError();
    } else {
      if (containsEntry(symbolTable, tree->string) || containsDeclaredEntry(declaredSymbolTable, tree->string)) {
	printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_BOUND_TO_VAR_CANNOT_BE_EXTERNAL,"Warning: the identifier \"%s\" is already assigned to.\n",tree->string);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to an external procedure. This command will have no effect.\n");
        considerDyingOnError();
      } else {
	if (getFunction(tree->string) != NULL) {
	  printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_LIBRARY_FUNC_CANNOT_BE_EXTERNAL,"Warning: the identifier \"%s\" is already bound to a library function.\n",tree->string);
	  printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to an external procedure. This command will have no effect.\n");
          considerDyingOnError();
	} else {
          if (getConstantFunction(tree->string) != NULL) {
            printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_LIBRARY_CONST_CANNOT_BE_EXTERNAL,"Warning: the identifier \"%s\" is already bound to a library constant.\n",tree->string);
            printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to an external procedure. This command will have no effect.\n");
            considerDyingOnError();
          } else {
            if (getProcedure(tree->string) != NULL) {
              printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_EXTERNAL_PROC_CANNOT_BE_EXTERNAL,"Warning: the identifier \"%s\" is already bound to an external procedure.\n",tree->string);
              printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to an external procedure. This command will have no effect.\n");
              considerDyingOnError();
            } else {
              if (evaluateThingToString(&tempString, tree->child1)) {
                tempLibraryProcedure = bindProcedure(tempString, tree->string, tree->arguments);
                if(tempLibraryProcedure == NULL) {
                  printMessage(1,SOLLYA_MSG_ERROR_OCCURRED_COMMAND_NOT_EXECUTED,"Warning: an error occurred. The last command will have no effect.\n");
                  considerDyingOnError();
                }
                safeFree(tempString);
              } else {
                printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the expression given does not evaluate to a string.\n");
                printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                considerDyingOnError();
              }
            }
	  }
	}
      }
    }
    break;
  case ASSIGNMENT:
    tempNode = evaluateThing(tree->child1);
    if (!assignThingToTable(tree->string, tempNode)) {
      freeThing(tempNode);
      printMessage(1,SOLLYA_MSG_ASSIGNMENT_WILL_HAVE_NO_EFFECT,"Warning: the last assignment will have no effect.\n");
      considerDyingOnError();
    } else {
      freeThing(tempNode);
    }
    break;
  case FLOATASSIGNMENT:
    tempNode = evaluateThing(tree->child1);
    if (isPureTree(tempNode) && isConstant(tempNode)) {
      mpfr_init2(a, tools_precision);
      floatingPointEvaluationAlreadyDone = 0;
      if (isPureTree(tempNode) &&
	  isConstant(tempNode) &&
	  ((accessThruMemRef(tree->child1)->nodeType == TABLEACCESSWITHSUBSTITUTE) ||
	   (accessThruMemRef(tree->child1)->nodeType == APPLY)) &&
	  (lengthChain(accessThruMemRef(tree->child1)->arguments) == 1)) {
	if (accessThruMemRef(tree->child1)->nodeType == APPLY) {
	  tempNode2 = copyThing(accessThruMemRef(tree->child1)->child1);
	  tempNode3 = copyThing(accessThruMemRef((node *) ((accessThruMemRef(tree->child1)->arguments)->value)));
	} else {
	  tempNode2 = makeTableAccess(accessThruMemRef(tree->child1)->string);
	  tempNode3 = copyThing(accessThruMemRef((node *) ((accessThruMemRef(tree->child1)->arguments)->value)));
	}
	tempNode4 = evaluateThing(tempNode2);
	tempNode5 = evaluateThing(tempNode3);
	if (isPureTree(tempNode4) &&
	    isPureTree(tempNode5) &&
	    (!isConstant(tempNode4)) &&
	    isConstant(tempNode5)) {
	  tempNode6 = simplifyTreeErrorfree(tempNode5);
	  if ((accessThruMemRef(tempNode6)->nodeType == CONSTANT) &&
	      mpfr_number_p(*(accessThruMemRef(tempNode6)->value))) {
	    if (evaluateFaithful(a, tempNode4, *(accessThruMemRef(tempNode6)->value), tools_precision)) {
	      floatingPointEvaluationAlreadyDone = 1;
	    }
	  }
	  freeThing(tempNode6);
	}
	freeThing(tempNode2);
	freeThing(tempNode3);
	freeThing(tempNode4);
	freeThing(tempNode5);
      }
      if (floatingPointEvaluationAlreadyDone || evaluateThingToConstant(a, tempNode, NULL,1,0))  {
	freeThing(tempNode);
	tempNode = makeConstant(a);
      }
      mpfr_clear(a);
    }
    if (!assignThingToTable(tree->string, tempNode)) {
      printMessage(1,SOLLYA_MSG_ASSIGNMENT_WILL_HAVE_NO_EFFECT,"Warning: the last assignment will have no effect.\n");
      considerDyingOnError();
    }
    freeThing(tempNode);
    break;
  case ASSIGNMENTININDEXING:
    curr = tree->arguments;
    if ((accessThruMemRef((node *) (curr->value)))->nodeType == TABLEACCESS) {
      if ((tempNode = getThingFromTable((accessThruMemRef((node *) (curr->value)))->string, 1, NULL)) != NULL) {
	if (isPureList(tempNode) || isPureFinalEllipticList(tempNode)) {
	  curr = tree->arguments;
	  curr = curr->next;
	  if (evaluateThingToInteger(&resB, accessThruMemRef((node *) (curr->value)), NULL)) {
	    resC = 0;
	    if (resB >= 0) {
	      curr = curr->next;
	      tempNode2 = evaluateThing(accessThruMemRef((node *) (curr->value)));
	      if (resB == lengthChain(accessThruMemRef(tempNode)->arguments)) {
		tempList = addElement(copyChain(accessThruMemRef(tempNode)->arguments,copyThingOnVoid),copyThing(tempNode2));
		tempList2 = copyChain(tempList,copyThingOnVoid);
		freeChain(tempList,freeThingOnVoid);
		tempNode3 = makeList(tempList2);
		tempNode3->nodeType = accessThruMemRef(tempNode)->nodeType;
		setupRandomAccessOnLists(tempNode3);
		resC = 1;
	      } else {
		if (resB < lengthChain(accessThruMemRef(tempNode)->arguments)) {
		  tempNode3 = makeList(copyChainAndReplaceNth(accessThruMemRef(tempNode)->arguments, resB, tempNode2, copyThingOnVoid));
		  tempNode3->nodeType = accessThruMemRef(tempNode)->nodeType;
		  setupRandomAccessOnLists(tempNode3);
		  resC = 1;
		} else {
		  if (isFinalEllipticList(tempNode)) {
		    resE = 0;
		    if (isPureTree((node *) accessInList(accessThruMemRef(tempNode)->arguments,
							 lengthChain(accessThruMemRef(tempNode)->arguments) - 1))) {
		      mpfr_init2(a, tools_precision);
		      if (evaluateThingToConstant(a,
						  (node *) accessInList(accessThruMemRef(tempNode)->arguments,
									lengthChain(accessThruMemRef(tempNode)->arguments) - 1),
						  NULL,0,0)) {
			if (mpfr_integer_p(a)) {
			  resD = mpfr_get_si(a, GMP_RNDN);
			  mpfr_init2(b, 8 * sizeof(resD) + 5);
			  mpfr_set_si(b, resD, GMP_RNDN);
			  if (mpfr_cmp(a, b) == 0) {
			    tempList = copyChain(accessThruMemRef(tempNode)->arguments,copyThingOnVoid);
			    for (i=lengthChain(accessThruMemRef(tempNode)->arguments);i<resB;i++) {
			      resD++;
			      mpfr_set_si(b, resD, GMP_RNDN);
			      tempList = addElement(tempList,makeConstant(b));
			    }
			    tempList = addElement(tempList, copyThing(tempNode2));
			    resD += 2;
			    mpfr_set_si(b, resD, GMP_RNDN);
			    tempList = addElement(tempList,makeConstant(b));
			    tempList2 = copyChain(tempList,copyThingOnVoid);
			    freeChain(tempList,freeThingOnVoid);
			    tempNode3 = makeList(tempList2);
			    tempNode3->nodeType = accessThruMemRef(tempNode)->nodeType;
			    setupRandomAccessOnLists(tempNode3);
			    resC = 1;
			  } else {
			    resE = 1;
			  }
			  mpfr_clear(b);
			} else {
			  resE = 1;
			}
		      } else {
			resE = 1;
		      }
		      mpfr_clear(a);
		    } else {
		      resE = 1;
		    }
		    if (resE) {
		      tempNode4 = (node *) accessInList(accessThruMemRef(tempNode)->arguments, lengthChain(accessThruMemRef(tempNode)->arguments) - 1);
		      tempList = copyChain(accessThruMemRef(tempNode)->arguments,copyThingOnVoid);
		      for (i=lengthChain(accessThruMemRef(tempNode)->arguments);i<resB;i++) {
			tempList = addElement(tempList,copyThing(tempNode4));
		      }
		      tempList = addElement(tempList, copyThing(tempNode2));
		      tempList = addElement(tempList,copyThing(tempNode4));
		      tempList2 = copyChain(tempList,copyThingOnVoid);
		      freeChain(tempList,freeThingOnVoid);
		      tempNode3 = makeList(tempList2);
		      tempNode3->nodeType = accessThruMemRef(tempNode)->nodeType;
		      setupRandomAccessOnLists(tempNode3);
		      resC = 1;
		    }
		  }
		}
	      }
	      freeThing(tempNode2);
	      if (resC) {
		curr = tree->arguments;
		if (!assignThingToTable(accessThruMemRef((node *) (curr->value))->string, tempNode3)) {
		  printMessage(1,SOLLYA_MSG_ASSIGNMENT_WILL_HAVE_NO_EFFECT,"Warning: the last assignment will have no effect.\n");
                  considerDyingOnError();
		}
		freeThing(tempNode3);
	      } else {
		printMessage(1,SOLLYA_MSG_ASSIGNMENT_OF_INDEXED_ELEMENTS_NOT_IN_RANGE,"Warning: assigning to indexed elements of lists is only allowed on indexes in the existing range.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                considerDyingOnError();
	      }
	    } else {
	      printMessage(1,SOLLYA_MSG_ASSIGNMENT_OF_INDEXED_ELEMENTS_NOT_IN_RANGE,"Warning: assigning to indexed elements of lists is only allowed on indexes in the existing range.\n");
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
              considerDyingOnError();
	    }
	  } else {
	    printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
	    printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
            considerDyingOnError();
	  }
	} else {
	  if (isEmptyList(tempNode)) {
	    curr = tree->arguments;
	    curr = curr->next;
	    if (evaluateThingToInteger(&resB, (node *) (curr->value), NULL)) {
	      if (resB == 0) {
		curr = curr->next;
		tempNode2 = evaluateThing((node *) (curr->value));
		tempNode3 = makeList(addElement(NULL,tempNode2));
		curr = tree->arguments;
		if (!assignThingToTable(accessThruMemRef((node *) (curr->value))->string, tempNode3)) {
		  printMessage(1,SOLLYA_MSG_ASSIGNMENT_WILL_HAVE_NO_EFFECT,"Warning: the last assignment will have no effect.\n");
                  considerDyingOnError();
		}
		freeThing(tempNode3);
	      } else {
		printMessage(1,SOLLYA_MSG_ASSIGNMENT_OF_INDEXED_EMPTY_LIST_ONLY_ON_ZERO,"Warning: assigning to indexed elements of empty lists is only allowed on index 0.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                considerDyingOnError();
	      }
	    } else {
	      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
              considerDyingOnError();
	    }
	  } else {
	    if (isString(tempNode)) {
	      curr = tree->arguments;
	      curr = curr->next;
	      if (evaluateThingToInteger(&resB, (node *) (curr->value), NULL)) {
		if ((resB >= 0) && (resB <= (int)strlen(accessThruMemRef(tempNode)->string))) {
		  curr = curr->next;
		  if (evaluateThingToString(&tempString,(node *) (curr->value))) {
		    if (strlen(tempString) == 1) {
		      if (resB == (int)strlen(accessThruMemRef(tempNode)->string)) {
			tempString2 = (char *) safeCalloc(resB + 2,sizeof(char));
			strcpy(tempString2,accessThruMemRef(tempNode)->string);
			tempString2[resB] = tempString[0];
			tempNode3 = makeString(tempString2);
			safeFree(tempString2);
		      } else {
			tempNode3 = makeString(accessThruMemRef(tempNode)->string);
			(accessThruMemRef(tempNode3)->string)[resB] = tempString[0];
		      }
		      curr = tree->arguments;
		      if (!assignThingToTable(accessThruMemRef((node *) (curr->value))->string, tempNode3)) {
			printMessage(1,SOLLYA_MSG_ASSIGNMENT_WILL_HAVE_NO_EFFECT,"Warning: the last assignment will have no effect.\n");
                        considerDyingOnError();
		      }
		      freeThing(tempNode3);
		    } else {
		      printMessage(1,SOLLYA_MSG_STRING_NOT_OF_LENGTH_ONE,"Warning: the string to be assigned is not of length 1.\n");
		      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                      considerDyingOnError();
		    }
		    safeFree(tempString);
		  } else {
		    printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the expression given does not evaluate to a string.\n");
		    printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                    considerDyingOnError();
		  }
		} else {
		  printMessage(1,SOLLYA_MSG_ASSIGNMENT_OF_INDEXED_ELEMENTS_NOT_IN_RANGE,"Warning: assigning to indexed elements of strings is only allowed in the existing range.\n");
		  printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                  considerDyingOnError();
		}
	      } else {
		printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                considerDyingOnError();
	      }
	    } else {
	      curr = tree->arguments;
	      printMessage(1,SOLLYA_MSG_IDENTIFIER_NOT_BOUND_TO_LIST_OR_STRING,"Warning: the identifier \"%s\" is not assigned to a (empty) list or a string.\n",
			   (accessThruMemRef((node *) (curr->value)))->string);
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
              considerDyingOnError();
	    }
	  }
	}
	freeThing(tempNode);
      } else {
	curr = tree->arguments;
	printMessage(1,SOLLYA_MSG_IDENTIFIER_NOT_ASSIGNED_TO,"Warning: the identifier \"%s\" is not assigned to.\n",(accessThruMemRef((node *) (curr->value)))->string);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
        considerDyingOnError();
      }
    } else {
      printMessage(1,SOLLYA_MSG_FIRST_ELMENT_OF_LEFT_SIDE_NOT_IDENTIFIER,"Warning: the first element of the left-hand side is not an identifier.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case FLOATASSIGNMENTININDEXING:
    curr = tree->arguments;
    if ((accessThruMemRef((node *) (curr->value)))->nodeType == TABLEACCESS) {
      if ((tempNode = getThingFromTable((accessThruMemRef((node *) (curr->value)))->string, 1, NULL)) != NULL) {
	if (isPureList(tempNode) || isPureFinalEllipticList(tempNode)) {
	  curr = tree->arguments;
	  curr = curr->next;
	  if (evaluateThingToInteger(&resB, (node *) (curr->value), NULL)) {
	    resC = 0;
	    if (resB >= 0) {
	      curr = curr->next;
	      tempNode2 = evaluateThing((node *) (curr->value));
	      if (isPureTree(tempNode2) && isConstant(tempNode2)) {
		mpfr_init2(a, tools_precision);
		floatingPointEvaluationAlreadyDone = 0;
		if (isPureTree(tempNode2) &&
		    isConstant(tempNode2) &&
		    (((accessThruMemRef((node *) (curr->value)))->nodeType == TABLEACCESSWITHSUBSTITUTE) ||
		     ((accessThruMemRef((node *) (curr->value)))->nodeType == APPLY)) &&
		    (lengthChain((accessThruMemRef((node *) (curr->value)))->arguments) == 1)) {
		  if ((accessThruMemRef((node *) (curr->value)))->nodeType == APPLY) {
		    tempNode7 = copyThing((accessThruMemRef((node *) (curr->value)))->child1);
		    tempNode3 = copyThing(accessThruMemRef((node *) (((accessThruMemRef((node *) (curr->value)))->arguments)->value)));
		  } else {
		    tempNode7 = makeTableAccess((accessThruMemRef((node *) (curr->value)))->string);
		    tempNode3 = copyThing(accessThruMemRef((node *) (((accessThruMemRef((node *) (curr->value)))->arguments)->value)));
		  }
		  tempNode4 = evaluateThing(tempNode7);
		  tempNode5 = evaluateThing(tempNode3);
		  if (isPureTree(tempNode4) &&
		      isPureTree(tempNode5) &&
		      (!isConstant(tempNode4)) &&
		      isConstant(tempNode5)) {
		    tempNode6 = simplifyTreeErrorfree(tempNode5);
		    if ((accessThruMemRef(tempNode6)->nodeType == CONSTANT) &&
			mpfr_number_p(*(accessThruMemRef(tempNode6)->value))) {
		      if (evaluateFaithful(a, tempNode4, *(accessThruMemRef(tempNode6)->value), tools_precision)) {
			floatingPointEvaluationAlreadyDone = 1;
		      }
		    }
		    freeThing(tempNode6);
		  }
		  freeThing(tempNode7);
		  freeThing(tempNode3);
		  freeThing(tempNode4);
		  freeThing(tempNode5);
		}
		if (floatingPointEvaluationAlreadyDone || evaluateThingToConstant(a, tempNode2, NULL,1,0))  {
		  freeThing(tempNode2);
		  tempNode2 = makeConstant(a);
		}
		mpfr_clear(a);
	      }
	      if (resB == lengthChain(accessThruMemRef(tempNode)->arguments)) {
		tempList = addElement(copyChain(accessThruMemRef(tempNode)->arguments,copyThingOnVoid),copyThing(tempNode2));
		tempList2 = copyChain(tempList,copyThingOnVoid);
		freeChain(tempList,freeThingOnVoid);
		tempNode3 = makeList(tempList2);
		tempNode3->nodeType = accessThruMemRef(tempNode)->nodeType;
		setupRandomAccessOnLists(tempNode3);
		resC = 1;
	      } else {
		if (resB < lengthChain(accessThruMemRef(tempNode)->arguments)) {
		  tempNode3 = makeList(copyChainAndReplaceNth(accessThruMemRef(tempNode)->arguments, resB, tempNode2, copyThingOnVoid));
		  tempNode3->nodeType = accessThruMemRef(tempNode)->nodeType;
		  setupRandomAccessOnLists(tempNode3);
		  resC = 1;
		} else {
		  if (isFinalEllipticList(tempNode)) {
		    resE = 0;
		    if (isPureTree((node *) accessInList(accessThruMemRef(tempNode)->arguments,
							 lengthChain(accessThruMemRef(tempNode)->arguments) - 1))) {
		      mpfr_init2(a, tools_precision);
		      if (evaluateThingToConstant(a,
						  (node *) accessInList(accessThruMemRef(tempNode)->arguments,
									lengthChain(accessThruMemRef(tempNode)->arguments) - 1),
						  NULL,0,0)) {
			if (mpfr_integer_p(a)) {
			  resD = mpfr_get_si(a, GMP_RNDN);
			  mpfr_init2(b, 8 * sizeof(resD) + 5);
			  mpfr_set_si(b, resD, GMP_RNDN);
			  if (mpfr_cmp(a, b) == 0) {
			    tempList = copyChain(accessThruMemRef(tempNode)->arguments,copyThingOnVoid);
			    for (i=lengthChain(accessThruMemRef(tempNode)->arguments);i<resB;i++) {
			      resD++;
			      mpfr_set_si(b, resD, GMP_RNDN);
			      tempList = addElement(tempList,makeConstant(b));
			    }
			    tempList = addElement(tempList, copyThing(tempNode2));
			    resD += 2;
			    mpfr_set_si(b, resD, GMP_RNDN);
			    tempList = addElement(tempList,makeConstant(b));
			    tempList2 = copyChain(tempList,copyThingOnVoid);
			    freeChain(tempList,freeThingOnVoid);
			    tempNode3 = makeList(tempList2);
			    tempNode3->nodeType = accessThruMemRef(tempNode)->nodeType;
			    setupRandomAccessOnLists(tempNode3);
			    resC = 1;
			  } else {
			    resE = 1;
			  }
			  mpfr_clear(b);
			} else {
			  resE = 1;
			}
		      } else {
			resE = 1;
		      }
		      mpfr_clear(a);
		    } else {
		      resE = 1;
		    }
		    if (resE) {
		      tempNode4 = (node *) accessInList(accessThruMemRef(tempNode)->arguments, lengthChain(accessThruMemRef(tempNode)->arguments) - 1);
		      tempList = copyChain(accessThruMemRef(tempNode)->arguments,copyThingOnVoid);
		      for (i=lengthChain(accessThruMemRef(tempNode)->arguments);i<resB;i++) {
			tempList = addElement(tempList,copyThing(tempNode4));
		      }
		      tempList = addElement(tempList, copyThing(tempNode2));
		      tempList = addElement(tempList,copyThing(tempNode4));
		      tempList2 = copyChain(tempList,copyThingOnVoid);
		      freeChain(tempList,freeThingOnVoid);
		      tempNode3 = makeList(tempList2);
		      tempNode3->nodeType = accessThruMemRef(tempNode)->nodeType;
		      setupRandomAccessOnLists(tempNode3);
		      resC = 1;
		    }
		  }
		}
	      }
	      freeThing(tempNode2);
	      if (resC) {
		curr = tree->arguments;
		if (isPureTree(tempNode3) && isConstant(tempNode3)) {
		  mpfr_init2(a, tools_precision);
		  if (evaluateThingToConstant(a, tempNode3, NULL, 1,0))  {
		    freeThing(tempNode3);
		    tempNode3 = makeConstant(a);
		  }
		  mpfr_clear(a);
		}
		if (!assignThingToTable((accessThruMemRef((node *) (curr->value)))->string, tempNode3)) {
		  printMessage(1,SOLLYA_MSG_ASSIGNMENT_WILL_HAVE_NO_EFFECT,"Warning: the last assignment will have no effect.\n");
                  considerDyingOnError();
		}
		freeThing(tempNode3);
	      } else {
		printMessage(1,SOLLYA_MSG_ASSIGNMENT_OF_INDEXED_ELEMENTS_NOT_IN_RANGE,"Warning: assigning to indexed elements of lists is only allowed on indexes in the existing range.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                considerDyingOnError();
	      }
	    } else {
	      printMessage(1,SOLLYA_MSG_ASSIGNMENT_OF_INDEXED_ELEMENTS_NOT_IN_RANGE,"Warning: assigning to indexed elements of lists is only allowed on indexes in the existing range.\n");
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
              considerDyingOnError();
	    }
	  } else {
	    printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
	    printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
            considerDyingOnError();
	  }
	} else {
	  if (isEmptyList(tempNode)) {
	    curr = tree->arguments;
	    curr = curr->next;
	    if (evaluateThingToInteger(&resB, (node *) (curr->value), NULL)) {
	      if (resB == 0) {
		curr = curr->next;
		tempNode2 = evaluateThing((node *) (curr->value));
		if (isPureTree(tempNode2) && isConstant(tempNode2)) {
		  mpfr_init2(a, tools_precision);
		  floatingPointEvaluationAlreadyDone = 0;
		  if (isPureTree(tempNode2) &&
		      isConstant(tempNode2) &&
		      (((accessThruMemRef((node *) (curr->value)))->nodeType == TABLEACCESSWITHSUBSTITUTE) ||
		       ((accessThruMemRef((node *) (curr->value)))->nodeType == APPLY)) &&
		      (lengthChain((accessThruMemRef((node *) (curr->value)))->arguments) == 1)) {
		    if ((accessThruMemRef((node *) (curr->value)))->nodeType == APPLY) {
		      tempNode7 = copyThing((accessThruMemRef((node *) (curr->value)))->child1);
		      tempNode3 = copyThing(accessThruMemRef((node *) (((accessThruMemRef((node *) (curr->value)))->arguments)->value)));
		    } else {
		      tempNode7 = makeTableAccess((accessThruMemRef((node *) (curr->value)))->string);
		      tempNode3 = copyThing(accessThruMemRef((node *) (((accessThruMemRef((node *) (curr->value)))->arguments)->value)));
		    }
		    tempNode4 = evaluateThing(tempNode7);
		    tempNode5 = evaluateThing(tempNode3);
		    if (isPureTree(tempNode4) &&
			isPureTree(tempNode5) &&
			(!isConstant(tempNode4)) &&
			isConstant(tempNode5)) {
		      tempNode6 = simplifyTreeErrorfree(tempNode5);
		      if ((accessThruMemRef(tempNode6)->nodeType == CONSTANT) &&
			  mpfr_number_p(*(accessThruMemRef(tempNode6)->value))) {
			if (evaluateFaithful(a, tempNode4, *(accessThruMemRef(tempNode6)->value), tools_precision)) {
			  floatingPointEvaluationAlreadyDone = 1;
			}
		      }
		      freeThing(tempNode6);
		    }
		    freeThing(tempNode7);
		    freeThing(tempNode3);
		    freeThing(tempNode4);
		    freeThing(tempNode5);
		  }
		  if (floatingPointEvaluationAlreadyDone || evaluateThingToConstant(a, tempNode2, NULL, 1,0))  {
		    freeThing(tempNode2);
		    tempNode2 = makeConstant(a);
		  }
		  mpfr_clear(a);
		}
		tempNode3 = makeList(addElement(NULL,tempNode2));
		setupRandomAccessOnLists(tempNode3);
		curr = tree->arguments;
		if (isPureTree(tempNode3) && isConstant(tempNode3)) {
		  mpfr_init2(a, tools_precision);
		  if (evaluateThingToConstant(a, tempNode3, NULL, 1,0))  {
		    freeThing(tempNode3);
		    tempNode3 = makeConstant(a);
		  }
		  mpfr_clear(a);
		}
		if (!assignThingToTable((accessThruMemRef((node *) (curr->value)))->string, tempNode3)) {
		  printMessage(1,SOLLYA_MSG_ASSIGNMENT_WILL_HAVE_NO_EFFECT,"Warning: the last assignment will have no effect.\n");
                  considerDyingOnError();
		}
		freeThing(tempNode3);
	      } else {
		printMessage(1,SOLLYA_MSG_ASSIGNMENT_OF_INDEXED_EMPTY_LIST_ONLY_ON_ZERO,"Warning: assigning to indexed elements of empty lists is only allowed on index 0.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                considerDyingOnError();
	      }
	    } else {
	      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
              considerDyingOnError();
	    }
	  } else {
	    if (isString(tempNode)) {
	      curr = tree->arguments;
	      curr = curr->next;
	      if (evaluateThingToInteger(&resB, (node *) (curr->value), NULL)) {
		if ((resB >= 0) && (resB <= (int)strlen(accessThruMemRef(tempNode)->string))) {
		  curr = curr->next;
		  if (evaluateThingToString(&tempString,accessThruMemRef((node *) (curr->value)))) {
		    if (strlen(tempString) == 1) {
		      if (resB == (int)strlen(accessThruMemRef(tempNode)->string)) {
			tempString2 = (char *) safeCalloc(resB + 2,sizeof(char));
			strcpy(tempString2,accessThruMemRef(tempNode)->string);
			tempString2[resB] = tempString[0];
			tempNode3 = makeString(tempString2);
			safeFree(tempString2);
		      } else {
			tempNode3 = makeString(accessThruMemRef(tempNode)->string);
			(accessThruMemRef(tempNode3)->string)[resB] = tempString[0];
		      }
		      curr = tree->arguments;
		      if (isPureTree(tempNode3) && isConstant(tempNode3)) {
			mpfr_init2(a, tools_precision);
			if (evaluateThingToConstant(a, tempNode3, NULL, 1,0))  {
			  freeThing(tempNode3);
			  tempNode3 = makeConstant(a);
			}
			mpfr_clear(a);
		      }
		      if (!assignThingToTable(((node *) (curr->value))->string, tempNode3)) {
			printMessage(1,SOLLYA_MSG_ASSIGNMENT_WILL_HAVE_NO_EFFECT,"Warning: the last assignment will have no effect.\n");
                        considerDyingOnError();
		      }
		      freeThing(tempNode3);
		    } else {
		      printMessage(1,SOLLYA_MSG_STRING_NOT_OF_LENGTH_ONE,"Warning: the string to be assigned is not of length 1.\n");
		      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                      considerDyingOnError();
		    }
		    safeFree(tempString);
		  } else {
		    printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the expression given does not evaluate to a string.\n");
		    printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                    considerDyingOnError();
		  }
		} else {
		  printMessage(1,SOLLYA_MSG_ASSIGNMENT_OF_INDEXED_ELEMENTS_NOT_IN_RANGE,"Warning: assigning to indexed elements of strings is only allowed in the existing range.\n");
		  printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                  considerDyingOnError();
		}
	      } else {
		printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
		printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                considerDyingOnError();
	      }
	    } else {
	      curr = tree->arguments;
	      printMessage(1,SOLLYA_MSG_IDENTIFIER_NOT_BOUND_TO_LIST_OR_STRING,"Warning: the identifier \"%s\" is not assigned to a (empty) list or a string.\n",
			   ((node *) (curr->value))->string);
	      printMessage(1,SOLLYA_MSG_CONTINUATION,"The command will not be executed.\n");
              considerDyingOnError();
	    }
	  }
	}
	freeThing(tempNode);
      } else {
	curr = tree->arguments;
	printMessage(1,SOLLYA_MSG_IDENTIFIER_NOT_ASSIGNED_TO,"Warning: the identifier \"%s\" is not assigned to.\n",((node *) (curr->value))->string);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
        considerDyingOnError();
      }
    } else {
      printMessage(1,SOLLYA_MSG_FIRST_ELMENT_OF_LEFT_SIDE_NOT_IDENTIFIER,"Warning: the first element of the left-hand side is not an identifier.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case ASSIGNMENTINSTRUCTURE:
    tempNode = evaluateThing(tree->child1);
    tempNode2 = getThingFromTable((char *) (tree->arguments->value), 1, NULL);
    tempNode3 = recomputeLeftHandSideForAssignmentInStructure(tempNode2, tempNode, tree->arguments->next);
    if (tempNode3 != NULL) {
      if (!assignThingToTable((char *) (tree->arguments->value), tempNode3)) {
	freeThing(tempNode);
	if (tempNode2 != NULL) freeThing(tempNode2);
	freeThing(tempNode3);
	printMessage(1,SOLLYA_MSG_ASSIGNMENT_WILL_HAVE_NO_EFFECT,"Warning: the last assignment will have no effect.\n");
	considerDyingOnError();
      } else {
	freeThing(tempNode);
	if (tempNode2 != NULL) freeThing(tempNode2);
	freeThing(tempNode3);
      }
    } else {
      freeThing(tempNode);
      if (tempNode2 != NULL) freeThing(tempNode2);
      printMessage(1,SOLLYA_MSG_ASSIGNMENT_WILL_HAVE_NO_EFFECT,"Warning: the last assignment will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case FLOATASSIGNMENTINSTRUCTURE:
    tempNode = evaluateThing(tree->child1);
    if (isPureTree(tempNode) && isConstant(tempNode)) {
      mpfr_init2(a, tools_precision);
      floatingPointEvaluationAlreadyDone = 0;
      if (isPureTree(tempNode) &&
	  isConstant(tempNode) &&
	  ((accessThruMemRef(tree->child1)->nodeType == TABLEACCESSWITHSUBSTITUTE) ||
	   (accessThruMemRef(tree->child1)->nodeType == APPLY)) &&
	  (lengthChain(accessThruMemRef(tree->child1)->arguments) == 1)) {
	if (accessThruMemRef(tree->child1)->nodeType == APPLY) {
	  tempNode2 = copyThing(accessThruMemRef(tree->child1)->child1);
	  tempNode3 = copyThing(accessThruMemRef((node *) ((accessThruMemRef(tree->child1)->arguments)->value)));
	} else {
	  tempNode2 = makeTableAccess(accessThruMemRef(tree->child1)->string);
	  tempNode3 = copyThing(accessThruMemRef((node *) ((accessThruMemRef(tree->child1)->arguments)->value)));
	}
	tempNode4 = evaluateThing(tempNode2);
	tempNode5 = evaluateThing(tempNode3);
	if (isPureTree(tempNode4) &&
	    isPureTree(tempNode5) &&
	    (!isConstant(tempNode4)) &&
	    isConstant(tempNode5)) {
	  tempNode6 = simplifyTreeErrorfree(tempNode5);
	  if ((accessThruMemRef(tempNode6)->nodeType == CONSTANT) &&
	      mpfr_number_p(*(accessThruMemRef(tempNode6)->value))) {
	    if (evaluateFaithful(a, tempNode4, *(accessThruMemRef(tempNode6)->value), tools_precision)) {
	      floatingPointEvaluationAlreadyDone = 1;
	    }
	  }
	  freeThing(tempNode6);
	}
	freeThing(tempNode2);
	freeThing(tempNode3);
	freeThing(tempNode4);
	freeThing(tempNode5);
      }
      if (floatingPointEvaluationAlreadyDone || evaluateThingToConstant(a, tempNode, NULL,1,0))  {
	freeThing(tempNode);
	tempNode = makeConstant(a);
      }
      mpfr_clear(a);
    }
    tempNode2 = getThingFromTable((char *) (tree->arguments->value), 1, NULL);
    tempNode3 = recomputeLeftHandSideForAssignmentInStructure(tempNode2, tempNode, tree->arguments->next);
    if (tempNode3 != NULL) {
      if (!assignThingToTable((char *) (tree->arguments->value), tempNode3)) {
	freeThing(tempNode);
	if (tempNode2 != NULL) freeThing(tempNode2);
	freeThing(tempNode3);
	printMessage(1,SOLLYA_MSG_ASSIGNMENT_WILL_HAVE_NO_EFFECT,"Warning: the last assignment will have no effect.\n");
	considerDyingOnError();
      } else {
	freeThing(tempNode);
	if (tempNode2 != NULL) freeThing(tempNode2);
	freeThing(tempNode3);
      }
    } else {
      freeThing(tempNode);
      if (tempNode2 != NULL) freeThing(tempNode2);
      printMessage(1,SOLLYA_MSG_ASSIGNMENT_WILL_HAVE_NO_EFFECT,"Warning: the last assignment will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case PROTOASSIGNMENTINSTRUCTURE:
    if (tryToRewriteLeftHandStructAccess(&tempChain,tree->child1)) {
      tempNode = makeAssignmentInStructure(tempChain,copyThing(tree->child2));
      res = executeCommand(tempNode);
      if (res) result = 1;
      freeThing(tempNode);
    } else {
      printMessage(1,SOLLYA_MSG_LEFT_HAND_SIDE_NOT_ELEMENT_OF_STRUCTURED_TYPE,"Warning: the left-hand side is not an access to an element of a structured type.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case PROTOFLOATASSIGNMENTINSTRUCTURE:
    if (tryToRewriteLeftHandStructAccess(&tempChain,tree->child1)) {
      tempNode = makeFloatAssignmentInStructure(tempChain,copyThing(tree->child2));
      res = executeCommand(tempNode);
      if (res) result = 1;
      freeThing(tempNode);
    } else {
      printMessage(1,SOLLYA_MSG_LEFT_HAND_SIDE_NOT_ELEMENT_OF_STRUCTURED_TYPE,"Warning: the left-hand side is not an access to an element of a structured type.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case LIBRARYBINDING:
    if ((variablename != NULL) && (strcmp(variablename,tree->string) == 0)) {
      printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_FREE_VAR_CANNOT_BE_LIBRARY,"Warning: the identifier \"%s\" is already be bound as the current free variable.\n",variablename);
      printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to a library function. This command will have no effect.\n");
      considerDyingOnError();
    } else {
      if (containsEntry(symbolTable, tree->string) || containsDeclaredEntry(declaredSymbolTable, tree->string)) {
	printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_BOUND_TO_VAR_CANNOT_BE_LIBRARY,"Warning: the identifier \"%s\" is already assigned to.\n",tree->string);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to a library function. This command will have no effect.\n");
        considerDyingOnError();
      } else {
	if (getProcedure(tree->string) != NULL) {
	  printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_EXTERNAL_PROC_CANNOT_BE_LIBRARY,"Warning: the identifier \"%s\" is already bound to an external procedure.\n",tree->string);
	  printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to a library function. This command will have no effect.\n");
          considerDyingOnError();
	} else {
	  if (getFunction(tree->string) != NULL) {
	    printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_LIBRARY_FUNC_CANNOT_BE_LIBRARY,"Warning: the identifier \"%s\" is already bound to a library function.\n",tree->string);
	    printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to a library function. This command will have no effect.\n");
            considerDyingOnError();
	  } else {
            if (getConstantFunction(tree->string) != NULL) {
              printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_LIBRARY_CONST_CANNOT_BE_LIBRARY,"Warning: the identifier \"%s\" is already bound to a library constant.\n",tree->string);
              printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to a library function. This command will have no effect.\n");
              considerDyingOnError();
            } else {
              if (evaluateThingToString(&tempString, tree->child1)) {
                tempLibraryFunction = bindFunction(tempString, tree->string);
                if(tempLibraryFunction == NULL) {
                  printMessage(1,SOLLYA_MSG_ERROR_OCCURRED_COMMAND_NOT_EXECUTED,"Warning: an error occurred. The last command will have no effect.\n");
                  considerDyingOnError();
                }
                safeFree(tempString);
              } else {
                printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the expression given does not evaluate to a string.\n");
                printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                considerDyingOnError();
              }
            }
	  }
	}
      }
    }
    break;
  case LIBRARYCONSTANTBINDING:
    if ((variablename != NULL) && (strcmp(variablename,tree->string) == 0)) {
      printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_FREE_VAR_CANNOT_BE_LIBRARY,"Warning: the identifier \"%s\" is already bound as the current free variable.\n",variablename);
      printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to a library constant. This command will have no effect.\n");
      considerDyingOnError();
    } else {
      if (containsEntry(symbolTable, tree->string) || containsDeclaredEntry(declaredSymbolTable, tree->string)) {
	printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_BOUND_TO_VAR_CANNOT_BE_LIBRARY,"Warning: the identifier \"%s\" is already assigned to.\n",tree->string);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to a library constant. This command will have no effect.\n");
        considerDyingOnError();
      } else {
	if (getProcedure(tree->string) != NULL) {
	  printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_EXTERNAL_PROC_CANNOT_BE_LIBRARY,"Warning: the identifier \"%s\" is already bound to an external procedure.\n",tree->string);
	  printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to a library constant. This command will have no effect.\n");
          considerDyingOnError();
	} else {
	  if (getFunction(tree->string) != NULL) {
	    printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_LIBRARY_FUNC_CANNOT_BE_LIBRARY,"Warning: the identifier \"%s\" is already bound to a library function.\n",tree->string);
	    printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to a library constant. This command will have no effect.\n");
            considerDyingOnError();
	  } else {
            if (getConstantFunction(tree->string) != NULL) {
              printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_LIBRARY_CONST_CANNOT_BE_LIBRARY,"Warning: the identifier \"%s\" is already bound to a library constant.\n",tree->string);
              printMessage(1,SOLLYA_MSG_CONTINUATION,"It cannot be bound to a library constant. This command will have no effect.\n");
              considerDyingOnError();
            } else {

              if (evaluateThingToString(&tempString, tree->child1)) {
                tempLibraryFunction = bindConstantFunction(tempString, tree->string);
                if(tempLibraryFunction == NULL) {
                  printMessage(1,SOLLYA_MSG_ERROR_OCCURRED_COMMAND_NOT_EXECUTED,"Warning: an error occurred. The last command will have no effect.\n");
                  considerDyingOnError();
                }
                safeFree(tempString);
              } else {
                printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_STRING,"Warning: the expression given does not evaluate to a string.\n");
                printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
                considerDyingOnError();
              }
            }
	  }
	}
      }
    }
    break;
  case PRECASSIGN:
    defaultVal = DEFAULTPRECISION;
    if (evaluateThingToInteger(&resA, tree->child1, &defaultVal)) {
      if (resA < 12) {
	resA = 12;
	printMessage(1,SOLLYA_MSG_PREC_MUST_BE_AT_LEAST_TWELVE_BITS,"Warning: the precision of the tool must be at least 12 bits.\n");
      }
      defaultprecision = resA;
      tools_precision = resA;
      outputMode();
      sollyaPrintf("The precision has been set to %d bits.\n",resA);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case POINTSASSIGN:
    defaultVal = DEFAULTPOINTS;
    if (evaluateThingToInteger(&resA, tree->child1, &defaultVal)) {
      if (resA < 3) {
	resA = 3;
	printMessage(1,SOLLYA_MSG_POINTS_MUST_BE_AT_LEAST_THREE_POINTS,"Warning: the number of points must be at least 3 points.\n");
      }
      defaultpoints = resA;
      outputMode();
      sollyaPrintf("The number of points has been set to %d.\n",resA);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case DIAMASSIGN:
    mpfr_init2(a,tools_precision);
    mpfr_init2(b,tools_precision);
    mpfr_set_d(b,DEFAULTDIAM,GMP_RNDN);
    if (evaluateThingToConstant(a, tree->child1, &b, 0,0)) {
      mpfr_clear(statediam);
      mpfr_init2(statediam,mpfr_get_prec(a));
      mpfr_set(statediam,a,GMP_RNDN);
      outputMode();
      sollyaPrintf("The diameter has been set to ");
      printMpfr(a);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_CONSTANT,"Warning: the expression given does not evaluate to a constant.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    mpfr_clear(a);
    mpfr_clear(b);
    break;
  case DISPLAYASSIGN:
    resB = 0;
    if (evaluateThingToDisplayMode(&resA, tree->child1, &resB)) {
      dyadic = resA;
      outputMode();
      switch (dyadic) {
      case 0:
	sollyaPrintf("Display mode is decimal numbers.\n");
	break;
      case 1:
	sollyaPrintf("Display mode is dyadic numbers.\n");
	break;
      case 2:
	sollyaPrintf("Display mode is dyadic numbers in integer-power-of-2 notation.\n");
	break;
      case 3:
	sollyaPrintf("Display mode is binary numbers.\n");
	break;
      case 4:
	sollyaPrintf("Display mode is hexadecimal numbers.\n");
	break;
      default:
	sollyaPrintf("Display mode in unknown state.\n");
      }
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_DISPLAY_TYPE,"Warning: the expression given does not evaluate to default, dyadic, powers, hexadecimal or binary.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case VERBOSITYASSIGN:
    defaultVal = 1;
    if (evaluateThingToInteger(&resA, tree->child1, &defaultVal)) {
      if (resA < 0) {
	resA = 0;
	printMessage(1,SOLLYA_MSG_VERBOSITY_MUST_NOT_BE_NEGATIVE,"Warning: the verbosity of the tool must not be negative.\n");
      }
      verbosity = resA;
      outputMode();
      sollyaPrintf("The verbosity level has been set to %d.\n",resA);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case CANONICALASSIGN:
    defaultVal = 0;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      canonical = resA;
      outputMode();
      if (canonical)
	sollyaPrintf("Canonical automatic printing output has been activated.\n");
      else
	sollyaPrintf("Canonical automatic printing output has been deactivated.\n");
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case AUTOSIMPLIFYASSIGN:
    defaultVal = 1;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      autosimplify = resA;
      outputMode();
      if (autosimplify)
	sollyaPrintf("Automatic pure tree simplification has been activated.\n");
      else
	sollyaPrintf("Automatic pure tree simplification has been deactivated.\n");
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case SHOWMESSAGENUMBERSASSIGN:
    defaultVal = 1;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      activateMessageNumbers = resA;
      outputMode();
      if (activateMessageNumbers)
	sollyaPrintf("Displaying of message numbers has been activated.\n");
      else
	sollyaPrintf("Displaying of message numbers has been deactivated.\n");
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case TAYLORRECURSASSIGN:
    defaultVal = DEFAULTTAYLORRECURSIONS;
    if (evaluateThingToInteger(&resA, tree->child1, &defaultVal)) {
      if (resA < 0) {
	resA = 0;
	printMessage(1,SOLLYA_MSG_TAYLOR_RECURSIONS_MUST_NOT_BE_NEGATIVE,"Warning: the number of recursions for Taylor evaluation must not be negative.\n");
      }
      taylorrecursions = resA;     outputMode();
      sollyaPrintf("The number of recursions for Taylor evaluation has been set to %d.\n",resA);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case TIMINGASSIGN:
    defaultVal = 0;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      timecounting = resA;     outputMode();
      if (timecounting)
	sollyaPrintf("Timing has been activated.\n");
      else
	sollyaPrintf("Timing has been deactivated.\n");
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case FULLPARENASSIGN:
    defaultVal = 0;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      fullParentheses = resA;     outputMode();
      if (fullParentheses)
	sollyaPrintf("Full parentheses mode has been activated.\n");
      else
	sollyaPrintf("Full parentheses mode has been deactivated.\n");
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case MIDPOINTASSIGN:
    defaultVal = 1;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      midpointMode = resA;     outputMode();
      if (midpointMode)
	sollyaPrintf("Midpoint mode has been activated.\n");
      else
	sollyaPrintf("Midpoint mode has been deactivated.\n");
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case DIEONERRORMODEASSIGN:
    defaultVal = 1;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      dieOnErrorMode = resA;     outputMode();
      if (dieOnErrorMode)
	sollyaPrintf("Die-on-error mode has been activated.\n");
      else
	sollyaPrintf("Die-on-error mode has been deactivated.\n");
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case RATIONALMODEASSIGN:
    defaultVal = 0;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      rationalMode = resA;     outputMode();
      if (rationalMode)
	sollyaPrintf("Rational mode has been activated.\n");
      else
	sollyaPrintf("Rational mode has been deactivated.\n");
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case SUPPRESSWARNINGSASSIGN:
    defaultVal = eliminatePromptBackup;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      noRoundingWarnings = !resA;     outputMode();
      if (noRoundingWarnings)
	sollyaPrintf("Rounding warning mode has been deactivated.\n");
      else
	sollyaPrintf("Rounding warning mode has been activated.\n");
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case HOPITALRECURSASSIGN:
    defaultVal = DEFAULTHOPITALRECURSIONS;
    if (evaluateThingToInteger(&resA, tree->child1, &defaultVal)) {
      if (resA < 0) {
	resA = 0;
	printMessage(1,SOLLYA_MSG_HOPITAL_RECURSIONS_MUST_NOT_BE_NEGATIVE,"Warning: the number of recursions for Hopital's rule must not be negative.\n");
      }
      hopitalrecursions = resA;     outputMode();
      sollyaPrintf("The number of recursions for Hopital's rule has been set to %d.\n",resA);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case PRECSTILLASSIGN:
    defaultVal = DEFAULTPRECISION;
    if (evaluateThingToInteger(&resA, tree->child1, &defaultVal)) {
      if (resA < 12) {
	resA = 12;
	printMessage(2,SOLLYA_MSG_PREC_MUST_BE_AT_LEAST_TWELVE_BITS,"Warning: the precision of the tool must be at least 12 bits.\n");
      }
      defaultprecision = resA;
      tools_precision = resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case POINTSSTILLASSIGN:
    defaultVal = DEFAULTPOINTS;
    if (evaluateThingToInteger(&resA, tree->child1, &defaultVal)) {
      if (resA < 3) {
	resA = 3;
	printMessage(2,SOLLYA_MSG_POINTS_MUST_BE_AT_LEAST_THREE_POINTS,"Warning: the number of points must be at least 3 points.\n");
      }
      defaultpoints = resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case DIAMSTILLASSIGN:
    mpfr_init2(a,tools_precision);
    mpfr_init2(b,tools_precision);
    mpfr_set_d(b,DEFAULTDIAM,GMP_RNDN);
    if (evaluateThingToConstant(a, tree->child1, &b, 0,0)) {
      mpfr_clear(statediam);
      mpfr_init2(statediam,mpfr_get_prec(a));
      mpfr_set(statediam,a,GMP_RNDN);
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_CONSTANT,"Warning: the expression given does not evaluate to a constant.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    mpfr_clear(a);
    mpfr_clear(b);
    break;
  case DISPLAYSTILLASSIGN:
    resB = 0;
    if (evaluateThingToDisplayMode(&resA, tree->child1, &resB)) {
      dyadic = resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_DISPLAY_TYPE,"Warning: the expression given does not evaluate to default, dyadic, powers, hexadecimal or binary.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case VERBOSITYSTILLASSIGN:
    defaultVal = 1;
    if (evaluateThingToInteger(&resA, tree->child1, &defaultVal)) {
      if (resA < 0) {
	resA = 0;
	printMessage(2,SOLLYA_MSG_VERBOSITY_MUST_NOT_BE_NEGATIVE,"Warning: the verbosity of the tool must not be negative.\n");
      }
      verbosity = resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case CANONICALSTILLASSIGN:
    defaultVal = 0;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      canonical = resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case AUTOSIMPLIFYSTILLASSIGN:
    defaultVal = 1;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      autosimplify = resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case SHOWMESSAGENUMBERSSTILLASSIGN:
    defaultVal = 1;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      activateMessageNumbers = resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case TAYLORRECURSSTILLASSIGN:
    defaultVal = DEFAULTTAYLORRECURSIONS;
    if (evaluateThingToInteger(&resA, tree->child1, &defaultVal)) {
      if (resA < 0) {
	resA = 0;
	printMessage(2,SOLLYA_MSG_TAYLOR_RECURSIONS_MUST_NOT_BE_NEGATIVE,"Warning: the number of recursions for Taylor evaluation must not be negative.\n");
      }
      taylorrecursions = resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case TIMINGSTILLASSIGN:
    defaultVal = 0;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      timecounting = resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case FULLPARENSTILLASSIGN:
    defaultVal = 0;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      fullParentheses = resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case MIDPOINTSTILLASSIGN:
    defaultVal = 1;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      midpointMode = resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case DIEONERRORMODESTILLASSIGN:
    defaultVal = 1;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      dieOnErrorMode = resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case RATIONALMODESTILLASSIGN:
    defaultVal = 0;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      rationalMode = resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case SUPPRESSWARNINGSSTILLASSIGN:
    defaultVal = eliminatePromptBackup;
    if (evaluateThingToOnOff(&resA, tree->child1, &defaultVal)) {
      noRoundingWarnings = !resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_ON_OR_OFF,"Warning: the expression given does not evaluate to on or off.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  case HOPITALRECURSSTILLASSIGN:
    defaultVal = DEFAULTHOPITALRECURSIONS;
    if (evaluateThingToInteger(&resA, tree->child1, &defaultVal)) {
      if (resA < 0) {
	resA = 0;
	printMessage(2,SOLLYA_MSG_HOPITAL_RECURSIONS_MUST_NOT_BE_NEGATIVE,"Warning: the number of recursions for Hopital's rule must not be negative.\n");
      }
      hopitalrecursions = resA;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_DOES_NOT_EVALUATE_TO_MACHINE_INTEGER,"Warning: the expression given does not evaluate to a machine integer.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"This command will have no effect.\n");
      considerDyingOnError();
    }
    break;
  default:
    sollyaFprintf(stderr,"Error: executeCommand: unknown identifier (%d) in the tree\n",tree->nodeType);
    exit(1);
  }

  if (timingString != NULL) {
    popTimeCounter(timingString);
    safeFree(timingString);
  }

  return result;
}



node *makeCommandList(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = COMMANDLIST;
  res->arguments = thinglist;

  return res;

}

node *makeWhile(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = WHILE;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeIfElse(node *thing1, node *thing2, node *thing3) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = IFELSE;
  res->arguments = addElement(addElement(addElement(NULL, thing3), thing2), thing1);

  return res;

}

node *makeIf(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = IF;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeFor(char *string, node *thing1, node *thing2, node *thing3, node *thing4) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FOR;
  res->string = (char *) safeCalloc(strlen(string) + 1,sizeof(char));
  strcpy(res->string, string);
  res->arguments = addElement(addElement(addElement(addElement(NULL, thing4), thing3), thing2), thing1);

  return res;

}

node *makeForIn(char *string, node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FORIN;
  res->child1 = thing1;
  res->child2 = thing2;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);

  return res;

}

node *makeQuit() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = QUIT;

  return res;

}

node *makeNop() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = NOP;

  return res;

}

node *makeNopArg(node *thing1) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = NOPARG;
  res->child1 = thing1;

  return res;

}


node *makeFalseQuit() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FALSEQUIT;

  return res;

}

node *makeFalseRestart() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FALSERESTART;

  return res;

}


node *makeRestart() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = RESTART;

  return res;

}

node *makePrint(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PRINT;
  res->arguments = thinglist;

  return res;

}

node *makeSuppressMessage(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = SUPPRESSMESSAGE;
  res->arguments = thinglist;

  return res;

}

node *makeUnsuppressMessage(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = UNSUPPRESSMESSAGE;
  res->arguments = thinglist;

  return res;

}

node *makeVariableDeclaration(chain *stringlist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = VARIABLEDECLARATION;
  res->arguments = stringlist;

  return res;

}


node *makePrintXml(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PRINTXML;
  res->child1 = thing;

  return res;

}

node *makePrintXmlNewFile(node *thing, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PRINTXMLNEWFILE;
  res->child1 = thing;
  res->child2 = thing2;

  return res;

}

node *makePrintXmlAppendFile(node *thing, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PRINTXMLAPPENDFILE;
  res->child1 = thing;
  res->child2 = thing2;

  return res;

}


node *makeNewFilePrint(node *thing, chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = NEWFILEPRINT;
  res->arguments = thinglist;
  res->child1 = thing;

  return res;

}

node *makeAppendFilePrint(node *thing, chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = APPENDFILEPRINT;
  res->arguments = thinglist;
  res->child1 = thing;


  return res;

}

node *makePlot(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PLOT;
  res->arguments = thinglist;

  return res;

}

node *makePrintHexa(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PRINTHEXA;
  res->child1 = thing;

  return res;

}

node *makePrintFloat(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PRINTFLOAT;
  res->child1 = thing;

  return res;

}


node *makePrintBinary(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PRINTBINARY;
  res->child1 = thing;

  return res;

}

node *makePrintExpansion(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PRINTEXPANSION;
  res->child1 = thing;

  return res;

}

node *makeBashExecute(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = BASHEXECUTE;
  res->child1 = thing;

  return res;

}

node *makeExternalPlot(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = EXTERNALPLOT;
  res->arguments = thinglist;

  return res;

}

node *makeWrite(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = WRITE;
  res->arguments = thinglist;

  return res;

}

node *makeNewFileWrite(node *thing, chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = NEWFILEWRITE;
  res->child1 = thing;
  res->arguments = thinglist;

  return res;

}

node *makeAppendFileWrite(node *thing, chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = APPENDFILEWRITE;
  res->child1 = thing;
  res->arguments = thinglist;

  return res;

}

node *makeAsciiPlot(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ASCIIPLOT;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeWorstCase(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = WORSTCASE;
  res->arguments = thinglist;

  return res;

}

node *makeRename(char *string1, char *string2) {
  node *res;
  char *tempString;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = RENAME;
  res->string = (char *) safeCalloc(strlen(string1) + 1, sizeof(char));
  strcpy(res->string,string1);
  tempString = (char *) safeCalloc(strlen(string2) + 1, sizeof(char));
  strcpy(tempString,string2);
  res->arguments = addElement(NULL,tempString);

  return res;

}

node *makeAutoprint(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = AUTOPRINT;
  res->arguments = thinglist;

  return res;

}

node *makeAssignment(char *string, node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ASSIGNMENT;
  res->child1 = thing;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);

  return res;

}

node *makeFloatAssignment(char *string, node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FLOATASSIGNMENT;
  res->child1 = thing;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);

  return res;

}


node *makeExternalProc(char *string, node *thing, chain *typelist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = EXTERNALPROC;
  res->child1 = thing;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);
  res->arguments = typelist;

  return res;

}


node *makeLibraryBinding(char *string, node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = LIBRARYBINDING;
  res->child1 = thing;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);

  return res;
}

node *makeLibraryConstantBinding(char *string, node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = LIBRARYCONSTANTBINDING;
  res->child1 = thing;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);

  return res;

}

node *makePrecAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PRECASSIGN;
  res->child1 = thing;

  return res;

}

node *makeProcedureFunction(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PROCEDUREFUNCTION;
  res->libFunDeriv = 0;
  res->child2 = thing;
  res->child1 = makeVariable();

  return res;

}

node *makePointsAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = POINTSASSIGN;
  res->child1 = thing;

  return res;

}

node *makeDiamAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DIAMASSIGN;
  res->child1 = thing;

  return res;

}

node *makeDisplayAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DISPLAYASSIGN;
  res->child1 = thing;

  return res;

}

node *makeVerbosityAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = VERBOSITYASSIGN;
  res->child1 = thing;

  return res;

}

node *makeCanonicalAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = CANONICALASSIGN;
  res->child1 = thing;

  return res;

}

node *makeAutoSimplifyAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = AUTOSIMPLIFYASSIGN;
  res->child1 = thing;

  return res;

}

node *makeShowMessageNumbersAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = SHOWMESSAGENUMBERSASSIGN;
  res->child1 = thing;

  return res;

}

node *makeTaylorRecursAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = TAYLORRECURSASSIGN;
  res->child1 = thing;

  return res;

}

node *makeTimingAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = TIMINGASSIGN;
  res->child1 = thing;

  return res;

}

node *makeTime(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = TIME;
  res->child1 = thing;

  return res;

}

node *makeFullParenAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FULLPARENASSIGN;
  res->child1 = thing;

  return res;

}

node *makeMidpointAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = MIDPOINTASSIGN;
  res->child1 = thing;

  return res;

}

node *makeDieOnErrorAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DIEONERRORMODEASSIGN;
  res->child1 = thing;

  return res;

}

node *makeRationalModeAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = RATIONALMODEASSIGN;
  res->child1 = thing;

  return res;

}



node *makeSuppressWarningsAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = SUPPRESSWARNINGSASSIGN;
  res->child1 = thing;

  return res;

}


node *makeHopitalRecursAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = HOPITALRECURSASSIGN;
  res->child1 = thing;

  return res;

}

node *makePrecStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PRECSTILLASSIGN;
  res->child1 = thing;

  return res;

}

node *makePointsStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = POINTSSTILLASSIGN;
  res->child1 = thing;

  return res;

}

node *makeDiamStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DIAMSTILLASSIGN;
  res->child1 = thing;

  return res;

}

node *makeDisplayStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DISPLAYSTILLASSIGN;
  res->child1 = thing;

  return res;

}

node *makeVerbosityStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = VERBOSITYSTILLASSIGN;
  res->child1 = thing;

  return res;

}

node *makeCanonicalStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = CANONICALSTILLASSIGN;
  res->child1 = thing;

  return res;

}

node *makeAutoSimplifyStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = AUTOSIMPLIFYSTILLASSIGN;
  res->child1 = thing;

  return res;

}

node *makeShowMessageNumbersStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = SHOWMESSAGENUMBERSSTILLASSIGN;
  res->child1 = thing;

  return res;

}

node *makeTaylorRecursStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = TAYLORRECURSSTILLASSIGN;
  res->child1 = thing;

  return res;

}

node *makeTimingStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = TIMINGSTILLASSIGN;
  res->child1 = thing;

  return res;

}

node *makeFullParenStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FULLPARENSTILLASSIGN;
  res->child1 = thing;

  return res;

}

node *makeMidpointStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = MIDPOINTSTILLASSIGN;
  res->child1 = thing;

  return res;

}

node *makeDieOnErrorStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DIEONERRORMODESTILLASSIGN;
  res->child1 = thing;

  return res;

}

node *makeRationalModeStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = RATIONALMODESTILLASSIGN;
  res->child1 = thing;

  return res;

}


node *makeSuppressWarningsStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = SUPPRESSWARNINGSSTILLASSIGN;
  res->child1 = thing;

  return res;

}


node *makeHopitalRecursStillAssign(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = HOPITALRECURSSTILLASSIGN;
  res->child1 = thing;

  return res;

}

node *makeAnd(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = AND;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeOr(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = OR;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeNegation(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = NEGATION;
  res->child1 = thing;

  return res;

}

node *makeIndex(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = INDEX;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeMatch(node *thing, chain *matchlist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = MATCH;
  res->child1 = thing;
  res->arguments = matchlist;

  return res;
}

node *makeCompareEqual(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = COMPAREEQUAL;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeCompareIn(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = COMPAREIN;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeCompareLess(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = COMPARELESS;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeCompareGreater(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = COMPAREGREATER;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeCompareLessEqual(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = COMPARELESSEQUAL;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeCompareGreaterEqual(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = COMPAREGREATEREQUAL;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeCompareNotEqual(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = COMPARENOTEQUAL;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeConcat(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = CONCAT;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeAddToList(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ADDTOLIST;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makePrepend(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PREPEND;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeAppend(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = APPEND;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}


node *makeOn() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ON;

  return res;

}

node *makeOff() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = OFF;

  return res;

}

node *makeDyadic() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DYADIC;

  return res;

}

node *makePowers() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = POWERS;

  return res;

}

node *makeBinaryThing() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = BINARY;

  return res;

}

node *makeHexadecimalThing() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = HEXADECIMAL;

  return res;

}


node *makeFile() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FILESYM;

  return res;

}

node *makePostscript() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = POSTSCRIPT;

  return res;

}

node *makePostscriptFile() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = POSTSCRIPTFILE;

  return res;

}

node *makePerturb() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PERTURB;

  return res;

}

node *makeRoundDown() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ROUNDDOWN;

  return res;

}

node *makeRoundUp() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ROUNDUP;

  return res;

}

node *makeRoundToZero() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ROUNDTOZERO;

  return res;

}

node *makeRoundToNearest() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ROUNDTONEAREST;

  return res;

}

node *makeHonorCoeff() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = HONORCOEFF;

  return res;

}

node *makeTrue() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = TRUE;

  return res;

}

node *makeUnit() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = UNIT;

  return res;

}


node *makeFalse() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FALSE;

  return res;

}

node *makeDefault() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DEFAULT;

  return res;

}

node *makeDecimal() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DECIMAL;

  return res;

}

node *makeAbsolute() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ABSOLUTESYM;

  return res;

}

node *makeRelative() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = RELATIVESYM;

  return res;

}

node *makeFixed() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FIXED;

  return res;

}

node *makeFloating() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FLOATING;

  return res;

}

node *makeError() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ERRORSPECIAL;

  return res;

}


node *makeDoubleSymbol() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DOUBLESYMBOL;

  return res;

}

node *makeSingleSymbol() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = SINGLESYMBOL;

  return res;

}

node *makeHalfPrecisionSymbol() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = HALFPRECISIONSYMBOL;

  return res;

}

node *makeQuadSymbol() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = QUADSYMBOL;

  return res;

}

node *makeDoubleextendedSymbol() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DOUBLEEXTENDEDSYMBOL;

  return res;

}


node *makeDoubleDoubleSymbol() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DOUBLEDOUBLESYMBOL;

  return res;

}

node *makeTripleDoubleSymbol() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = TRIPLEDOUBLESYMBOL;

  return res;

}

node *makeString(char *string) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = STRING;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);

  return res;

}

node *makeTableAccess(char *string) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = TABLEACCESS;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);

  return res;

}

node *makeIsBound(char *string) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ISBOUND;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);

  return res;

}


node *makeTableAccessWithSubstitute(char *string, chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = TABLEACCESSWITHSUBSTITUTE;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);
  res->arguments = thinglist;

  return res;

}

node *makeStructAccess(node *thing, char *string) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = STRUCTACCESS;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);
  res->child1 = thing;

  return res;

}

node *makeApply(node *thing, chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = APPLY;
  res->child1 = thing;
  res->arguments = thinglist;

  return res;

}


node *makeDecimalConstant(char *string) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DECIMALCONSTANT;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);

  return res;

}

node *makeMidpointConstant(char *string) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = MIDPOINTCONSTANT;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);

  return res;

}


node *makeDyadicConstant(char *string) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DYADICCONSTANT;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);

  return res;

}

node *makeHexConstant(char *string) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = HEXCONSTANT;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);

  return res;

}

node *makeHexadecimalConstant(char *string) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = HEXADECIMALCONSTANT;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);

  return res;

}


node *makeBinaryConstant(char *string) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = BINARYCONSTANT;
  res->string = (char *) safeCalloc(strlen(string) + 1, sizeof(char));
  strcpy(res->string, string);

  return res;

}

node *makeEmptyList() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = EMPTYLIST;

  return res;

}

node *makeList(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = LIST;
  res->arguments = thinglist;
  res->argArray = NULL;
  res->argArraySize = 0;
  res->argArrayAllocSize = 0;


  return res;

}

node *makeStructure(chain *assoclist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = STRUCTURE;
  res->arguments = assoclist;

  return res;
}

node *makeRevertedStructure(chain *assoclist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = STRUCTURE;
  res->arguments = copyChain(assoclist,copyEntryOnVoid);
  freeChain(assoclist,freeEntryOnVoid);

  return res;

}

node *makeRevertedList(chain *thinglist) {
  node *res;
  chain *tempList;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = LIST;
  tempList = copyChain(thinglist,copyThingOnVoid);
  freeChain(thinglist,freeThingOnVoid);
  res->arguments = tempList;
  res->argArray = NULL;
  res->argArraySize = 0;
  res->argArrayAllocSize = 0;


  return res;

}

node *makeFinalEllipticList(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FINALELLIPTICLIST;
  res->arguments = thinglist;
  res->argArray = NULL;
  res->argArraySize = 0;
  res->argArrayAllocSize = 0;


  return res;

}

node *makeRevertedFinalEllipticList(chain *thinglist) {
  node *res;
  chain *tempList;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FINALELLIPTICLIST;
  tempList = copyChain(thinglist,copyThingOnVoid);
  freeChain(thinglist,freeThingOnVoid);
  res->arguments = tempList;
  res->argArray = NULL;
  res->argArraySize = 0;
  res->argArrayAllocSize = 0;


  return res;

}


node *makeElliptic() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ELLIPTIC;

  return res;

}

node *makeRange(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = RANGE;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}


node *makeDeboundMax(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DEBOUNDMAX;
  res->child1 = thing;

  return res;

}

node *makeEvalConst(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = EVALCONST;
  res->child1 = thing;

  return res;

}


node *makeDeboundMin(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DEBOUNDMIN;
  res->child1 = thing;

  return res;

}

node *makeDeboundMid(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DEBOUNDMID;
  res->child1 = thing;

  return res;

}

node *makeDiff(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DIFF;
  res->child1 = thing;

  return res;

}

node *makeDirtysimplify(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DIRTYSIMPLIFY;
  res->child1 = thing;

  return res;

}

node *makeRemez(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = REMEZ;
  res->arguments = thinglist;

  return res;

}

node *makeBind(node *thing1, char *string1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = BIND;
  res->child1 = thing1;
  res->child2 = thing2;
  res->string = (char *) safeCalloc(strlen(string1) + 1, sizeof(char));
  strcpy(res->string, string1);

  return res;

}

node *makeMax(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = MAX;
  res->arguments = thinglist;

  return res;

}

node *makeMin(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = MIN;
  res->arguments = thinglist;

  return res;

}

node *makeFPminimax(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FPMINIMAX;
  res->arguments = thinglist;

  return res;

}

node *makeHorner(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = HORNER;
  res->child1 = thing;

  return res;

}

node *makeCanonicalThing(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = CANONICAL;
  res->child1 = thing;

  return res;

}

node *makeExpand(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = EXPAND;
  res->child1 = thing;

  return res;

}

node *makeSimplifySafe(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = SIMPLIFYSAFE;
  res->child1 = thing;

  return res;

}

node *makeTaylor(node *thing1, node *thing2, node *thing3) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = TAYLOR;
  res->arguments = addElement(addElement(addElement(NULL, thing3), thing2), thing1);

  return res;

}

node *makeTaylorform(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = TAYLORFORM;
  res->arguments = thinglist;

  return res;

}

node *makeChebyshevform(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = CHEBYSHEVFORM;
  res->arguments = thinglist;

  return res;

}

node *makeAutodiff(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = AUTODIFF;
  res->arguments = thinglist;

  return res;

}

node *makeDegree(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DEGREE;
  res->child1 = thing;

  return res;

}

node *makeNumerator(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = NUMERATOR;
  res->child1 = thing;

  return res;

}

node *makeDenominator(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DENOMINATOR;
  res->child1 = thing;

  return res;

}

node *makeSubstitute(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = SUBSTITUTE;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeComposePolynomials(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = COMPOSEPOLYNOMIALS;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeCoeff(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = COEFF;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeSubpoly(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = SUBPOLY;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeRoundcoefficients(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ROUNDCOEFFICIENTS;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeRationalapprox(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = RATIONALAPPROX;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeAccurateInfnorm(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ACCURATEINFNORM;
  res->arguments = thinglist;

  return res;

}

node *makeRoundToFormat(node *thing1, node *thing2, node *thing3) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ROUNDTOFORMAT;
  res->arguments = addElement(addElement(addElement(NULL, thing3), thing2), thing1);

  return res;

}

node *makeEvaluate(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = EVALUATE;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeParse(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PARSE;
  res->child1 = thing;

  return res;

}

node *makeReadXml(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = READXML;
  res->child1 = thing;

  return res;

}

node *makeExecute(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = EXECUTE;
  res->child1 = thing;

  return res;

}


node *makeInfnorm(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = INFNORM;
  res->arguments = thinglist;

  return res;

}

node *makeSupnorm(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = SUPNORM;
  res->arguments = thinglist;

  return res;

}

node *makeFindZeros(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FINDZEROS;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeFPFindZeros(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FPFINDZEROS;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeDirtyInfnorm(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DIRTYINFNORM;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeNumberRoots(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = NUMBERROOTS;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeIntegral(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = INTEGRAL;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeDirtyIntegral(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DIRTYINTEGRAL;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeImplementPoly(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = IMPLEMENTPOLY;
  res->arguments = thinglist;

  return res;

}

node *makeImplementConst(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = IMPLEMENTCONST;
  res->arguments = thinglist;

  return res;

}

node *makeCheckInfnorm(node *thing1, node *thing2, node *thing3) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = CHECKINFNORM;
  res->arguments = addElement(addElement(addElement(NULL, thing3), thing2), thing1);

  return res;

}

node *makeZeroDenominators(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ZERODENOMINATORS;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeIsEvaluable(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ISEVALUABLE;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeSearchGal(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = SEARCHGAL;
  res->arguments = thinglist;

  return res;

}

node *makeGuessDegree(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = GUESSDEGREE;
  res->arguments = thinglist;

  return res;

}

node *makeDirtyFindZeros(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DIRTYFINDZEROS;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;

}

node *makeHead(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = HEAD;
  res->child1 = thing;

  return res;

}

node *makeRoundCorrectly(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ROUNDCORRECTLY;
  res->child1 = thing;

  return res;

}


node *makeReadFile(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = READFILE;
  res->child1 = thing;

  return res;

}

node *makeBashevaluate(chain *thinglist) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = BASHEVALUATE;
  res->arguments = thinglist;

  return res;

}

node *makeGetSuppressedMessages() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = GETSUPPRESSEDMESSAGES;

  return res;

}

node *makeRevert(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = REVERT;
  res->child1 = thing;

  return res;

}

node *makeSort(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = SORT;
  res->child1 = thing;

  return res;

}


node *makeMantissa(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = MANTISSA;
  res->child1 = thing;

  return res;

}

node *makeExponent(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = EXPONENT;
  res->child1 = thing;

  return res;

}

node *makePrecision(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PRECISION;
  res->child1 = thing;

  return res;

}

node *makeTail(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = TAIL;
  res->child1 = thing;

  return res;

}

node *makeLength(node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = LENGTH;
  res->child1 = thing;

  return res;

}

node *makeExternalProcedureUsage(libraryProcedure *proc) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = EXTERNALPROCEDUREUSAGE;
  res->libProc = proc;

  return res;
}

node *makeProc(chain *stringlist, node *body, node *returnVal) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PROC;
  res->arguments = stringlist;
  res->child1 = body;
  res->child2 = returnVal;

  return res;
}

node *makeMatchElement(node *matcher, node *commands, node *returnVal) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = MATCHELEMENT;
  res->arguments = addElement(NULL,commands);
  res->child1 = matcher;
  res->child2 = returnVal;

  return res;
}

node *makeProcIllim(char *arg, node *body, node *returnVal) {
  node *res;
  chain *argList;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PROCILLIM;
  argList = addElement(NULL,arg);
  res->arguments = argList;
  res->child1 = body;
  res->child2 = returnVal;

  return res;
}

node *makePrecDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PRECDEREF;

  return res;

}

node *makePointsDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = POINTSDEREF;

  return res;

}


node *makeDiamDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DIAMDEREF;

  return res;

}


node *makeDisplayDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DISPLAYDEREF;

  return res;

}


node *makeVerbosityDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = VERBOSITYDEREF;

  return res;

}


node *makeCanonicalDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = CANONICALDEREF;

  return res;

}


node *makeAutoSimplifyDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = AUTOSIMPLIFYDEREF;

  return res;

}

node *makeShowMessageNumbersDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = SHOWMESSAGENUMBERSDEREF;

  return res;

}

node *makeTaylorRecursDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = TAYLORRECURSDEREF;

  return res;

}


node *makeTimingDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = TIMINGDEREF;

  return res;

}


node *makeFullParenDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FULLPARENDEREF;

  return res;

}


node *makeMidpointDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = MIDPOINTDEREF;

  return res;

}

node *makeDieOnErrorDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = DIEONERRORMODEDEREF;

  return res;

}

node *makeRationalModeDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = RATIONALMODEDEREF;

  return res;

}


node *makeSuppressWarningsDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = SUPPRESSWARNINGSDEREF;

  return res;

}


node *makeHopitalRecursDeref() {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = HOPITALRECURSDEREF;

  return res;

}

node *makeAssignmentInIndexing(node *thing1, node *thing2, node *thing3) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ASSIGNMENTININDEXING;
  res->arguments = addElement(addElement(addElement(NULL,thing3),thing2),thing1);

  return res;
}

node *makeFloatAssignmentInIndexing(node *thing1, node *thing2, node *thing3) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FLOATASSIGNMENTININDEXING;
  res->arguments = addElement(addElement(addElement(NULL,thing3),thing2),thing1);

  return res;
}

node *makeAssignmentInStructure(chain *idents, node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = ASSIGNMENTINSTRUCTURE;
  res->arguments = idents;
  res->child1 = thing;

  return res;
}

node *makeFloatAssignmentInStructure(chain *idents, node *thing) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = FLOATASSIGNMENTINSTRUCTURE;
  res->arguments = idents;
  res->child1 = thing;

  return res;
}

node *makeProtoAssignmentInStructure(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PROTOASSIGNMENTINSTRUCTURE;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;
}

node *makeProtoFloatAssignmentInStructure(node *thing1, node *thing2) {
  node *res;

  res = (node *) safeMalloc(sizeof(node));
  res->nodeType = PROTOFLOATASSIGNMENTINSTRUCTURE;
  res->child1 = thing1;
  res->child2 = thing2;

  return res;
}

void freeThingOnVoid(void *tree) {
  freeThing((node *) tree);
}

void freeThing(node *tree) {
  if (tree == NULL) return;

  if (tree->nodeType == MEMREF) {
    tree->libFunDeriv--;
    if (tree->libFunDeriv < 1) {
      freeThing(tree->child1);
      if (tree->arguments != NULL) {
	sollya_mpfi_clear(*((sollya_mpfi_t *) tree->arguments->next->value));
	safeFree(tree->arguments->next->value);
	safeFree(tree->arguments->next);
	safeFree(tree->arguments->value);
	safeFree(tree->arguments);
      }
      safeFree(tree);
    }
    return;
  }

  switch (tree->nodeType) {
  case VARIABLE:
    safeFree(tree);
    break;
  case CONSTANT:
    mpfr_clear(*(tree->value));
    safeFree(tree->value);
    safeFree(tree);
    break;
  case ADD:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case SUB:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case MUL:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case DIV:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case SQRT:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case EXP:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case LOG:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case LOG_2:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case LOG_10:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case SIN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case COS:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case TAN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case ASIN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case ACOS:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case ATAN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case SINH:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case COSH:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case TANH:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case ASINH:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case ACOSH:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case ATANH:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case POW:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case NEG:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case ABS:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case DOUBLE:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case SINGLE:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case HALFPRECISION:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case QUAD:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case DOUBLEDOUBLE:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case TRIPLEDOUBLE:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case ERF:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case ERFC:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case LOG_1P:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case EXP_M1:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case DOUBLEEXTENDED:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case LIBRARYFUNCTION:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case LIBRARYCONSTANT:
    safeFree(tree);
    break;
  case PROCEDUREFUNCTION:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case CEIL:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case FLOOR:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case NEARESTINT:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case PI_CONST:
    safeFree(tree);
    break;
  case COMMANDLIST:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case WHILE:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case IFELSE:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case IF:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case FOR:
    safeFree(tree->string);
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case FORIN:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree->string);
    safeFree(tree);
    break;
  case QUIT:
    safeFree(tree);
    break;
  case NOP:
    safeFree(tree);
    break;
  case NOPARG:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case FALSEQUIT:
    safeFree(tree);
    break;
  case FALSERESTART:
    safeFree(tree);
    break;
  case RESTART:
    safeFree(tree);
    break;
  case PRINT:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case SUPPRESSMESSAGE:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case UNSUPPRESSMESSAGE:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case VARIABLEDECLARATION:
    freeChain(tree->arguments, safeFree);
    safeFree(tree);
    break;
  case NEWFILEPRINT:
    freeChain(tree->arguments, freeThingOnVoid);
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case APPENDFILEPRINT:
    freeChain(tree->arguments, freeThingOnVoid);
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case PLOT:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case PRINTHEXA:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case PRINTFLOAT:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case PRINTBINARY:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case PRINTEXPANSION:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case BASHEXECUTE:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case EXTERNALPLOT:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case WRITE:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case NEWFILEWRITE:
    freeChain(tree->arguments, freeThingOnVoid);
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case APPENDFILEWRITE:
    freeChain(tree->arguments, freeThingOnVoid);
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case ASCIIPLOT:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case PRINTXML:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case PRINTXMLNEWFILE:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case PRINTXMLAPPENDFILE:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case WORSTCASE:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case RENAME:
    safeFree(tree->string);
    freeChain(tree->arguments, safeFree);
    safeFree(tree);
    break;
  case AUTOPRINT:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case ASSIGNMENT:
    freeThing(tree->child1);
    safeFree(tree->string);
    safeFree(tree);
    break;
  case FLOATASSIGNMENT:
    freeThing(tree->child1);
    safeFree(tree->string);
    safeFree(tree);
    break;
  case EXTERNALPROC:
    freeThing(tree->child1);
    safeFree(tree->string);
    freeChain(tree->arguments, freeIntPtr);
    safeFree(tree);
    break;
  case LIBRARYBINDING:
    freeThing(tree->child1);
    safeFree(tree->string);
    safeFree(tree);
    break;
  case LIBRARYCONSTANTBINDING:
    freeThing(tree->child1);
    safeFree(tree->string);
    safeFree(tree);
    break;
  case PRECASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case POINTSASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case DIAMASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case DISPLAYASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case VERBOSITYASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case CANONICALASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case AUTOSIMPLIFYASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case SHOWMESSAGENUMBERSASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case TAYLORRECURSASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case TIMINGASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case FULLPARENASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case MIDPOINTASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case DIEONERRORMODEASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case RATIONALMODEASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case SUPPRESSWARNINGSASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case HOPITALRECURSASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case PRECSTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case POINTSSTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case DIAMSTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case DISPLAYSTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case VERBOSITYSTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case CANONICALSTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case AUTOSIMPLIFYSTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case SHOWMESSAGENUMBERSSTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case TAYLORRECURSSTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case TIMINGSTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case FULLPARENSTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case MIDPOINTSTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case DIEONERRORMODESTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case RATIONALMODESTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case SUPPRESSWARNINGSSTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case HOPITALRECURSSTILLASSIGN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case AND:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case OR:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case NEGATION:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case INDEX:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case COMPAREEQUAL:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case COMPAREIN:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case COMPARELESS:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case COMPAREGREATER:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case COMPARELESSEQUAL:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case COMPAREGREATEREQUAL:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case COMPARENOTEQUAL:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case CONCAT:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case ADDTOLIST:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case PREPEND:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case APPEND:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case ON:
    safeFree(tree);
    break;
  case OFF:
    safeFree(tree);
    break;
  case DYADIC:
    safeFree(tree);
    break;
  case POWERS:
    safeFree(tree);
    break;
  case BINARY:
    safeFree(tree);
    break;
  case HEXADECIMAL:
    safeFree(tree);
    break;
  case FILESYM:
    safeFree(tree);
    break;
  case POSTSCRIPT:
    safeFree(tree);
    break;
  case POSTSCRIPTFILE:
    safeFree(tree);
    break;
  case PERTURB:
    safeFree(tree);
    break;
  case ROUNDDOWN:
    safeFree(tree);
    break;
  case ROUNDUP:
    safeFree(tree);
    break;
  case ROUNDTOZERO:
    safeFree(tree);
    break;
  case ROUNDTONEAREST:
    safeFree(tree);
    break;
  case HONORCOEFF:
    safeFree(tree);
    break;
  case TRUE:
    safeFree(tree);
    break;
  case UNIT:
    safeFree(tree);
    break;
  case FALSE:
    safeFree(tree);
    break;
  case DEFAULT:
    safeFree(tree);
    break;
  case DECIMAL:
    safeFree(tree);
    break;
  case ABSOLUTESYM:
    safeFree(tree);
    break;
  case RELATIVESYM:
    safeFree(tree);
    break;
  case FIXED:
    safeFree(tree);
    break;
  case FLOATING:
    safeFree(tree);
    break;
  case ERRORSPECIAL:
    safeFree(tree);
    break;
  case DOUBLESYMBOL:
    safeFree(tree);
    break;
  case SINGLESYMBOL:
    safeFree(tree);
    break;
  case HALFPRECISIONSYMBOL:
    safeFree(tree);
    break;
  case QUADSYMBOL:
    safeFree(tree);
    break;
  case DOUBLEEXTENDEDSYMBOL:
    safeFree(tree);
    break;
  case DOUBLEDOUBLESYMBOL:
    safeFree(tree);
    break;
  case TRIPLEDOUBLESYMBOL:
    safeFree(tree);
    break;
  case STRING:
    safeFree(tree->string);
    safeFree(tree);
    break;
  case TABLEACCESS:
    safeFree(tree->string);
    safeFree(tree);
    break;
  case ISBOUND:
    safeFree(tree->string);
    safeFree(tree);
    break;
  case TABLEACCESSWITHSUBSTITUTE:
    safeFree(tree->string);
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case STRUCTACCESS:
    safeFree(tree->string);
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case APPLY:
    freeThing(tree->child1);
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case DECIMALCONSTANT:
    safeFree(tree->string);
    safeFree(tree);
    break;
  case MIDPOINTCONSTANT:
    safeFree(tree->string);
    safeFree(tree);
    break;
  case DYADICCONSTANT:
    safeFree(tree->string);
    safeFree(tree);
    break;
  case HEXCONSTANT:
    safeFree(tree->string);
    safeFree(tree);
    break;
  case HEXADECIMALCONSTANT:
    safeFree(tree->string);
    safeFree(tree);
    break;
  case BINARYCONSTANT:
    safeFree(tree->string);
    safeFree(tree);
    break;
  case EMPTYLIST:
    safeFree(tree);
    break;
  case LIST:
    freeChain(tree->arguments, freeThingOnVoid);
    if (tree->argArray != NULL) {
      safeFree(tree->argArray);
      tree->argArray = NULL;
      tree->argArraySize = 0;
      tree->argArrayAllocSize = 0;
    }
    safeFree(tree);
    break;
  case STRUCTURE:
    freeChain(tree->arguments, freeEntryOnVoid);
    safeFree(tree);
    break;
  case FINALELLIPTICLIST:
    freeChain(tree->arguments, freeThingOnVoid);
    if (tree->argArray != NULL) {
      safeFree(tree->argArray);
      tree->argArray = NULL;
      tree->argArraySize = 0;
      tree->argArrayAllocSize = 0;
    }
    safeFree(tree);
    break;
  case ELLIPTIC:
    safeFree(tree);
    break;
  case RANGE:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case DEBOUNDMAX:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case EVALCONST:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case DEBOUNDMIN:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case DEBOUNDMID:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case DIFF:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case BASHEVALUATE:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case GETSUPPRESSEDMESSAGES:
    safeFree(tree);
    break;
  case DIRTYSIMPLIFY:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case SIMPLIFYSAFE:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case TIME:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case REMEZ:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case MATCH:
    freeThing(tree->child1);
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case MATCHELEMENT:
    freeThing(tree->child1);
    freeThing(tree->child2);
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case MIN:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case MAX:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case FPMINIMAX:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case HORNER:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case CANONICAL:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case EXPAND:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case TAYLOR:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case TAYLORFORM:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case CHEBYSHEVFORM:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case AUTODIFF:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case DEGREE:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case NUMERATOR:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case DENOMINATOR:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case SUBSTITUTE:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case COMPOSEPOLYNOMIALS:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case COEFF:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case SUBPOLY:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case ROUNDCOEFFICIENTS:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case RATIONALAPPROX:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case ACCURATEINFNORM:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case ROUNDTOFORMAT:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case EVALUATE:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case PARSE:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case READXML:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case EXECUTE:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case INFNORM:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case SUPNORM:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case FINDZEROS:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case FPFINDZEROS:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case DIRTYINFNORM:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case NUMBERROOTS:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case INTEGRAL:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case DIRTYINTEGRAL:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case IMPLEMENTPOLY:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case IMPLEMENTCONST:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case CHECKINFNORM:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case ZERODENOMINATORS:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case ISEVALUABLE:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case SEARCHGAL:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case GUESSDEGREE:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case ASSIGNMENTININDEXING:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case FLOATASSIGNMENTININDEXING:
    freeChain(tree->arguments, freeThingOnVoid);
    safeFree(tree);
    break;
  case ASSIGNMENTINSTRUCTURE:
    freeChain(tree->arguments, freeStringPtr);
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case FLOATASSIGNMENTINSTRUCTURE:
    freeChain(tree->arguments, freeStringPtr);
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case PROTOASSIGNMENTINSTRUCTURE:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case PROTOFLOATASSIGNMENTINSTRUCTURE:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case DIRTYFINDZEROS:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree);
    break;
  case HEAD:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case ROUNDCORRECTLY:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case READFILE:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case REVERT:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case SORT:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case MANTISSA:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case EXPONENT:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case PRECISION:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case TAIL:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case LENGTH:
    freeThing(tree->child1);
    safeFree(tree);
    break;
  case EXTERNALPROCEDUREUSAGE:
    safeFree(tree);
    break;
  case PROC:
    freeThing(tree->child1);
    freeThing(tree->child2);
    freeChain(tree->arguments, safeFree);
    safeFree(tree);
    break;
  case BIND:
    freeThing(tree->child1);
    freeThing(tree->child2);
    safeFree(tree->string);
    safeFree(tree);
    break;
  case PROCILLIM:
    freeThing(tree->child1);
    freeThing(tree->child2);
    freeChain(tree->arguments, safeFree);
    safeFree(tree);
    break;
  case PRECDEREF:
    safeFree(tree);
    break;
  case POINTSDEREF:
    safeFree(tree);
    break;
  case DIAMDEREF:
    safeFree(tree);
    break;
  case DISPLAYDEREF:
    safeFree(tree);
    break;
  case VERBOSITYDEREF:
    safeFree(tree);
    break;
  case CANONICALDEREF:
    safeFree(tree);
    break;
  case AUTOSIMPLIFYDEREF:
    safeFree(tree);
    break;
  case SHOWMESSAGENUMBERSDEREF:
    safeFree(tree);
    break;
  case TAYLORRECURSDEREF:
    safeFree(tree);
    break;
  case TIMINGDEREF:
    safeFree(tree);
    break;
  case FULLPARENDEREF:
    safeFree(tree);
    break;
  case MIDPOINTDEREF:
    safeFree(tree);
    break;
  case DIEONERRORMODEDEREF:
    safeFree(tree);
    break;
  case RATIONALMODEDEREF:
    safeFree(tree);
    break;
  case SUPPRESSWARNINGSDEREF:
    safeFree(tree);
    break;
  case HOPITALRECURSDEREF:
    safeFree(tree);
    break;
  default:
    sollyaFprintf(stderr,"Error: freeThing: unknown identifier (%d) in the tree\n",tree->nodeType);
    exit(1);
  }
  return;
}



void fRawPrintThing(FILE *fd, node *tree) {
  char *str;

  if (tree == NULL) return;
  str = sRawPrintThing(tree);
  sollyaFprintf(fd,"%s",str);
  safeFree(str);
  return;
}

void rawPrintThing(node *tree) {
  fRawPrintThing(stdout,tree);
  return;
}

int isEqualThingOnVoid(void *tree, void *tree2) {
  return isEqualThing((node *) tree, (node *) tree2);
}

int isEqualThing(node *tree, node *tree2) {
  chain *curri, *currj;
  int found;

  if (tree == NULL) return 0;
  if (tree2 == NULL) return 0;

  if (tree == tree2) return 1;

  if (tree->nodeType == MEMREF) {
    return isEqualThing(tree->child1, tree2);
  }

  if (tree2->nodeType == MEMREF) {
    return isEqualThing(tree, tree2->child1);
  }

  if (tree->nodeType != tree2->nodeType) return 0;

  switch (tree->nodeType) {
  case VARIABLE:
    break;
  case CONSTANT:
    if (!mpfr_equal_p(*(tree->value),*(tree2->value))) return 0;
    break;
  case ADD:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case SUB:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case MUL:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case DIV:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case SQRT:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case EXP:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case LOG:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case LOG_2:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case LOG_10:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case SIN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case COS:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case TAN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case ASIN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case ACOS:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case ATAN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case SINH:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case COSH:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case TANH:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case ASINH:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case ACOSH:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case ATANH:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case POW:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case NEG:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case ABS:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case DOUBLE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case SINGLE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case HALFPRECISION:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case QUAD:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case DOUBLEDOUBLE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case TRIPLEDOUBLE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case ERF:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case ERFC:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case LOG_1P:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case EXP_M1:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case DOUBLEEXTENDED:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case LIBRARYFUNCTION:
    if (tree->libFun != tree2->libFun) return 0;
    if (tree->libFunDeriv != tree2->libFunDeriv) return 0;
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case LIBRARYCONSTANT:
    if (tree->libFun != tree2->libFun) return 0;
    break;
  case PROCEDUREFUNCTION:
    if (tree->libFunDeriv != tree2->libFunDeriv) return 0;
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case CEIL:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case FLOOR:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case NEARESTINT:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case PI_CONST:
    break;
  case COMMANDLIST:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case WHILE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case IFELSE:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case IF:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case FOR:
    if (strcmp(tree->string,tree2->string) != 0) return 0;    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case FORIN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case QUIT:
    break;
  case NOP:
    break;
  case NOPARG:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case FALSEQUIT:
    break;
  case FALSERESTART:
    break;
  case RESTART:
    break;
  case VARIABLEDECLARATION:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualStringOnVoid)) return 0;
    break;
  case PRINT:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case SUPPRESSMESSAGE:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case UNSUPPRESSMESSAGE:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case NEWFILEPRINT:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case APPENDFILEPRINT:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case PLOT:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case PRINTHEXA:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case PRINTFLOAT:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case PRINTBINARY:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case PRINTEXPANSION:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case BASHEXECUTE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case EXTERNALPLOT:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case WRITE:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case NEWFILEWRITE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case APPENDFILEWRITE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case ASCIIPLOT:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case PRINTXML:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case PRINTXMLNEWFILE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case PRINTXMLAPPENDFILE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case WORSTCASE:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case RENAME:
    if (strcmp(tree->string,tree2->string) != 0) return 0;
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualStringOnVoid)) return 0;
    break;
  case AUTOPRINT:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case ASSIGNMENT:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case FLOATASSIGNMENT:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case EXTERNALPROC:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualIntPtrOnVoid)) return 0;
  case LIBRARYBINDING:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case LIBRARYCONSTANTBINDING:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case PRECASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case POINTSASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case DIAMASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case DISPLAYASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case VERBOSITYASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case CANONICALASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case AUTOSIMPLIFYASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case SHOWMESSAGENUMBERSASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case TAYLORRECURSASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case TIMINGASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case FULLPARENASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case MIDPOINTASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case DIEONERRORMODEASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case RATIONALMODEASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case SUPPRESSWARNINGSASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case HOPITALRECURSASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case PRECSTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case POINTSSTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case DIAMSTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case DISPLAYSTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case VERBOSITYSTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case CANONICALSTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case AUTOSIMPLIFYSTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case SHOWMESSAGENUMBERSSTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case TAYLORRECURSSTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case TIMINGSTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case FULLPARENSTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case MIDPOINTSTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case DIEONERRORMODESTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case RATIONALMODESTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case SUPPRESSWARNINGSSTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case HOPITALRECURSSTILLASSIGN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case AND:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case OR:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case NEGATION:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case INDEX:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case COMPAREEQUAL:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case COMPAREIN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case COMPARELESS:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case COMPAREGREATER:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case COMPARELESSEQUAL:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case COMPAREGREATEREQUAL:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case COMPARENOTEQUAL:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case CONCAT:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case ADDTOLIST:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case APPEND:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case PREPEND:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case ON:
    break;
  case OFF:
    break;
  case DYADIC:
    break;
  case POWERS:
    break;
  case BINARY:
    break;
  case HEXADECIMAL:
    break;
  case FILESYM:
    break;
  case POSTSCRIPT:
    break;
  case POSTSCRIPTFILE:
    break;
  case PERTURB:
    break;
  case ROUNDDOWN:
    break;
  case ROUNDUP:
    break;
  case ROUNDTOZERO:
    break;
  case ROUNDTONEAREST:
    break;
  case HONORCOEFF:
    break;
  case TRUE:
    break;
  case UNIT:
    break;
  case FALSE:
    break;
  case DEFAULT:
    break;
  case DECIMAL:
    break;
  case ABSOLUTESYM:
    break;
  case RELATIVESYM:
    break;
  case FIXED:
    break;
  case FLOATING:
    break;
  case ERRORSPECIAL:
    break;
  case DOUBLESYMBOL:
    break;
  case SINGLESYMBOL:
    break;
  case HALFPRECISIONSYMBOL:
    break;
  case QUADSYMBOL:
    break;
  case DOUBLEEXTENDEDSYMBOL:
    break;
  case DOUBLEDOUBLESYMBOL:
    break;
  case TRIPLEDOUBLESYMBOL:
    break;
  case STRING:
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case TABLEACCESS:
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case ISBOUND:
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case TABLEACCESSWITHSUBSTITUTE:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case STRUCTACCESS:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case APPLY:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    if (!isEqualThing(tree->child1,tree2->child1)) return 0; break;
  case DECIMALCONSTANT:
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case MIDPOINTCONSTANT:
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case DYADICCONSTANT:
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case HEXCONSTANT:
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case HEXADECIMALCONSTANT:
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case BINARYCONSTANT:
    if (strcmp(tree->string,tree2->string) != 0) return 0;    break;
  case EMPTYLIST:
    break;
  case LIST:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    setupRandomAccessOnLists(tree);
    setupRandomAccessOnLists(tree2);
    break;
  case STRUCTURE:
    if (lengthChain(tree->arguments) != lengthChain(tree2->arguments)) return 0;
    for (curri=tree->arguments;curri!=NULL;curri=curri->next) {
      found = 0;
      currj = tree2->arguments;
      while ((!found) &&
	     (currj != NULL)) {
	if ((!strcmp(((entry *) (curri->value))->name,
		     ((entry *) (currj->value))->name)) &&
	    (isEqualThing(((node *) ((entry *) (curri->value))->value),
			  ((node *) ((entry *) (currj->value))->value)))) {
	  found = 1;
	}
	currj = currj->next;
      }
      if (!found) return 0;
    }
    break;
  case FINALELLIPTICLIST:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    setupRandomAccessOnLists(tree);
    setupRandomAccessOnLists(tree2);
    break;
  case ELLIPTIC:
    break;
  case RANGE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case DEBOUNDMAX:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case EVALCONST:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case DEBOUNDMIN:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case DEBOUNDMID:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case DIFF:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case BASHEVALUATE:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case GETSUPPRESSEDMESSAGES:
    break;
  case DIRTYSIMPLIFY:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case SIMPLIFYSAFE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case TIME:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case REMEZ:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case MATCH:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case MATCHELEMENT:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case MIN:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case MAX:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case FPMINIMAX:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case HORNER:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case CANONICAL:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case EXPAND:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case TAYLOR:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case TAYLORFORM:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case CHEBYSHEVFORM:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case AUTODIFF:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case DEGREE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case NUMERATOR:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case DENOMINATOR:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case SUBSTITUTE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case COMPOSEPOLYNOMIALS:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case COEFF:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case SUBPOLY:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case ROUNDCOEFFICIENTS:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case RATIONALAPPROX:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case ACCURATEINFNORM:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case ROUNDTOFORMAT:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case EVALUATE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case PARSE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case READXML:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case EXECUTE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case INFNORM:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case SUPNORM:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case FINDZEROS:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case FPFINDZEROS:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case DIRTYINFNORM:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case NUMBERROOTS:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case INTEGRAL:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case DIRTYINTEGRAL:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case IMPLEMENTPOLY:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case IMPLEMENTCONST:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case CHECKINFNORM:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case ZERODENOMINATORS:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case ISEVALUABLE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case SEARCHGAL:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case GUESSDEGREE:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case ASSIGNMENTININDEXING:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case FLOATASSIGNMENTININDEXING:
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualThingOnVoid)) return 0;
    break;
  case ASSIGNMENTINSTRUCTURE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualStringOnVoid)) return 0;
    break;
  case FLOATASSIGNMENTINSTRUCTURE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualStringOnVoid)) return 0;
    break;
  case PROTOASSIGNMENTINSTRUCTURE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case PROTOFLOATASSIGNMENTINSTRUCTURE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case DIRTYFINDZEROS:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    break;
  case HEAD:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case ROUNDCORRECTLY:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case READFILE:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case REVERT:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case SORT:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case MANTISSA:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case EXPONENT:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case PRECISION:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case TAIL:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case LENGTH:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    break;
  case EXTERNALPROCEDUREUSAGE:
    if (tree->libProc != tree2->libProc) return 0;
    break;
  case PROC:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualStringOnVoid)) return 0;
    break;
  case BIND:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    if (strcmp(tree->string,tree2->string) != 0) return 0;
    break;
  case PROCILLIM:
    if (!isEqualThing(tree->child1,tree2->child1)) return 0;
    if (!isEqualThing(tree->child2,tree2->child2)) return 0;
    if (!isEqualChain(tree->arguments,tree2->arguments,isEqualStringOnVoid)) return 0;
    break;
  case PRECDEREF:
    break;
  case POINTSDEREF:
    break;
  case DIAMDEREF:
    break;
  case DISPLAYDEREF:
    break;
  case VERBOSITYDEREF:
    break;
  case CANONICALDEREF:
    break;
  case AUTOSIMPLIFYDEREF:
    break;
  case SHOWMESSAGENUMBERSDEREF:
    break;
  case TAYLORRECURSDEREF:
    break;
  case TIMINGDEREF:
    break;
  case FULLPARENDEREF:
    break;
  case MIDPOINTDEREF:
    break;
  case DIEONERRORMODEDEREF:
    break;
  case RATIONALMODEDEREF:
    break;
  case SUPPRESSWARNINGSDEREF:
    break;
  case HOPITALRECURSDEREF:
    break;
  default:
    sollyaFprintf(stderr,"Error: isEqualThing: unknown identifier (%d) in the tree\n",tree->nodeType);
    exit(1);
  }

  return 1;
}


int isCorrectlyTypedBaseSymbol(node *tree) {

  if (tree == NULL) return 0;

  if (tree->nodeType == MEMREF) {
    return isCorrectlyTypedBaseSymbol(tree->child1);
  }

  switch (tree->nodeType) {
  case ON:
  case OFF:
  case DYADIC:
  case POWERS:
  case BINARY:
  case HEXADECIMAL:
  case FILESYM:
  case POSTSCRIPT:
  case POSTSCRIPTFILE:
  case PERTURB:
  case ROUNDDOWN:
  case ROUNDUP:
  case ROUNDTOZERO:
  case ROUNDTONEAREST:
  case HONORCOEFF:
  case TRUE:
  case UNIT:
  case FALSE:
  case DEFAULT:
  case DECIMAL:
  case ABSOLUTESYM:
  case RELATIVESYM:
  case FIXED:
  case FLOATING:
  case DOUBLESYMBOL:
  case SINGLESYMBOL:
  case HALFPRECISIONSYMBOL:
  case QUADSYMBOL:
  case DOUBLEEXTENDEDSYMBOL:
  case DOUBLEDOUBLESYMBOL:
  case TRIPLEDOUBLESYMBOL:
  case STRING:
  case EMPTYLIST:
  case EXTERNALPROCEDUREUSAGE:
  case PROC:
  case PROCILLIM:
    return 1;
  default:
    return 0;
  }

  return 0;
}

int associationContainsDoubleEntries(chain *assoc) {
  chain *curri, *currj;

  for (curri=assoc;curri!=NULL;curri=curri->next) {
    for (currj=assoc;currj!=NULL;currj=currj->next) {
      if ((curri != currj) &&
	  (!strcmp(((entry *) (curri->value))->name,
		   ((entry *) (currj->value))->name))) return 1;
    }
  }

  return 0;
}

int isCorrectlyTyped(node *tree) {
  chain *curr;

  if ((tree->nodeType == MEMREF) && (tree->child2 == tree->child1)) return 1;

  if (isPureTree(tree)) return 1;
  if (isCorrectlyTypedBaseSymbol(tree)) return 1;
  if (isRange(tree)) return 1;
  if (isPureList(tree)) {
    curr = accessThruMemRef(tree)->arguments;
    while (curr != NULL) {
      if ((!isCorrectlyTyped((node *) (curr->value))) && (!isError((node *) (curr->value)))) return 0;
      curr = curr->next;
    }
    return 1;
  }
  if (isStructure(tree)) {
    if (associationContainsDoubleEntries(accessThruMemRef(tree)->arguments)) return 0;
    curr = accessThruMemRef(tree)->arguments;
    while (curr != NULL) {
      if ((!isCorrectlyTyped((node *) (((entry *) (curr->value))->value))) && (!isError((node *) (((entry *) (curr->value))->value)))) return 0;
      curr = curr->next;
    }
    return 1;
  }
  if (isPureFinalEllipticList(tree)) {
    curr = accessThruMemRef(tree)->arguments;
    while (curr != NULL) {
      if ((!isCorrectlyTyped((node *) (curr->value))) && (!isError((node *) (curr->value)))) return 0;
      curr = curr->next;
    }
    return 1;
  }

  return 0;
}

node *evaluateThing(node *tree) {
  node *evaluated, *tempNode;
  int okay;

  okay = 1;

  if ((tree != NULL) &&
      (tree->nodeType == MEMREF) &&
      ((tree->child2 == tree->child1) ||
       (isCorrectlyTyped(tree) &&
	(!(autosimplify && (isPureTree(tree) && (treeSize(tree) < MAXAUTOSIMPLSIZE))))))) {
    evaluated = addMemRef(copyThing(tree));
    if (evaluated->nodeType == MEMREF) {
      evaluated->child2 = evaluated->child1;
    }
    return evaluated;
  }

  evaluated = evaluateThingInner(tree);

  if (!isCorrectlyTyped(evaluated)) {
    okay = 0;
    if (accessThruMemRef(evaluated)->nodeType == ERRORSPECIAL) {
      freeThing(evaluated);
      if ((accessThruMemRef(tree)->nodeType != ERRORSPECIAL) &&
          (accessThruMemRef(tree)->nodeType != TABLEACCESS)) {
	printMessage(1,SOLLYA_MSG_EXPR_OR_COMMAND_COULD_NOT_BE_HANDLED,"Warning: the given expression or command could not be handled.\n");
        considerDyingOnError();
      }
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_NOT_CORRECTLY_TYPED,"Warning: at least one of the given expressions or a subexpression is not correctly typed\nor its evaluation has failed because of some error on a side-effect.\n");
      printMessage(2,SOLLYA_MSG_CONTINUATION,"Information: the expression or a partial evaluation of it has been the following:\n%b\n",evaluated);
      freeThing(evaluated);
      considerDyingOnError();
    }

    printMessage(3,SOLLYA_MSG_EVALUATION_CREATES_ERROR_SPECIAL_SYMBOL,"Information: evaluation creates an error special symbol.\n");

    evaluated = makeError();
  }

  if (autosimplify && isPureTree(evaluated)) {
    if (treeSize(evaluated) < MAXAUTOSIMPLSIZE) {
      tempNode = simplifyTreeErrorfree(evaluated);
      freeThing(evaluated);
      evaluated = tempNode;
    } else {
      printMessage(1,SOLLYA_MSG_EXPR_TOO_BIG_FOR_AUTOMATIC_SIMPLIFICATION,"Warning: the given expression is too big to be treated by the automatic simplification.\n");
    }
  }

  if (okay && (evaluated->nodeType == MEMREF)) {
    evaluated->child2 = evaluated->child1;
  }

  return evaluated;
}


int evaluateFormatsListForFPminimax(chain **res, node *list, int n, int mode) {
  chain *result=NULL;
  chain *curr;
  int i, a;
  int *intptr;

  if( (accessThruMemRef(list)->nodeType==LIST) && (lengthChain(accessThruMemRef(list)->arguments) < n) ) {
    printMessage(1, SOLLYA_MSG_FPMINIMAX_LESS_FORMATS_THAN_MONOMIALS, "Error in fpminimax: there is less formats indications than monomials\n");
    considerDyingOnError();
    return 0;
  }
  if( (accessThruMemRef(list)->nodeType==LIST) && (lengthChain(accessThruMemRef(list)->arguments) > n) ) {
    printMessage(1, SOLLYA_MSG_FPMINIMAX_LESS_MONOMIALS_THAN_FORMATS, "Warning in fpminimax: there is more formats indications than monomials\nthe formats list will be truncated\n");
  }

  curr=accessThruMemRef(list)->arguments;
  i = 1;
  while(i <= n) {
    switch((accessThruMemRef((node *)(curr->value)))->nodeType) {
    case SINGLESYMBOL: a=24; break;
    case QUADSYMBOL: a=113; break;
    case HALFPRECISIONSYMBOL: a=11; break;
    case DOUBLESYMBOL: a=53; break;
    case DOUBLEDOUBLESYMBOL: a=107; break;
    case TRIPLEDOUBLESYMBOL: a=161; break;
    case DOUBLEEXTENDEDSYMBOL: a=64; break;
    default:
      if (! evaluateThingToInteger(&a, (node *)(curr->value), NULL) ) {
	printMessage(1, SOLLYA_MSG_FPMINIMAX_FORMAT_LIST_MALFORMED, "Error in fpminimax: the formats list must contains only integers or formats\n");
        considerDyingOnError();
	freeChain(result, freeIntPtr);
	return 0;
      }
    }

    if ((a <= 0) && (mode == FLOATING)) {
      printMessage(1, SOLLYA_MSG_FPMINIMAX_FORMAT_NEGATIVE_FOR_FP_COEFFS, "Warning in fpminimax: a format indication is non-positive while floating-point coefficients are desired.\n");
      printMessage(1, SOLLYA_MSG_CONTINUATION, "The corresponding format is replaced by 1.\n");
      a = 1;
    }
    intptr = (int *)safeMalloc(sizeof(int));
    *intptr = a;
    result = addElement(result, intptr);

    if(curr->next != NULL) curr=curr->next;
    i++;
  }

  *res = copyChain(result, copyIntPtrOnVoid);
  freeChain(result, freeIntPtr);

  return 1;
}

void mpfr_zero_sign_normalize(mpfr_t op) {
  if (mpfr_zero_p(op)) {
    mpfr_mul(op,op,op,GMP_RNDN); /* (+/- 0)^2 = +0 */
  }
}

int evaluateArgumentForExternalProc(void **res, node *argument, int type) {
  int retVal;
  mpfr_t a, b;
  chain *curr;

  switch (type) {
  case VOID_TYPE:
    retVal = 0;
    break;
  case CONSTANT_TYPE:
    *res = safeMalloc(sizeof(mpfr_t));
    mpfr_init2(*((mpfr_t *) (*res)), tools_precision);
    retVal = evaluateThingToConstant(*((mpfr_t *) (*res)), argument, NULL, 0,0);
    mpfr_zero_sign_normalize(*((mpfr_t *) (*res)));
    if (!retVal) {
      mpfr_clear(*((mpfr_t *) (*res)));
      safeFree(*res);
    }
    break;
  case FUNCTION_TYPE:
    retVal = evaluateThingToPureTree((node **) res, argument);
    break;
  case OBJECT_TYPE:
    *res = evaluateThing(argument);
    retVal = 1;
    break;
  case RANGE_TYPE:
    mpfr_init2(a,tools_precision);
    mpfr_init2(b,tools_precision);
    retVal = evaluateThingToRange(a, b, argument);
    if (retVal) {
      *res = safeMalloc(sizeof(sollya_mpfi_t));
      sollya_mpfi_init2(*((sollya_mpfi_t *) (*res)), tools_precision);
      sollya_mpfi_interv_fr_safe(*((sollya_mpfi_t *) (*res)), a, b);
    }
    mpfr_clear(a);
    mpfr_clear(b);
    break;
  case INTEGER_TYPE:
    *res = safeMalloc(sizeof(int));
    retVal = evaluateThingToInteger((int *) (*res), argument, NULL);
    if (!retVal) {
      safeFree(*res);
    }
    break;
  case STRING_TYPE:
    retVal = evaluateThingToString((char **) res, argument);
    break;
  case BOOLEAN_TYPE:
    *res = safeMalloc(sizeof(int));
    retVal = evaluateThingToBoolean((int *) (*res), argument, NULL);
    if (!retVal) {
      safeFree(*res);
    }
    break;
  case CONSTANT_LIST_TYPE:
    if (evaluateThingToEmptyList(argument)) {
      *((chain **) res) = NULL;
      retVal = 1;
    } else {
      retVal = evaluateThingToConstantList((chain **) res, argument);
      for (curr=*((chain **) res); curr != NULL; curr = curr->next) {
	mpfr_zero_sign_normalize(*((mpfr_t *) curr->value)); 
      }
    }
    break;
  case FUNCTION_LIST_TYPE:
    if (evaluateThingToEmptyList(argument)) {
      *((chain **) res) = NULL;
      retVal = 1;
    } else
      retVal = evaluateThingToPureListOfPureTrees((chain **) res, argument);
    break;
  case OBJECT_LIST_TYPE:
    if (evaluateThingToEmptyList(argument)) {
      *((chain **) res) = NULL;
      retVal = 1;
    } else
      retVal = evaluateThingToPureListOfThings((chain **) res, argument);
    break;
  case RANGE_LIST_TYPE:
    if (evaluateThingToEmptyList(argument)) {
      *((chain **) res) = NULL;
      retVal = 1;
    } else
      retVal = evaluateThingToRangeList((chain **) res, argument);
    break;
  case INTEGER_LIST_TYPE:
    if (evaluateThingToEmptyList(argument)) {
      *((chain **) res) = NULL;
      retVal = 1;
    } else
      retVal = evaluateThingToIntegerList((chain **) res, NULL, argument);
    break;
  case STRING_LIST_TYPE:
    if (evaluateThingToEmptyList(argument)) {
      *((chain **) res) = NULL;
      retVal = 1;
    } else
      retVal = evaluateThingToStringList((chain **) res, argument);
    break;
  case BOOLEAN_LIST_TYPE:
    if (evaluateThingToEmptyList(argument)) {
      *((chain **) res) = NULL;
      retVal = 1;
    } else
      retVal = evaluateThingToBooleanList((chain **) res, argument);
    break;
  default:
    sollyaFprintf(stderr, "Error in evaluateArgumentForExternalProc: unknown type.\n");
    exit(1);
  }

  return retVal;
}

void freeArgumentForExternalProc(void* arg, int type) {

  switch (type) {
  case VOID_TYPE:
    break;
  case CONSTANT_TYPE:
    mpfr_clear(*((mpfr_t *) arg));
    safeFree(arg);
    break;
  case FUNCTION_TYPE:
    freeThing((node *) arg);
    break;
  case OBJECT_TYPE:
    freeThing((node *) arg);
    break;
  case RANGE_TYPE:
    sollya_mpfi_clear(*((sollya_mpfi_t *) arg));
    safeFree(arg);
    break;
  case INTEGER_TYPE:
    safeFree(arg);
    break;
  case STRING_TYPE:
    safeFree(arg);
    break;
  case BOOLEAN_TYPE:
    safeFree(arg);
    break;
  case CONSTANT_LIST_TYPE:
    freeChain((chain *) arg, freeMpfrPtr);
    break;
  case FUNCTION_LIST_TYPE:
    freeChain((chain *) arg, freeThingOnVoid);
    break;
  case OBJECT_LIST_TYPE:
    freeChain((chain *) arg, freeThingOnVoid);
    break;
  case RANGE_LIST_TYPE:
    freeChain((chain *) arg, freeMpfiPtr);
    break;
  case INTEGER_LIST_TYPE:
    freeChain((chain *) arg, freeIntPtr);
    break;
  case STRING_LIST_TYPE:
    freeChain((chain *) arg, safeFree);
    break;
  case BOOLEAN_LIST_TYPE:
    freeChain((chain *) arg, freeIntPtr);
    break;
  default:
    sollyaFprintf(stderr, "Error in freeArgumentForExternalProc: unknown type.\n");
    exit(1);
  }

}

int executeMatchBodyInner(node **resultThing, node *body, node *thingToReturn, chain *associations) {
  int okay, failure;
  chain *curr;

  curr = accessThruMemRef(body)->arguments;
  okay = 1;
  while (curr != NULL) {
    if (isQuit((node *) (curr->value)) ||
	isFalseQuit((node *) (curr->value)) ||
	isRestart((node *) (curr->value)) ||
	isFalseRestart((node *) (curr->value))) {
      printMessage(1,SOLLYA_MSG_QUIT_OR_RESTART_MUST_NOT_BE_IN_MATCH,"Warning: a quit or restart command may not be part of the body of a match-with construct.\nThe match-with construct will not be executed.\n");
      considerDyingOnError();
      okay = 0;
      break;
    }
    curr = curr->next;
  }

  if (!okay) {
    *resultThing = NULL;
    return 0;
  }

  declaredSymbolTable = pushFrame(declaredSymbolTable);

  okay = 1;
  curr = associations;
  while (curr != NULL) {
    failure = 1;
    if ((variablename != NULL) && (strcmp(variablename, ((entry *) (curr->value))->name) == 0)) {
      printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_FREE_VAR_CANNOT_BE_MATCHED,"Warning: the identifier \"%s\" is already bound to the current free variable.\nIt cannot be used as a match variable. The match-with construct cannot be executed.\n",
		   ((entry *) (curr->value))->name);
      considerDyingOnError();
    } else {
      if (getFunction(((entry *) (curr->value))->name) != NULL) {
	printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_LIBRARY_FUNC_CANNOT_BE_MATCHED,"Warning: the identifier \"%s\" is already bound to a library function.\nIt cannot be used as a match variable. The match-with construct cannot be executed.\n",
		     ((entry *) (curr->value))->name);
        considerDyingOnError();
      } else {
        if (getConstantFunction(((entry *) (curr->value))->name) != NULL) {
          printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_LIBRARY_CONST_CANNOT_BE_MATCHED,"Warning: the identifier \"%s\" is already bound to a library constant.\nIt cannot be used as a match variable. The match-with construct cannot be executed.\n",
                       ((entry *) (curr->value))->name);
          considerDyingOnError();
        } else {
          if (getProcedure(((entry *) (curr->value))->name) != NULL) {
            printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_EXTERNAL_PROC_CANNOT_BE_MATCHED,"Warning: the identifier \"%s\" is already bound to an external procedure.\nIt cannot be used as a match variable. The match-with cannot be executed.\n",
                         ((entry *) (curr->value))->name);
            considerDyingOnError();
          } else {
            if (declaredSymbolTable != NULL) {
              failure = 0;
	      declaredSymbolTable = declareNewEntry(declaredSymbolTable, ((entry *) (curr->value))->name, (node *) (((entry *) (curr->value))->value), copyThingOnVoid);
            } else {
              printMessage(1,SOLLYA_MSG_FRAME_SYSTEM_CORRUPTED_MATCH_NOT_EXECUTED,"Warning: previous command interruptions have corrupted the frame system.\n");
              printMessage(1,SOLLYA_MSG_CONTINUATION,"The match variable \"%s\" cannot be bound to its actual value.\nThe match-with cannot be executed.\n",((entry *) (curr->value))->name);
              considerDyingOnError();
            }
          }
	}
      }
    }
    if (failure) {
      okay = 0;
      break;
    }
    curr = curr->next;
  }

  if (!okay) {
    declaredSymbolTable = popFrame(declaredSymbolTable,freeThingOnVoid);
    *resultThing = NULL;
    return 0;
  }

  declaredSymbolTable = pushFrame(declaredSymbolTable);

  curr = accessThruMemRef(body)->arguments;
  okay = 1;
  while (curr != NULL) {
    if (isQuit((node *) (curr->value)) ||
	isFalseQuit((node *) (curr->value)) ||
	isRestart((node *) (curr->value)) ||
	isRestart((node *) (curr->value))) {
      printMessage(1,SOLLYA_MSG_QUIT_OR_RESTART_MUST_NOT_BE_IN_MATCH,"Warning: a quit or restart command may not be part of the body of a match-with construct.\nThe match-with construct will no longer be executed.\n");
      failure = 1;
    } else {
      failure = executeCommand((node *) (curr->value));
    }
    if (failure) {
      okay = 0;
      break;
    }
    curr = curr->next;
  }

  if (!okay) {
    declaredSymbolTable = popFrame(declaredSymbolTable,freeThingOnVoid);
    declaredSymbolTable = popFrame(declaredSymbolTable,freeThingOnVoid);
    *resultThing = NULL;
    return 0;
  }

  *resultThing = evaluateThing(thingToReturn);

  declaredSymbolTable = popFrame(declaredSymbolTable,freeThingOnVoid);
  declaredSymbolTable = popFrame(declaredSymbolTable,freeThingOnVoid);

  return 1;
}

int executeMatchBody(node **resultThing, node *body, node *thingToReturn, chain *associations) {
  int res;

  pushTimeCounter();

  res = executeMatchBodyInner(resultThing, body, thingToReturn, associations);

  popTimeCounter("executing the body of a match-with construct");

  return res;
}

int executeMatch(node **result, node *thingToMatch, node **matchers, node **codesToRun, node **thingsToReturn, int numberMatchers) {
  int i, okay;
  chain *associations;

  okay = 0;
  associations = NULL;
  for (i=0;i<numberMatchers;i++) {
    if (tryMatch(&associations, accessThruMemRef(thingToMatch), accessThruMemRef(matchers[i]))) {
      okay = 1;
      break;
    }
  }

  if (okay) {
    okay = executeMatchBody(result, accessThruMemRef(codesToRun[i]), accessThruMemRef(thingsToReturn[i]), associations);
    if (associations != NULL) freeChain(associations, freeEntryOnVoid);
  } else {
    printMessage(1,SOLLYA_MSG_NO_MATCHING_CASE_FOUND,"Warning: no matching expression found in a match-with construct and no default case given.\n");
    *result = makeError();
    okay = 1;
  }

  return okay;
}


int executeProcedureInner(node **resultThing, node *proc, chain *args, int elliptic) {
  int result, res, noError;
  chain *curr, *curr2;
  node *tempNode;

  if (accessThruMemRef(proc)->nodeType != PROCILLIM) {
    if (lengthChain(accessThruMemRef(proc)->arguments) != lengthChain(args)) {
      if (!((lengthChain(args) == 1) &&
	    (isUnit((node *) (args->value))) &&
	    (lengthChain(accessThruMemRef(proc)->arguments) == 0))) {
	*resultThing = NULL;
	return 1;
      }
    }
  }

  curr = accessThruMemRef(proc)->child1->arguments;
  result = 0;
  while (curr != NULL) {
    if (isQuit((node *) (curr->value)) ||
	isFalseQuit((node *) (curr->value)) ||
	isRestart((node *) (curr->value)) ||
	isFalseRestart((node *) (curr->value))) {
      printMessage(1,SOLLYA_MSG_QUIT_OR_RESTART_MUST_NOT_BE_IN_PROC,"Warning: a quit or restart command may not be part of a procedure body.\nThe procedure will not be executed.\n");
      considerDyingOnError();
      result = 1;
      break;
    }
    curr = curr->next;
  }

  if (result) {
    *resultThing = NULL;
    return 0;
  }

  declaredSymbolTable = pushFrame(declaredSymbolTable);

  result = 0;
  curr = accessThruMemRef(proc)->arguments;
  curr2 = args;
  while (curr != NULL) {
    noError = 0;
    if ((variablename != NULL) && (strcmp(variablename, (char *) (curr->value)) == 0)) {
      printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_FREE_VAR_CANNOT_BE_PARAMETER,"Warning: the identifier \"%s\" is already bound to the current free variable.\nIt cannot be used as a formal parameter of a procedure. The procedure cannot be executed.\n",
		   (char *) (curr->value));
      considerDyingOnError();
    } else {
      if (getFunction((char *) (curr->value)) != NULL) {
	printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_LIBRARY_FUNC_CANNOT_BE_PARAMETER,"Warning: the identifier \"%s\" is already bound to a library function.\nIt cannot be used as a formal parameter of a procedure. The procedure cannot be executed.\n",
		     (char *) (curr->value));
        considerDyingOnError();

      } else {
        if (getConstantFunction((char *) (curr->value)) != NULL) {
          printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_LIBRARY_CONST_CANNOT_BE_PARAMETER,"Warning: the identifier \"%s\" is already bound to a library constant.\nIt cannot be used as a formal parameter of a procedure. The procedure cannot be executed.\n",
                       (char *) (curr->value));
          considerDyingOnError();

        } else {
          if (getProcedure((char *) (curr->value)) != NULL) {
            printMessage(1,SOLLYA_MSG_IDENTIFIER_IS_EXTERNAL_PROC_CANNOT_BE_PARAMETER,"Warning: the identifier \"%s\" is already bound to an external procedure.\nIt cannot be used as a formal parameter of a procedure. The procedure cannot be executed.\n",
                         (char *) (curr->value),(char *) (curr->value));
            considerDyingOnError();

          } else {
            if (declaredSymbolTable != NULL) {
              noError = 1;
              if (accessThruMemRef(proc)->nodeType != PROCILLIM) {
                declaredSymbolTable = declareNewEntry(declaredSymbolTable, (char *) (curr->value), (node *) (curr2->value), copyThingOnVoid);
              } else {
                if (curr2 == NULL) {
                  tempNode = makeEmptyList();
                  declaredSymbolTable = declareNewEntry(declaredSymbolTable, (char *) (curr->value), tempNode, copyThingOnVoid);
                  freeThing(tempNode);
                } else {
                  if (elliptic)
                    tempNode = makeFinalEllipticList(copyChainWithoutReversal(curr2, copyThingOnVoid));
                  else
                    tempNode = makeList(copyChainWithoutReversal(curr2, copyThingOnVoid));
                  declaredSymbolTable = declareNewEntry(declaredSymbolTable, (char *) (curr->value), tempNode, copyThingOnVoid);
                  freeThing(tempNode);
                }
              }
            } else {
              printMessage(1,SOLLYA_MSG_FRAME_SYSTEM_CORRUPTED_PROC_NOT_EXECUTED,"Warning: previous command interruptions have corrupted the frame system.\n");
              printMessage(1,SOLLYA_MSG_CONTINUATION,"The formal parameter \"%s\" cannot be bound to its actual value.\nThe procedure cannot be executed.\n",(char *) (curr->value));
              considerDyingOnError();
            }
          }
	}
      }
    }
    if (!noError) {
      result = 1;
      break;
    }

    if (accessThruMemRef(proc)->nodeType == PROCILLIM) break;

    curr = curr->next;
    curr2 = curr2->next;
  }

  if (result) {
    declaredSymbolTable = popFrame(declaredSymbolTable,freeThingOnVoid);
    *resultThing = NULL;
    return 0;
  }

  curr = accessThruMemRef(accessThruMemRef(proc)->child1)->arguments;
  result = 0;
  while (curr != NULL) {
    if (isQuit((node *) (curr->value)) ||
	isFalseQuit((node *) (curr->value)) ||
	isRestart((node *) (curr->value)) ||
	isRestart((node *) (curr->value))) {
      printMessage(1,SOLLYA_MSG_QUIT_OR_RESTART_MUST_NOT_BE_IN_PROC,"Warning: a quit or restart command may not be part of a procedure body.\n");
      printMessage(1,SOLLYA_MSG_CONTINUATION,"The procedure will no longer be executed.\n");
      res = 1;
    } else {
      res = executeCommand((node *) (curr->value));
    }
    if (res) {
      result = 1;
      break;
    }
    curr = curr->next;
  }

  if (result) {
    declaredSymbolTable = popFrame(declaredSymbolTable,freeThingOnVoid);
    *resultThing = NULL;
    return 0;
  }

  *resultThing = evaluateThing(accessThruMemRef(proc)->child2);

  declaredSymbolTable = popFrame(declaredSymbolTable,freeThingOnVoid);

  return 1;
}

int executeProcedure(node **resultThing, node *proc, chain *args, int elliptic) {
  int res;

  pushTimeCounter();

  res = executeProcedureInner(resultThing, proc, args, elliptic);

  popTimeCounter("executing a procedure");

  return res;
}

void computeFunctionWithProcedure(sollya_mpfi_t y, node *proc, sollya_mpfi_t x, unsigned int derivN) {
  mpfr_t derivNAsMpfr, xleft, xright, precAsMpfr;
  chain *args;
  int res;
  node *resThing;

  if (isProcedure(proc)) {

    mpfr_init2(precAsMpfr,8 * sizeof(mp_prec_t) + 10);
    mpfr_set_ui(precAsMpfr,(unsigned int) sollya_mpfi_get_prec(y),GMP_RNDU);

    mpfr_init2(derivNAsMpfr,8 * sizeof(derivN) + 10);
    mpfr_set_ui(derivNAsMpfr,derivN,GMP_RNDN);

    mpfr_init2(xleft,sollya_mpfi_get_prec(x));
    mpfr_init2(xright,sollya_mpfi_get_prec(x));
    sollya_mpfi_get_left(xleft,x);
    sollya_mpfi_get_right(xright,x);

    args = addElement(addElement(addElement(NULL,makeConstant(precAsMpfr)),
				 makeConstant(derivNAsMpfr)),
		      makeRange(makeConstant(xleft),makeConstant(xright)));

    res = executeProcedure(&resThing, proc, args, 0);

    if (res) {
      if (resThing != NULL) {
	if (isRange(resThing)) {
	  sollya_mpfi_interv_fr_safe(y,*(accessThruMemRef(resThing)->child1->value),*(accessThruMemRef(resThing)->child2->value));
	} else {
	  sollya_mpfi_set_nan(y);
	}
	freeThing(resThing);
      } else {
        sollya_mpfi_set_nan(y);
      }
    } else {
      sollya_mpfi_set_nan(y);
    }

    freeChain(args, freeThingOnVoid);

    mpfr_clear(xright);
    mpfr_clear(xleft);
    mpfr_clear(derivNAsMpfr);
    mpfr_clear(precAsMpfr);
  } else {
    sollya_mpfi_set_nan(y);
  }
}

void computeFunctionWithProcedureMpfr(mpfr_t rop, node *proc, mpfr_t op, unsigned int derivN) {
  sollya_mpfi_t opI, ropI;

  sollya_mpfi_init2(opI,mpfr_get_prec(op));
  sollya_mpfi_init2(ropI,mpfr_get_prec(rop)+2);
  sollya_mpfi_set_fr(opI,op);

  computeFunctionWithProcedure(ropI,proc,opI,derivN);

  sollya_mpfi_mid(rop,ropI);

  sollya_mpfi_clear(opI);
  sollya_mpfi_clear(ropI);
}

int executeExternalProcedureInner(node **resultThing, libraryProcedure *proc, chain *args) {
  chain *myArgs, *myArgSignature, *curr, *curr2;
  int myResultSignature;
  void **arguments;
  int numberArgs, i, res, k;
  int externalResult;
  void *resultSpace;
  mpfr_t a, b;
  mp_prec_t pr;
  node *tempNode;

  if ((lengthChain(args) == 1) && (isUnit((node *) (args->value)))) myArgs = NULL; else myArgs = args;
  if (*((int *) (proc->signature->next->value)) == VOID_TYPE) {
    myArgSignature = NULL;
    myResultSignature = *((int *) (proc->signature->value));
  } else {
    myArgSignature = copyChainWithoutReversal(proc->signature->next,copyIntPtrOnVoid);
    myResultSignature = *((int *) (proc->signature->value));
  }

  if ((numberArgs = lengthChain(myArgs)) != lengthChain(myArgSignature)) {
    freeChain(myArgSignature, freeIntPtr);
    *resultThing = NULL;
    return 1;
  }

  if (numberArgs != 0) {
    arguments = (void **) safeCalloc(numberArgs, sizeof(void *));
    curr = myArgs;
    curr2 = myArgSignature;
    i = 0;
    res=0; /* useless */
    while ((curr != NULL) && (curr2 != NULL)) {
      res = evaluateArgumentForExternalProc(&(arguments[i]),(node *) (curr->value),*((int *) (curr2->value)));
      if (!res) break;
      i++;
      curr = curr->next;
      curr2 = curr2->next;
    }
    if (!res) {
      k = 0;
      curr2 = myArgSignature;
      while ((curr2 != NULL) && (k < i)) {
	freeArgumentForExternalProc(arguments[k],*((int *) (curr2->value)));
	k++;
	curr2 = curr2->next;
      }
      safeFree(arguments);
      freeChain(myArgSignature, freeIntPtr);
      *resultThing = NULL;
      return 1;
    }
  }

  if (numberArgs != 0) {
    switch (myResultSignature) {
    case VOID_TYPE:
      externalResult = ((int (*)(void **))(proc->code))(arguments);
      if (externalResult) {
	*resultThing = makeUnit();
      }
      break;
    case CONSTANT_TYPE:
      resultSpace = safeMalloc(sizeof(mpfr_t));
      mpfr_init2(*((mpfr_t *) resultSpace),tools_precision);
      externalResult = ((int (*)(mpfr_t *, void **))(proc->code))((mpfr_t *) resultSpace,arguments);
      if (externalResult) {
	*resultThing = makeConstant(*((mpfr_t *) resultSpace));
      }
      mpfr_clear(*((mpfr_t *) resultSpace));
      safeFree(resultSpace);
      break;
    case FUNCTION_TYPE:
      externalResult = ((int (*)(node **, void **))(proc->code))((node **) (&resultSpace),arguments);
      if (externalResult) {
	*resultThing = (node *) resultSpace;
      }
      break;
    case OBJECT_TYPE:
      externalResult = ((int (*)(node **, void **))(proc->code))((node **) (&resultSpace),arguments);
      if (externalResult) {
	*resultThing = (node *) resultSpace;
      }
      break;
    case RANGE_TYPE:
      resultSpace = safeMalloc(sizeof(sollya_mpfi_t));
      sollya_mpfi_init2(*((sollya_mpfi_t *) resultSpace),tools_precision);
      externalResult = ((int (*)(mpfi_t *, void **))(proc->code))((mpfi_t *) resultSpace,arguments);
      if (externalResult) {
	mpfr_init2(a,tools_precision);
	mpfr_init2(b,tools_precision);
	sollya_mpfi_get_left(a, *((sollya_mpfi_t *) resultSpace));
	sollya_mpfi_get_right(b, *((sollya_mpfi_t *) resultSpace));
	*resultThing = makeRange(makeConstant(a), makeConstant(b));
	mpfr_clear(b);
	mpfr_clear(a);
      }
      sollya_mpfi_clear(*((sollya_mpfi_t *) resultSpace));
      safeFree(resultSpace);
      break;
    case INTEGER_TYPE:
      resultSpace = safeMalloc(sizeof(int));
      externalResult = ((int (*)(int *, void **))(proc->code))((int *) (resultSpace),arguments);
      if (externalResult) {
	mpfr_init2(a,(mp_prec_t) (8 * sizeof(int) + 5));
	mpfr_set_si(a,*((int *) resultSpace), GMP_RNDN);
	*resultThing = makeConstant(a);
	mpfr_clear(a);
      }
      safeFree(resultSpace);
      break;
    case STRING_TYPE:
      externalResult = ((int (*)(char **, void **))(proc->code))((char **) (&resultSpace),arguments);
      if (externalResult) {
	*resultThing = makeString((char *) resultSpace);
	safeFree(resultSpace);
      }
      break;
    case BOOLEAN_TYPE:
      resultSpace = safeMalloc(sizeof(int));
      externalResult = ((int (*)(int *, void **))(proc->code))((int *) (resultSpace),arguments);
      if (externalResult) {
	if (*((int *) resultSpace)) {
	  *resultThing = makeTrue();
	} else {
	  *resultThing = makeFalse();
	}
      }
      safeFree(resultSpace);
      break;
    case CONSTANT_LIST_TYPE:
      externalResult = ((int (*)(chain **, void **))(proc->code))((chain **) (&resultSpace),arguments);
      if (externalResult) {
	curr = (chain *) resultSpace;
	if (curr == NULL) {
	  *resultThing = makeEmptyList();
	} else {
	  curr2 = NULL;
	  while (curr != NULL) {
	    curr2 = addElement(curr2, makeConstant(*((mpfr_t *) (curr->value))));
	    curr = curr->next;
	  }
	  *resultThing = makeList(copyChain(curr2, copyThingOnVoid));
	  freeChain(curr2, freeThingOnVoid);
	  freeChain((chain *) resultSpace, freeMpfrPtr);
	}
      }
      break;
    case FUNCTION_LIST_TYPE:
      externalResult = ((int (*)(chain **, void **))(proc->code))((chain **) (&resultSpace),arguments);
      if (externalResult) {
	if (((chain *) resultSpace) == NULL) {
	  *resultThing = makeEmptyList();
	} else {
	  *resultThing = makeList((chain *) resultSpace);
	}
      }
      break;
    case OBJECT_LIST_TYPE:
      externalResult = ((int (*)(chain **, void **))(proc->code))((chain **) (&resultSpace),arguments);
      if (externalResult) {
	if (((chain *) resultSpace) == NULL) {
	  *resultThing = makeEmptyList();
	} else {
	  *resultThing = makeList((chain *) resultSpace);
	}
      }
      break;
    case RANGE_LIST_TYPE:
      externalResult = ((int (*)(chain **, void **))(proc->code))((chain **) (&resultSpace),arguments);
      if (externalResult) {
	curr = (chain *) resultSpace;
	if (curr == NULL) {
	  *resultThing = makeEmptyList();
	} else {
	  curr2 = NULL;
	  while (curr != NULL) {
	    pr = sollya_mpfi_get_prec(*((sollya_mpfi_t *) (curr->value)));
	    mpfr_init2(a, pr);
	    mpfr_init2(b, pr);
	    sollya_mpfi_get_left(a, *((sollya_mpfi_t *) (curr->value)));
	    sollya_mpfi_get_right(b, *((sollya_mpfi_t *) (curr->value)));
	    curr2 = addElement(curr2, makeRange(makeConstant(a), makeConstant(b)));
	    mpfr_clear(a);
	    mpfr_clear(b);
	    curr = curr->next;
	  }
	  *resultThing = makeList(copyChain(curr2, copyThingOnVoid));
	  freeChain(curr2, freeThingOnVoid);
	  freeChain((chain *) resultSpace, freeMpfiPtr);
	}
      }
      break;
    case INTEGER_LIST_TYPE:
      externalResult = ((int (*)(chain **, void **))(proc->code))((chain **) (&resultSpace),arguments);
      if (externalResult) {
	curr = (chain *) resultSpace;
	if (curr == NULL) {
	  *resultThing = makeEmptyList();
	} else {
	  curr2 = NULL;
	  mpfr_init2(a,(mp_prec_t) (8 * sizeof(int) + 5));
	  while (curr != NULL) {
	    mpfr_set_si(a, *((int *) (curr->value)), GMP_RNDN);
	    curr2 = addElement(curr2, makeConstant(a));
	    curr = curr->next;
	  }
	  mpfr_clear(a);
	  *resultThing = makeList(copyChain(curr2, copyThingOnVoid));
	  freeChain(curr2, freeThingOnVoid);
	  freeChain((chain *) resultSpace, freeIntPtr);
	}
      }
      break;
    case STRING_LIST_TYPE:
      externalResult = ((int (*)(chain **, void **))(proc->code))((chain **) (&resultSpace),arguments);
      if (externalResult) {
	curr = (chain *) resultSpace;
	if (curr == NULL) {
	  *resultThing = makeEmptyList();
	} else {
	  curr2 = NULL;
	  while (curr != NULL) {
	    curr2 = addElement(curr2, makeString((char *) (curr->value)));
	    curr = curr->next;
	  }
	  *resultThing = makeList(copyChain(curr2, copyThingOnVoid));
	  freeChain(curr2, freeThingOnVoid);
	  freeChain((chain *) resultSpace, safeFree);
	}
      }
      break;
    case BOOLEAN_LIST_TYPE:
      externalResult = ((int (*)(chain **, void **))(proc->code))((chain **) (&resultSpace),arguments);
      if (externalResult) {
	curr = (chain *) resultSpace;
	if (curr == NULL) {
	  *resultThing = makeEmptyList();
	} else {
	  curr2 = NULL;
	  while (curr != NULL) {
	    if (*((int *) (curr->value))) {
	      tempNode = makeTrue();
	    } else {
	      tempNode = makeFalse();
	    }
	    curr2 = addElement(curr2, tempNode);
	    curr = curr->next;
	  }
	  *resultThing = makeList(copyChain(curr2, copyThingOnVoid));
	  freeChain(curr2, freeThingOnVoid);
	  freeChain((chain *) resultSpace, freeIntPtr);
	}
      }
      break;
    default:
      sollyaFprintf(stderr, "Error in executeExternalProcedure: unknown type.\n");
      exit(1);
    }
  } else {
    switch (myResultSignature) {
    case VOID_TYPE:
      externalResult = ((int (*)(void))(proc->code))();
      if (externalResult) {
	*resultThing = makeUnit();
      }
      break;
    case CONSTANT_TYPE:
      resultSpace = safeMalloc(sizeof(mpfr_t));
      mpfr_init2(*((mpfr_t *) resultSpace),tools_precision);
      externalResult = ((int (*)(mpfr_t *))(proc->code))((mpfr_t *) resultSpace);
      if (externalResult) {
	*resultThing = makeConstant(*((mpfr_t *) resultSpace));
      }
      mpfr_clear(*((mpfr_t *) resultSpace));
      safeFree(resultSpace);
      break;
    case FUNCTION_TYPE:
      externalResult = ((int (*)(node **))(proc->code))((node **) (&resultSpace));
      if (externalResult) {
	*resultThing = (node *) resultSpace;
      }
      break;
    case OBJECT_TYPE:
      externalResult = ((int (*)(node **))(proc->code))((node **) (&resultSpace));
      if (externalResult) {
	*resultThing = (node *) resultSpace;
      }
      break;
    case RANGE_TYPE:
      resultSpace = safeMalloc(sizeof(sollya_mpfi_t));
      sollya_mpfi_init2(*((sollya_mpfi_t *) resultSpace),tools_precision);
      externalResult = ((int (*)(sollya_mpfi_t *))(proc->code))((sollya_mpfi_t *) resultSpace);
      if (externalResult) {
	mpfr_init2(a,tools_precision);
	mpfr_init2(b,tools_precision);
	sollya_mpfi_get_left(a, *((sollya_mpfi_t *) resultSpace));
	sollya_mpfi_get_right(b, *((sollya_mpfi_t *) resultSpace));
	*resultThing = makeRange(makeConstant(a), makeConstant(b));
	mpfr_clear(b);
	mpfr_clear(a);
      }
      sollya_mpfi_clear(*((sollya_mpfi_t *) resultSpace));
      safeFree(resultSpace);
      break;
    case INTEGER_TYPE:
      resultSpace = safeMalloc(sizeof(int));
      externalResult = ((int (*)(int *))(proc->code))((int *) (resultSpace));
      if (externalResult) {
	mpfr_init2(a,(mp_prec_t) (8 * sizeof(int) + 5));
	mpfr_set_si(a,*((int *) resultSpace), GMP_RNDN);
	*resultThing = makeConstant(a);
	mpfr_clear(a);
      }
      safeFree(resultSpace);
      break;
    case STRING_TYPE:
      externalResult = ((int (*)(char **))(proc->code))((char **) (&resultSpace));
      if (externalResult) {
	*resultThing = makeString((char *) resultSpace);
	safeFree(resultSpace);
      }
      break;
    case BOOLEAN_TYPE:
      resultSpace = safeMalloc(sizeof(int));
      externalResult = ((int (*)(int *))(proc->code))((int *) (resultSpace));
      if (externalResult) {
	if (*((int *) resultSpace)) {
	  *resultThing = makeTrue();
	} else {
	  *resultThing = makeFalse();
	}
      }
      safeFree(resultSpace);
      break;
    case CONSTANT_LIST_TYPE:
      externalResult = ((int (*)(chain **))(proc->code))((chain **) (&resultSpace));
      if (externalResult) {
	curr = (chain *) resultSpace;
	if (curr == NULL) {
	  *resultThing = makeEmptyList();
	} else {
	  curr2 = NULL;
	  while (curr != NULL) {
	    curr2 = addElement(curr2, makeConstant(*((mpfr_t *) (curr->value))));
	    curr = curr->next;
	  }
	  *resultThing = makeList(copyChain(curr2, copyThingOnVoid));
	  freeChain(curr2, freeThingOnVoid);
	  freeChain((chain *) resultSpace, freeMpfrPtr);
	}
      }
      break;
    case FUNCTION_LIST_TYPE:
      externalResult = ((int (*)(chain **))(proc->code))((chain **) (&resultSpace));
      if (externalResult) {
	if (((chain *) resultSpace) == NULL) {
	  *resultThing = makeEmptyList();
	} else {
	  *resultThing = makeList((chain *) resultSpace);
	}
      }
      break;
    case OBJECT_LIST_TYPE:
      externalResult = ((int (*)(chain **))(proc->code))((chain **) (&resultSpace));
      if (externalResult) {
	if (((chain *) resultSpace) == NULL) {
	  *resultThing = makeEmptyList();
	} else {
	  *resultThing = makeList((chain *) resultSpace);
	}
      }
      break;
    case RANGE_LIST_TYPE:
      externalResult = ((int (*)(chain **))(proc->code))((chain **) (&resultSpace));
      if (externalResult) {
	curr = (chain *) resultSpace;
	if (curr == NULL) {
	  *resultThing = makeEmptyList();
	} else {
	  curr2 = NULL;
	  while (curr != NULL) {
	    pr = sollya_mpfi_get_prec(*((sollya_mpfi_t *) (curr->value)));
	    mpfr_init2(a, pr);
	    mpfr_init2(b, pr);
	    sollya_mpfi_get_left(a, *((sollya_mpfi_t *) (curr->value)));
	    sollya_mpfi_get_right(b, *((sollya_mpfi_t *) (curr->value)));
	    curr2 = addElement(curr2, makeRange(makeConstant(a), makeConstant(b)));
	    mpfr_clear(a);
	    mpfr_clear(b);
	    curr = curr->next;
	  }
	  *resultThing = makeList(copyChain(curr2, copyThingOnVoid));
	  freeChain(curr2, freeThingOnVoid);
	  freeChain((chain *) resultSpace, freeMpfiPtr);
	}
      }
      break;
    case INTEGER_LIST_TYPE:
      externalResult = ((int (*)(chain **))(proc->code))((chain **) (&resultSpace));
      if (externalResult) {
	curr = (chain *) resultSpace;
	if (curr == NULL) {
	  *resultThing = makeEmptyList();
	} else {
	  curr2 = NULL;
	  mpfr_init2(a,(mp_prec_t) (8 * sizeof(int) + 5));
	  while (curr != NULL) {
	    mpfr_set_si(a, *((int *) (curr->value)), GMP_RNDN);
	    curr2 = addElement(curr2, makeConstant(a));
	    curr = curr->next;
	  }
	  mpfr_clear(a);
	  *resultThing = makeList(copyChain(curr2, copyThingOnVoid));
	  freeChain(curr2, freeThingOnVoid);
	  freeChain((chain *) resultSpace, freeIntPtr);
	}
      }
      break;
    case STRING_LIST_TYPE:
      externalResult = ((int (*)(chain **))(proc->code))((chain **) (&resultSpace));
      if (externalResult) {
	curr = (chain *) resultSpace;
	if (curr == NULL) {
	  *resultThing = makeEmptyList();
	} else {
	  curr2 = NULL;
	  while (curr != NULL) {
	    curr2 = addElement(curr2, makeString((char *) (curr->value)));
	    curr = curr->next;
	  }
	  *resultThing = makeList(copyChain(curr2, copyThingOnVoid));
	  freeChain(curr2, freeThingOnVoid);
	  freeChain((chain *) resultSpace, safeFree);
	}
      }
      break;
    case BOOLEAN_LIST_TYPE:
      externalResult = ((int (*)(chain **))(proc->code))((chain **) (&resultSpace));
      if (externalResult) {
	curr = (chain *) resultSpace;
	if (curr == NULL) {
	  *resultThing = makeEmptyList();
	} else {
	  curr2 = NULL;
	  while (curr != NULL) {
	    if (*((int *) (curr->value))) {
	      tempNode = makeTrue();
	    } else {
	      tempNode = makeFalse();
	    }
	    curr2 = addElement(curr2, tempNode);
	    curr = curr->next;
	  }
	  *resultThing = makeList(copyChain(curr2, copyThingOnVoid));
	  freeChain(curr2, freeThingOnVoid);
	  freeChain((chain *) resultSpace, freeIntPtr);
	}
      }
      break;
    default:
      sollyaFprintf(stderr, "Error in executeExternalProcedure: unknown type.\n");
      exit(1);
    }
  }

  if (numberArgs != 0) {
    k = 0;
    curr2 = myArgSignature;
    while ((curr2 != NULL) && (k <= numberArgs)) {
      freeArgumentForExternalProc(arguments[k],*((int *) (curr2->value)));
      k++;
      curr2 = curr2->next;
    }
    safeFree(arguments);
  }

  freeChain(myArgSignature, freeIntPtr);

  return externalResult;
}

int executeExternalProcedure(node **resultThing, libraryProcedure *proc, chain *args) {
  int res;

  pushTimeCounter();

  res = executeExternalProcedureInner(resultThing, proc, args);

  popTimeCounter("executing an external procedure");

  return res;
}

node *preevaluateMatcher(node *tree);

void *preevaluateMatcherOnVoid(void *tree) {
  return (void *) preevaluateMatcher((node *) tree);
}

int variableUsePreventsPreevaluation(node *tree) {
  chain *curr;

  if (tree->nodeType == MEMREF) {
    return variableUsePreventsPreevaluation(tree->child1);
  }

  switch (tree->nodeType) {
  case RENAME:
  case ASSIGNMENT:
  case FLOATASSIGNMENT:
  case EXTERNALPROC:
  case LIBRARYBINDING:
  case LIBRARYCONSTANTBINDING:
  case DEFAULT:
  case ISBOUND:
  case STRUCTACCESS:
  case MATCH:
  case MATCHELEMENT:
  case VARIABLEDECLARATION:
  case ASSIGNMENTINSTRUCTURE:
  case FLOATASSIGNMENTINSTRUCTURE:
  case PROTOASSIGNMENTINSTRUCTURE:
  case PROTOFLOATASSIGNMENTINSTRUCTURE:
  case FOR:
    return 1;
    break;
  case TABLEACCESS:
    if ((variablename != NULL) &&
	(!strcmp(variablename, tree->string))) {
      return 0;
    } else {
      return 1;
    }
    break;
  case TABLEACCESSWITHSUBSTITUTE:
    if ((variablename != NULL) &&
	(!strcmp(variablename, tree->string))) {
      return variableUsePreventsPreevaluation(tree->child1);
    } else {
      return 1;
    }
    break;
  case VARIABLE:
  case CONSTANT:
  case LIBRARYCONSTANT:
  case PI_CONST:
  case QUIT:
  case NOP:
  case FALSEQUIT:
  case FALSERESTART:
  case RESTART:
  case ON:
  case OFF:
  case DYADIC:
  case POWERS:
  case BINARY:
  case HEXADECIMAL:
  case FILESYM:
  case POSTSCRIPT:
  case POSTSCRIPTFILE:
  case PERTURB:
  case ROUNDDOWN:
  case ROUNDUP:
  case ROUNDTOZERO:
  case ROUNDTONEAREST:
  case HONORCOEFF:
  case TRUE:
  case UNIT:
  case FALSE:
  case DECIMAL:
  case ABSOLUTESYM:
  case RELATIVESYM:
  case FIXED:
  case FLOATING:
  case ERRORSPECIAL:
  case DOUBLESYMBOL:
  case SINGLESYMBOL:
  case QUADSYMBOL:
  case HALFPRECISIONSYMBOL:
  case DOUBLEEXTENDEDSYMBOL:
  case DOUBLEDOUBLESYMBOL:
  case TRIPLEDOUBLESYMBOL:
  case STRING:
  case DECIMALCONSTANT:
  case MIDPOINTCONSTANT:
  case DYADICCONSTANT:
  case HEXCONSTANT:
  case HEXADECIMALCONSTANT:
  case BINARYCONSTANT:
  case EMPTYLIST:
  case ELLIPTIC:
  case EXTERNALPROCEDUREUSAGE:
  case PRECDEREF:
  case POINTSDEREF:
  case DIAMDEREF:
  case DISPLAYDEREF:
  case VERBOSITYDEREF:
  case CANONICALDEREF:
  case AUTOSIMPLIFYDEREF:
  case SHOWMESSAGENUMBERSDEREF:
  case TAYLORRECURSDEREF:
  case TIMINGDEREF:
  case FULLPARENDEREF:
  case MIDPOINTDEREF:
  case DIEONERRORMODEDEREF:
  case RATIONALMODEDEREF:
  case SUPPRESSWARNINGSDEREF:
  case HOPITALRECURSDEREF:
  case GETSUPPRESSEDMESSAGES:
    return 0;
    break;
  case ADD:
  case SUB:
  case MUL:
  case DIV:
  case POW:
  case PROCEDUREFUNCTION:
  case WHILE:
  case IF:
  case FORIN:
  case ASCIIPLOT:
  case PRINTXMLNEWFILE:
  case PRINTXMLAPPENDFILE:
  case AND:
  case OR:
  case INDEX:
  case COMPAREEQUAL:
  case COMPAREIN:
  case COMPARELESS:
  case COMPAREGREATER:
  case COMPARELESSEQUAL:
  case COMPAREGREATEREQUAL:
  case COMPARENOTEQUAL:
  case CONCAT:
  case ADDTOLIST:
  case PREPEND:
  case APPEND:
  case RANGE:
  case SUBSTITUTE:
  case COMPOSEPOLYNOMIALS:
  case COEFF:
  case SUBPOLY:
  case ROUNDCOEFFICIENTS:
  case RATIONALAPPROX:
  case EVALUATE:
  case FINDZEROS:
  case FPFINDZEROS:
  case DIRTYINFNORM:
  case NUMBERROOTS:
  case INTEGRAL:
  case DIRTYINTEGRAL:
  case ZERODENOMINATORS:
  case ISEVALUABLE:
  case DIRTYFINDZEROS:
  case BIND:
    return (variableUsePreventsPreevaluation(tree->child1) && variableUsePreventsPreevaluation(tree->child2));
    break;
  case SQRT:
  case EXP:
  case LOG:
  case LOG_2:
  case LOG_10:
  case SIN:
  case COS:
  case TAN:
  case ASIN:
  case ACOS:
  case ATAN:
  case SINH:
  case COSH:
  case TANH:
  case ASINH:
  case ACOSH:
  case ATANH:
  case NEG:
  case ABS:
  case DOUBLE:
  case SINGLE:
  case QUAD:
  case HALFPRECISION:
  case DOUBLEDOUBLE:
  case TRIPLEDOUBLE:
  case ERF:
  case ERFC:
  case LOG_1P:
  case EXP_M1:
  case DOUBLEEXTENDED:
  case LIBRARYFUNCTION:
  case CEIL:
  case FLOOR:
  case NEARESTINT:
  case NOPARG:
  case PRINTHEXA:
  case PRINTFLOAT:
  case PRINTBINARY:
  case PRINTEXPANSION:
  case BASHEXECUTE:
  case PRINTXML:
  case PRECASSIGN:
  case POINTSASSIGN:
  case DIAMASSIGN:
  case DISPLAYASSIGN:
  case VERBOSITYASSIGN:
  case CANONICALASSIGN:
  case AUTOSIMPLIFYASSIGN:
  case SHOWMESSAGENUMBERSASSIGN:
  case TAYLORRECURSASSIGN:
  case TIMINGASSIGN:
  case FULLPARENASSIGN:
  case MIDPOINTASSIGN:
  case DIEONERRORMODEASSIGN:
  case RATIONALMODEASSIGN:
  case SUPPRESSWARNINGSASSIGN:
  case HOPITALRECURSASSIGN:
  case PRECSTILLASSIGN:
  case POINTSSTILLASSIGN:
  case DIAMSTILLASSIGN:
  case DISPLAYSTILLASSIGN:
  case VERBOSITYSTILLASSIGN:
  case CANONICALSTILLASSIGN:
  case AUTOSIMPLIFYSTILLASSIGN:
  case SHOWMESSAGENUMBERSSTILLASSIGN:
  case TAYLORRECURSSTILLASSIGN:
  case TIMINGSTILLASSIGN:
  case FULLPARENSTILLASSIGN:
  case MIDPOINTSTILLASSIGN:
  case DIEONERRORMODESTILLASSIGN:
  case RATIONALMODESTILLASSIGN:
  case SUPPRESSWARNINGSSTILLASSIGN:
  case HOPITALRECURSSTILLASSIGN:
  case NEGATION:
  case HORNER:
  case CANONICAL:
  case EXPAND:
  case DEGREE:
  case NUMERATOR:
  case DENOMINATOR:
  case PARSE:
  case READXML:
  case EXECUTE:
  case HEAD:
  case ROUNDCORRECTLY:
  case READFILE:
  case REVERT:
  case SORT:
  case MANTISSA:
  case EXPONENT:
  case PRECISION:
  case TAIL:
  case LENGTH:
  case DEBOUNDMAX:
  case EVALCONST:
  case DEBOUNDMIN:
  case DEBOUNDMID:
  case DIFF:
  case DIRTYSIMPLIFY:
  case SIMPLIFYSAFE:
  case TIME:
    return variableUsePreventsPreevaluation(tree->child1);
    break;
  case PROC:
  case PROCILLIM:
    return ((tree->arguments == NULL) &&
	    variableUsePreventsPreevaluation(tree->child1) && variableUsePreventsPreevaluation(tree->child2));
    break;
  case COMMANDLIST:
  case IFELSE:
  case PRINT:
  case SUPPRESSMESSAGE:
  case UNSUPPRESSMESSAGE:
  case PLOT:
  case EXTERNALPLOT:
  case WRITE:
  case WORSTCASE:
  case AUTOPRINT:
  case LIST:
  case FINALELLIPTICLIST:
  case REMEZ:
  case BASHEVALUATE:
  case MIN:
  case MAX:
  case FPMINIMAX:
  case TAYLOR:
  case TAYLORFORM:
  case CHEBYSHEVFORM:
  case AUTODIFF:
  case ACCURATEINFNORM:
  case ROUNDTOFORMAT:
  case INFNORM:
  case SUPNORM:
  case IMPLEMENTPOLY:
  case IMPLEMENTCONST:
  case CHECKINFNORM:
  case SEARCHGAL:
  case GUESSDEGREE:
  case ASSIGNMENTININDEXING:
  case FLOATASSIGNMENTININDEXING:
    for (curr = tree->arguments;
	 curr != NULL;
	 curr = curr->next) {
      if (variableUsePreventsPreevaluation((node *) (curr->value))) return 1;
    }
    return 0;
    break;
  case NEWFILEPRINT:
  case NEWFILEWRITE:
  case APPENDFILEWRITE:
  case APPENDFILEPRINT:
  case APPLY:
    for (curr = tree->arguments;
	 curr != NULL;
	 curr = curr->next) {
      if (variableUsePreventsPreevaluation((node *) (curr->value))) return 1;
    }
    if (variableUsePreventsPreevaluation(tree->child1)) return 1;
    return 0;
    break;
  case STRUCTURE:
    for (curr = tree->arguments;
	 curr != NULL;
	 curr = curr->next) {
      if (variableUsePreventsPreevaluation((node *) (((entry *) (curr->value))->value))) return 1;
    }
    return 0;
    break;
  default:
    sollyaFprintf(stderr,"Error: variableUsePreventsPreevaluation: unknown identifier (%d) in the tree\n",tree->nodeType);
    exit(1);
  }
  return 1;
}

node *preevaluateMatcher(node *tree) {
  node *copy, *tempNode2, *tempNode, *tempNodeExtra;
  int rangeEvaluateLeft, rangeEvaluateRight;
  chain *tempChain, *curr, *newChain;
  int resA, resB, resC, i;
  mpfr_t a, infinity;

  if (tree == NULL) return NULL;

  if (tree->nodeType == MEMREF) {
    return preevaluateMatcher(tree->child1);
  }

  copy = (node *) safeMalloc(sizeof(node));
  copy->nodeType = tree->nodeType;

  switch (tree->nodeType) {
  case DECIMALCONSTANT:
  case MIDPOINTCONSTANT:
  case DYADICCONSTANT:
  case HEXCONSTANT:
  case HEXADECIMALCONSTANT:
  case BINARYCONSTANT:
    safeFree(copy);
    copy = evaluateThing(tree);
    break;
  case RANGE:
    rangeEvaluateLeft = !variableUsePreventsPreevaluation(tree->child1);
    rangeEvaluateRight = !variableUsePreventsPreevaluation(tree->child2);
    if (rangeEvaluateLeft && rangeEvaluateRight) {
      safeFree(copy);
      copy = evaluateThing(tree);
      if (accessThruMemRef(copy)->nodeType != RANGE) {
	freeThing(copy);
	copy = (node *) safeMalloc(sizeof(node));
	copy->nodeType = tree->nodeType;
	copy->child1 = preevaluateMatcher(tree->child1);
	copy->child2 = preevaluateMatcher(tree->child2);
      }
    } else {
      if (rangeEvaluateLeft) {
	copy->child2 = preevaluateMatcher(tree->child2);
	tempNode = (node *) safeMalloc(sizeof(node));
	tempNode->nodeType = RANGE;
	tempNode->child1 = copyThing(tree->child1);
	mpfr_init2(infinity,12);
	mpfr_set_inf(infinity,1);
	tempNode->child2 = makeConstant(infinity);
	mpfr_clear(infinity);
	tempNodeExtra = evaluateThing(tempNode);
	tempNode2 = deepCopyThing(tempNodeExtra);
	freeThing(tempNodeExtra);
	if (tempNode2->nodeType == RANGE) {
	  copy->child1 = tempNode2->child1;
	  freeThing(tempNode2->child2);
	  safeFree(tempNode2);
	} else {
	  copy->child1 = preevaluateMatcher(tree->child1);
	  freeThing(tempNode2);
	}
	freeThing(tempNode);
      } else {
	if (rangeEvaluateRight) {
	  copy->child1 = preevaluateMatcher(tree->child1);
	  tempNode = (node *) safeMalloc(sizeof(node));
	  tempNode->nodeType = RANGE;
	  mpfr_init2(infinity,12);
	  mpfr_set_inf(infinity,-1);
	  tempNode->child1 = makeConstant(infinity);
	  tempNode->child2 = copyThing(tree->child2);
	  mpfr_clear(infinity);
	  tempNodeExtra = evaluateThing(tempNode);
	  tempNode2 = deepCopyThing(tempNodeExtra);
	  freeThing(tempNodeExtra);
	  if (tempNode2->nodeType == RANGE) {
	    copy->child2 = tempNode2->child2;
	    freeThing(tempNode2->child1);
	    safeFree(tempNode2);
	  } else {
	    copy->child2 = preevaluateMatcher(tree->child2);
	    freeThing(tempNode2);
	  }
	  freeThing(tempNode);
	} else {
	  copy->child1 = preevaluateMatcher(tree->child1);
	  copy->child2 = preevaluateMatcher(tree->child2);
	}
      }
    }
    break;
  case DIFF:
    switch (accessThruMemRef(tree->child1)->nodeType) {
    case LIBRARYFUNCTION:
    case PROCEDUREFUNCTION:
      if ((accessThruMemRef(accessThruMemRef(tree->child1)->child1)->nodeType == VARIABLE) ||
	  ((variablename != NULL) &&
	   ((accessThruMemRef(accessThruMemRef(tree->child1)->child1)->nodeType == TABLEACCESS) &&
	    (!strcmp(variablename,accessThruMemRef(accessThruMemRef(tree->child1)->child1)->string))))) {
	safeFree(copy);
	copy = evaluateThing(tree);
      } else {
	copy->child1 = preevaluateMatcher(tree->child1);
      }
      break;
    default:
      copy->child1 = preevaluateMatcher(tree->child1);
      break;
    }
    break;
  case LIST:
    tempChain = copyChain(tree->arguments, preevaluateMatcherOnVoid);
    curr = tempChain; newChain = NULL; resC = 0;
    while (curr != NULL) {
      if ((curr->next != NULL) &&
	  (curr->next->next != NULL) &&
	  isElliptic((node *) (curr->next->value)) &&
	  isPureTree((node *) (curr->value)) &&
	  isPureTree((node *) (curr->next->next->value)) &&
	  isConstant((node *) (curr->value)) &&
	  isConstant((node *) (curr->next->next->value)) &&
	  evaluateThingToInteger(&resA,(node *) (curr->value), NULL) &&
	  evaluateThingToInteger(&resB,(node *) (curr->next->next->value),NULL) &&
	  (resA >= resB)) {
	mpfr_init2(a,sizeof(int) * 8);
	resC = 1;
	for (i=resA;i>=resB;i--) {
	  mpfr_set_si(a,i,GMP_RNDN);
	  newChain = addElement(newChain,makeConstant(a));
	}
	mpfr_clear(a);
	curr = curr->next->next;
      } else {
	newChain = addElement(newChain,copyThing((node *) (curr->value)));
      }
      curr = curr->next;
    }
    freeChain(tempChain, freeThingOnVoid);
    copy->arguments = newChain;
    copy->argArray = NULL;
    copy->argArraySize = 0;
    copy->argArrayAllocSize = 0;
    if (resC && (!isPureList(copy))) {
      tempNode = preevaluateMatcher(copy);
      freeThing(copy);
      copy = tempNode;
    }
    break;
  case FINALELLIPTICLIST:
    tempChain = copyChain(tree->arguments, preevaluateMatcherOnVoid);
    curr = tempChain; newChain = NULL; resC = 0;
    while (curr != NULL) {
      if ((curr->next != NULL) &&
	  (curr->next->next != NULL) &&
	  isElliptic((node *) (curr->next->value)) &&
	  isPureTree((node *) (curr->value)) &&
	  isPureTree((node *) (curr->next->next->value)) &&
	  isConstant((node *) (curr->value)) &&
	  isConstant((node *) (curr->next->next->value)) &&
	  evaluateThingToInteger(&resA,(node *) (curr->value), NULL) &&
	  evaluateThingToInteger(&resB,(node *) (curr->next->next->value),NULL) &&
	  (resA >= resB)) {
	mpfr_init2(a,sizeof(int) * 8);
	resC = 1;
	for (i=resA;i>=resB;i--) {
	  mpfr_set_si(a,i,GMP_RNDN);
	  newChain = addElement(newChain,makeConstant(a));
	}
	mpfr_clear(a);
	curr = curr->next->next;
      } else {
	newChain = addElement(newChain,copyThing((node *) (curr->value)));
      }
      curr = curr->next;
    }
    freeChain(tempChain, freeThingOnVoid);
    copy->arguments = newChain;
    copy->argArray = NULL;
    copy->argArraySize = 0;
    copy->argArrayAllocSize = 0;
    if (resC && (!isPureFinalEllipticList(copy))) {
      tempNode = preevaluateMatcher(copy);
      freeThing(copy);
      copy = tempNode;
    }
    break;
  case VARIABLE:
    break;
  case CONSTANT:
    copy->value = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
    mpfr_init2(*(copy->value),mpfr_get_prec(*(tree->value)));
    mpfr_set(*(copy->value),*(tree->value),GMP_RNDN);
    break;
  case ADD:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case SUB:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case MUL:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case DIV:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case SQRT:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case EXP:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case LOG:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case LOG_2:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case LOG_10:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case SIN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case COS:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case TAN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case ASIN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case ACOS:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case ATAN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case SINH:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case COSH:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case TANH:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case ASINH:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case ACOSH:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case ATANH:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case POW:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case NEG:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case ABS:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case DOUBLE:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case SINGLE:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case QUAD:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case HALFPRECISION:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case DOUBLEDOUBLE:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case TRIPLEDOUBLE:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case ERF:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case ERFC:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case LOG_1P:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case EXP_M1:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case DOUBLEEXTENDED:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case LIBRARYFUNCTION:
    copy->libFun = tree->libFun;
    copy->libFunDeriv = tree->libFunDeriv;
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case LIBRARYCONSTANT:
    copy->libFun = tree->libFun;
    break;
  case PROCEDUREFUNCTION:
    copy->libFunDeriv = tree->libFunDeriv;
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case CEIL:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case FLOOR:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case NEARESTINT:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case PI_CONST:
    break;
  case COMMANDLIST:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case WHILE:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case IFELSE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case IF:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case FOR:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case FORIN:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case QUIT:
    break;
  case FALSEQUIT:
    break;
  case FALSERESTART:
    break;
  case RESTART:
    break;
  case PRINT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case SUPPRESSMESSAGE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case UNSUPPRESSMESSAGE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case VARIABLEDECLARATION:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case NOP:
    break;
  case NOPARG:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case NEWFILEPRINT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case APPENDFILEPRINT:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case PLOT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case PRINTHEXA:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case PRINTFLOAT:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case PRINTBINARY:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case PRINTEXPANSION:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case BASHEXECUTE:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case EXTERNALPLOT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case WRITE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case NEWFILEWRITE:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case APPENDFILEWRITE:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case ASCIIPLOT:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case PRINTXML:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case PRINTXMLNEWFILE:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case PRINTXMLAPPENDFILE:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case WORSTCASE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case RENAME:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case AUTOPRINT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case EXTERNALPROC:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyIntPtrOnVoid);
    break;
  case ASSIGNMENT:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case FLOATASSIGNMENT:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case LIBRARYBINDING:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case LIBRARYCONSTANTBINDING:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case PRECASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case POINTSASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case DIAMASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case DISPLAYASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case VERBOSITYASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case CANONICALASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case AUTOSIMPLIFYASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case SHOWMESSAGENUMBERSASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case TAYLORRECURSASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case TIMINGASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case FULLPARENASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case MIDPOINTASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case DIEONERRORMODEASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case RATIONALMODEASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case SUPPRESSWARNINGSASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case HOPITALRECURSASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case PRECSTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case POINTSSTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case DIAMSTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case DISPLAYSTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case VERBOSITYSTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case CANONICALSTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case AUTOSIMPLIFYSTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case SHOWMESSAGENUMBERSSTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case TAYLORRECURSSTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case TIMINGSTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case FULLPARENSTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case MIDPOINTSTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case DIEONERRORMODESTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case RATIONALMODESTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case SUPPRESSWARNINGSSTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case HOPITALRECURSSTILLASSIGN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case AND:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case OR:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case NEGATION:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case INDEX:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case COMPAREEQUAL:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case COMPAREIN:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case COMPARELESS:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case COMPAREGREATER:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case COMPARELESSEQUAL:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case COMPAREGREATEREQUAL:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case COMPARENOTEQUAL:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case CONCAT:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case ADDTOLIST:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case PREPEND:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case APPEND:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case ON:
    break;
  case OFF:
    break;
  case DYADIC:
    break;
  case POWERS:
    break;
  case BINARY:
    break;
  case HEXADECIMAL:
    break;
  case FILESYM:
    break;
  case POSTSCRIPT:
    break;
  case POSTSCRIPTFILE:
    break;
  case PERTURB:
    break;
  case ROUNDDOWN:
    break;
  case ROUNDUP:
    break;
  case ROUNDTOZERO:
    break;
  case ROUNDTONEAREST:
    break;
  case HONORCOEFF:
    break;
  case TRUE:
    break;
  case UNIT:
    break;
  case FALSE:
    break;
  case DEFAULT:
    break;
  case DECIMAL:
    break;
  case ABSOLUTESYM:
    break;
  case RELATIVESYM:
    break;
  case FIXED:
    break;
  case FLOATING:
    break;
  case ERRORSPECIAL:
    break;
  case DOUBLESYMBOL:
    break;
  case SINGLESYMBOL:
    break;
  case QUADSYMBOL:
    break;
  case HALFPRECISIONSYMBOL:
    break;
  case DOUBLEEXTENDEDSYMBOL:
    break;
  case DOUBLEDOUBLESYMBOL:
    break;
  case TRIPLEDOUBLESYMBOL:
    break;
  case STRING:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case TABLEACCESS:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case ISBOUND:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case TABLEACCESSWITHSUBSTITUTE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case STRUCTACCESS:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case APPLY:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case EMPTYLIST:
    break;
  case STRUCTURE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyEntryOnVoid);
    break;
  case ELLIPTIC:
    break;
  case DEBOUNDMAX:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case DEBOUNDMIN:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case DEBOUNDMID:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case EVALCONST:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case DIRTYSIMPLIFY:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case SIMPLIFYSAFE:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case TIME:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case REMEZ:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case BASHEVALUATE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case GETSUPPRESSEDMESSAGES:
    break;
  case MATCH:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case MATCHELEMENT:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case MIN:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case MAX:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case FPMINIMAX:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case HORNER:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case CANONICAL:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case EXPAND:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case TAYLOR:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case TAYLORFORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case CHEBYSHEVFORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case AUTODIFF:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case DEGREE:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case NUMERATOR:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case DENOMINATOR:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case SUBSTITUTE:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case COMPOSEPOLYNOMIALS:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case COEFF:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case SUBPOLY:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case ROUNDCOEFFICIENTS:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case RATIONALAPPROX:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case ACCURATEINFNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case ROUNDTOFORMAT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case EVALUATE:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case PARSE:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case READXML:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case EXECUTE:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case INFNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case SUPNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case FINDZEROS:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case FPFINDZEROS:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case DIRTYINFNORM:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case NUMBERROOTS:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case INTEGRAL:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case DIRTYINTEGRAL:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case IMPLEMENTPOLY:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case IMPLEMENTCONST:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case CHECKINFNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case ZERODENOMINATORS:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case ISEVALUABLE:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case SEARCHGAL:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case GUESSDEGREE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case ASSIGNMENTININDEXING:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case FLOATASSIGNMENTININDEXING:
    copy->arguments = copyChainWithoutReversal(tree->arguments, preevaluateMatcherOnVoid);
    break;
  case ASSIGNMENTINSTRUCTURE:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case FLOATASSIGNMENTINSTRUCTURE:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case PROTOASSIGNMENTINSTRUCTURE:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case PROTOFLOATASSIGNMENTINSTRUCTURE:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case DIRTYFINDZEROS:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    break;
  case HEAD:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case ROUNDCORRECTLY:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case READFILE:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case REVERT:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case SORT:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case MANTISSA:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case EXPONENT:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case PRECISION:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case TAIL:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case LENGTH:
    copy->child1 = preevaluateMatcher(tree->child1);
    break;
  case EXTERNALPROCEDUREUSAGE:
    copy->libProc = tree->libProc;
    break;
  case PROC:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case BIND:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case PROCILLIM:
    copy->child1 = preevaluateMatcher(tree->child1);
    copy->child2 = preevaluateMatcher(tree->child2);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyString);
    break;
  case PRECDEREF:
    break;
  case POINTSDEREF:
    break;
  case DIAMDEREF:
    break;
  case DISPLAYDEREF:
    break;
  case VERBOSITYDEREF:
    break;
  case CANONICALDEREF:
    break;
  case AUTOSIMPLIFYDEREF:
    break;
  case SHOWMESSAGENUMBERSDEREF:
    break;
  case TAYLORRECURSDEREF:
    break;
  case TIMINGDEREF:
    break;
  case FULLPARENDEREF:
    break;
  case MIDPOINTDEREF:
    break;
  case DIEONERRORMODEDEREF:
    break;
  case RATIONALMODEDEREF:
    break;
  case SUPPRESSWARNINGSDEREF:
    break;
  case HOPITALRECURSDEREF:
    break;
  default:
    sollyaFprintf(stderr,"Error: preevaluateMatcher: unknown identifier (%d) in the tree\n",tree->nodeType);
    exit(1);
  }

  return copy;
}

node *performBind(node *proc, char *ident, node *thing) {
  int hasArg;
  chain *curr, *newArgs, *actualArgs;
  char *newStr;
  node *newActualArg;

  /* Start by checking if proc has an argument
     ident.
  */
  hasArg = 0;
  curr = proc->arguments;
  while ((!hasArg) && (curr != NULL)) {
    if (!strcmp(((char *) (curr->value)),ident)) {
      hasArg = 1;
    }
    curr = curr->next;
  }

  /* If we do not find the argument, we return NULL */
  if (!hasArg) return NULL;

  /* Here, we are sure that we can find the argument

     We continue by generating the list of arguments
     different from ident.

  */
  newArgs = NULL;
  curr = proc->arguments;
  while (curr != NULL) {
    if (strcmp(((char *) (curr->value)),ident)) {
      /* The argument is different from ident */
      newStr = safeCalloc(strlen(((char *) (curr->value))) + 1, sizeof(char));
      strcpy(newStr, ((char *) (curr->value)));
      newArgs = addElement(newArgs, newStr);
    }
    curr = curr->next;
  }

  /* The list of new arguments is inverted, we have to revert it */
  curr = copyChain(newArgs, copyString);
  freeChain(newArgs, safeFree);
  newArgs = curr;

  /* Now we have to build the list of things to apply to the
     original procedure
  */
  actualArgs = NULL;
  curr = proc->arguments;
  while (curr != NULL) {
    if (!strcmp(((char *) (curr->value)),ident)) {
      /* Here, we have to replace the argument ident by the new thing */
      newActualArg = copyThing(thing);
    } else {
      /* Here, we have to keep the argument */
      newActualArg = makeTableAccess(((char *) (curr->value)));
    }
    actualArgs = addElement(actualArgs, newActualArg);
    curr = curr->next;
  }

  /* This list actualArgs needs to be reverted, too */
  curr = copyChain(actualArgs, copyThingOnVoid);
  freeChain(actualArgs, freeThingOnVoid);
  actualArgs = curr;

  /* Now build up and return the new procedure */

  return makeProc(newArgs, makeCommandList(addElement(NULL,makeNop())), makeApply(copyThing(proc), actualArgs));
}

void *evaluateThingInnerOnVoid(void *tree) {
  return (void *) evaluateThingInner((node *) tree);
}

void *evaluateThingOnVoid(void *tree) {
  return (void *) evaluateThing((node *) tree);
}

void *makeMonomialFromIntOnVoid(void *n) {
  int a;
  a = *((int *)n);
  if (a==0) return makeConstantDouble(1.0);
  if (a==1) return makeVariable();
  return (void *)makePow(makeVariable(), makeConstantInt(a));
}

/* Check that tree is a finite non-empty list that does not contain the symbol "..."
   Return 1 if, moreover, one of the following conditions is satisfied:
   * either the list contains only non-negative and distinct integers;
   * or the list contains only pure trees (i.e. mathematical expressions).
   In case of success, a list of pure trees is stored in monomials. If tree
   is a list of integers [n1...nk], monomials contain the functions [x^n1...x^nk],
   and otherwise monomials is just the content of tree.
   In case of failure, returns 0, without doing anything with monomials
*/
int evaluateThingToPseudoMonomialsList(chain **monom, node *tree) {
  int useless;
  chain *curr;
  chain *monomials;
  int prev;
  int failure = 0;

  if (!isPureList(tree)) return 0;
  if (evaluateThingToIntegerList(&monomials, &useless, tree)) {
    sortChain(monomials, cmpIntPtr);
    prev = -1;
    for (curr = monomials; curr != NULL; curr = curr->next) {
      if (*(int *)(curr->value) < 0) {
        printMessage(1,SOLLYA_MSG_REMEZ_MONOMIAL_DEGREES_MUST_NOT_BE_NEGATIVE,"Error: monomial degrees must be non-negative.\n");
        failure = 1;
        break;
      }
      if (*(int *)(curr->value) == prev) {
        printMessage(1,SOLLYA_MSG_REMEZ_MONOMIAL_DEGREE_GIVEN_TWICE,"Error: monomial degree is given twice in argument to Remez algorithm.\n");
        failure = 1;
        break;
      }
      prev = *(int *)(curr->value);
    }
    if (failure) { freeChain(monomials,freeMemoryOnVoid); return 0; }
    else {
      *monom = copyChainWithoutReversal(monomials, makeMonomialFromIntOnVoid);
      freeChain(monomials,freeIntPtr);
      return 1;
    }
  }
  else {
    if (!evaluateThingToPureListOfPureTrees(monom, tree)) return 0;
  }

  return 1;
}


node *evaluateThingInnerRemez(node *tree, char *timingString) {
  chain *curr;
  chain *arguments;
  chain *monomials = NULL;
  node *firstArg, *secondArg, *thirdArg, *fourthArg, *fifthArg, *sixthArg;
  node *result;
  int failure = 0;
  int n = -1;
  mpfr_t tmp, a, b, c, d, quality;

  /* We process the arguments:
   * the first one must be a function f
   * the second one can be an integer n, a list of integers [|n1...nk|] or a list of functions [|g1...gk|]
   n is equivalent to [|0...n|] and [|n1...nk|] is equivalent to [|x^n1...x^nk|]
   * the third argument must be an interval
   * the fourth argument is optional and must be a function w (default is 1)
   * the fifth argument is optional and must be a postive number (default is 1e-5). This is the required quality.
   * the sixth argument is optional and must be a positive number r or an interval [r1, r2] (default is [0, +Inf]).
   r is equivalent to [r,r]. This argument is officially undocumented. The description of this argument is given
   in the commit message of revision 1405.

   Note: the parser has already ensured that the first three arguments exist.
  */

  arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
  curr = arguments;
  firstArg = copyThing((node *) (curr->value)); curr = curr->next;
  secondArg = copyThing((node *) (curr->value)); curr = curr->next;
  thirdArg = copyThing((node *) (curr->value)); curr = curr->next;
  fourthArg = NULL; fifthArg = NULL; sixthArg = NULL;

  if (curr != NULL) {
    fourthArg = copyThing((node *) (curr->value)); curr = curr->next;
  }
  if (curr != NULL) {
    fifthArg = copyThing((node *) (curr->value)); curr = curr->next;
  }
  if (curr != NULL) {
    sixthArg = copyThing((node *) (curr->value)); curr = curr->next;
  }

  if (curr != NULL) {
    printMessage(1,SOLLYA_MSG_REMEZ_TOO_MANY_ARGUMENTS,"Warning: too many arguments given to remez command. The remaining arguments will be ignored.\n");
    considerDyingOnError();
  }

  if ( (fourthArg == NULL) || isDefault(fourthArg) ) {
    freeThing(fourthArg); fourthArg = makeConstantDouble(1.0);
  }
  if ( (fifthArg == NULL) || isDefault(fifthArg) ) {
    freeThing(fifthArg); fifthArg = makeConstantDouble(0.00001);
  }
  if ( (sixthArg == NULL) || isDefault(sixthArg) ) {
    freeThing(sixthArg);
    mpfr_init2(tmp, 53);
    mpfr_set_inf(tmp, 1);
    sixthArg = makeRange(makeConstantDouble(0.0), makeConstant(tmp));
    mpfr_clear(tmp);
  }

  /* Now we check the types of the arguments */
  if (!isPureTree(firstArg)) failure = 1;

  /* Second argument */
  if (isPureTree(secondArg)) { /* secondArg can be an integer */
    if (!evaluateThingToInteger(&n, secondArg, NULL)) failure = 1;
    else {
      if (n<0) {
        printMessage(1,SOLLYA_MSG_REMEZ_SECND_ARG_MUST_BE_NONNEGATIVE_INT_OR_LIST,"Error: the second argument of remez must be a non-negative integer or a list.\n");
        failure = 1;
      }
      else { /* The second argument is a valid integer n. Converting it to a list. */
        freeThing(secondArg);
        secondArg = makeList(makeConstantIntChain(n));
      }
    }
  }
  if (!evaluateThingToPseudoMonomialsList(&monomials, secondArg)) failure = 1;

  /* Third argument */
  mpfr_init2(a, tools_precision); mpfr_init2(b, tools_precision); /* Only for avoiding future reallocation.
                                                                     The precision of a and b will be set to a suitable
                                                                     value by evaluateThingToRange anyway */
  if (!evaluateThingToRange(a, b, thirdArg))   failure = 1;

  /* Fourth argument */
  if (!isPureTree(fourthArg)) failure = 1;

  /* Fifth argument */
  mpfr_init2(quality, tools_precision);
  if (!evaluateThingToConstant(quality, fifthArg, NULL, 0,0))   failure = 1;

  /* Sixth argument */
  mpfr_init2(c, tools_precision); mpfr_init2(d, tools_precision);
  if (isPureTree(sixthArg)) { /* sixthArg can be a number */
    if (!evaluateThingToConstant(c, sixthArg, NULL, 0,0))   failure = 1;
    else {
      mpfr_set_prec(d, mpfr_get_prec(c));
      mpfr_set(d, c, GMP_RNDN); /* exact */
    }
  }
  else {
    if (!evaluateThingToRange(c, d, sixthArg))    failure = 1;
  }

  /* Now, if (failure), we cannot run the algorithm, otherwise we can */
  if (failure) {
    result = copyThing(tree);
  }
  else {
    if (timingString != NULL) pushTimeCounter();
    result = remez(firstArg, fourthArg, monomials, a, b, quality, c, d, tools_precision);
    if (timingString != NULL) popTimeCounter(timingString);
  }

  /* If ever result is NULL, we replace it with its original tree before evaluation */
  if (result == NULL) result = copyThing(tree);

  mpfr_clear(a); mpfr_clear(b); mpfr_clear(c); mpfr_clear(d); mpfr_clear(quality);
  freeChain(monomials,freeMemoryOnVoid);
  freeChain(arguments,freeThingOnVoid);
  freeThing(firstArg);
  freeThing(secondArg);
  freeThing(thirdArg);
  freeThing(fourthArg);
  freeThing(fifthArg);
  freeThing(sixthArg);
  return result;
}

node *evaluateThingInnerFpminimax(node *tree, char *timingString) {
  chain *curr;
  chain *arguments;
  chain *monomials = NULL;
  chain *formats = NULL;
  chain *pointsList = NULL;
  node *firstArg, *secondArg, *thirdArg, *fourthArg, *fifthArg, *sixthArg, *seventhArg, *eighthArg;
  int relabsArg, fpfixedArg;
  node *pstarArg, *constrainedPartArg;
  node *result;
  int failure = 0;
  int n = -1;
  mpfr_t a, b;

  arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
  curr = arguments;

  /* We process the arguments:
   * the first one must be a function f
   * the second one can be an integer, a list of integers or a list of functions as for remez
   * the third argument must be a list containing only integers and keywords D, DD, etc.
   * the fourth argument must be an interval or a list of constants
   * the fifth, sixth and seventh arguments are optional and can be
   - RELATIVE | ABSOLUTE (default is  RELATIVE)
   - FIXED | FLOATING (default is FLOATING)
   - a function (default is 0)
   * the eighth argument is optional and is a function q (constrained part)

   Note: the parser has already ensured that the first four arguments exist.
  */

  firstArg = copyThing((node *) (curr->value)); curr = curr->next;
  secondArg = copyThing((node *) (curr->value)); curr = curr->next;
  thirdArg = copyThing((node *) (curr->value)); curr = curr->next;
  fourthArg = copyThing((node *) (curr->value)); curr = curr->next;
  fifthArg = sixthArg = seventhArg = eighthArg = NULL;

  if (curr != NULL) {
    fifthArg = copyThing((node *) (curr->value)); curr = curr->next;
  }
  if (curr != NULL) {
    sixthArg = copyThing((node *) (curr->value)); curr = curr->next;
  }
  if (curr != NULL) {
    seventhArg = copyThing((node *) (curr->value)); curr = curr->next;
  }
  if (curr != NULL) {
    eighthArg = copyThing((node *) (curr->value)); curr = curr->next;
  }

  if (curr != NULL) {
    printMessage(1,SOLLYA_MSG_FPMINIMAX_TOO_MANY_ARGUMENTS,"Warning: too many arguments given to fpminimax command. The remaining arguments will be ignored.\n");
    considerDyingOnError();
  }


  /* We now handle the three optional parameters that can be permuted */
  relabsArg = RELATIVESYM;
  fpfixedArg = FLOATING;
  constrainedPartArg = makeConstantDouble(0.0);

  if ( (fifthArg != NULL) && (!isDefault(fifthArg)) ) {
    switch(accessThruMemRef(fifthArg)->nodeType) {
    case RELATIVESYM: case ABSOLUTESYM: relabsArg = accessThruMemRef(fifthArg)->nodeType; break;
    case FLOATING: case FIXED: fpfixedArg = accessThruMemRef(fifthArg)->nodeType; break;
    default:
      if (isPureTree(fifthArg)) {
        freeThing(constrainedPartArg); constrainedPartArg = copyTree(fifthArg);
      }
      else {
        printMessage(1, SOLLYA_MSG_INVALID_FIFTH_ARGUMENT, "Error in fpminimax: invalid fifth argument\n");
        failure = 1;
      }
    }
  }

  if ( (sixthArg != NULL) && (!isDefault(sixthArg)) ) {
    switch(accessThruMemRef(sixthArg)->nodeType) {
    case RELATIVESYM: case ABSOLUTESYM: relabsArg = accessThruMemRef(sixthArg)->nodeType; break;
    case FLOATING: case FIXED: fpfixedArg = accessThruMemRef(sixthArg)->nodeType; break;
    default:
      if (isPureTree(sixthArg)) {
        freeThing(constrainedPartArg); constrainedPartArg = copyTree(sixthArg);
      }
      else {
        printMessage(1, SOLLYA_MSG_INVALID_FIFTH_ARGUMENT, "Error in fpminimax: invalid fifth argument\n");
        failure = 1;
      }
    }
  }

  if ( (seventhArg != NULL) && (!isDefault(seventhArg)) ) {
    switch(accessThruMemRef(seventhArg)->nodeType) {
    case RELATIVESYM: case ABSOLUTESYM: relabsArg = accessThruMemRef(seventhArg)->nodeType; break;
    case FLOATING: case FIXED: fpfixedArg = accessThruMemRef(seventhArg)->nodeType; break;
    default:
      if (isPureTree(seventhArg)) {
        freeThing(constrainedPartArg); constrainedPartArg = copyTree(seventhArg);
      }
      else {
        printMessage(1, SOLLYA_MSG_INVALID_FIFTH_ARGUMENT, "Error in fpminimax: invalid fifth argument\n");
        failure = 1;
      }
    }
  }

  /* Finally we handle the eighth optional argument */
  if ( (eighthArg == NULL) || isDefault(eighthArg) )   pstarArg = NULL;
  else pstarArg = copyThing(eighthArg);


  /* Now, we check the type of the arguments. Arguments 5, 6 and 7 have already been done */
  if (!isPureTree(firstArg)) failure = 1;

  /* Second argument. This code is a copy-paste from evaluateThingInnerRemez */
  if (isPureTree(secondArg)) { /* secondArg can be an integer */
    if (!evaluateThingToInteger(&n, secondArg, NULL)) failure = 1;
    else {
      if (n<0) {
        printMessage(1,SOLLYA_MSG_FPMINIMAX_SECND_ARG_MUST_BE_NONNEG_INT_OR_LIST,"Error: the second argument of fpminimax must be a non-negative integer or a list.\n");
        failure = 1;
      }
      else { /* The second argument is a valid integer n. Converting it to a list. */
        freeThing(secondArg);
        secondArg = makeList(makeConstantIntChain(n));
      }
    }
  }
  if (!evaluateThingToPseudoMonomialsList(&monomials, secondArg)) failure = 1;


  /* Third argument: must be a list. Note that negative formats are allowed in FIXED mode
     but not in FLOATING mode
  */
  if( (accessThruMemRef(thirdArg)->nodeType == LIST) || (accessThruMemRef(thirdArg)->nodeType == FINALELLIPTICLIST) )
    evaluateFormatsListForFPminimax(&formats, thirdArg, lengthChain(monomials), fpfixedArg);
  else {
    printMessage(1, SOLLYA_MSG_FPMINIMAX_THIRD_ARG_MUST_BE_FORMAT_INDICATIONS, "Error in fpminimax: the third argument of fpminimax must be a list of formats indications.\n");
    failure = 1;
  }

  /* Fourth argument: either a range or a list of points */
  mpfr_init2(a, tools_precision); mpfr_init2(b, tools_precision); /* Only for avoiding future reallocation.
                                                                     The precision of a and b will be set to a suitable
                                                                     value by evaluateThingToRange anyway */
  if (!evaluateThingToRange(a, b, fourthArg)) {
    if (!evaluateThingToConstantList(&pointsList, fourthArg)) {
      printMessage(1, SOLLYA_MSG_FPMINIMAX_FOURTH_ARG_INTERVAL_OR_LIST_OF_POINTS, "Error in fpminimax: the fourth argument of fpminimax must be either an interval or a list of points\n");
      failure = 1;
    }
  }
  if (pointsList != NULL) {
    curr = pointsList;
    mpfr_set_prec(a, mpfr_get_prec(*(mpfr_t *)(curr->value)));
    mpfr_set(a, *(mpfr_t *)(curr->value), GMP_RNDD); /* exact */
    while(curr->next != NULL) curr = curr->next;
    mpfr_set_prec(b, mpfr_get_prec(*(mpfr_t *)(curr->value)));
    mpfr_set(b, *(mpfr_t *)(curr->value), GMP_RNDU); /* exact */
  }

  /* Eighth argument */
  if ( (pstarArg != NULL) && (!isPureTree(pstarArg)) )  failure = 1;

  /* Now, if (failure), we cannot run the algorithm, otherwise we can */
  if (failure) {
    result = copyThing(tree);
  }
  else {
    if (timingString != NULL) pushTimeCounter();
    result = FPminimax(firstArg, monomials, formats, pointsList, a, b, fpfixedArg, relabsArg, constrainedPartArg, pstarArg);

    /* FPminimax can return NULL if does not succeed, either because not enough points or format inidications were
       prrovided, or because it did not manage to find correct exponents (for floating-point formats).
       In this case, we return error */
    if (result == NULL)  result = makeError();
    if (timingString != NULL) popTimeCounter(timingString);
  }

  mpfr_clear(a); mpfr_clear(b);
  freeChain(monomials,freeMemoryOnVoid);
  freeChain(arguments,freeThingOnVoid);
  freeChain(formats, freeIntPtr);
  freeChain(pointsList, freeMpfrPtr);
  freeThing(firstArg);
  freeThing(secondArg);
  freeThing(thirdArg);
  freeThing(fourthArg);
  freeThing(fifthArg);
  freeThing(sixthArg);
  freeThing(seventhArg);
  freeThing(eighthArg);
  freeThing(pstarArg);
  free_memory(constrainedPartArg);
  return result;
}

node *evaluateThingInnerRationalapprox(node *tree, char *timingString) {
  node *result;
  node *firstArg, *secondArg;
  int failure = 0;
  mpfr_t a;
  int n;

  firstArg = evaluateThingInner(tree->child1);
  secondArg = evaluateThingInner(tree->child2);

  /* firstArg must be a constant expression */
  mpfr_init2(a, tools_precision);
  if (!isPureTree(firstArg)) failure = 1;
  else { if (!evaluateThingToConstant(a, firstArg, NULL, 0, 0)) failure = 1; }

  /* secondArg must be an integer */
  if (!isPureTree(secondArg)) failure = 1;
  else {if (!evaluateThingToInteger(&n, secondArg, NULL)) failure = 1; }

  if (failure) {
    result = copyThing(tree);
  }
  else {
    if (timingString != NULL) pushTimeCounter();
    result = rationalApprox(a, n);
    if (timingString != NULL) popTimeCounter(timingString);
  }

  freeThing(firstArg);
  freeThing(secondArg);
  mpfr_clear(a);
  return result;
}

node *evaluateThingInnerst(node *);

node *evaluateThingInner(node *tree) {
  node *res;

  if ((tree != NULL) &&
      (tree->nodeType == MEMREF) &&
      ((tree->child1 == tree->child2) || isCorrectlyTyped(tree))) {
    return addMemRef(copyThing(tree));
  }

  res = evaluateThingInnerst(tree);

  if ((tree != NULL) && (res != NULL) &&
      (tree->nodeType == MEMREF) &&
      (tree != res) &&
      isEqualThing(tree,res)) {
    freeThing(res);
    res = copyThing(tree);
  }

  return addMemRef(res);
}

node *evaluateThingInnerst(node *tree) {
  node *copy, *tempNode, *tempNode2, *tempNode3, *tempNode4, *tempNode5, *tempNode6;
  int *intptr;
  int resA, resB, i, resC, resD, resE, resF, resG, resH, resI, resJ, resK, resL, resM, resN;
  char *tempString, *tempString2, *timingString, *tempString3, *tempString4, *tempString5;
  char *str1, *str2, *str3;
  mpfr_t a, b, c, d, e;
  chain *tempChain, *curr, *newChain, *tempChain2, *tempChain3, *curr2, *tempChain4, *tempChain5;
  rangetype yrange, xrange, yrange2;
  node *firstArg, *secondArg, *thirdArg, *fourthArg, *fifthArg, *sixthArg, *seventhArg, *eighthArg;
  rangetype *rangeTempPtr;
  FILE *fd, *fd2;
  mp_exp_t expo;
  mp_prec_t pTemp, pTemp2, pTemp3;
  int undoVariableTrick;
  sollya_mpfi_t tempIA, tempIB, tempIC, tempID;
  int alreadyDisplayed;
  sollya_mpfi_t *tmpInterv1, *tmpInterv2;
  sollya_mpfi_t *tmpInterv11;
  mpfr_t bb,cc;
  sollya_mpfi_t tempIA2;
  unsigned int tempUI;
  node **thingArray1, **thingArray2, **thingArray3;
  entry *structEntry;
  chain *assoclist;
  int floatingPointEvaluationAlreadyDone;
  mpz_t tempMpz;
  char *decString;
  int negate;

  /* Make compiler happy: */
  pTemp = 12;
  pTemp2 = 12;
  /* End of compiler happiness */

  if (tree == NULL) return NULL;

  if (tree->nodeType == MEMREF) {
    return evaluateThingInner(tree->child1);
  }

  timingString = NULL;
  if (timecounting) {
    timingString = getTimingStringForThing(tree);
  }

  copy = (node *) safeMalloc(sizeof(node));
  copy->nodeType = tree->nodeType;

  switch (tree->nodeType) {
  case VARIABLE:
    break;
  case CONSTANT:
    copy->value = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
    mpfr_init2(*(copy->value),mpfr_get_prec(*(tree->value)));
    mpfr_set(*(copy->value),*(tree->value),GMP_RNDN);
    break;
  case ADD:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isRangeNonEmpty(copy->child1) && isRangeNonEmpty(copy->child2)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIB,pTemp);
      sollya_mpfi_interv_fr(tempIB,*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_add(tempIC,tempIA,tempIB);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIB);
      sollya_mpfi_clear(tempIC);
    } else {
      if (isRangeNonEmpty(copy->child1) &&
	  isPureTree(copy->child2) &&
	  isConstant(copy->child2)) { 
	if (mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value)) && 
	    mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value))) {
	  tempNode = makeAdd(makeVariable(),copyTree(copy->child2));
	  xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  mpfr_init2(*(xrange.a),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value)));
	  mpfr_init2(*(xrange.b),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value)));
	  mpfr_init2(*(yrange.a),tools_precision);
	  mpfr_init2(*(yrange.b),tools_precision);
	  mpfr_set(*(xrange.a),*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),GMP_RNDD);
	  mpfr_set(*(xrange.b),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value),GMP_RNDU);
	  evaluateRangeFunction(yrange, tempNode, xrange, tools_precision);
	  freeThing(copy);
	  copy = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	  freeThing(tempNode);
	  mpfr_clear(*(xrange.a));
	  mpfr_clear(*(xrange.b));
	  mpfr_clear(*(yrange.a));
	  mpfr_clear(*(yrange.b));
	  safeFree(xrange.a);
	  safeFree(xrange.b);
	  safeFree(yrange.a);
	  safeFree(yrange.b);
	} else {
	  pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
	  pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
	  if (pTemp2 > pTemp) pTemp = pTemp2;
	  sollya_mpfi_init2(tempIA,pTemp);
	  sollya_mpfi_init2(tempIB,tools_precision);
	  sollya_mpfi_init2(tempIC,tools_precision);
	  sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
	  evaluateConstantExpressionToSharpInterval(tempIB, copy->child2);
	  sollya_mpfi_add(tempIC, tempIA, tempIB);
	  freeThing(copy);
	  mpfr_init2(a,tools_precision);
	  mpfr_init2(b,tools_precision);
	  sollya_mpfi_get_left(a,tempIC);
	  sollya_mpfi_get_right(b,tempIC);
	  copy = makeRange(makeConstant(a),makeConstant(b));
	  mpfr_clear(a);
	  mpfr_clear(b);
	  sollya_mpfi_clear(tempIC);
	  sollya_mpfi_clear(tempIB);
	  sollya_mpfi_clear(tempIA);
	}
      } else {
	if (isRangeNonEmpty(copy->child2) &&
	    isPureTree(copy->child1) &&
	    isConstant(copy->child1)) { 
	  if (mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value)) && 
	      mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value))) {
	    tempNode = makeAdd(copyTree(copy->child1),makeVariable());
	    xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    mpfr_init2(*(xrange.a),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value)));
	    mpfr_init2(*(xrange.b),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value)));
	    mpfr_init2(*(yrange.a),tools_precision);
	    mpfr_init2(*(yrange.b),tools_precision);
	    mpfr_set(*(xrange.a),*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),GMP_RNDD);
	    mpfr_set(*(xrange.b),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value),GMP_RNDU);
	    evaluateRangeFunction(yrange, tempNode, xrange, tools_precision);
	    freeThing(copy);
	    copy = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	    freeThing(tempNode);
	    mpfr_clear(*(xrange.a));
	    mpfr_clear(*(xrange.b));
	    mpfr_clear(*(yrange.a));
	    mpfr_clear(*(yrange.b));
	    safeFree(xrange.a);
	    safeFree(xrange.b);
	    safeFree(yrange.a);
	    safeFree(yrange.b);
	  } else {
	    pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value));
	    pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
	    if (pTemp2 > pTemp) pTemp = pTemp2;
	    sollya_mpfi_init2(tempIA,pTemp);
	    sollya_mpfi_init2(tempIB,tools_precision);
	    sollya_mpfi_init2(tempIC,tools_precision);
	    sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
	    evaluateConstantExpressionToSharpInterval(tempIB, copy->child1);
	    sollya_mpfi_add(tempIC, tempIB, tempIA);
	    freeThing(copy);
	    mpfr_init2(a,tools_precision);
	    mpfr_init2(b,tools_precision);
	    sollya_mpfi_get_left(a,tempIC);
	    sollya_mpfi_get_right(b,tempIC);
	    copy = makeRange(makeConstant(a),makeConstant(b));
	    mpfr_clear(a);
	    mpfr_clear(b);
	    sollya_mpfi_clear(tempIC);
	    sollya_mpfi_clear(tempIB);
	    sollya_mpfi_clear(tempIA);
	  }
	}
      }
    }
    break;
  case SUB:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isRangeNonEmpty(copy->child1) && isRangeNonEmpty(copy->child2)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIB,pTemp);
      sollya_mpfi_interv_fr(tempIB,*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_sub(tempIC,tempIA,tempIB);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIB);
      sollya_mpfi_clear(tempIC);
    } else {
      if (isRangeNonEmpty(copy->child1) &&
	  isPureTree(copy->child2) &&
	  isConstant(copy->child2)) { 
	if (mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value)) && 
	    mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value))) {
	  tempNode = makeSub(makeVariable(),copyTree(copy->child2));
	  xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  mpfr_init2(*(xrange.a),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value)));
	  mpfr_init2(*(xrange.b),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value)));
	  mpfr_init2(*(yrange.a),tools_precision);
	  mpfr_init2(*(yrange.b),tools_precision);
	  mpfr_set(*(xrange.a),*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),GMP_RNDD);
	  mpfr_set(*(xrange.b),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value),GMP_RNDU);
	  evaluateRangeFunction(yrange, tempNode, xrange, tools_precision);
	  freeThing(copy);
	  copy = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	  freeThing(tempNode);
	  mpfr_clear(*(xrange.a));
	  mpfr_clear(*(xrange.b));
	  mpfr_clear(*(yrange.a));
	  mpfr_clear(*(yrange.b));
	  safeFree(xrange.a);
	  safeFree(xrange.b);
	  safeFree(yrange.a);
	  safeFree(yrange.b);
	} else {
	  pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
	  pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
	  if (pTemp2 > pTemp) pTemp = pTemp2;
	  sollya_mpfi_init2(tempIA,pTemp);
	  sollya_mpfi_init2(tempIB,tools_precision);
	  sollya_mpfi_init2(tempIC,tools_precision);
	  sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
	  evaluateConstantExpressionToSharpInterval(tempIB, copy->child2);
	  sollya_mpfi_sub(tempIC, tempIA, tempIB);
	  freeThing(copy);
	  mpfr_init2(a,tools_precision);
	  mpfr_init2(b,tools_precision);
	  sollya_mpfi_get_left(a,tempIC);
	  sollya_mpfi_get_right(b,tempIC);
	  copy = makeRange(makeConstant(a),makeConstant(b));
	  mpfr_clear(a);
	  mpfr_clear(b);
	  sollya_mpfi_clear(tempIC);
	  sollya_mpfi_clear(tempIB);
	  sollya_mpfi_clear(tempIA);
	}
      } else {
	if (isRangeNonEmpty(copy->child2) &&
	    isPureTree(copy->child1) &&
	    isConstant(copy->child1)) { 
	  if (mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value)) && 
	      mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value))) {
	    tempNode = makeSub(copyTree(copy->child1),makeVariable());
	    xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    mpfr_init2(*(xrange.a),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value)));
	    mpfr_init2(*(xrange.b),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value)));
	    mpfr_init2(*(yrange.a),tools_precision);
	    mpfr_init2(*(yrange.b),tools_precision);
	    mpfr_set(*(xrange.a),*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),GMP_RNDD);
	    mpfr_set(*(xrange.b),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value),GMP_RNDU);
	    evaluateRangeFunction(yrange, tempNode, xrange, tools_precision);
	    freeThing(copy);
	    copy = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	    freeThing(tempNode);
	    mpfr_clear(*(xrange.a));
	    mpfr_clear(*(xrange.b));
	    mpfr_clear(*(yrange.a));
	    mpfr_clear(*(yrange.b));
	    safeFree(xrange.a);
	    safeFree(xrange.b);
	    safeFree(yrange.a);
	    safeFree(yrange.b);
	  } else {
	    pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value));
	    pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
	    if (pTemp2 > pTemp) pTemp = pTemp2;
	    sollya_mpfi_init2(tempIA,pTemp);
	    sollya_mpfi_init2(tempIB,tools_precision);
	    sollya_mpfi_init2(tempIC,tools_precision);
	    sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
	    evaluateConstantExpressionToSharpInterval(tempIB, copy->child1);
	    sollya_mpfi_sub(tempIC, tempIB, tempIA);
	    freeThing(copy);
	    mpfr_init2(a,tools_precision);
	    mpfr_init2(b,tools_precision);
	    sollya_mpfi_get_left(a,tempIC);
	    sollya_mpfi_get_right(b,tempIC);
	    copy = makeRange(makeConstant(a),makeConstant(b));
	    mpfr_clear(a);
	    mpfr_clear(b);
	    sollya_mpfi_clear(tempIC);
	    sollya_mpfi_clear(tempIB);
	    sollya_mpfi_clear(tempIA);
	  }
	}
      }
    }
    break;
  case MUL:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isRangeNonEmpty(copy->child1) && isRangeNonEmpty(copy->child2)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIB,pTemp);
      sollya_mpfi_interv_fr(tempIB,*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_mul(tempIC,tempIA,tempIB);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIB);
      sollya_mpfi_clear(tempIC);
    } else {
      if (isRangeNonEmpty(copy->child1) &&
	  isPureTree(copy->child2) &&
	  isConstant(copy->child2)) { 
	if (mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value)) && 
	    mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value))) {
	  tempNode = makeMul(makeVariable(),copyTree(copy->child2));
	  xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  mpfr_init2(*(xrange.a),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value)));
	  mpfr_init2(*(xrange.b),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value)));
	  mpfr_init2(*(yrange.a),tools_precision);
	  mpfr_init2(*(yrange.b),tools_precision);
	  mpfr_set(*(xrange.a),*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),GMP_RNDD);
	  mpfr_set(*(xrange.b),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value),GMP_RNDU);
	  evaluateRangeFunction(yrange, tempNode, xrange, tools_precision);
	  freeThing(copy);
	  copy = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	  freeThing(tempNode);
	  mpfr_clear(*(xrange.a));
	  mpfr_clear(*(xrange.b));
	  mpfr_clear(*(yrange.a));
	  mpfr_clear(*(yrange.b));
	  safeFree(xrange.a);
	  safeFree(xrange.b);
	  safeFree(yrange.a);
	  safeFree(yrange.b);
	} else {
	  pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
	  pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
	  if (pTemp2 > pTemp) pTemp = pTemp2;
	  sollya_mpfi_init2(tempIA,pTemp);
	  sollya_mpfi_init2(tempIB,tools_precision);
	  sollya_mpfi_init2(tempIC,tools_precision);
	  sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
	  evaluateConstantExpressionToSharpInterval(tempIB, copy->child2);
	  sollya_mpfi_mul(tempIC, tempIA, tempIB);
	  freeThing(copy);
	  mpfr_init2(a,tools_precision);
	  mpfr_init2(b,tools_precision);
	  sollya_mpfi_get_left(a,tempIC);
	  sollya_mpfi_get_right(b,tempIC);
	  copy = makeRange(makeConstant(a),makeConstant(b));
	  mpfr_clear(a);
	  mpfr_clear(b);
	  sollya_mpfi_clear(tempIC);
	  sollya_mpfi_clear(tempIB);
	  sollya_mpfi_clear(tempIA);
	}
      } else {
	if (isRangeNonEmpty(copy->child2) &&
	    isPureTree(copy->child1) &&
	    isConstant(copy->child1)) { 
	  if (mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value)) && 
	      mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value))) {
	    tempNode = makeMul(copyTree(copy->child1),makeVariable());
	    xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    mpfr_init2(*(xrange.a),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value)));
	    mpfr_init2(*(xrange.b),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value)));
	    mpfr_init2(*(yrange.a),tools_precision);
	    mpfr_init2(*(yrange.b),tools_precision);
	    mpfr_set(*(xrange.a),*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),GMP_RNDD);
	    mpfr_set(*(xrange.b),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value),GMP_RNDU);
	    evaluateRangeFunction(yrange, tempNode, xrange, tools_precision);
	    freeThing(copy);
	    copy = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	    freeThing(tempNode);
	    mpfr_clear(*(xrange.a));
	    mpfr_clear(*(xrange.b));
	    mpfr_clear(*(yrange.a));
	    mpfr_clear(*(yrange.b));
	    safeFree(xrange.a);
	    safeFree(xrange.b);
	    safeFree(yrange.a);
	    safeFree(yrange.b);
	  } else {
	    pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value));
	    pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
	    if (pTemp2 > pTemp) pTemp = pTemp2;
	    sollya_mpfi_init2(tempIA,pTemp);
	    sollya_mpfi_init2(tempIB,tools_precision);
	    sollya_mpfi_init2(tempIC,tools_precision);
	    sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
	    evaluateConstantExpressionToSharpInterval(tempIB, copy->child1);
	    sollya_mpfi_mul(tempIC, tempIB, tempIA);
	    freeThing(copy);
	    mpfr_init2(a,tools_precision);
	    mpfr_init2(b,tools_precision);
	    sollya_mpfi_get_left(a,tempIC);
	    sollya_mpfi_get_right(b,tempIC);
	    copy = makeRange(makeConstant(a),makeConstant(b));
	    mpfr_clear(a);
	    mpfr_clear(b);
	    sollya_mpfi_clear(tempIC);
	    sollya_mpfi_clear(tempIB);
	    sollya_mpfi_clear(tempIA);
	  }
	}
      }
    }
    break;
  case DIV:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isRangeNonEmpty(copy->child1) && isRangeNonEmpty(copy->child2)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIB,pTemp);
      sollya_mpfi_interv_fr(tempIB,*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_div(tempIC,tempIA,tempIB);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIB);
      sollya_mpfi_clear(tempIC);
    } else {
      if (isRangeNonEmpty(copy->child1) &&
	  isPureTree(copy->child2) &&
	  isConstant(copy->child2)) { 
	if (mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value)) && 
	    mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value))) {
	  tempNode = makeDiv(makeVariable(),copyTree(copy->child2));
	  xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  mpfr_init2(*(xrange.a),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value)));
	  mpfr_init2(*(xrange.b),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value)));
	  mpfr_init2(*(yrange.a),tools_precision);
	  mpfr_init2(*(yrange.b),tools_precision);
	  mpfr_set(*(xrange.a),*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),GMP_RNDD);
	  mpfr_set(*(xrange.b),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value),GMP_RNDU);
	  evaluateRangeFunction(yrange, tempNode, xrange, tools_precision);
	  freeThing(copy);
	  copy = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	  freeThing(tempNode);
	  mpfr_clear(*(xrange.a));
	  mpfr_clear(*(xrange.b));
	  mpfr_clear(*(yrange.a));
	  mpfr_clear(*(yrange.b));
	  safeFree(xrange.a);
	  safeFree(xrange.b);
	  safeFree(yrange.a);
	  safeFree(yrange.b);
	} else {
	  pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
	  pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
	  if (pTemp2 > pTemp) pTemp = pTemp2;
	  sollya_mpfi_init2(tempIA,pTemp);
	  sollya_mpfi_init2(tempIB,tools_precision);
	  sollya_mpfi_init2(tempIC,tools_precision);
	  sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
	  evaluateConstantExpressionToSharpInterval(tempIB, copy->child2);
	  sollya_mpfi_div(tempIC, tempIA, tempIB);
	  freeThing(copy);
	  mpfr_init2(a,tools_precision);
	  mpfr_init2(b,tools_precision);
	  sollya_mpfi_get_left(a,tempIC);
	  sollya_mpfi_get_right(b,tempIC);
	  copy = makeRange(makeConstant(a),makeConstant(b));
	  mpfr_clear(a);
	  mpfr_clear(b);
	  sollya_mpfi_clear(tempIC);
	  sollya_mpfi_clear(tempIB);
	  sollya_mpfi_clear(tempIA);
	}
      } else {
	if (isRangeNonEmpty(copy->child2) &&
	    isPureTree(copy->child1) &&
	    isConstant(copy->child1)) { 
	  if (mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value)) && 
	      mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value))) {
	    tempNode = makeDiv(copyTree(copy->child1),makeVariable());
	    xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    mpfr_init2(*(xrange.a),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value)));
	    mpfr_init2(*(xrange.b),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value)));
	    mpfr_init2(*(yrange.a),tools_precision);
	    mpfr_init2(*(yrange.b),tools_precision);
	    mpfr_set(*(xrange.a),*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),GMP_RNDD);
	    mpfr_set(*(xrange.b),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value),GMP_RNDU);
	    evaluateRangeFunction(yrange, tempNode, xrange, tools_precision);
	    freeThing(copy);
	    copy = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	    freeThing(tempNode);
	    mpfr_clear(*(xrange.a));
	    mpfr_clear(*(xrange.b));
	    mpfr_clear(*(yrange.a));
	    mpfr_clear(*(yrange.b));
	    safeFree(xrange.a);
	    safeFree(xrange.b);
	    safeFree(yrange.a);
	    safeFree(yrange.b);
	  } else {
	    pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value));
	    pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
	    if (pTemp2 > pTemp) pTemp = pTemp2;
	    sollya_mpfi_init2(tempIA,pTemp);
	    sollya_mpfi_init2(tempIB,tools_precision);
	    sollya_mpfi_init2(tempIC,tools_precision);
	    sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
	    evaluateConstantExpressionToSharpInterval(tempIB, copy->child1);
	    sollya_mpfi_div(tempIC, tempIB, tempIA);
	    freeThing(copy);
	    mpfr_init2(a,tools_precision);
	    mpfr_init2(b,tools_precision);
	    sollya_mpfi_get_left(a,tempIC);
	    sollya_mpfi_get_right(b,tempIC);
	    copy = makeRange(makeConstant(a),makeConstant(b));
	    mpfr_clear(a);
	    mpfr_clear(b);
	    sollya_mpfi_clear(tempIC);
	    sollya_mpfi_clear(tempIB);
	    sollya_mpfi_clear(tempIA);
	  }
	}
      }
    }
    break;
  case SQRT:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_sqrt(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case EXP:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_exp(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case LOG:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_log(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case LOG_2:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_log2(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case LOG_10:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_log10(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case SIN:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_sin(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case COS:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_cos(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case TAN:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_tan(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case ASIN:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_asin(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case ACOS:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_acos(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case ATAN:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_atan(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case SINH:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_sinh(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case COSH:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_cosh(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case TANH:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_tanh(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case ASINH:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_asinh(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case ACOSH:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_acosh(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case ATANH:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_atanh(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case POW:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isRangeNonEmpty(copy->child1) && isRangeNonEmpty(copy->child2)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIB,pTemp);
      sollya_mpfi_interv_fr(tempIB,*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_pow(tempIC,tempIA,tempIB);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIB);
      sollya_mpfi_clear(tempIC);
    } else {
      if (isRangeNonEmpty(copy->child1) &&
	  isPureTree(copy->child2) &&
	  isConstant(copy->child2)) { 
	if (mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value)) && 
	    mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value))) {
	  tempNode = makePow(makeVariable(),copyTree(copy->child2));
	  xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  mpfr_init2(*(xrange.a),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value)));
	  mpfr_init2(*(xrange.b),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value)));
	  mpfr_init2(*(yrange.a),tools_precision);
	  mpfr_init2(*(yrange.b),tools_precision);
	  mpfr_set(*(xrange.a),*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),GMP_RNDD);
	  mpfr_set(*(xrange.b),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value),GMP_RNDU);
	  evaluateRangeFunction(yrange, tempNode, xrange, tools_precision);
	  freeThing(copy);
	  copy = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	  freeThing(tempNode);
	  mpfr_clear(*(xrange.a));
	  mpfr_clear(*(xrange.b));
	  mpfr_clear(*(yrange.a));
	  mpfr_clear(*(yrange.b));
	  safeFree(xrange.a);
	  safeFree(xrange.b);
	  safeFree(yrange.a);
	  safeFree(yrange.b);
	} else {
	  pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
	  pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
	  if (pTemp2 > pTemp) pTemp = pTemp2;
	  sollya_mpfi_init2(tempIA,pTemp);
	  sollya_mpfi_init2(tempIB,tools_precision);
	  sollya_mpfi_init2(tempIC,tools_precision);
	  sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
	  evaluateConstantExpressionToSharpInterval(tempIB, copy->child2);
	  sollya_mpfi_pow(tempIC, tempIA, tempIB);
	  freeThing(copy);
	  mpfr_init2(a,tools_precision);
	  mpfr_init2(b,tools_precision);
	  sollya_mpfi_get_left(a,tempIC);
	  sollya_mpfi_get_right(b,tempIC);
	  copy = makeRange(makeConstant(a),makeConstant(b));
	  mpfr_clear(a);
	  mpfr_clear(b);
	  sollya_mpfi_clear(tempIC);
	  sollya_mpfi_clear(tempIB);
	  sollya_mpfi_clear(tempIA);
	}
      } else {
	if (isRangeNonEmpty(copy->child2) &&
	    isPureTree(copy->child1) &&
	    isConstant(copy->child1)) { 
	  if (mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value)) && 
	      mpfr_number_p(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value))) {
	    tempNode = makePow(copyTree(copy->child1),makeVariable());
	    xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    mpfr_init2(*(xrange.a),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value)));
	    mpfr_init2(*(xrange.b),mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value)));
	    mpfr_init2(*(yrange.a),tools_precision);
	    mpfr_init2(*(yrange.b),tools_precision);
	    mpfr_set(*(xrange.a),*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),GMP_RNDD);
	    mpfr_set(*(xrange.b),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value),GMP_RNDU);
	    evaluateRangeFunction(yrange, tempNode, xrange, tools_precision);
	    freeThing(copy);
	    copy = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	    freeThing(tempNode);
	    mpfr_clear(*(xrange.a));
	    mpfr_clear(*(xrange.b));
	    mpfr_clear(*(yrange.a));
	    mpfr_clear(*(yrange.b));
	    safeFree(xrange.a);
	    safeFree(xrange.b);
	    safeFree(yrange.a);
	    safeFree(yrange.b);
	  } else {
	    pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value));
	    pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
	    if (pTemp2 > pTemp) pTemp = pTemp2;
	    sollya_mpfi_init2(tempIA,pTemp);
	    sollya_mpfi_init2(tempIB,tools_precision);
	    sollya_mpfi_init2(tempIC,tools_precision);
	    sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
	    evaluateConstantExpressionToSharpInterval(tempIB, copy->child1);
	    sollya_mpfi_pow(tempIC, tempIB, tempIA);
	    freeThing(copy);
	    mpfr_init2(a,tools_precision);
	    mpfr_init2(b,tools_precision);
	    sollya_mpfi_get_left(a,tempIC);
	    sollya_mpfi_get_right(b,tempIC);
	    copy = makeRange(makeConstant(a),makeConstant(b));
	    mpfr_clear(a);
	    mpfr_clear(b);
	    sollya_mpfi_clear(tempIC);
	    sollya_mpfi_clear(tempIB);
	    sollya_mpfi_clear(tempIA);
	  }
	}
      }
    }
    break;
  case NEG:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_neg(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case ABS:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_abs(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case DOUBLE:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_round_to_double(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case SINGLE:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_round_to_single(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case QUAD:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_round_to_quad(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case HALFPRECISION:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_round_to_halfprecision(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case DOUBLEDOUBLE:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_round_to_doubledouble(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case TRIPLEDOUBLE:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_round_to_tripledouble(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case ERF:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_erf(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case ERFC:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_erfc(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case LOG_1P:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_log1p(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case EXP_M1:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_expm1(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case DOUBLEEXTENDED:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_round_to_doubleextended(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case LIBRARYFUNCTION:
    copy->libFun = tree->libFun;
    copy->libFunDeriv = tree->libFunDeriv;
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      mpfi_init2(tempID,tools_precision);
      copy->libFun->code(tempID, tempIA, copy->libFunDeriv); 
      sollya_init_and_convert_interval(tempIC, tempID);
      mpfi_clear(tempID);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case PROCEDUREFUNCTION:
    copy->libFunDeriv = tree->libFunDeriv;
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      computeFunctionWithProcedure(tempIC, copy->child2, tempIA, (unsigned int) copy->libFunDeriv);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case LIBRARYCONSTANT:
    copy->libFun = tree->libFun;
    break;
  case CEIL:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_ceil(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case FLOOR:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_floor(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case NEARESTINT:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRangeNonEmpty(copy->child1)) {
      pTemp = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value));
      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      if (pTemp2 > pTemp) pTemp = pTemp2;
      sollya_mpfi_init2(tempIA,pTemp);
      sollya_mpfi_interv_fr(tempIA,*(accessThruMemRef(accessThruMemRef(copy->child1)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child1)->child2)->value));
      sollya_mpfi_init2(tempIC,tools_precision);
      sollya_mpfi_nearestint(tempIC,tempIA);
      freeThing(copy);
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      sollya_mpfi_get_left(a,tempIC);
      sollya_mpfi_get_right(b,tempIC);
      copy = makeRange(makeConstant(a),makeConstant(b));
      mpfr_clear(a);
      mpfr_clear(b);
      sollya_mpfi_clear(tempIA);
      sollya_mpfi_clear(tempIC);
    }
    break;
  case PI_CONST:
    break;
  case AND:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isBoolean(copy->child1) && isBoolean(copy->child2)) {
      if ((accessThruMemRef(copy->child1)->nodeType == TRUE) &&
	  (accessThruMemRef(copy->child2)->nodeType == TRUE)) {
	copy->nodeType = TRUE;
      } else {
	copy->nodeType = FALSE;
      }
      freeThing(copy->child1);
      freeThing(copy->child2);
    }
    break;
  case OR:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isBoolean(copy->child1) && isBoolean(copy->child2)) {
      if ((accessThruMemRef(copy->child1)->nodeType == FALSE) &&
	  (accessThruMemRef(copy->child2)->nodeType == FALSE)) {
	copy->nodeType = FALSE;
      } else {
	copy->nodeType = TRUE;
      }
      freeThing(copy->child1);
      freeThing(copy->child2);
    }
    break;
  case NEGATION:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isBoolean(copy->child1)) {
      if (accessThruMemRef(copy->child1)->nodeType == FALSE) {
	copy->nodeType = TRUE;
      } else {
	copy->nodeType = FALSE;
      }
      freeThing(copy->child1);
    }
    break;
  case INDEX:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isString(copy->child1) || isPureList(copy->child1) || isPureFinalEllipticList(copy->child1)) {
      if (evaluateThingToInteger(&resA,copy->child2,NULL)) {
	if (isString(copy->child1)) {
	  if ((resA >= 0) && (resA < (int)strlen(accessThruMemRef(copy->child1)->string))) {
	    if (timingString != NULL) pushTimeCounter();
	    tempString = (char *) safeCalloc(2,sizeof(char));
	    tempString[0] = (accessThruMemRef(copy->child1)->string)[resA];
	    copy->nodeType = STRING;
	    copy->string = tempString;
	    freeThing(copy->child1);
	    freeThing(copy->child2);
	    if (timingString != NULL) popTimeCounter(timingString);
	  }
	} else {
	  if (isPureList(copy->child1)) {
	    if ((accessThruMemRef(copy->child1)->argArray != NULL) &&
		((resA >= 0) && (resA < accessThruMemRef(copy->child1)->argArraySize))) {
              if (timingString != NULL) pushTimeCounter();
              tempNode = copyThing((accessThruMemRef(copy->child1)->argArray)[(accessThruMemRef(copy->child1)->argArraySize - 1) - resA]);
              freeThing(copy);
              copy = tempNode;
              if (timingString != NULL) popTimeCounter(timingString);
	    } else {
	      if (resA >= 0) {
		setupRandomAccessOnLists(copy->child1);
		if (resA < lengthChain(accessThruMemRef(copy->child1)->arguments)) {
		  if (timingString != NULL) pushTimeCounter();
		  tempNode = copyThing((node *) accessInList(accessThruMemRef(copy->child1)->arguments, resA));
		  freeThing(copy);
		  copy = tempNode;
		  if (timingString != NULL) popTimeCounter(timingString);
		}
	      }
	    }
	  } else {
	    if (isPureFinalEllipticList(copy->child1)) {
	      if ((accessThruMemRef(copy->child1)->argArray != NULL) &&
		  ((resA >= 0) && (resA < accessThruMemRef(copy->child1)->argArraySize))) {
		if (timingString != NULL) pushTimeCounter();
		tempNode = copyThing((accessThruMemRef(copy->child1)->argArray)[(accessThruMemRef(copy->child1)->argArraySize - 1) - resA]);
		freeThing(copy);
		copy = tempNode;
		if (timingString != NULL) popTimeCounter(timingString);
	      } else {
		if (resA >= 0) {
		  setupRandomAccessOnLists(copy->child1);
		  if (resA < lengthChain(accessThruMemRef(copy->child1)->arguments)) {
		    if (timingString != NULL) pushTimeCounter();
		    tempNode = copyThing((node *) accessInList(accessThruMemRef(copy->child1)->arguments, resA));
		    freeThing(copy);
		    copy = tempNode;
		    if (timingString != NULL) popTimeCounter(timingString);
		  } else {
		    if (isPureTree((node *) accessInList(accessThruMemRef(copy->child1)->arguments,
							 lengthChain(accessThruMemRef(copy->child1)->arguments) - 1))) {
		      mpfr_init2(a, tools_precision);
		      if (evaluateThingToConstant(a,
						  (node *) accessInList(accessThruMemRef(copy->child1)->arguments,
									lengthChain(accessThruMemRef(copy->child1)->arguments) - 1),
						  NULL, 0, 0)) {
			if (mpfr_integer_p(a)) {
			  resB = mpfr_get_si(a, GMP_RNDN);
			  mpfr_init2(b, 8 * sizeof(resB) + 5);
			  mpfr_set_si(b, resB, GMP_RNDN);
			  if (mpfr_cmp(a, b) == 0) {
			    resB = resA + resB - lengthChain(accessThruMemRef(copy->child1)->arguments) + 1;
			    mpfr_set_si(b, resB, GMP_RNDN);
			    if (timingString != NULL) pushTimeCounter();
			    tempNode = makeConstant(b);
			    freeThing(copy);
			    copy = tempNode;
			    if (timingString != NULL) popTimeCounter(timingString);
			  } else {
			    if (timingString != NULL) pushTimeCounter();
			    tempNode = copyThing((node *) accessInList(accessThruMemRef(copy->child1)->arguments,
								       lengthChain(accessThruMemRef(copy->child1)->arguments) - 1));
			    freeThing(copy);
			    copy = tempNode;
			    if (timingString != NULL) popTimeCounter(timingString);
			  }
			  mpfr_clear(b);
			} else {
			  if (timingString != NULL) pushTimeCounter();
			  tempNode = copyThing((node *) accessInList(accessThruMemRef(copy->child1)->arguments,
								     lengthChain(accessThruMemRef(copy->child1)->arguments) - 1));
			  freeThing(copy);
			  copy = tempNode;
			  if (timingString != NULL) popTimeCounter(timingString);
			}
		      } else {
			if (timingString != NULL) pushTimeCounter();
			tempNode = copyThing((node *) accessInList(accessThruMemRef(copy->child1)->arguments,
								   lengthChain(accessThruMemRef(copy->child1)->arguments) - 1));
			freeThing(copy);
			copy = tempNode;
			if (timingString != NULL) popTimeCounter(timingString);
		      }
		      mpfr_clear(a);
		    } else {
		      if (timingString != NULL) pushTimeCounter();
		      tempNode = copyThing((node *) accessInList(accessThruMemRef(copy->child1)->arguments,
								 lengthChain(accessThruMemRef(copy->child1)->arguments) - 1));
		      freeThing(copy);
		      copy = tempNode;
		      if (timingString != NULL) popTimeCounter(timingString);
		    }
		  }
		}
	      }
	    }
	  }
	}
      }
    }
    break;
  case COMPAREEQUAL:
    resJ = 0;
    copy->child1 = evaluateThing(tree->child1);
    copy->child2 = evaluateThing(tree->child2);
    if (timingString != NULL) pushTimeCounter();
    if ((isError(copy->child1) && (!isError(tree->child1)) && (!isError(tree->child2))) ||
	(isError(copy->child2) && (!isError(tree->child2)) && (!isError(tree->child1)))) {
      printMessage(1,SOLLYA_MSG_TEST_COMPARES_ERROR_TO_SOMETHING,"Warning: the evaluation of one of the sides of an equality test yields error due to a syntax error or an error on a side-effect.\nThe other side either also yields error due to an syntax or side-effect error or does not evaluate to error.\nThe boolean returned may be meaningless.\n");
    }
    if (isEqualThing(copy->child1,copy->child2)) {
      if (!isError(copy->child1)) {
	freeThing(copy);
	copy = makeTrue();
      } else {
	freeThing(copy);
	copy = makeFalse();
      }
    } else {
      if (isPureTree(copy->child1) &&
	  isPureTree(copy->child2) &&
	  isConstant(copy->child1) &&
	  isConstant(copy->child2)) {
        if (checkInequalityFast(&resF, copy->child1, copy->child2)) {
          freeThing(copy);
          copy = makeFalse();
        } else {
          mpfr_init2(a,tools_precision);
          mpfr_init2(b,tools_precision);
          if ((resA = evaluateThingToConstant(a,copy->child1,NULL,1,1)) &&
              (resB = evaluateThingToConstant(b,copy->child2,NULL,1,1))) {
            if ((resA == 3) || (resB == 3)) {
	      if ((mpfr_number_p(a) || (resA == 2)) && (mpfr_number_p(b) || (resB == 2))) {
		printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_THAT_IS_NOT_FAITHFUL,"Warning: equality test relies on floating-point result that is not faithfully evaluated.\n");
	      } else {
		if (resJ) {
		  printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: equality test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
		  resJ = 1;
		}
	      }
	    }
	    if ((!resJ) && (!((mpfr_number_p(a) || (resA == 2)) && (mpfr_number_p(b) || (resB == 2))))) {
	      printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: equality test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
	      resJ = 1;
	    }
            resC = mpfr_equal_p(a,b);
            if ((resA == 1) || (resB == 1)) {
              if (mpfr_number_p(a) && mpfr_number_p(b)) {
                resE = 0;
                if (resC) {
                  /* a == b */
                  resE = 1;
                } else {
                  /* a != b */
                  if (mpfr_cmp(a,b) < 0) {
                    /* a < b */
                    if (resA == 1) mpfr_nextabove(a);
                    if (resB == 1) mpfr_nextbelow(b);
                    resE = (mpfr_cmp(a,b) >= 0);
                  } else {
                    /* b < a */
                    if (resA == 1) mpfr_nextbelow(a);
                    if (resB == 1) mpfr_nextabove(b);
                    resE = (mpfr_cmp(a,b) <= 0);
                  }
                }
                if (resE) {
                  if (compareConstant(&resD, copy->child1, copy->child2, NULL, 0)) {
                    resC = (resD == 0);
                  } else {
                    printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_UNDECIDED,"Warning: the tool is unable to decide an equality test by evaluation even though faithful evaluation of the terms has been possible. The terms will be considered to be equal.\n");
		    resC = 1;
		  }
                } else
                  printMessage(2,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT,"Information: equality test relies on floating-point result.\n");
              } else {
		if ((!((mpfr_number_p(a) || (resA == 2)) && (mpfr_number_p(b) || (resB == 2)))) && (!resJ)) {
		  printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: equality test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
		  resJ = 1;
		}
	      }
            }
            if (resC) {
              freeThing(copy);
              copy = makeTrue();
            } else {
              freeThing(copy);
              copy = makeFalse();
            }
          }
          mpfr_clear(a);
          mpfr_clear(b);
        }
      } else {
	freeThing(copy);
	copy = makeFalse();
      }
    }
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case COMPAREIN:
    copy->child1 = evaluateThing(tree->child1);
    copy->child2 = evaluateThing(tree->child2);
    resE = 0;
    if (isPureTree(copy->child1) &&
	isConstant(copy->child1) &&
	isRange(copy->child2)) {
      if (timingString != NULL) pushTimeCounter();
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      mpfr_init2(c,tools_precision);
      if (evaluateThingToRange(b,c,copy->child2)) {
	tempNode = makeConstant(b);
	tempNode2 = makeConstant(c);
	resI = ((checkInequalityFast(&resJ, tempNode, copy->child1)) &&
		(checkInequalityFast(&resK, copy->child1, tempNode2)));
	free_memory(tempNode);
	free_memory(tempNode2);
	if (resI) {
	  if ((resJ <= 0) && (resK <= 0)) {
	    freeThing(copy);
	    copy = makeTrue();
	  } else {
	    freeThing(copy);
	    copy = makeFalse();
	  }
	  resE = 1;
	} else {
	  if ((resA = evaluateThingToConstant(a,copy->child1,NULL,1,1))) {
	    if (resA == 3)
	      printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_THAT_IS_NOT_FAITHFUL,"Warning: containment test relies on floating-point result that is not faithfully evaluated.\n");
	    resC = ((mpfr_cmp(b,a) <= 0) &&
		    (mpfr_cmp(a,c) <= 0) &&
		    (!mpfr_unordered_p(a,b)) &&
		    (!mpfr_unordered_p(a,c)));
	    resH = (mpfr_number_p(a) && mpfr_number_p(b) && mpfr_number_p(c));
	    resB = 0;
	    if (resA == 1) {
	      mpfr_init2(d,mpfr_get_prec(a));
	      mpfr_set(d,a,GMP_RNDN);
	      if (resC) {
		/* b <= a <= c */
		mpfr_nextbelow(a);
		resB = (resC != ((mpfr_cmp(b,a) <= 0) &&
				 (mpfr_cmp(a,c) <= 0) &&
				 (!mpfr_unordered_p(a,b)) &&
				 (!mpfr_unordered_p(a,c))));
		if (!resB) {
		  mpfr_set(a,d,GMP_RNDN);
		  mpfr_nextabove(a);
		  resB = (resC != ((mpfr_cmp(b,a) <= 0) &&
				   (mpfr_cmp(a,c) <= 0) &&
				   (!mpfr_unordered_p(a,b)) &&
				   (!mpfr_unordered_p(a,c))));
		}
	      } else {
		/* a < b or c < a */
		mpfr_nextabove(a);
		resB = (resC != ((mpfr_cmp(b,a) <= 0) &&
				 (mpfr_cmp(a,c) <= 0) &&
				 (!mpfr_unordered_p(a,b)) &&
				 (!mpfr_unordered_p(a,c))));
		if (!resB) {
		  mpfr_set(a,d,GMP_RNDN);
		  mpfr_nextbelow(a);
		  resB = (resC != ((mpfr_cmp(b,a) <= 0) &&
				   (mpfr_cmp(a,c) <= 0) &&
				   (!mpfr_unordered_p(a,b)) &&
				   (!mpfr_unordered_p(a,c))));
		}
	      }
	      if (resB) {
		tempNode = makeConstant(b);
		tempNode2 = makeConstant(c);
		if (compareConstant(&resA, tempNode, copy->child1, NULL, 0) &&
		    compareConstant(&resB, copy->child1, tempNode2, NULL, 0)) {
		  resC = (resA <= 0) && (resB <= 0);
		} else {
		  if (resH) {
		    printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_UNDECIDED,"Warning: the tool is unable to decide a containment test by evaluation even though faithful evaluation of the terms has been possible. The terms will be considered to be equal.\n");
		    resC = 1;
		  } else {
		    printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: containment test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
		  }
		}
		freeThing(tempNode);
		freeThing(tempNode2);
	      } else
		printMessage(2,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT,"Information: containment test relies on floating-point result.\n");
	      mpfr_clear(d);
	    }
	    if (resC) {
	      freeThing(copy);
	      copy = makeTrue();
	    } else {
	      freeThing(copy);
	      copy = makeFalse();
	    }
	    resE = 1;
	  }
	}
      }
      mpfr_clear(a);
      mpfr_clear(b);
      mpfr_clear(c);
      if (timingString != NULL) popTimeCounter(timingString);
    }
    if ((!resE) &&
	isRange(copy->child1) &&
	isRange(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      mpfr_init2(c,tools_precision);
      mpfr_init2(d,tools_precision);
      if (evaluateThingToRange(a,b,copy->child1) &&
	  evaluateThingToRange(c,d,copy->child2)) {
	resC = ((mpfr_cmp(c,a) <= 0) && (!mpfr_unordered_p(c,a)) &&
		(mpfr_cmp(b,d) <= 0) && (!mpfr_unordered_p(b,d)));
	if (resC) {
	  freeThing(copy);
	  copy = makeTrue();
	} else {
	  freeThing(copy);
	  copy = makeFalse();
	}
      }
      mpfr_clear(a);
      mpfr_clear(b);
      mpfr_clear(c);
      mpfr_clear(d);
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case COMPARELESS:
    copy->child1 = evaluateThing(tree->child1);
    copy->child2 = evaluateThing(tree->child2);
    if (isPureTree(copy->child1) &&
	isPureTree(copy->child2) &&
	isConstant(copy->child1) &&
	isConstant(copy->child2)) {
      if (timingString != NULL) pushTimeCounter();
      if (checkInequalityFast(&resF, copy->child1, copy->child2)) {
        if (resF < 0) {
          freeThing(copy);
          copy = makeTrue();
        } else {
          freeThing(copy);
          copy = makeFalse();
        }
      } else {
        mpfr_init2(a,tools_precision);
        mpfr_init2(b,tools_precision);
        if ((resA = evaluateThingToConstant(a,copy->child1,NULL,1,1)) &&
            (resB = evaluateThingToConstant(b,copy->child2,NULL,1,1))) {
	  resI = ((mpfr_number_p(a) || (resA == 2)) && (mpfr_number_p(b) || (resB == 2)));
	  resJ = 0;
          if ((resA == 3) || (resB == 3)) {
	    if (resI) {
	      printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_THAT_IS_NOT_FAITHFUL,"Warning: inequality test relies on floating-point result that is not faithfully evaluated.\n");
	    } else {
	      printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: inequality test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
	      resJ = 1;
	    }
	  }
          resC = ((mpfr_cmp(a,b) < 0) && (!mpfr_unordered_p(a,b)));
	  resH = (mpfr_number_p(a) && mpfr_number_p(b));
          if ((resA == 1) || (resB == 1)) {
            if (resC) {
              /* a < b */
              if (resA == 1) mpfr_nextabove(a);
              if (resB == 1) mpfr_nextbelow(b);
            } else {
              /* a >= b */
              if (resA == 1) mpfr_nextbelow(a);
              if (resB == 1) mpfr_nextabove(b);
            }
            if ((mpfr_cmp(a,b) < 0) != resC) {
              if (compareConstant(&resD, copy->child1, copy->child2, NULL, 0)) {
                resC = (resD < 0);
              } else {
		if (resH) {
		  printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_UNDECIDED,"Warning: the tool is unable to decide an inequality test by evaluation even though faithful evaluation of the terms has been possible. The terms will be considered to be equal.\n");
		  resC = 0;
		} else {
		  if ((!resI) && (!resJ)) {
		    printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: inequality test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
		  }
		}
	      }
            } else
              printMessage(2,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT,"Information: inequality test relies on floating-point result.\n");
          }
          if (resC) {
            freeThing(copy);
            copy = makeTrue();
          } else {
            freeThing(copy);
            copy = makeFalse();
          }
        }
        mpfr_clear(a);
        mpfr_clear(b);
      }
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case MIN:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    curr = copy->arguments;
    if (isList((node *) (curr->value))) {
      curr = accessThruMemRef(((node *) (curr->value)))->arguments;
      resE = 1;
      while (curr != NULL) {
        if (!(isPureTree((node *) (curr->value)) &&
              isConstant((node *) (curr->value)))) {
          resE = 0;
          break;
        }
        curr = curr->next;
      }
      if (resE) {
        if (timingString != NULL) pushTimeCounter();
        curr = copy->arguments;
        curr = accessThruMemRef(((node *) (curr->value)))->arguments;
        if (curr->next == NULL) {
          tempNode = copyThing((node *) (curr->value));
          freeThing(copy);
          copy = tempNode;
        } else {
          tempNode = (node *) (curr->value);
	  resK = 0;
	  resM = 0;
          curr = curr->next;
          while (curr != NULL) {
            tempNode2 = (node *) (curr->value);
            if (checkInequalityFast(&resF, tempNode, tempNode2)) {
              if (resF > 0) {
                tempNode = tempNode2;
		resK = 0;
		resM = 0;
              }
            } else {
              mpfr_init2(a,tools_precision);
              mpfr_init2(b,tools_precision);
              if ((resA = evaluateThingToConstant(a,tempNode,NULL,1,1)) &&
                  (resB = evaluateThingToConstant(b,tempNode2,NULL,1,1))) {
		resL = 0;
		resN = 0;
		resI = ((mpfr_number_p(a) || (resA == 2)) && (mpfr_number_p(b) || (resB == 2)));
		resJ = 0;
                if ((resA == 3) || (resB == 3)) {
		  if (resI) {
		    resN = 1;
		  } else {
		    printMessage(1,SOLLYA_MSG_MIN_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: minimum computation relies on floating-point result that is faithfully evaluated and at least one of the terms is not a real number.\n");
		    resJ = 1;
		  }
		}
                resC = ((mpfr_cmp(a,b) < 0) && (!mpfr_unordered_p(a,b)));
		resG = mpfr_number_p(b);
		resH = (mpfr_number_p(a) && mpfr_number_p(b));
                if ((resA == 1) || (resB == 1)) {
                  if (resC) {
                    /* a < b */
                    if (resA == 1) mpfr_nextabove(a);
                    if (resB == 1) mpfr_nextbelow(b);
                  } else {
                    /* a >= b */
                    if (resA == 1) mpfr_nextbelow(a);
                    if (resB == 1) mpfr_nextabove(b);
                  }
                  if ((mpfr_cmp(a,b) < 0) != resC) {
                    if (compareConstant(&resD, tempNode, tempNode2, NULL, 0)) {
                      resC = (resD < 0);
		      resG = 1;
                    } else {
		      if (resH) {
			resL = 1;
			resC = 0;
		      } else {
			if ((!resI) && (!resJ)) {
			  printMessage(1,SOLLYA_MSG_MIN_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: minimum computation relies on floating-point result that is faithfully evaluated and at least one of the terms is not a real number.\n");
			}
		      }
		    }
                  } else
                    printMessage(2,SOLLYA_MSG_MIN_RELIES_ON_FP_RESULT,"Information: minimum computation relies on floating-point result.\n");
                }
                if ((!resC) && (resG)) {
                  tempNode = tempNode2;
		  resK = resL;
		  resM = resN;
                }
		resK = resK || resL;
		resM = resM || resN;
              } else {
                resE = 0;
              }
              mpfr_clear(a);
              mpfr_clear(b);
            }
            curr = curr->next;
          }
          if (resE) {
	    if (resK) {
	      printMessage(1,SOLLYA_MSG_MIN_RELIES_ON_FP_RESULT_FAITHFUL_BUT_UNDECIDED,"Warning: the tool is unable to decide a minimum computation by evaluation even though faithful evaluation of the terms has been possible. The terms will be considered to be equal.\n");
	    }
	    if (resM) {
	      printMessage(1,SOLLYA_MSG_MIN_RELIES_ON_FP_RESULT_THAT_IS_NOT_FAITHFUL,"Warning: minimum computation relies on floating-point result that is not faithfully evaluated.\n");
	    }
            tempNode3 = copyThing(tempNode);
            freeThing(copy);
            copy = tempNode3;
          }
        }
        if (timingString != NULL) popTimeCounter(timingString);
      }
    } else {
      resE = 1;
      while (curr != NULL) {
        if (!(isPureTree((node *) (curr->value)) &&
              isConstant((node *) (curr->value)))) {
          resE = 0;
          break;
        }
        curr = curr->next;
      }
      if (resE) {
        if (timingString != NULL) pushTimeCounter();
        curr = copy->arguments;
        if (curr->next == NULL) {
          tempNode = copyThing((node *) (curr->value));
          freeThing(copy);
          copy = tempNode;
        } else {
          tempNode = (node *) (curr->value);
          curr = curr->next;
	  resK = 0;
	  resM = 0;
          while (curr != NULL) {
            tempNode2 = (node *) (curr->value);
            if (checkInequalityFast(&resF, tempNode, tempNode2)) {
              if (resF > 0) {
                tempNode = tempNode2;
		resK = 0;
		resM = 0;
              }
            } else {
              mpfr_init2(a,tools_precision);
              mpfr_init2(b,tools_precision);
              if ((resA = evaluateThingToConstant(a,tempNode,NULL,1,1)) &&
                  (resB = evaluateThingToConstant(b,tempNode2,NULL,1,1))) {
		resL = 0;
		resN = 0;
		resI = ((mpfr_number_p(a) || (resA == 2)) && (mpfr_number_p(b) || (resB == 2)));
		resJ = 0;
                if ((resA == 3) || (resB == 3))  {
		  if (resI) {
		    resN = 1;
		  } else {
		    printMessage(1,SOLLYA_MSG_MIN_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: minimum computation relies on floating-point result that is faithfully evaluated and at least one of the terms is not a real number.\n");
		    resJ = 1;
		  }
		}
                resC = ((mpfr_cmp(a,b) < 0) && (!mpfr_unordered_p(a,b)));
		resG = mpfr_number_p(b);
		resH = (mpfr_number_p(a) && mpfr_number_p(b));
                if ((resA == 1) || (resB == 1)) {
                  if (resC) {
                    /* a < b */
                    if (resA == 1) mpfr_nextabove(a);
                    if (resB == 1) mpfr_nextbelow(b);
                  } else {
                    /* a >= b */
                    if (resA == 1) mpfr_nextbelow(a);
                    if (resB == 1) mpfr_nextabove(b);
                  }
                  if ((mpfr_cmp(a,b) < 0) != resC) {
                    if (compareConstant(&resD, tempNode, tempNode2, NULL, 0)) {
                      resC = (resD < 0);
		      resG = 1;
                    } else {
		      if (resH) {
			resL = 1;
			resC = 0;
		      } else {
			if ((!resI) && (resJ)) {
			  printMessage(1,SOLLYA_MSG_MIN_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: minimum computation relies on floating-point result that is faithfully evaluated and at least one of the terms is not a real number.\n");
			}
		      }
		    }
                  } else
                    printMessage(2,SOLLYA_MSG_MIN_RELIES_ON_FP_RESULT,"Information: minimum computation relies on floating-point result.\n");
                }
                if ((!resC) && (resG)) {
                  tempNode = tempNode2;
		  resK = resL;
		  resM = resN;
                }
		resK = resK || resL;
		resM = resM || resN;
              } else {
                resE = 0;
              }
              mpfr_clear(a);
              mpfr_clear(b);
            }
            curr = curr->next;
          }
          if (resE) {
	    if (resK) {
	      printMessage(1,SOLLYA_MSG_MIN_RELIES_ON_FP_RESULT_FAITHFUL_BUT_UNDECIDED,"Warning: the tool is unable to decide a minimum computation by evaluation even though faithful evaluation of the terms has been possible. The terms will be considered to be equal.\n");
	    }
	    if (resM) {
	      printMessage(1,SOLLYA_MSG_MIN_RELIES_ON_FP_RESULT_THAT_IS_NOT_FAITHFUL,"Warning: minimum computation relies on floating-point result that is not faithfully evaluated.\n");
	    }
            tempNode3 = copyThing(tempNode);
            freeThing(copy);
            copy = tempNode3;
          }
        }
        if (timingString != NULL) popTimeCounter(timingString);
      }
    }
    break;
  case MAX:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    curr = copy->arguments;
    if (isList((node *) (curr->value))) {
      curr = accessThruMemRef(((node *) (curr->value)))->arguments;
      resE = 1;
      while (curr != NULL) {
        if (!(isPureTree((node *) (curr->value)) &&
              isConstant((node *) (curr->value)))) {
          resE = 0;
          break;
        }
        curr = curr->next;
      }
      if (resE) {
        if (timingString != NULL) pushTimeCounter();
        curr = copy->arguments;
        curr = accessThruMemRef(((node *) (curr->value)))->arguments;
        if (curr->next == NULL) {
          tempNode = copyThing((node *) (curr->value));
          freeThing(copy);
          copy = tempNode;
        } else {
          tempNode = (node *) (curr->value);
	  resK = 0;
	  resM = 0;
          curr = curr->next;
          while (curr != NULL) {
            tempNode2 = (node *) (curr->value);
            if (checkInequalityFast(&resF, tempNode, tempNode2)) {
              if (resF < 0) {
                tempNode = tempNode2;
		resK = 0;
		resM = 0;
              }
            } else {
              mpfr_init2(a,tools_precision);
              mpfr_init2(b,tools_precision);
              if ((resA = evaluateThingToConstant(a,tempNode,NULL,1,1)) &&
                  (resB = evaluateThingToConstant(b,tempNode2,NULL,1,1))) {
		resL = 0;
		resN = 0;
		resI = ((mpfr_number_p(a) || (resA == 2)) && (mpfr_number_p(b) || (resB == 2)));
		resJ = 0;
                if ((resA == 3) || (resB == 3)) {
		  if (resI) {
		    resN = 1;
		  } else {
		    printMessage(1,SOLLYA_MSG_MAX_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: maximum computation relies on floating-point result that is faithfully evaluated and at least one of the terms is not a real number.\n");
		    resJ = 1;
		  }
		}
                resC = ((mpfr_cmp(a,b) < 0) || (mpfr_unordered_p(a,b)));
		resG = mpfr_number_p(b);
		resH = (mpfr_number_p(a) && mpfr_number_p(b));
                if ((resA == 1) || (resB == 1)) {
                  if (resC) {
                    /* a < b */
                    if (resA == 1) mpfr_nextabove(a);
                    if (resB == 1) mpfr_nextbelow(b);
                  } else {
                    /* a >= b */
                    if (resA == 1) mpfr_nextbelow(a);
                    if (resB == 1) mpfr_nextabove(b);
                  }
                  if ((mpfr_cmp(a,b) < 0) != resC) {
                    if (compareConstant(&resD, tempNode, tempNode2, NULL, 0)) {
                      resC = (resD < 0);
		      resG = 1;
                    } else {
		      if (resH) {
			resL = 1;
			resC = 0;
		      } else {
			if ((!resI) && (!resJ)) {
			  printMessage(1,SOLLYA_MSG_MAX_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: maximum computation relies on floating-point result that is faithfully evaluated and at least one of the terms is not a real number.\n");
			}
		      }
		    }
                  } else
                    printMessage(2,SOLLYA_MSG_MAX_RELIES_ON_FP_RESULT,"Information: maximum computation relies on floating-point result.\n");
                }
                if (resC && resG) {
                  tempNode = tempNode2;
		  resK = resL;
		  resM = resN;
                }
		resK = resK || resL;
		resM = resM || resN;
              } else {
                resE = 0;
              }
              mpfr_clear(a);
              mpfr_clear(b);
            }
            curr = curr->next;
          }
          if (resE) {
	    if (resK) {
	      printMessage(1,SOLLYA_MSG_MAX_RELIES_ON_FP_RESULT_FAITHFUL_BUT_UNDECIDED,"Warning: the tool is unable to decide a maximum computation by evaluation even though faithful evaluation of the terms has been possible. The terms will be considered to be equal.\n");
	    }
	    if (resM) {
	      printMessage(1,SOLLYA_MSG_MAX_RELIES_ON_FP_RESULT_THAT_IS_NOT_FAITHFUL,"Warning: maximum computation relies on floating-point result that is not faithfully evaluated.\n");
	    }
            tempNode3 = copyThing(tempNode);
            freeThing(copy);
            copy = tempNode3;
          }
        }
        if (timingString != NULL) popTimeCounter(timingString);
      }
    } else {
      resE = 1;
      while (curr != NULL) {
        if (!(isPureTree((node *) (curr->value)) &&
              isConstant((node *) (curr->value)))) {
          resE = 0;
          break;
        }
        curr = curr->next;
      }
      if (resE) {
        if (timingString != NULL) pushTimeCounter();
        curr = copy->arguments;
        if (curr->next == NULL) {
          tempNode = copyThing((node *) (curr->value));
          freeThing(copy);
          copy = tempNode;
        } else {
          tempNode = (node *) (curr->value);
	  resK = 0;
	  resM = 0;
          curr = curr->next;
          while (curr != NULL) {
            tempNode2 = (node *) (curr->value);
            if (checkInequalityFast(&resF, tempNode, tempNode2)) {
              if (resF < 0) {
                tempNode = tempNode2;
		resK = 0;
		resM = 0;
              }
            } else {
              mpfr_init2(a,tools_precision);
              mpfr_init2(b,tools_precision);
              if ((resA = evaluateThingToConstant(a,tempNode,NULL,1,1)) &&
                  (resB = evaluateThingToConstant(b,tempNode2,NULL,1,1))) {
		resL = 0;
		resN = 0;
		resI = ((mpfr_number_p(a) || (resA == 2)) && (mpfr_number_p(b) || (resB == 2)));
		resJ = 0;
                if ((resA == 3) || (resB == 3)) {
		  if (resI) {
		    resN = 1;
		  } else {
		    printMessage(1,SOLLYA_MSG_MAX_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: maximum computation relies on floating-point result that is faithfully evaluated and at least one of the terms is not a real number.\n");
		    resJ = 1;
		  }
		}
                resC = ((mpfr_cmp(a,b) < 0) || (mpfr_unordered_p(a,b)));
		resG = mpfr_number_p(b);
		resH = (mpfr_number_p(a) && mpfr_number_p(b));
                if ((resA == 1) || (resB == 1)) {
                  if (resC) {
                    /* a < b */
                    if (resA == 1) mpfr_nextabove(a);
                    if (resB == 1) mpfr_nextbelow(b);
                  } else {
                    /* a >= b */
                    if (resA == 1) mpfr_nextbelow(a);
                    if (resB == 1) mpfr_nextabove(b);
                  }
                  if ((mpfr_cmp(a,b) < 0) != resC) {
                    if (compareConstant(&resD, tempNode, tempNode2, NULL, 0)) {
                      resC = (resD < 0);
		      resG = 1;
                    } else {
		      if (resH) {
			resL = 1;
			resC = 0;
		      } else {
			if ((!resI) && (!resJ)) {
			  printMessage(1,SOLLYA_MSG_MAX_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: maximum computation relies on floating-point result that is faithfully evaluated and at least one of the terms is not a real number.\n");
			}
		      }
		    }
                  } else
                    printMessage(2,SOLLYA_MSG_MAX_RELIES_ON_FP_RESULT,"Information: maximum computation relies on floating-point result.\n");
                }
                if (resC && resG) {
                  tempNode = tempNode2;
		  resK = resL;
		  resM = resN;
                }
		resK = resK || resL;
		resM = resM || resN;
              } else {
                resE = 0;
              }
              mpfr_clear(a);
              mpfr_clear(b);
            }
            curr = curr->next;
          }
          if (resE) {
	    if (resK) {
	      printMessage(1,SOLLYA_MSG_MAX_RELIES_ON_FP_RESULT_FAITHFUL_BUT_UNDECIDED,"Warning: the tool is unable to decide a maximum computation by evaluation even though faithful evaluation of the terms has been possible. The terms will be considered to be equal.\n");
	    }
	    if (resM) {
	      printMessage(1,SOLLYA_MSG_MAX_RELIES_ON_FP_RESULT_THAT_IS_NOT_FAITHFUL,"Warning: maximum computation relies on floating-point result that is not faithfully evaluated.\n");
	    }
            tempNode3 = copyThing(tempNode);
            freeThing(copy);
            copy = tempNode3;
          }
        }
        if (timingString != NULL) popTimeCounter(timingString);
      }
    }
    break;
  case COMPAREGREATER:
    copy->child1 = evaluateThing(tree->child1);
    copy->child2 = evaluateThing(tree->child2);
    if (isPureTree(copy->child1) &&
	isPureTree(copy->child2) &&
	isConstant(copy->child1) &&
	isConstant(copy->child2)) {
      if (timingString != NULL) pushTimeCounter();
      if (checkInequalityFast(&resF, copy->child1, copy->child2)) {
        if (resF > 0) {
          freeThing(copy);
          copy = makeTrue();
        } else {
          freeThing(copy);
          copy = makeFalse();
        }
      } else {
        mpfr_init2(a,tools_precision);
        mpfr_init2(b,tools_precision);
        if ((resA = evaluateThingToConstant(a,copy->child1,NULL,1,1)) &&
            (resB = evaluateThingToConstant(b,copy->child2,NULL,1,1))) {
	  resI = ((mpfr_number_p(a) || (resA == 2)) && (mpfr_number_p(b) || (resB == 2)));
	  resJ = 0;
          if ((resA == 3) || (resB == 3)) {
	    if (resI) {
	      printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_THAT_IS_NOT_FAITHFUL,"Warning: inequality test relies on floating-point result that is not faithfully evaluated.\n");
	    } else {
	      printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: inequality test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
	      resJ = 1;
	    }
	  }
          resC = ((mpfr_cmp(a,b) > 0) && (!mpfr_unordered_p(a,b)));
	  resH = (mpfr_number_p(a) && mpfr_number_p(b));
          if ((resA == 1) || (resB == 1)) {
            if (resC) {
              /* a > b */
              if (resA == 1) mpfr_nextbelow(a);
              if (resB == 1) mpfr_nextabove(b);
            } else {
              /* a <= b */
              if (resA == 1) mpfr_nextabove(a);
              if (resB == 1) mpfr_nextbelow(b);
            }
            if ((mpfr_cmp(a,b) > 0) != resC) {
              if (compareConstant(&resD, copy->child1, copy->child2, NULL, 0)) {
                resC = (resD > 0);
              } else {
		if (resH) {
		  printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_UNDECIDED,"Warning: the tool is unable to decide an inequality test by evaluation even though faithful evaluation of the terms has been possible. The terms will be considered to be equal.\n");
		  resC = 0;
		} else {
		  if ((!resI) && (!resJ)) {
		    printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: inequality test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
		  }
		}
	      }
            } else
              printMessage(2,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT,"Information: inequality test relies on floating-point result.\n");
          }
          if (resC) {
            freeThing(copy);
            copy = makeTrue();
          } else {
            freeThing(copy);
            copy = makeFalse();
          }
        }
        mpfr_clear(a);
        mpfr_clear(b);
      }
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case COMPARELESSEQUAL:
    copy->child1 = evaluateThing(tree->child1);
    copy->child2 = evaluateThing(tree->child2);
    if (isPureTree(copy->child1) &&
	isPureTree(copy->child2) &&
	isConstant(copy->child1) &&
	isConstant(copy->child2)) {
      if (timingString != NULL) pushTimeCounter();
      if (checkInequalityFast(&resF, copy->child1, copy->child2)) {
        if (resF < 0) {
          freeThing(copy);
          copy = makeTrue();
        } else {
          freeThing(copy);
          copy = makeFalse();
        }
      } else {
        mpfr_init2(a,tools_precision);
        mpfr_init2(b,tools_precision);
        if ((resA = evaluateThingToConstant(a,copy->child1,NULL,1,1)) &&
            (resB = evaluateThingToConstant(b,copy->child2,NULL,1,1))) {
	  resI = ((mpfr_number_p(a) || (resA == 2)) && (mpfr_number_p(b) || (resB == 2)));
	  resJ = 0;
          if ((resA == 3) || (resB == 3)) {
	    if (resI) {
	      printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_THAT_IS_NOT_FAITHFUL,"Warning: inequality test relies on floating-point result that is not faithfully evaluated.\n");
	    } else {
	      printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: inequality test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
	      resJ = 1;
	    }
	  }
          resC = ((mpfr_cmp(a,b) <= 0) && (!mpfr_unordered_p(a,b)));
	  resH = (mpfr_number_p(a) && mpfr_number_p(b));
          if ((resA == 1) || (resB == 1)) {
            if (resC) {
              /* a <= b */
              if (resA == 1) mpfr_nextabove(a);
              if (resB == 1) mpfr_nextbelow(b);
            } else {
              /* a > b */
              if (resA == 1) mpfr_nextbelow(a);
              if (resB == 1) mpfr_nextabove(b);
            }
            if ((mpfr_cmp(a,b) <= 0) != resC) {
              if (compareConstant(&resD, copy->child1, copy->child2, NULL, 0)) {
                resC = (resD <= 0);
              } else {
		if (resH) {
		  printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_UNDECIDED,"Warning: the tool is unable to decide an inequality test by evaluation even though faithful evaluation of the terms has been possible. The terms will be considered to be equal.\n");
		  resC = 1;
		} else {
		  if ((!resI) && (!resJ)) {
		    printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: inequality test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
		  }
		}
	      }
            } else
              printMessage(2,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT,"Information: inequality test relies on floating-point result.\n");
          }
          if (resC) {
            freeThing(copy);
            copy = makeTrue();
          } else {
            freeThing(copy);
            copy = makeFalse();
          }
        }
        mpfr_clear(a);
        mpfr_clear(b);
      }
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case COMPAREGREATEREQUAL:
    copy->child1 = evaluateThing(tree->child1);
    copy->child2 = evaluateThing(tree->child2);
    if (isPureTree(copy->child1) &&
	isPureTree(copy->child2) &&
	isConstant(copy->child1) &&
	isConstant(copy->child2)) {
      if (timingString != NULL) pushTimeCounter();
      if (checkInequalityFast(&resF, copy->child1, copy->child2)) {
        if (resF > 0) {
          freeThing(copy);
          copy = makeTrue();
        } else {
          freeThing(copy);
          copy = makeFalse();
        }
      } else {
        mpfr_init2(a,tools_precision);
        mpfr_init2(b,tools_precision);
        if ((resA = evaluateThingToConstant(a,copy->child1,NULL,1,1)) &&
            (resB = evaluateThingToConstant(b,copy->child2,NULL,1,1))) {
	  resI = ((mpfr_number_p(a) || (resA == 2)) && (mpfr_number_p(b) || (resB == 2)));
	  resJ = 0;
          if ((resA == 3) || (resB == 3)) {
            if (resI) {
	      printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_THAT_IS_NOT_FAITHFUL,"Warning: inequality test relies on floating-point result that is not faithfully evaluated.\n");
	    } else {
	      printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: inequality test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
	      resJ = 1;
	    }
	  }
          resC = ((mpfr_cmp(a,b) >= 0) && (!mpfr_unordered_p(a,b)));
	  resH = (mpfr_number_p(a) && mpfr_number_p(b));
          if ((resA == 1) || (resB == 1)) {
            if (resC) {
              /* a >= b */
              if (resA == 1) mpfr_nextbelow(a);
              if (resB == 1) mpfr_nextabove(b);
            } else {
              /* a < b */
              if (resA == 1) mpfr_nextabove(a);
              if (resB == 1) mpfr_nextbelow(b);
            }
            if ((mpfr_cmp(a,b) >= 0) != resC) {
              if (compareConstant(&resD, copy->child1, copy->child2, NULL, 0)) {
                resC = (resD >= 0);
              } else {
		if (resH) {
		  printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_UNDECIDED,"Warning: the tool is unable to decide an inequality test by evaluation even though faithful evaluation of the terms has been possible. The terms will be considered to be equal.\n");
		  resC = 1;
		} else {
		  if ((!resI) && (!resJ)) {
		    printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: inequality test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
		  }
		}
	      }
            } else
              printMessage(2,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT,"Information: inequality test relies on floating-point result.\n");
          }
          if (resC) {
            freeThing(copy);
            copy = makeTrue();
          } else {
            freeThing(copy);
            copy = makeFalse();
          }
        }
        mpfr_clear(a);
        mpfr_clear(b);
      }
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case COMPARENOTEQUAL:
    resJ = 0;
    copy->child1 = evaluateThing(tree->child1);
    copy->child2 = evaluateThing(tree->child2);
    if (timingString != NULL) pushTimeCounter();
    if ((isError(copy->child1) && (!isError(tree->child1)) && (!isError(tree->child2))) ||
	(isError(copy->child2) && (!isError(tree->child2)) && (!isError(tree->child1)))) {
      printMessage(1,SOLLYA_MSG_TEST_COMPARES_ERROR_TO_SOMETHING,"Warning: the evaluation of one of the sides of an equality test yields error due to a syntax error or an error on a side-effect.\nThe other side either also yields error due to an syntax or side-effect error or does not evaluate to error.\nThe boolean returned may be meaningless.\n");
    }
    if (isEqualThing(copy->child1,copy->child2)) {
      if (!isError(copy->child1)) {
	freeThing(copy);
	copy = makeFalse();
      } else {
	freeThing(copy);
	copy = makeFalse();
      }
    } else {
      if (isPureTree(copy->child1) &&
	  isPureTree(copy->child2) &&
	  isConstant(copy->child1) &&
	  isConstant(copy->child2)) {
        if (checkInequalityFast(&resF, copy->child1, copy->child2)) {
          freeThing(copy);
          copy = makeTrue();
        } else {
          mpfr_init2(a,tools_precision);
          mpfr_init2(b,tools_precision);
          if ((resA = evaluateThingToConstant(a,copy->child1,NULL,1,1)) &&
              (resB = evaluateThingToConstant(b,copy->child2,NULL,1,1))) {
	    resI = ((mpfr_number_p(a) || (resA == 2)) && (mpfr_number_p(b) || (resB == 2)));
            if ((resA == 3) || (resB == 3)) {
              if (resI) {
		printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_THAT_IS_NOT_FAITHFUL,"Warning: equality test relies on floating-point result that is not faithfully evaluated.\n");
	      } else {
		if (!resJ) {
		  printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: equality test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
		  resJ = 1;
		}
	      }
	    }
            resC = !(mpfr_equal_p(a,b) || mpfr_unordered_p(a,b));
	    resH = (mpfr_number_p(a) && mpfr_number_p(b));
            if ((resA == 1) || (resB == 1)) {
              if (mpfr_number_p(a) && mpfr_number_p(b)) {
                resE = 0;
                if (!resC) {
                  /* a == b */
                  resE = 1;
                } else {
                  /* a != b */
                  if (mpfr_cmp(a,b) < 0) {
                    /* a < b */
                    if (resA == 1) mpfr_nextabove(a);
                    if (resB == 1) mpfr_nextbelow(b);
                    resE = (mpfr_cmp(a,b) >= 0);
                  } else {
                    /* b < a */
                    if (resA == 1) mpfr_nextbelow(a);
                    if (resB == 1) mpfr_nextabove(b);
                    resE = (mpfr_cmp(a,b) <= 0);
                  }
                }
                if (resE) {
                  if (compareConstant(&resD, copy->child1, copy->child2, NULL, 0)) {
                    resC = (resD != 0);
                  } else {
		    if (resH) {
		      printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_UNDECIDED,"Warning: the tool is unable to decide an equality test by evaluation even though faithful evaluation of the terms has been possible. The terms will be considered to be equal.\n");
		      resC = 0;
		    } else {
		      if ((!resI) && (!resJ)) {
			printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: equality test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
			resJ = 1;
		      }
		    }
		  }
                } else
                  printMessage(2,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT,"Information: equality test relies on floating-point result.\n");
              } else {
		if ((!((mpfr_number_p(a) || (resA == 2)) && (mpfr_number_p(b) || (resB == 2)))) && (!resJ)) {
		  printMessage(1,SOLLYA_MSG_TEST_RELIES_ON_FP_RESULT_FAITHFUL_BUT_NOT_REAL,"Warning: equality test relies on floating-point result that is faithfully evaluated and at least one of the sides is not a real number.\n");
		  resJ = 1;
		}
	      }
            }
            if (resC) {
              freeThing(copy);
              copy = makeTrue();
            } else {
              freeThing(copy);
              copy = makeFalse();
            }
          }
          mpfr_clear(a);
          mpfr_clear(b);
        }
      } else {
	if (!(isError(copy->child1) || isError(copy->child2))) {
	  freeThing(copy);
	  copy = makeTrue();
	} else {
	  freeThing(copy);
	  copy = makeFalse();
	}
      }
    }
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case CONCAT:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isString(copy->child1) && isString(copy->child2)) {
      if (timingString != NULL) pushTimeCounter();
      tempString = (char *) safeCalloc(strlen(accessThruMemRef(copy->child1)->string) + strlen(accessThruMemRef(copy->child2)->string) + 1, sizeof(char));
      sprintf(tempString,"%s%s",accessThruMemRef(copy->child1)->string,accessThruMemRef(copy->child2)->string);
      freeThing(copy->child1);
      freeThing(copy->child2);
      copy->nodeType = STRING;
      copy->string = tempString;
      if (timingString != NULL) popTimeCounter(timingString);
    } else {
      if (isString(copy->child1) && isPureTree(copy->child2) && isConstant(copy->child2)) {
	if (timingString != NULL) pushTimeCounter();
	mpfr_init2(a,tools_precision);
	if (evaluateThingToConstant(a, copy->child2, NULL,0,0)) {
	  tempString2 = sprintValue(&a);
	  tempString = (char *) safeCalloc(strlen(accessThruMemRef(copy->child1)->string) + strlen(tempString2) + 1, sizeof(char));
	  sprintf(tempString,"%s%s",accessThruMemRef(copy->child1)->string,tempString2);
	  freeThing(copy->child1);
	  freeThing(copy->child2);
	  copy->nodeType = STRING;
	  copy->string = tempString;
	  safeFree(tempString2);
	}
	mpfr_clear(a);
	if (timingString != NULL) popTimeCounter(timingString);
      } else {
	if (isString(copy->child2) && isPureTree(copy->child1) && isConstant(copy->child1)) {
	  if (timingString != NULL) pushTimeCounter();
	  mpfr_init2(a,tools_precision);
	  if (evaluateThingToConstant(a, copy->child1, NULL,0,0)) {
	    tempString2 = sprintValue(&a);
	    tempString = (char *) safeCalloc(strlen(accessThruMemRef(copy->child2)->string) + strlen(tempString2) + 1, sizeof(char));
	    sprintf(tempString,"%s%s",tempString2,accessThruMemRef(copy->child2)->string);
	    freeThing(copy->child1);
	    freeThing(copy->child2);
	    copy->nodeType = STRING;
	    copy->string = tempString;
	    safeFree(tempString2);
	  }
	  mpfr_clear(a);
	  if (timingString != NULL) popTimeCounter(timingString);
	} else {
	  if (isString(copy->child1)) {
	    if (timingString != NULL) pushTimeCounter();
	    tempNode2 = evaluateThing(copy->child2);
	    if (!isError(tempNode2) || isError(copy->child2)) {
	      tempString2 = sPrintThing(tempNode2);
	      tempString = (char *) safeCalloc(strlen(accessThruMemRef(copy->child1)->string) + strlen(tempString2) + 1, sizeof(char));
	      sprintf(tempString,"%s%s",accessThruMemRef(copy->child1)->string,tempString2);
	      freeThing(copy->child1);
	      freeThing(copy->child2);
	      copy->nodeType = STRING;
	      copy->string = tempString;
	      safeFree(tempString2);
	    }
	    freeThing(tempNode2);
	    if (timingString != NULL) popTimeCounter(timingString);
	  } else {
	    if (isString(copy->child2)) {
	      if (timingString != NULL) pushTimeCounter();
	      tempNode2 = evaluateThing(copy->child1);
	      if (!isError(tempNode2) || isError(copy->child1)) {
		tempString2 = sPrintThing(tempNode2);
		tempString = (char *) safeCalloc(strlen(accessThruMemRef(copy->child2)->string) + strlen(tempString2) + 1, sizeof(char));
		sprintf(tempString,"%s%s",tempString2,accessThruMemRef(copy->child2)->string);
		freeThing(copy->child1);
		freeThing(copy->child2);
		copy->nodeType = STRING;
		copy->string = tempString;
		safeFree(tempString2);
	      }
	      freeThing(tempNode2);
	      if (timingString != NULL) popTimeCounter(timingString);
	    } else {
	      if (isEmptyList(copy->child1) && isEmptyList(copy->child2)) {
		freeThing(copy->child1);
		freeThing(copy->child2);
		copy->nodeType = EMPTYLIST;
	      } else {
		if (isEmptyList(copy->child1) && (isList(copy->child2) || isFinalEllipticList(copy->child2))) {
		  copy->nodeType = accessThruMemRef(copy->child2)->nodeType;
		  copy->arguments = copyChainWithoutReversal(accessThruMemRef(copy->child2)->arguments,copyThingOnVoid);
		  copy->argArray = NULL;
		  copy->argArraySize = 0;
		  copy->argArrayAllocSize = 0;
		  freeThing(copy->child1);
		  freeThing(copy->child2);
		} else {
		  if (isEmptyList(copy->child2) && isList(copy->child1)) {
		    if (timingString != NULL) pushTimeCounter();
		    copy->nodeType = LIST;
		    copy->arguments = copyChainWithoutReversal(accessThruMemRef(copy->child1)->arguments,copyThingOnVoid);
		    copy->argArray = NULL;
		    copy->argArraySize = 0;
		    copy->argArrayAllocSize = 0;
		    freeThing(copy->child2);
		    freeThing(copy->child1);
		    if (timingString != NULL) popTimeCounter(timingString);
		  } else {
		    if (isList(copy->child1) && isList(copy->child2)) {
		      if (timingString != NULL) pushTimeCounter();
		      copy->nodeType = LIST;
		      copy->arguments = concatChains(copyChainWithoutReversal(accessThruMemRef(copy->child1)->arguments,copyThingOnVoid),
						     copyChainWithoutReversal(accessThruMemRef(copy->child2)->arguments,copyThingOnVoid));
		      copy->argArray = NULL;
		      copy->argArraySize = 0;
		      copy->argArrayAllocSize = 0;
		      freeThing(copy->child1);
		      freeThing(copy->child2);
		      if (timingString != NULL) popTimeCounter(timingString);
		    } else {
		      if (isList(copy->child1) && isFinalEllipticList(copy->child2)) {
			if (timingString != NULL) pushTimeCounter();
			copy->nodeType = FINALELLIPTICLIST;
			copy->arguments = concatChains(copyChainWithoutReversal(accessThruMemRef(copy->child1)->arguments,copyThingOnVoid),
						       copyChainWithoutReversal(accessThruMemRef(copy->child2)->arguments,copyThingOnVoid));
			copy->argArray = NULL;
			copy->argArraySize = 0;
			copy->argArrayAllocSize = 0;
			freeThing(copy->child1);
			freeThing(copy->child2);
			if (timingString != NULL) popTimeCounter(timingString);
		      } else {
			if (isProcedure(copy->child1) &&
			    (isList(copy->child2) ||
			     ((accessThruMemRef(copy->child1)->nodeType == PROCILLIM) && isFinalEllipticList(copy->child2)))) {
			  tempChain = copyChainWithoutReversal(accessThruMemRef(copy->child2)->arguments, evaluateThingOnVoid);
			  tempNode = evaluateThing(copy->child1);
			  tempNode2 = NULL;
			  if (executeProcedure(&tempNode2, tempNode, tempChain, isFinalEllipticList(copy->child2))) {
			    if (tempNode2 != NULL) {
			      freeThing(copy);
			      copy = tempNode2;
			    }
			  } else {
			    printMessage(1,SOLLYA_MSG_ERROR_WHILE_EXECUTING_A_PROCEDURE,"Warning: an error occurred while executing a procedure.\n");
                            considerDyingOnError();
			    freeThing(copy);
			    copy = makeError();
			  }
			  freeChain(tempChain, freeThingOnVoid);
			  freeThing(tempNode);
			} else {
			  if (isProcedure(copy->child1) && isEmptyList(copy->child2)) {
			    tempNode = evaluateThing(copy->child1);
			    tempNode2 = NULL;
			    if (executeProcedure(&tempNode2, tempNode, NULL, 0)) {
			      if (tempNode2 != NULL) {
				freeThing(copy);
				copy = tempNode2;
			      }
			    } else {
			      printMessage(1,SOLLYA_MSG_ERROR_WHILE_EXECUTING_A_PROCEDURE,"Warning: an error occurred while executing a procedure.\n");
                              considerDyingOnError();
			      freeThing(copy);
			      copy = makeError();
			    }
			    freeThing(tempNode);
			  }
			}
		      }
		    }
		  }
		}
	      }
	    }
	  }
	}
      }
    }
    break;
  case ADDTOLIST:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isList(copy->child2)) {
      if (timingString != NULL) pushTimeCounter();
      copy->nodeType = LIST;
      copy->arguments = addElement(copyChainWithoutReversal(accessThruMemRef(copy->child2)->arguments, copyThingOnVoid),copy->child1);
      copy->argArray = NULL;
      copy->argArraySize = 0;
      copy->argArrayAllocSize = 0;
      freeThing(copy->child2);
      if (timingString != NULL) popTimeCounter(timingString);
    } else {
      if (isEmptyList(copy->child2)) {
	if (timingString != NULL) pushTimeCounter();
	copy->nodeType = LIST;
	copy->arguments = addElement(NULL, copy->child1);
	copy->argArray = NULL;
	copy->argArraySize = 0;
	copy->argArrayAllocSize = 0;
	freeThing(copy->child2);
	if (timingString != NULL) popTimeCounter(timingString);
      } else {
	if (isFinalEllipticList(copy->child2)) {
	  if (timingString != NULL) pushTimeCounter();
	  copy->nodeType = FINALELLIPTICLIST;
	  copy->arguments = addElement(copyChainWithoutReversal(accessThruMemRef(copy->child2)->arguments, copyThingOnVoid),copy->child1);
	  copy->argArray = NULL;
	  copy->argArraySize = 0;
	  copy->argArrayAllocSize = 0;
	  freeThing(copy->child2);
	  if (timingString != NULL) popTimeCounter(timingString);
	} else {
	  if (isList(copy->child1)) {
	    if (timingString != NULL) pushTimeCounter();
	    tempChain = addElement(copyChain(accessThruMemRef(copy->child1)->arguments,copyThingOnVoid),copyThing(copy->child2));
	    tempNode = makeList(copyChain(tempChain,copyThingOnVoid));
	    freeChain(tempChain,freeThingOnVoid);
	    freeThing(copy);
	    copy = tempNode;
	    if (timingString != NULL) popTimeCounter(timingString);
	  } else {
	    if (isEmptyList(copy->child1)) {
	      if (timingString != NULL) pushTimeCounter();
	      copy->nodeType = LIST;
	      copy->arguments = addElement(NULL, copy->child2);
	      copy->argArray = NULL;
	      copy->argArraySize = 0;
	      copy->argArrayAllocSize = 0;
	      freeThing(copy->child1);
	      if (timingString != NULL) popTimeCounter(timingString);
	    }
	  }
	}
      }
    }
    break;
  case PREPEND:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isList(copy->child2)) {
      if (timingString != NULL) pushTimeCounter();
      copy->nodeType = LIST;
      copy->arguments = addElement(copyChainWithoutReversal(accessThruMemRef(copy->child2)->arguments, copyThingOnVoid),copy->child1);
      copy->argArray = NULL;
      copy->argArraySize = 0;
      copy->argArrayAllocSize = 0;
      setupRandomAccessOnLists(copy);
      freeThing(copy->child2);
      if (timingString != NULL) popTimeCounter(timingString);
    } else {
      if (isEmptyList(copy->child2)) {
	if (timingString != NULL) pushTimeCounter();
	copy->nodeType = LIST;
	copy->arguments = addElement(NULL, copy->child1);
	copy->argArray = NULL;
	copy->argArraySize = 0;
	copy->argArrayAllocSize = 0;
	setupRandomAccessOnLists(copy);
	freeThing(copy->child2);
	if (timingString != NULL) popTimeCounter(timingString);
      } else {
	if (isFinalEllipticList(copy->child2)) {
	  if (timingString != NULL) pushTimeCounter();
	  copy->nodeType = FINALELLIPTICLIST;
	  copy->arguments = addElement(copyChainWithoutReversal(accessThruMemRef(copy->child2)->arguments, copyThingOnVoid),copy->child1);
	  copy->argArray = NULL;
	  copy->argArraySize = 0;
	  copy->argArrayAllocSize = 0;
	  setupRandomAccessOnLists(copy);
	  freeThing(copy->child2);
	  if (timingString != NULL) popTimeCounter(timingString);
	}
      }
    }
    break;
  case APPEND:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isList(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      tempChain = addElement(copyChain(accessThruMemRef(copy->child1)->arguments,copyThingOnVoid),copyThing(copy->child2));
      tempNode = makeList(copyChain(tempChain,copyThingOnVoid));
      freeChain(tempChain,freeThingOnVoid);
      freeThing(copy);
      copy = tempNode;
      if (timingString != NULL) popTimeCounter(timingString);
    } else {
      if (isEmptyList(copy->child1)) {
	if (timingString != NULL) pushTimeCounter();
	copy->nodeType = LIST;
	copy->arguments = addElement(NULL, copy->child2);
	copy->argArray = NULL;
	copy->argArraySize = 0;
	copy->argArrayAllocSize = 0;
	freeThing(copy->child1);
	if (timingString != NULL) popTimeCounter(timingString);
      }
    }
    break;
  case ON:
    break;
  case OFF:
    break;
  case DYADIC:
    break;
  case POWERS:
    break;
  case BINARY:
    break;
  case HEXADECIMAL:
    break;
  case FILESYM:
    break;
  case POSTSCRIPT:
    break;
  case POSTSCRIPTFILE:
    break;
  case PERTURB:
    break;
  case ROUNDDOWN:
    break;
  case ROUNDUP:
    break;
  case ROUNDTOZERO:
    break;
  case ROUNDTONEAREST:
    break;
  case HONORCOEFF:
    break;
  case TRUE:
    break;
  case UNIT:
    break;
  case FALSE:
    break;
  case DEFAULT:
    break;
  case DECIMAL:
    break;
  case ABSOLUTESYM:
    break;
  case RELATIVESYM:
    break;
  case FIXED:
    break;
  case FLOATING:
    break;
  case ERRORSPECIAL:
    break;
  case DOUBLESYMBOL:
    break;
  case SINGLESYMBOL:
    break;
  case QUADSYMBOL:
    break;
  case HALFPRECISIONSYMBOL:
    break;
  case DOUBLEEXTENDEDSYMBOL:
    break;
  case DOUBLEDOUBLESYMBOL:
    break;
  case TRIPLEDOUBLESYMBOL:
    break;
  case STRING:
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    break;
  case TABLEACCESS:
    if (timingString != NULL) pushTimeCounter();
    if ((tempNode = getThingFromTable(tree->string, 1, NULL)) == NULL) {
      if (variablename == NULL) {
	variablename = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
	strcpy(variablename, tree->string);
      } else {
	printMessage(1,SOLLYA_MSG_IDENTIFIER_NOT_ASSIGNED_TO,"Warning: the identifier \"%s\" is neither assigned to, nor bound to a library function nor external procedure, nor equal to the current free variable.\n",tree->string);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"Will interpret \"%s\" as \"%s\".\n",tree->string,variablename);
      }
      tempNode = makeVariable();
    }
    safeFree(copy);
    copy = evaluateThingInner(tempNode);
    freeThing(tempNode);
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case ISBOUND:
    if (timingString != NULL) pushTimeCounter();
    if ((tempNode = getThingFromTable(tree->string, 1, NULL)) != NULL) {
      freeThing(tempNode);
      tempNode = makeTrue();
    } else {
      if ((variablename != NULL) &&
	  (strcmp(variablename,tree->string) == 0)) {
	tempNode = makeTrue();
      } else {
	tempNode = makeFalse();
      }
    }
    safeFree(copy);
    copy = tempNode;
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case TABLEACCESSWITHSUBSTITUTE:
    if (timingString != NULL) pushTimeCounter();
    undoVariableTrick = 0;
    if (variablename == NULL) {
      variablename = (char *) safeCalloc(4, sizeof(char));
      variablename[0] = '_';
      variablename[1] = 'x';
      variablename[2] = '_';
      undoVariableTrick = 1;
    }
    if ((tempNode = getThingFromTable(tree->string, 1, NULL)) == NULL) {
      if (undoVariableTrick) {
	safeFree(variablename);
	variablename = NULL;
	undoVariableTrick = 0;
      }
      if (variablename == NULL) {
	variablename = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
	strcpy(variablename, tree->string);
      } else {
	printMessage(1,SOLLYA_MSG_IDENTIFIER_NOT_ASSIGNED_TO,"Warning: the identifier \"%s\" is neither assigned to, nor bound to a library function nor external procedure, nor equal to the current free variable.\n",tree->string);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"Will interpret \"%s\" as \"%s\".\n",tree->string,variablename);
      }
      tempNode = makeVariable();
    }
    if (undoVariableTrick) {
      safeFree(variablename);
      variablename = NULL;
      undoVariableTrick = 0;
    }
    if (isPureTree(tempNode)) {
      if (lengthChain(tree->arguments) == 1) {
	if (evaluateThingToPureTree(&tempNode2,(node *) (tree->arguments->value))) {
	  safeFree(copy);
	  if (accessThruMemRef(tempNode)->nodeType == VARIABLE) {
	    if (variablename != NULL) {
	      printMessage(1,SOLLYA_MSG_FREE_VAR_INTERPRETED_AS_IDENTITY_FUNCTION,"Warning: the identifier \"%s\" is bound to the current free variable. In a functional context it will be considered as the identity function.\n",
			   variablename);
	    } else {
	      printMessage(1,SOLLYA_MSG_FREE_VAR_INTERPRETED_AS_IDENTITY_FUNCTION,"Warning: \"_x_\" is the free variable. In a functional context it will be considered as the identity function.\n");
	    }
	  }
	  copy = substitute(tempNode, tempNode2);
	  freeThing(tempNode2);
	} else {
	  mpfr_init2(a,tools_precision);
	  mpfr_init2(b,tools_precision);
	  if (evaluateThingToRange(a,b,(node *) (tree->arguments->value))) {
	    xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    mpfr_init2(*(xrange.a),mpfr_get_prec(a));
	    mpfr_init2(*(xrange.b),mpfr_get_prec(b));
	    mpfr_init2(*(yrange.a),tools_precision);
	    mpfr_init2(*(yrange.b),tools_precision);
	    mpfr_set(*(xrange.a),a,GMP_RNDD);
	    mpfr_set(*(xrange.b),b,GMP_RNDU);
	    evaluateRangeFunction(yrange, tempNode, xrange, tools_precision);
	    safeFree(copy);
	    copy = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	    mpfr_clear(*(xrange.a));
	    mpfr_clear(*(xrange.b));
	    mpfr_clear(*(yrange.a));
	    mpfr_clear(*(yrange.b));
	    safeFree(xrange.a);
	    safeFree(xrange.b);
	    safeFree(yrange.a);
	    safeFree(yrange.b);
	  } else {
	    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
	    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
	    strcpy(copy->string,tree->string);
	  }
	  mpfr_clear(a);
	  mpfr_clear(b);
	}
      } else {
	copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
	copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
	strcpy(copy->string,tree->string);
      }
    } else {
      if (isExternalProcedureUsage(tempNode)) {
	tempChain = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
	tempNode2 = NULL;
	if (executeExternalProcedure(&tempNode2, accessThruMemRef(tempNode)->libProc, tempChain)) {
	  if (tempNode2 != NULL) {
	    safeFree(copy);
	    copy = tempNode2;
	    freeChain(tempChain, freeThingOnVoid);
	  } else {
	    copy->arguments = tempChain;
	    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
	    strcpy(copy->string,tree->string);
	  }
	} else {
	  printMessage(1,SOLLYA_MSG_EXTERNAL_PROCEDURE_SIGNALED_FAILURE,"Warning: external procedure has signalized failure.\n");
          considerDyingOnError();
	  safeFree(copy);
	  copy = makeError();
	  freeChain(tempChain, freeThingOnVoid);
	}
      } else {
	if (isProcedure(tempNode)) {
	  tempChain = copyChainWithoutReversal(tree->arguments, evaluateThingOnVoid);
	  tempNode2 = NULL;
	  if (executeProcedure(&tempNode2, accessThruMemRef(tempNode), tempChain, 0)) {
	    if (tempNode2 != NULL) {
	      safeFree(copy);
	      copy = tempNode2;
	      freeChain(tempChain, freeThingOnVoid);
	    } else {
	      copy->arguments = tempChain;
	      copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
	      strcpy(copy->string,tree->string);
	    }
	  } else {
	    printMessage(1,SOLLYA_MSG_ERROR_WHILE_EXECUTING_A_PROCEDURE,"Warning: an error occurred while executing a procedure.\n");
            considerDyingOnError();
	    safeFree(copy);
	    copy = makeError();
	    freeChain(tempChain, freeThingOnVoid);
	  }
	} else {
	  copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
	  copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
	  strcpy(copy->string,tree->string);
	}
      }
    }
    freeThing(tempNode);
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case STRUCTACCESS:
    if (isStructure(tree->child1) &&
	(!associationContainsDoubleEntries(accessThruMemRef(tree->child1)->arguments))) {
      tempChain = accessThruMemRef(tree->child1)->arguments;
      resA = 0; tempNode = NULL;
      while ((!resA) && (tempChain != NULL)) {
	if (!strcmp(tree->string,((entry *) (tempChain->value))->name)) {
	  resA = 1;
	  tempNode = (node *) (((entry *) (tempChain->value))->value);
	}
	tempChain = tempChain->next;
      }
      if ((resA) && (tempNode != NULL)) {
	safeFree(copy);
	copy = evaluateThing(tempNode);
      } else {
        copy->child1 = evaluateThingInner(tree->child1);
        copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
        strcpy(copy->string,tree->string);
      }
    } else {
      copy->child1 = evaluateThingInner(tree->child1);
      copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
      strcpy(copy->string,tree->string);
      if (isStructure(copy->child1) &&
	  (!associationContainsDoubleEntries(accessThruMemRef(copy->child1)->arguments))) {
	tempChain = accessThruMemRef(copy->child1)->arguments;
	resA = 0; tempNode = NULL;
	while ((!resA) && (tempChain != NULL)) {
	  if (!strcmp(copy->string,((entry *) (tempChain->value))->name)) {
	    resA = 1;
	    tempNode = (node *) (((entry *) (tempChain->value))->value);
	  }
	  tempChain = tempChain->next;
	}
	if ((resA) && (tempNode != NULL)) {
	  tempNode2 = evaluateThing(tempNode);
	  freeThing(copy);
	  copy = tempNode2;
	}
      }
    }
    break;
  case EXTERNALPROCEDUREUSAGE:
    copy->libProc = tree->libProc;
    break;
  case APPLY:
    if (timingString != NULL) pushTimeCounter();
    tempNode = evaluateThingInner(tree->child1);
    if (isPureTree(tempNode)) {
      if (lengthChain(tree->arguments) == 1) {
	if (evaluateThingToPureTree(&tempNode2,(node *) (tree->arguments->value))) {
	  safeFree(copy);
	  if (accessThruMemRef(tempNode)->nodeType == VARIABLE) {
	    if (variablename != NULL) {
	      printMessage(1,SOLLYA_MSG_FREE_VAR_INTERPRETED_AS_IDENTITY_FUNCTION,"Warning: the identifier \"%s\" is bound to the current free variable. In a functional context it will be considered as the identity function.\n",
			   variablename);
	    } else {
	      printMessage(1,SOLLYA_MSG_FREE_VAR_INTERPRETED_AS_IDENTITY_FUNCTION,"Warning: \"_x_\" is the free variable. In a functional context it will be considered as the identity function.\n");
	    }
	  }
	  copy = substitute(tempNode, tempNode2);
	  freeThing(tempNode2);
	} else {
	  mpfr_init2(a,tools_precision);
	  mpfr_init2(b,tools_precision);
	  if (evaluateThingToRange(a,b,(node *) (tree->arguments->value))) {
	    xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    mpfr_init2(*(xrange.a),mpfr_get_prec(a));
	    mpfr_init2(*(xrange.b),mpfr_get_prec(b));
	    mpfr_init2(*(yrange.a),tools_precision);
	    mpfr_init2(*(yrange.b),tools_precision);
	    mpfr_set(*(xrange.a),a,GMP_RNDD);
	    mpfr_set(*(xrange.b),b,GMP_RNDU);
	    evaluateRangeFunction(yrange, tempNode, xrange, tools_precision);
	    safeFree(copy);
	    copy = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	    mpfr_clear(*(xrange.a));
	    mpfr_clear(*(xrange.b));
	    mpfr_clear(*(yrange.a));
	    mpfr_clear(*(yrange.b));
	    safeFree(xrange.a);
	    safeFree(xrange.b);
	    safeFree(yrange.a);
	    safeFree(yrange.b);
	  } else {
	    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
	    copy->child1 = copyThing(tempNode);
	  }
	  mpfr_clear(a);
	  mpfr_clear(b);
	}
      } else {
        copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
        copy->child1 = copyThing(tempNode);
      }
    } else {
      if (isExternalProcedureUsage(tempNode)) {
	tempChain = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
	tempNode2 = NULL;
	if (executeExternalProcedure(&tempNode2, accessThruMemRef(tempNode)->libProc, tempChain)) {
	  if (tempNode2 != NULL) {
	    safeFree(copy);
	    copy = tempNode2;
	    freeChain(tempChain, freeThingOnVoid);
	  } else {
	    copy->arguments = tempChain;
	    copy->child1 = copyThing(tempNode);
	  }
	} else {
	  printMessage(1,SOLLYA_MSG_EXTERNAL_PROCEDURE_SIGNALED_FAILURE,"Warning: external procedure has signalized failure.\n");
          considerDyingOnError();
	  safeFree(copy);
	  copy = makeError();
	  freeChain(tempChain, freeThingOnVoid);
	}
      } else {
	if (isProcedure(tempNode)) {
	  tempChain = copyChainWithoutReversal(tree->arguments, evaluateThingOnVoid);
	  tempNode2 = NULL;
	  if (executeProcedure(&tempNode2, accessThruMemRef(tempNode), tempChain, 0)) {
	    if (tempNode2 != NULL) {
	      safeFree(copy);
	      copy = tempNode2;
	      freeChain(tempChain, freeThingOnVoid);
	    } else {
	      copy->arguments = tempChain;
	      copy->child1 = copyThing(tempNode);
	    }
	  } else {
	    printMessage(1,SOLLYA_MSG_ERROR_WHILE_EXECUTING_A_PROCEDURE,"Warning: an error occurred while executing a procedure.\n");
            considerDyingOnError();
	    safeFree(copy);
	    copy = makeError();
	    freeChain(tempChain, freeThingOnVoid);
	  }
	} else {
	  copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
	  copy->child1 = copyThing(tempNode);
	}
      }
    }
    freeThing(tempNode);
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case DECIMALCONSTANT:
    if (timingString != NULL) pushTimeCounter();
    resA = 0;
    tempString2 = strchr(tree->string,'%');
    tempString3 = strrchr(tree->string,'%');
    if ((tempString2 != NULL) &&
	(tempString3 != NULL) &&
	(tempString2 != tempString3) &&
	(*(tempString2 + 1) != '\0') &&
	(tempString3 != tree->string) &&
	(*(tempString3 + 1) != '\0')) {
      tempString = (char *) safeCalloc(strlen(tempString3 + 1) + 1, sizeof(char));
      strcpy(tempString,tempString3 + 1);
      tempString4 = (char *) safeCalloc(strlen(tempString2 + 1) + 1, sizeof(char));
      tempString5 = tempString4;
      tempString2++;
      while ((*tempString2 != '\0') && (tempString2 != tempString3)) {
	*tempString5 = *tempString2;
	tempString5++; tempString2++;
      }
      resB = atoi(tempString4);
      safeFree(tempString4);
      if (resB < 12) {
	printMessage(1,SOLLYA_MSG_PRECISION_OF_NUMS_MUST_BE_AT_LEAST_TWELVE_BITS,"Warning: the precision of values in the tool must be at least 12 bits.\n");
	resB = 12;
      }
      pTemp = (mp_prec_t) resB;
      pTemp2 = pTemp;
      resA = 1;
    }
    if (!resA) {
      tempString = (char *) safeCalloc(strlen(tree->string) + 1, sizeof(char));
      strcpy(tempString,tree->string);
      pTemp = 4 * strlen(tempString) + 3324;
      if (tools_precision > pTemp) pTemp = tools_precision;
      pTemp2 = tools_precision;
    }
    if (strchr(tempString,'%') == NULL) {
      mpfr_init2(a,pTemp);
      mpfr_init2(b,pTemp);
      mpfr_set_str(a,tempString,10,GMP_RNDD);
      mpfr_set_str(b,tempString,10,GMP_RNDU);
      if (mpfr_cmp(a,b) != 0) {
	pTemp = pTemp2;
      }
      mpfr_clear(a); mpfr_clear(b);
      mpfr_init2(a,pTemp);
      mpfr_init2(b,pTemp);
      mpfr_set_str(a,tempString,10,GMP_RNDD);
      mpfr_set_str(b,tempString,10,GMP_RNDU);
      if (mpfr_cmp(a,b) != 0) {
	if (!noRoundingWarnings) {
	  printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_READING_A_CONSTANT,
		       "Warning: Rounding occurred when converting the constant \"%s\" to floating-point with %d bits.\n",
		       tempString,(int) pTemp);
	  printMessage(1,SOLLYA_MSG_CONTINUATION,"If safe computation is needed, try to increase the precision.\n");
	}
	mpfr_set_str(a,tempString,10,GMP_RNDN);
      }
      mpfr_init2(c,pTemp);
      if (!resA) simplifyMpfrPrec(c, a); else mpfr_set(c,a,GMP_RNDN);
      tempNode = makeConstant(c);
      mpfr_clear(c);
      mpfr_clear(b);
      mpfr_clear(a);
      safeFree(copy);
      copy = tempNode;
    }
    safeFree(tempString);
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case MIDPOINTCONSTANT:
    if (timingString != NULL) pushTimeCounter();
    str1 = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    str2 = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    cutMidpointStringIntoTwo(str1,str2,tree->string);
    mpfr_init2(a,tools_precision);
    mpfr_init2(b,tools_precision);
    mpfr_set_str(a,str1,10,GMP_RNDD);
    mpfr_set_str(b,str2,10,GMP_RNDU);
    if (mpfr_cmp(a,b) > 0) {
      printMessage(1,SOLLYA_MSG_RANGE_BOUNDS_IN_INVERSE_ORDER,"Warning: the range bounds are given in inverse order. Will revert them.\n");
      str3 = str1;
      str1 = str2;
      str2 = str3;
    }
    mpfr_clear(a); mpfr_clear(b);
    pTemp = 4 * strlen(str1) + 3324;
    if (tools_precision > pTemp) pTemp = tools_precision;
    mpfr_init2(a,pTemp);
    mpfr_init2(b,pTemp);
    mpfr_set_str(a,str1,10,GMP_RNDD);
    mpfr_set_str(b,str1,10,GMP_RNDU);
    if (mpfr_cmp(a,b) != 0) {
      pTemp = tools_precision;
    }
    mpfr_clear(a); mpfr_clear(b);
    mpfr_init2(a,pTemp);
    mpfr_init2(b,pTemp);
    mpfr_set_str(a,str1,10,GMP_RNDD);
    mpfr_set_str(b,str1,10,GMP_RNDU);
    if (mpfr_cmp(a,b) != 0) {
      if (!noRoundingWarnings) {
	printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_READING_A_CONSTANT,
		     "Warning: Rounding occurred when converting the constant \"%s\" to floating-point with %d bits.\n",
		     str1,(int) pTemp);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"The inclusion property is nevertheless satisfied.\n");
      }
      mpfr_set_str(a,str1,10,GMP_RNDD);
    }
    mpfr_init2(c,pTemp);
    simplifyMpfrPrec(c, a);
    mpfr_clear(b);
    mpfr_clear(a);
    pTemp = 4 * strlen(str2) + 3324;
    if (tools_precision > pTemp) pTemp = tools_precision;
    mpfr_init2(a,pTemp);
    mpfr_init2(b,pTemp);
    mpfr_set_str(a,str2,10,GMP_RNDD);
    mpfr_set_str(b,str2,10,GMP_RNDU);
    if (mpfr_cmp(a,b) != 0) {
      pTemp = tools_precision;
    }
    mpfr_clear(a); mpfr_clear(b);
    mpfr_init2(a,pTemp);
    mpfr_init2(b,pTemp);
    mpfr_set_str(a,str2,10,GMP_RNDD);
    mpfr_set_str(b,str2,10,GMP_RNDU);
    if (mpfr_cmp(a,b) != 0) {
      if (!noRoundingWarnings) {
	printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_READING_A_CONSTANT,
		     "Warning: Rounding occurred when converting the constant \"%s\" to floating-point with %d bits.\n",
		     str2,(int) pTemp);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"The inclusion property is nevertheless satisfied.\n");
      }
      mpfr_set_str(a,str2,10,GMP_RNDU);
    }
    mpfr_init2(d,pTemp);
    simplifyMpfrPrec(d, a);
    tempNode = makeConstant(c);
    tempNode2 = makeConstant(d);
    mpfr_clear(c);
    mpfr_clear(d);
    mpfr_clear(b);
    mpfr_clear(a);
    tempNode3 = makeRange(tempNode,tempNode2);
    safeFree(copy);
    copy = tempNode3;
    safeFree(str1); safeFree(str2);
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case DYADICCONSTANT:
    if (timingString != NULL) pushTimeCounter();
    pTemp = 4 * strlen(tree->string);
    if (tools_precision > pTemp) pTemp = tools_precision;
    mpfr_init2(a,pTemp);
    if (!readDyadic(a,tree->string)) {
      if (!noRoundingWarnings) {
	printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_READING_A_CONSTANT,
		     "Warning: Rounding occurred when converting the dyadic constant \"%s\" to floating-point with %d bits.\n",
		     tree->string,(int) pTemp);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"If safe computation is needed, try to increase the precision.\n");
      }
    }
    tempNode = makeConstant(a);
    mpfr_clear(a);
    safeFree(copy);
    copy = tempNode;
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case HEXCONSTANT:
    if (timingString != NULL) pushTimeCounter();
    pTemp = 53;
    if (tools_precision > pTemp) pTemp = tools_precision;
    mpfr_init2(a,pTemp);
    if (!readHexa(a,tree->string)) {
      if (!noRoundingWarnings) {
	printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_READING_A_CONSTANT,
		     "Warning: Rounding occurred when converting the hexadecimal constant \"%s\" to floating-point with %d bits.\n",
		     tree->string,(int) pTemp);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"If safe computation is needed, try to increase the precision.\n");
      }
    }
    tempNode = makeConstant(a);
    mpfr_clear(a);
    safeFree(copy);
    copy = tempNode;
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case HEXADECIMALCONSTANT:
    if (timingString != NULL) pushTimeCounter();
    pTemp = 4 * strlen(tree->string);
    if (tools_precision > pTemp) pTemp = tools_precision;
    mpfr_init2(a,pTemp);
    if (!readHexadecimal(a,tree->string)) {
      if (!noRoundingWarnings) {
	printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_READING_A_CONSTANT,
		     "Warning: Rounding occurred when converting the hexadecimal constant \"%s\" to floating-point with %d bits.\n",
		     tree->string,(int) pTemp);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"If safe computation is needed, try to increase the precision.\n");
      }
    }
    tempNode = makeConstant(a);
    mpfr_clear(a);
    safeFree(copy);
    copy = tempNode;
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case BINARYCONSTANT:
    if (timingString != NULL) pushTimeCounter();
    pTemp = strlen(tree->string);
    if (tools_precision > pTemp) pTemp = tools_precision;
    mpfr_init2(a,pTemp);
    mpfr_init2(b,pTemp);
    mpfr_set_str(a,tree->string,2,GMP_RNDD);
    mpfr_set_str(b,tree->string,2,GMP_RNDU);
    if (mpfr_cmp(a,b) != 0) {
      if (!noRoundingWarnings) {
	printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_READING_A_CONSTANT,
		     "Warning: Rounding occurred when converting the binary constant \"%s_2\" to floating-point with %d bits.\n",
		     tree->string,(int) pTemp);
	printMessage(1,SOLLYA_MSG_CONTINUATION,"If safe computation is needed, try to increase the precision.\n");
      }
      mpfr_set_str(a,tree->string,2,GMP_RNDN);
    }
    tempNode = makeConstant(a);
    mpfr_clear(b);
    mpfr_clear(a);
    safeFree(copy);
    copy = tempNode;
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case EMPTYLIST:
    break;
  case LIST:
    tempChain = copyChain(tree->arguments, evaluateThingInnerOnVoid);
    if (timingString != NULL) pushTimeCounter();
    curr = tempChain; newChain = NULL; resC = 0;
    while (curr != NULL) {
      if ((curr->next != NULL) &&
	  (curr->next->next != NULL) &&
	  isElliptic((node *) (curr->next->value)) &&
	  isPureTree((node *) (curr->value)) &&
	  isPureTree((node *) (curr->next->next->value)) &&
	  isConstant((node *) (curr->value)) &&
	  isConstant((node *) (curr->next->next->value)) &&
	  evaluateThingToInteger(&resA,(node *) (curr->value), NULL) &&
	  evaluateThingToInteger(&resB,(node *) (curr->next->next->value),NULL) &&
	  (resA >= resB)) {
	mpfr_init2(a,sizeof(int) * 8);
	resC = 1;
	for (i=resA;i>=resB;i--) {
	  mpfr_set_si(a,i,GMP_RNDN);
	  newChain = addElement(newChain,makeConstant(a));
	}
	mpfr_clear(a);
	curr = curr->next->next;
      } else {
	newChain = addElement(newChain,copyThing((node *) (curr->value)));
      }
      curr = curr->next;
    }
    freeChain(tempChain, freeThingOnVoid);
    copy->arguments = newChain;
    copy->argArray = NULL;
    copy->argArraySize = 0;
    copy->argArrayAllocSize = 0;
    if (resC && (!isPureList(copy))) {
      tempNode = evaluateThing(copy);
      freeThing(copy);
      copy = tempNode;
    }
    setupRandomAccessOnLists(copy);
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case STRUCTURE:
    if (!associationContainsDoubleEntries(tree->arguments)) {
      if (timingString != NULL) pushTimeCounter();
      copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateEntryOnVoid);
      if (timingString != NULL) popTimeCounter(timingString);
    } else {
      printMessage(1,SOLLYA_MSG_LITERAL_STRUCTURE_CONTAINS_ENTRY_TWICE,"Warning: a literal structure contains at least one entry twice. This is not allowed.\n");
      copy->arguments = copyChainWithoutReversal(tree->arguments, copyEntryOnVoid);
    }
    break;
  case FINALELLIPTICLIST:
    tempChain = copyChain(tree->arguments, evaluateThingInnerOnVoid);
    if (timingString != NULL) pushTimeCounter();
    curr = tempChain; newChain = NULL; resC = 0;
    while (curr != NULL) {
      if ((curr->next != NULL) &&
	  (curr->next->next != NULL) &&
	  isElliptic((node *) (curr->next->value)) &&
	  isPureTree((node *) (curr->value)) &&
	  isPureTree((node *) (curr->next->next->value)) &&
	  isConstant((node *) (curr->value)) &&
	  isConstant((node *) (curr->next->next->value)) &&
	  evaluateThingToInteger(&resA,(node *) (curr->value), NULL) &&
	  evaluateThingToInteger(&resB,(node *) (curr->next->next->value),NULL) &&
	  (resA >= resB)) {
	mpfr_init2(a,sizeof(int) * 8);
	resC = 1;
	for (i=resA;i>=resB;i--) {
	  mpfr_set_si(a,i,GMP_RNDN);
	  newChain = addElement(newChain,makeConstant(a));
	}
	mpfr_clear(a);
	curr = curr->next->next;
      } else {
	newChain = addElement(newChain,copyThing((node *) (curr->value)));
      }
      curr = curr->next;
    }
    freeChain(tempChain, freeThingOnVoid);
    copy->arguments = newChain;
    copy->argArray = NULL;
    copy->argArraySize = 0;
    copy->argArrayAllocSize = 0;
    if (resC && (!isPureFinalEllipticList(copy))) {
      tempNode = evaluateThing(copy);
      freeThing(copy);
      copy = tempNode;
    }
    setupRandomAccessOnLists(copy);
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case ELLIPTIC:
    break;
  case RANGE:
    alreadyDisplayed = 0;
    if ((accessThruMemRef(tree->child1)->nodeType == DECIMALCONSTANT) || 
	((accessThruMemRef(tree->child1)->nodeType == NEG) && 
	 (accessThruMemRef(accessThruMemRef(tree->child1)->child1)->nodeType == DECIMALCONSTANT))) {
      if ((accessThruMemRef(tree->child1)->nodeType == NEG) && 
	  (accessThruMemRef(accessThruMemRef(tree->child1)->child1)->nodeType == DECIMALCONSTANT)) {
	negate = 1;
	decString = accessThruMemRef(accessThruMemRef(tree->child1)->child1)->string;
	if ((accessThruMemRef(tree->child2)->nodeType == NEG) &&  
	    (accessThruMemRef(accessThruMemRef(tree->child2)->child1)->nodeType == DECIMALCONSTANT)) {
	  if (!strcmp(decString,accessThruMemRef(accessThruMemRef(tree->child2)->child1)->string))
	    alreadyDisplayed = 1;
	}	
      } else {
	negate = 0;
	decString = accessThruMemRef(tree->child1)->string;
	if (accessThruMemRef(tree->child2)->nodeType == DECIMALCONSTANT) {
	  if (!strcmp(decString,accessThruMemRef(tree->child2)->string))
	    alreadyDisplayed = 1;
	}
      }
      resA = 0;
      tempString2 = strchr(decString,'%');
      tempString3 = strrchr(decString,'%');
      if ((tempString2 != NULL) &&
          (tempString3 != NULL) &&
          (tempString2 != tempString3) &&
          (*(tempString2 + 1) != '\0') &&
          (tempString3 != decString) &&
          (*(tempString3 + 1) != '\0')) {
        tempString = (char *) safeCalloc(strlen(tempString3 + 1) + 1, sizeof(char));
        strcpy(tempString,tempString3 + 1);
        tempString4 = (char *) safeCalloc(strlen(tempString2 + 1) + 1, sizeof(char));
        tempString5 = tempString4;
        tempString2++;
        while ((*tempString2 != '\0') && (tempString2 != tempString3)) {
          *tempString5 = *tempString2;
          tempString5++; tempString2++;
        }
        resB = atoi(tempString4);
        safeFree(tempString4);
        if (resB < 12) {
          printMessage(1,SOLLYA_MSG_PRECISION_OF_NUMS_MUST_BE_AT_LEAST_TWELVE_BITS,"Warning: the precision of values in the tool must be at least 12 bits.\n");
          resB = 12;
        }
        pTemp = (mp_prec_t) resB;
        pTemp2 = pTemp;
        resA = 1;
      }
      if (!resA) {
        tempString = (char *) safeCalloc(strlen(decString) + 1, sizeof(char));
        strcpy(tempString,decString);
        pTemp = 4 * strlen(tempString) + 3324;
        if (tools_precision > pTemp) pTemp = tools_precision;
        pTemp2 = tools_precision;
      }
      if (strchr(tempString,'%') == NULL) {
        mpfr_init2(a,pTemp);
        mpfr_init2(b,pTemp);
        mpfr_set_str(a,tempString,10,GMP_RNDD);
        mpfr_set_str(b,tempString,10,GMP_RNDU);
        if (mpfr_cmp(a,b) != 0) {
          pTemp = pTemp2;
        }
        mpfr_clear(a); mpfr_clear(b);
        mpfr_init2(a,pTemp);
        mpfr_init2(b,pTemp);
        mpfr_set_str(a,tempString,10,GMP_RNDD);
        mpfr_set_str(b,tempString,10,GMP_RNDU);
        if (mpfr_cmp(a,b) != 0) {
          if (!noRoundingWarnings) {
            printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_READING_A_CONSTANT,
                         "Warning: Rounding occurred when converting the constant \"%s\" to floating-point with %d bits.\n",
                         tempString,(int) pTemp);
            printMessage(1,SOLLYA_MSG_CONTINUATION,"The inclusion property is nevertheless satisfied.\n");
          }
          if (negate) {
	    mpfr_set_str(a,tempString,10,GMP_RNDU);
	  } else {
	    mpfr_set_str(a,tempString,10,GMP_RNDD);
	  }
        }
        mpfr_init2(c,pTemp);
        if (!resA) {
	  simplifyMpfrPrec(c, a); 
	  if (negate) mpfr_neg(c, c, GMP_RNDN);
	} else {
	  if (negate) {
	    mpfr_set(c,a,GMP_RNDU);
	    mpfr_neg(c, c, GMP_RNDN);
	  } else {
	    mpfr_set(c,a,GMP_RNDD);
	  }
	}
        tempNode = makeConstant(c);
        mpfr_clear(c);
        mpfr_clear(b);
        mpfr_clear(a);
        copy->child1 = tempNode;
      }
      safeFree(tempString);
    } else {
      copy->child1 = evaluateThingInner(tree->child1);
    }
    if ((accessThruMemRef(tree->child2)->nodeType == DECIMALCONSTANT) || 
	((accessThruMemRef(tree->child2)->nodeType == NEG) && 
	 (accessThruMemRef(accessThruMemRef(tree->child2)->child1)->nodeType == DECIMALCONSTANT))) {
      if ((accessThruMemRef(tree->child2)->nodeType == NEG) && 
	  (accessThruMemRef(accessThruMemRef(tree->child2)->child1)->nodeType == DECIMALCONSTANT)) {
	negate = 1;
	decString = accessThruMemRef(accessThruMemRef(tree->child2)->child1)->string;
      } else {
	negate = 0;
	decString = accessThruMemRef(tree->child2)->string;
      }
      resA = 0;
      tempString2 = strchr(decString,'%');
      tempString3 = strrchr(decString,'%');
      if ((tempString2 != NULL) &&
          (tempString3 != NULL) &&
          (tempString2 != tempString3) &&
          (*(tempString2 + 1) != '\0') &&
          (tempString3 != decString) &&
          (*(tempString3 + 1) != '\0')) {
        tempString = (char *) safeCalloc(strlen(tempString3 + 1) + 1, sizeof(char));
        strcpy(tempString,tempString3 + 1);
        tempString4 = (char *) safeCalloc(strlen(tempString2 + 1) + 1, sizeof(char));
        tempString5 = tempString4;
        tempString2++;
        while ((*tempString2 != '\0') && (tempString2 != tempString3)) {
          *tempString5 = *tempString2;
          tempString5++; tempString2++;
        }
        resB = atoi(tempString4);
        safeFree(tempString4);
        if ((resB < 12) && (!alreadyDisplayed)) {
          printMessage(1,SOLLYA_MSG_PRECISION_OF_NUMS_MUST_BE_AT_LEAST_TWELVE_BITS,"Warning: the precision of values in the tool must be at least 12 bits.\n");
          resB = 12;
        }
        pTemp = (mp_prec_t) resB;
        pTemp2 = pTemp;
        resA = 1;
      }
      if (!resA) {
        tempString = (char *) safeCalloc(strlen(decString) + 1, sizeof(char));
        strcpy(tempString,decString);
        pTemp = 4 * strlen(tempString) + 3324;
        if (tools_precision > pTemp) pTemp = tools_precision;
        pTemp2 = tools_precision;
      }
      if (strchr(tempString,'%') == NULL) {
        mpfr_init2(a,pTemp);
        mpfr_init2(b,pTemp);
        mpfr_set_str(a,tempString,10,GMP_RNDD);
        mpfr_set_str(b,tempString,10,GMP_RNDU);
        if (mpfr_cmp(a,b) != 0) {
          pTemp = pTemp2;
        }
        mpfr_clear(a); mpfr_clear(b);
        mpfr_init2(a,pTemp);
        mpfr_init2(b,pTemp);
        mpfr_set_str(a,tempString,10,GMP_RNDD);
        mpfr_set_str(b,tempString,10,GMP_RNDU);
        if (mpfr_cmp(a,b) != 0) {
          if ((!noRoundingWarnings) && (!alreadyDisplayed)) {
            printMessage(1,SOLLYA_MSG_ROUNDING_OCCURRED_WHILE_READING_A_CONSTANT,
                         "Warning: Rounding occurred when converting the constant \"%s\" to floating-point with %d bits.\n",
                         tempString,(int) pTemp);
            printMessage(1,SOLLYA_MSG_CONTINUATION,"The inclusion property is nevertheless satisfied.\n");
          }
          if (negate) {
	    mpfr_set_str(a,tempString,10,GMP_RNDD);
	  } else {
	    mpfr_set_str(a,tempString,10,GMP_RNDU);
	  }
        }
        mpfr_init2(c,pTemp);
        if (!resA) {
	  simplifyMpfrPrec(c, a); 
	  if (negate) mpfr_neg(c, c, GMP_RNDN);
	} else {
	  if (negate) {
	    mpfr_set(c,a,GMP_RNDD);
	    mpfr_neg(c, c, GMP_RNDN);
	  } else {
	    mpfr_set(c,a,GMP_RNDU);
	  }
	}
        tempNode = makeConstant(c);
        mpfr_clear(c);
        mpfr_clear(b);
        mpfr_clear(a);
        copy->child2 = tempNode;
      }
      safeFree(tempString);
    } else {
      copy->child2 = evaluateThingInner(tree->child2);
    }
    if (isPureTree(copy->child1) &&
	isPureTree(copy->child2)) {
      if (timingString != NULL) pushTimeCounter();
      mpfr_init2(a,tools_precision + 5);
      resA = evaluateThingToConstant(a,copy->child1,NULL,0,0);
      if(resA) {
	mpfr_init2(b,tools_precision + 5);
        if (isSyntacticallyEqual(copy->child1,copy->child2)) {
          resB = resA;
          mpfr_set_prec(b,mpfr_get_prec(a));
          mpfr_set(b,a,GMP_RNDN);
        } else {
          resB = evaluateThingToConstant(b,copy->child2,NULL,0,0);
        }
	if(resB) {
	  if ((resA == 3) || (resB == 3)) {
	    xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    mpfr_init2(*(xrange.a),tools_precision);
	    mpfr_init2(*(xrange.b),tools_precision);
	    mpfr_set_d(*(xrange.a),1.0,GMP_RNDN);
	    mpfr_set_d(*(xrange.b),1.0,GMP_RNDN);
	    yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    mpfr_init2(*(yrange.a),tools_precision);
	    mpfr_init2(*(yrange.b),tools_precision);
	    yrange2.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange2.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    mpfr_init2(*(yrange2.a),tools_precision);
	    mpfr_init2(*(yrange2.b),tools_precision);
	    evaluateRangeFunction(yrange, copy->child1, xrange, 256 * tools_precision);
	    evaluateRangeFunction(yrange2, copy->child2, xrange, 256 * tools_precision);
	    if (!noRoundingWarnings) {
	      printMessage(1,SOLLYA_MSG_NOT_LEAST_POSSIBLE_INCLUSION_INTERVAL,"Warning: inclusion property is satisfied but the diameter may be greater than the least possible.\n");
	    }
	    sollya_mpfr_min(a,*(yrange.a),*(yrange2.a),GMP_RNDD);
	    sollya_mpfr_max(b,*(yrange.b),*(yrange2.b),GMP_RNDU);
	    mpfr_clear(*(xrange.a));
	    mpfr_clear(*(xrange.b));
	    safeFree(xrange.a);
	    safeFree(xrange.b);
	    mpfr_clear(*(yrange.a));
	    mpfr_clear(*(yrange.b));
	    safeFree(yrange.a);
	    safeFree(yrange.b);
	    mpfr_clear(*(yrange2.a));
	    mpfr_clear(*(yrange2.b));
	    safeFree(yrange2.a);
	    safeFree(yrange2.b);
	  }
	  freeThing(copy->child1);
	  freeThing(copy->child2);
	  if (mpfr_cmp(a,b) > 0) {
	    printMessage(1,SOLLYA_MSG_RANGE_BOUNDS_IN_INVERSE_ORDER,"Warning: the bounds of the given range are in wrong order. Will reverse them.\n");
	    if (resA != 2) {
	      if (tools_precision > mpfr_get_prec(a)) {
		mpfr_prec_round(a, tools_precision, GMP_RNDU); /* No rounding as precision always higher */
	      }
	      mpfr_nextabove(a);
	      mpfr_prec_round(a, tools_precision, GMP_RNDU);
	    }
	    if (resB != 2) {
	      if (tools_precision > mpfr_get_prec(b)) {
		mpfr_prec_round(b, tools_precision, GMP_RNDD); /* No rounding as precision always higher */
	      }
	      mpfr_nextbelow(b);
	      mpfr_prec_round(b, tools_precision, GMP_RNDD);
	    }
	    copy->child1 = makeConstant(b);
	    copy->child2 = makeConstant(a);
	    if (!(!((!(!(mpfr_nan_p(*(accessThruMemRef(copy->child1)->value))))) ^ (!(!(mpfr_nan_p(*(accessThruMemRef(copy->child2)->value)))))))) {
	      printMessage(1,SOLLYA_MSG_ONLY_ONE_ENDPOINT_OF_RANGE_IS_NAN,"Warning: one bound of a range is NaN while the other is not. Will normalize the range to have two NaN endpoints.\n");
	      mpfr_set_nan(*(accessThruMemRef(copy->child1)->value));
	      mpfr_set_nan(*(accessThruMemRef(copy->child2)->value));
	    }
	  } else {
	    if (resA != 2) {
	      if (tools_precision > mpfr_get_prec(a)) {
		mpfr_prec_round(a, tools_precision, GMP_RNDD); /* No rounding as precision always higher */
	      }
	      mpfr_nextbelow(a);
	      mpfr_prec_round(a, tools_precision, GMP_RNDD);
	    }
	    if (resB != 2) {
	      if (tools_precision > mpfr_get_prec(b)) {
		mpfr_prec_round(b, tools_precision, GMP_RNDU); /* No rounding as precision always higher */
	      }
	      mpfr_nextabove(b);
	      mpfr_prec_round(b, tools_precision, GMP_RNDU);
	    }
	    copy->child1 = makeConstant(a);
	    copy->child2 = makeConstant(b);
	    if (!(!((!(!(mpfr_nan_p(*(accessThruMemRef(copy->child1)->value))))) ^ (!(!(mpfr_nan_p(*(accessThruMemRef(copy->child2)->value)))))))) {
	      printMessage(1,SOLLYA_MSG_ONLY_ONE_ENDPOINT_OF_RANGE_IS_NAN,"Warning: one bound of a range is NaN while the other is not. Will normalize the range to have two NaN endpoints.\n");
	      mpfr_set_nan(*(accessThruMemRef(copy->child1)->value));
	      mpfr_set_nan(*(accessThruMemRef(copy->child2)->value));
	    }
	  }
	}
	mpfr_clear(b);
      }
      mpfr_clear(a);
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case DEBOUNDMAX:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRange(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      tempNode = copyThing(accessThruMemRef(copy->child1)->child2);
      freeThing(copy);
      copy = tempNode;
      if (timingString != NULL) popTimeCounter(timingString);
    } else {
      if (isPureTree(copy->child1) && isConstant(copy->child1)) {
	tempNode = copyThing(copy->child1);
	freeThing(copy);
	copy = tempNode;
      }
    }
    break;
  case EVALCONST:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isPureTree(copy->child1)) {
      tempNode = simplifyTreeErrorfree(copy->child1);
      if (isConstant(tempNode)) {
	mpfr_init2(a,tools_precision);
	floatingPointEvaluationAlreadyDone = 0;
	if (isPureTree(copy->child1) &&
	    isConstant(copy->child1) &&
	    ((accessThruMemRef(tree->child1)->nodeType == TABLEACCESSWITHSUBSTITUTE) ||
	     (accessThruMemRef(tree->child1)->nodeType == APPLY)) &&
	    (lengthChain(accessThruMemRef(tree->child1)->arguments) == 1)) {
	  if (accessThruMemRef(tree->child1)->nodeType == APPLY) {
	    tempNode2 = copyThing(accessThruMemRef(tree->child1)->child1);
	    tempNode3 = copyThing((node *) ((accessThruMemRef(tree->child1)->arguments)->value));
	  } else {
	    tempNode2 = makeTableAccess(accessThruMemRef(tree->child1)->string);
	    tempNode3 = copyThing((node *) ((accessThruMemRef(tree->child1)->arguments)->value));
	  }
	  tempNode4 = evaluateThing(tempNode2);
	  tempNode5 = evaluateThing(tempNode3);
	  if (isPureTree(tempNode4) &&
	      isPureTree(tempNode5) &&
	      (!isConstant(tempNode4)) &&
	      isConstant(tempNode5)) {
	    tempNode6 = simplifyTreeErrorfree(tempNode5);
	    if ((accessThruMemRef(tempNode6)->nodeType == CONSTANT) &&
		mpfr_number_p(*(accessThruMemRef(tempNode6)->value))) {
	      if (evaluateFaithful(a, tempNode4, *(accessThruMemRef(tempNode6)->value), tools_precision)) {
		floatingPointEvaluationAlreadyDone = 1;
	      }
	    }
	    freeThing(tempNode6);
	  }
	  freeThing(tempNode2);
	  freeThing(tempNode3);
	  freeThing(tempNode4);
	  freeThing(tempNode5);
	}
	if (floatingPointEvaluationAlreadyDone || evaluateThingToConstant(a,tempNode,NULL,1,0)) {
	  tempNode2 = makeConstant(a);
	  freeThing(copy);
	  copy = tempNode2;
	} else {
	  tempNode2 = copy->child1;
	  safeFree(copy);
	  copy = tempNode2;
	}
	mpfr_clear(a);
      } else {
	tempNode2 = copy->child1;
	safeFree(copy);
	copy = tempNode2;
      }
      freeThing(tempNode);
    } else {
      tempNode2 = copy->child1;
      safeFree(copy);
      copy = tempNode2;
    }
    break;
  case DEBOUNDMIN:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRange(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      tempNode = copyThing(accessThruMemRef(copy->child1)->child1);
      freeThing(copy);
      copy = tempNode;
      if (timingString != NULL) popTimeCounter(timingString);
    } else {
      if (isPureTree(copy->child1) && isConstant(copy->child1)) {
	tempNode = copyThing(copy->child1);
	freeThing(copy);
	copy = tempNode;
      }
    }
    break;
  case DEBOUNDMID:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRange(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      tempNode = makeDiv(makeAdd(copyThing(accessThruMemRef(copy->child1)->child1),copyThing(accessThruMemRef(copy->child1)->child2)),makeConstantDouble(2.0));
      freeThing(copy);
      copy = tempNode;
      if (timingString != NULL) popTimeCounter(timingString);
    } else {
      if (isPureTree(copy->child1) && isConstant(copy->child1)) {
	tempNode = copyThing(copy->child1);
	freeThing(copy);
	copy = tempNode;
      }
    }
    break;
  case DIFF:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isPureTree(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      tempNode = differentiate(copy->child1);
      freeThing(copy);
      copy = tempNode;
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case DIRTYSIMPLIFY:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isPureTree(copy->child1)) {
      if (isConstant(copy->child1)) {
	mpfr_init2(a,tools_precision);
	mpfr_init2(b,tools_precision);
	mpfr_set_d(a,1.0,GMP_RNDN);
	if (timingString != NULL) pushTimeCounter();
	if (evaluateFaithful(b, copy->child1, a, tools_precision)) {
	  tempNode = makeConstant(b);
	  freeThing(copy);
	  copy = tempNode;
	} else {
	  printMessage(2,SOLLYA_MSG_TREE_IS_CONSTANT_BUT_CANNOT_DO_FAITHFUL_EVAL,"Information: the given tree is constant but cannot be evaluated faithfully.\n");
	  tempNode = simplifyTree(copy->child1);
	  freeThing(copy);
	  copy = tempNode;
	}
	if (timingString != NULL) popTimeCounter(timingString);
	mpfr_clear(a);
	mpfr_clear(b);
      } else {
	if (timingString != NULL) pushTimeCounter();
	tempNode = simplifyTree(copy->child1);
	freeThing(copy);
	copy = tempNode;
	if (timingString != NULL) popTimeCounter(timingString);
      }
    }
    break;
  case SIMPLIFYSAFE:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isPureTree(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      tempNode = simplifyTreeErrorfree(copy->child1);
      freeThing(copy);
      copy = tempNode;
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case TIME:
    mpfr_init2(a,tools_precision);
    if (timingString != NULL) pushTimeCounter();
    resA = timeCommand(a,tree->child1);
    if (timingString != NULL) popTimeCounter(timingString);
    safeFree(copy);
    copy = makeConstant(a);
    mpfr_clear(a);
    if (resA) {
      printMessage(1,SOLLYA_MSG_TIMED_COMMAND_HAS_QUIT_THE_TOOL,"Warning: a command executed in a timed environment required quitting the tool. This is not possible. The quit command has been discarded.\n");
    }
    break;
  case REMEZ:
    safeFree(copy);
    copy = evaluateThingInnerRemez(tree, timingString);
    break;
  case BIND:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    copy->string = (char *) safeCalloc(strlen(tree->string)+1,sizeof(char));
    strcpy(copy->string,tree->string);
    if (isProcedureNotIllim(copy->child1)) {
      tempNode = performBind(accessThruMemRef(copy->child1),copy->string,accessThruMemRef(copy->child2));
      if (tempNode == NULL) {
	printMessage(1,SOLLYA_MSG_PARAM_OF_PROCEDURE_DOES_NOT_EXIST,"Warning: the given procedure has no argument named \"%s\". The procedure is returned unchanged.\n",copy->string);
	tempNode = copyThing(copy->child1);
      }
      freeThing(copy);
      copy = tempNode;
    }
    break;
  case MATCH:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    if (isCorrectlyTyped(copy->child1)) {
      resA = 1;
      for (curr = copy->arguments; curr != NULL; curr=curr->next) {
	if (!isMatchElement((node *) (curr->value))) {
	  resA = 0;
	  break;
	}
      }
      if (resA) {
	resB = lengthChain(copy->arguments);
	thingArray1 = (node **) safeCalloc(resB, sizeof(node *));
	thingArray2 = (node **) safeCalloc(resB, sizeof(node *));
	thingArray3 = (node **) safeCalloc(resB, sizeof(node *));
	resC = 0;
	for (curr = copy->arguments; curr != NULL; curr=curr->next) {
	  thingArray1[resC] = preevaluateMatcher(accessThruMemRef(((node *) (curr->value)))->child1);
	  thingArray3[resC] = accessThruMemRef(((node *) (curr->value)))->child2;
	  thingArray2[resC] = accessThruMemRef((node *) (accessThruMemRef(((node *) (curr->value)))->arguments->value));
	  resC++;
	}
	resD = 1;
	for (resC=0;resC<resB;resC++) {
	  if (!isMatchable(thingArray1[resC])) {
	    resD = 0;
	    break;
	  }
	}
	if (resD) {
	  tempNode = NULL;
	  if ((executeMatch(&tempNode,accessThruMemRef(copy->child1),thingArray1,thingArray2,thingArray3,resB)) && (tempNode != NULL)) {
	    freeThing(copy);
	    copy = tempNode;
	  }
	}
	for (resC=0;resC<resB;resC++) {
	  freeThing(thingArray1[resC]);
	}
	safeFree(thingArray1);
	safeFree(thingArray2);
	safeFree(thingArray3);
      }
    }
    break;
  case MATCHELEMENT:
    copy->child1 = copyThing(tree->child1);
    copy->child2 = copyThing(tree->child2);
    copy->arguments = copyChainWithoutReversal(tree->arguments, copyThingOnVoid);
    break;
  case FPMINIMAX:
    safeFree(copy);
    copy = evaluateThingInnerFpminimax(tree, timingString);
    break;
  case HORNER:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isPureTree(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      tempNode = horner(copy->child1);
      freeThing(copy);
      copy = tempNode;
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case CANONICAL:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isPureTree(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      tempNode = makeCanonical(copy->child1, tools_precision);
      freeThing(copy);
      copy = tempNode;
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case EXPAND:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isPureTree(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      tempNode = expand(copy->child1);
      freeThing(copy);
      copy = tempNode;
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case TAYLOR:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    curr = copy->arguments;
    if (isPureTree((node *) (curr->value))) {
      curr = curr->next;
      if (isPureTree((node *) (curr->value)) &&
	  evaluateThingToInteger(&resA,(node *) (curr->value),NULL)) {
	curr = curr->next;
	mpfr_init2(a,tools_precision);
	if (isPureTree((node *) (curr->value)) &&
	    evaluateThingToConstant(a,(node *) (curr->value),NULL,0,0)) {
	  if (timingString != NULL) pushTimeCounter();
	  tempNode = makeConstant(a);
	  curr = copy->arguments;
	  tempNode2 = taylor((node *) (curr->value), resA, tempNode, tools_precision);
	  freeThing(tempNode);
	  freeThing(copy);
	  copy = tempNode2;
	  if (timingString != NULL) popTimeCounter(timingString);
	}
	mpfr_clear(a);
      }
    }
    break;
  case TAYLORFORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    curr = copy->arguments;
    if (isPureTree((node *) (curr->value))) {
      curr = curr->next;
      if (isPureTree((node *) (curr->value)) &&
	  evaluateThingToInteger(&resA,(node *) (curr->value),NULL)) {
	curr = curr->next;
	tmpInterv11 = NULL;
        intptr = NULL;
        resB = 1;
        if (curr != NULL) {
          if (isRange((node *) (curr->value)) || isPureTree((node *) (curr->value))) {
            if (isRange((node *) (curr->value))) {
              mpfr_init2(bb,tools_precision);
              mpfr_init2(cc,tools_precision);
              if (evaluateThingToRange(bb,cc,(node *) (curr->value))) {
                pTemp = mpfr_get_prec(bb);
                pTemp2 = mpfr_get_prec(cc);
                if (pTemp2 > pTemp) pTemp = pTemp2;
                sollya_mpfi_init2(tempIA2,pTemp);
                sollya_mpfi_interv_fr_safe(tempIA2,bb,cc);
                tmpInterv11 = &tempIA2;
              } else {
                resB = 0;
              }
              mpfr_clear(bb);
              mpfr_clear(cc);
            } else {
              if (isPureTree((node *) (curr->value))) {
                mpfr_init2(bb,tools_precision);
                if (evaluateThingToConstant(bb,(node *) (curr->value),NULL,0,0)) {
                  sollya_mpfi_init2(tempIA2,tools_precision);
                  sollya_mpfi_interv_fr(tempIA2,bb,bb);
                  tmpInterv11 = &tempIA2;
                } else {
                  resB = 0;
                }
                mpfr_clear(bb);
              } else {
                resB = 0;
              }
            }
            curr = curr->next;
            tmpInterv1 = NULL;
            intptr = NULL;
            resB = 1;
            if (curr != NULL) {
              if (isRange((node *) (curr->value))) {
                mpfr_init2(b,tools_precision);
                mpfr_init2(c,tools_precision);
                if (evaluateThingToRange(b,c,(node *) (curr->value))) {
                  pTemp = mpfr_get_prec(b);
                  pTemp2 = mpfr_get_prec(c);
                  if (pTemp2 > pTemp) pTemp = pTemp2;
                  sollya_mpfi_init2(tempIA,pTemp);
                  sollya_mpfi_interv_fr_safe(tempIA,b,c);
                  tmpInterv1 = &tempIA;
                } else {
                  resB = 0;
                }
                mpfr_clear(b);
                mpfr_clear(c);
                curr = curr->next;
                if (curr != NULL) {
                  if (isExternalPlotMode((node *) (curr->value)) ||
                      isDefault((node *) (curr->value))) {
                    resC = ABSOLUTE;
                    if (evaluateThingToExternalPlotMode(&resD,
                                                        (node *) (curr->value),
                                                        &resC)) {
                      intptr = &resD;
                    } else {
                      resB = 0;
                    }
                  } else {
                    resB = 0;
                  }
                }
              } else {
                if (isExternalPlotMode((node *) (curr->value)) ||
                    isDefault((node *) (curr->value))) {
                  resC = ABSOLUTE;
                  if (evaluateThingToExternalPlotMode(&resD,
                                                      (node *) (curr->value),
                                                      &resC)) {
                    intptr = &resD;
                  } else {
                    resB = 0;
                  }
                } else {
                  resB = 0;
                }
              }
            }

            if (resB) {
              curr = copy->arguments;
              if (timingString != NULL) pushTimeCounter();
              tempNode2 = NULL;
              tempChain2 = NULL;
              tmpInterv2 = NULL;
              if (intptr != NULL)
                resC = *intptr;
              else
                resC = ABSOLUTE;
              taylorform(&tempNode2, &tempChain2, &tmpInterv2,
                         (node *) (curr->value), resA, tmpInterv11,
                         tmpInterv1, resC);
              if (timingString != NULL) popTimeCounter(timingString);
              if (tempNode2 != NULL) {
                tempChain3 = NULL;
                curr2 = tempChain2;
                while (curr2 != NULL) {
                  pTemp = sollya_mpfi_get_prec(*((sollya_mpfi_t *) (curr2->value)));
                  mpfr_init2(b,pTemp);
                  mpfr_init2(c,pTemp);
                  sollya_mpfi_get_left(b,*((sollya_mpfi_t *) (curr2->value)));
                  sollya_mpfi_get_right(c,*((sollya_mpfi_t *) (curr2->value)));
                  tempChain3 = addElement(tempChain3,makeRange(makeConstant(b),
                                                               makeConstant(c)));
                  mpfr_clear(b);
                  mpfr_clear(c);
                  curr2 = curr2->next;
                }
                tempChain4 = copyChain(tempChain3,copyThingOnVoid);
                freeChain(tempChain3,freeThingOnVoid);
                tempChain3 = addElement(addElement(NULL,tempNode2),makeList(tempChain4));
                if (tmpInterv2 != NULL) {
                  pTemp = sollya_mpfi_get_prec(*tmpInterv2);
                  mpfr_init2(b,pTemp);
                  mpfr_init2(c,pTemp);
                  sollya_mpfi_get_left(b,*tmpInterv2);
                  sollya_mpfi_get_right(c,*tmpInterv2);
                  tempChain3 = addElement(tempChain3,makeRange(makeConstant(b),
                                                               makeConstant(c)));
                  mpfr_clear(b);
                  mpfr_clear(c);
                }
                tempChain4 = copyChain(tempChain3,copyThingOnVoid);
                freeChain(tempChain3,freeThingOnVoid);
                tempNode = makeList(tempChain4);
                freeThing(copy);
                copy = tempNode;
              }
              if (tempChain2 != NULL) {
                freeChain(tempChain2, freeMpfiPtr);
              }
              if (tmpInterv2 != NULL) {
                sollya_mpfi_clear(*tmpInterv2);
                safeFree(tmpInterv2);
              }
            }
            if (tmpInterv1 != NULL) sollya_mpfi_clear(*tmpInterv1);
          }
        }
	if (tmpInterv11 != NULL) sollya_mpfi_clear(*tmpInterv11);
      }
    }
    break;
  case CHEBYSHEVFORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    curr = copy->arguments;
    firstArg = (node *) curr->value;
    curr = curr->next;
    secondArg = (node *) curr->value;
    curr = curr->next;
    thirdArg = (node *) curr->value;
    if (isPureTree(firstArg)) {
      if (isPureTree(secondArg) &&
	  evaluateThingToInteger(&resA, secondArg, NULL)) {
	if (resA >= 0) {
	  mpfr_init2(a,tools_precision);
          mpfr_init2(b,tools_precision);
          resC = (isRange(thirdArg) &&
                  evaluateThingToRange(a,b,thirdArg));
          if (resC ||
              (isPureTree(thirdArg) &&
               evaluateThingToConstant(a,thirdArg,NULL,0,0))) {
            if (!resC) {
              mpfr_set_prec(b,mpfr_get_prec(a));
              mpfr_set(b,a,GMP_RNDN);
            }
            if (timingString != NULL) pushTimeCounter();
            pTemp = mpfr_get_prec(a);
            if (mpfr_get_prec(b) > pTemp) pTemp = mpfr_get_prec(b);
            sollya_mpfi_init2(tempIA,pTemp);
            sollya_mpfi_interv_fr(tempIA,a,b);
	    sollya_mpfi_init2(tempIA2,tools_precision);
	    if (timingString != NULL) pushTimeCounter();
	    tempNode = NULL;
	    tempChain2 = NULL;
	    tempChain3 = NULL;
	    chebyshevform(&tempNode, &tempChain2, tempIA2, &tempChain3, firstArg, resA, tempIA, tools_precision);
	    if (timingString != NULL) popTimeCounter(timingString);
	    sollya_mpfi_clear(tempIA);
	    mpfr_clear(a);
	    mpfr_clear(b);
	    if ((tempNode != NULL) && (tempChain2 != NULL) && (tempChain3 != NULL)) {
	      tempChain4 = NULL;
	      curr2 = tempChain3;
	      while (curr2 != NULL) {
		pTemp = sollya_mpfi_get_prec(*((sollya_mpfi_t *) (curr2->value)));
		mpfr_init2(a,pTemp);
		mpfr_init2(b,pTemp);
		sollya_mpfi_get_left(a,*((sollya_mpfi_t *) (curr2->value)));
		sollya_mpfi_get_right(b,*((sollya_mpfi_t *) (curr2->value)));
		tempChain4 = addElement(tempChain4, makeRange(makeConstant(a),makeConstant(b)));
		mpfr_clear(a);
		mpfr_clear(b);
		curr2 = curr2->next;
	      }
	      tempChain5 = copyChain(tempChain4, copyThingOnVoid);
	      tempNode3 = makeList(tempChain5);
	      freeChain(tempChain4, freeThingOnVoid);
	      tempChain4 = NULL;
	      curr2 = tempChain2;
	      while (curr2 != NULL) {
		pTemp = sollya_mpfi_get_prec(*((sollya_mpfi_t *) (curr2->value)));
		mpfr_init2(a,pTemp);
		mpfr_init2(b,pTemp);
		sollya_mpfi_get_left(a,*((sollya_mpfi_t *) (curr2->value)));
		sollya_mpfi_get_right(b,*((sollya_mpfi_t *) (curr2->value)));
		tempChain4 = addElement(tempChain4, makeRange(makeConstant(a),makeConstant(b)));
		mpfr_clear(a);
		mpfr_clear(b);
		curr2 = curr2->next;
	      }
	      tempChain5 = copyChain(tempChain4, copyThingOnVoid);
	      tempNode4 = makeList(tempChain5);
	      freeChain(tempChain4, freeThingOnVoid);
	      pTemp = sollya_mpfi_get_prec(tempIA2);
	      mpfr_init2(a,pTemp);
	      mpfr_init2(b,pTemp);
	      sollya_mpfi_get_left(a,tempIA2);
	      sollya_mpfi_get_right(b,tempIA2);
	      tempNode5 = makeRange(makeConstant(a),makeConstant(b));
	      mpfr_clear(a);
	      mpfr_clear(b);
	      tempChain4 = addElement(addElement(addElement(addElement(NULL, tempNode3), tempNode5), tempNode4), tempNode);
	      tempNode6 = makeList(tempChain4);
	      freeChain(tempChain2, freeMpfiPtr);
	      freeChain(tempChain3, freeMpfiPtr);
	      freeThing(copy);
	      copy = tempNode6;
	    } else {
	      printMessage(1,SOLLYA_MSG_CHEBYSHEVFORM_ERROR_IN_COMPUTATION,"Warning: an error occurred during computation of a Chebyshev form.\n");
	    }
	    sollya_mpfi_clear(tempIA2);
	  }
	} else {
          printMessage(1,SOLLYA_MSG_CHEBYSHEVFORM_DEGREE_MUST_NOT_BE_NEGATIVE,"Warning: the degree of a Chebyshev must not be negative.\n");
	}
      }
    }
    break;
  case AUTODIFF:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    curr = copy->arguments;
    if (isPureTree((node *) (curr->value))) {
      curr = curr->next;
      if (isPureTree((node *) (curr->value)) &&
	  evaluateThingToInteger(&resA,(node *) (curr->value),NULL)) {
        if (resA >= 0) {
          curr = curr->next;
          mpfr_init2(a,tools_precision);
          mpfr_init2(b,tools_precision);
          resC = (isRange((node *) (curr->value)) &&
                  evaluateThingToRange(a,b,(node *) (curr->value)));
          if (resC ||
              (isPureTree((node *) (curr->value)) &&
               evaluateThingToConstant(a,(node *) (curr->value),NULL,0,0))) {
            if (!resC) {
              mpfr_set_prec(b,mpfr_get_prec(a));
              mpfr_set(b,a,GMP_RNDN);
            }
            if (timingString != NULL) pushTimeCounter();
            pTemp = mpfr_get_prec(a);
            if (mpfr_get_prec(b) > pTemp) pTemp = mpfr_get_prec(b);
            sollya_mpfi_init2(tempIA,pTemp);
            sollya_mpfi_interv_fr_safe(tempIA,a,b);
            tmpInterv1 = (sollya_mpfi_t *) safeCalloc(resA + 1, sizeof(sollya_mpfi_t));
            for (resB=0;resB<resA+1;resB++) {
              sollya_mpfi_init2(tmpInterv1[resB],tools_precision);
            }
            auto_diff(tmpInterv1, accessThruMemRef((node *) (copy->arguments->value)), tempIA, resA);
            curr = NULL;
            for (resB=resA;resB>=0;resB--) {
              pTemp = sollya_mpfi_get_prec(tmpInterv1[resB]);
              mpfr_init2(c,pTemp);
              mpfr_init2(d,pTemp);
              sollya_mpfi_get_left(c,tmpInterv1[resB]);
              sollya_mpfi_get_right(d,tmpInterv1[resB]);
              curr = addElement(curr,makeRange(makeConstant(c), makeConstant(d)));
              mpfr_clear(c);
              mpfr_clear(d);
            }
            tempNode = makeList(curr);
            freeThing(copy);
            copy = tempNode;
            for (resB=0;resB<resA+1;resB++) {
              sollya_mpfi_clear(tmpInterv1[resB]);
            }
            safeFree(tmpInterv1);
            sollya_mpfi_clear(tempIA);
            if (timingString != NULL) popTimeCounter(timingString);
          }
          mpfr_clear(a);
          mpfr_clear(b);
        } else {
          printMessage(1,SOLLYA_MSG_AUTODIFF_DEGREE_MUST_NOT_BE_NEGATIVE,"Warning: the degree of differentiation in autodiff must not be negative.\n");
        }
      }
    }
    break;
  case DEGREE:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isPureTree(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      mpz_init(tempMpz);
      getDegreeMpzVerified(tempMpz, copy->child1);
      tempNode = makeConstantMpz(tempMpz);
      mpz_clear(tempMpz);
      freeThing(copy);
      copy = tempNode;
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case NUMERATOR:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isPureTree(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      if (!getNumeratorDenominator(&tempNode,&tempNode2,copy->child1)) {
	printMessage(1,SOLLYA_MSG_EXPR_IS_NO_FRACTION,"Warning: the expression given is not a fraction. Will consider it as a fraction with denominator 1.\n");
      } else {
	freeThing(tempNode2);
      }
      freeThing(copy);
      copy = tempNode;
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case DENOMINATOR:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isPureTree(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      if (!getNumeratorDenominator(&tempNode2,&tempNode,copy->child1)) {
	printMessage(1,SOLLYA_MSG_EXPR_IS_NO_FRACTION,"Warning: the expression given is not a fraction. Will consider it as a fraction with denominator 1.\n");
	tempNode = makeConstantDouble(1.0);
      }
      freeThing(tempNode2);
      freeThing(copy);
      copy = tempNode;
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case SUBSTITUTE:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1) && isPureTree(copy->child2)) {
      if (timingString != NULL) pushTimeCounter();
      tempNode = substitute(copy->child1,copy->child2);
      freeThing(copy);
      copy = tempNode;
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case COMPOSEPOLYNOMIALS:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1) && isPureTree(copy->child2)) {
      if (timingString != NULL) pushTimeCounter();
      tempChain = NULL;
      tempNode2 = NULL;
      composePolynomials(&tempNode2,&tempChain,copy->child1,copy->child2,tools_precision);
      if (timingString != NULL) popTimeCounter(timingString);
      if (tempNode2 != NULL) {
	if (tempChain == NULL) {
	  tempNode3 = makeEmptyList();
	} else {
	  tempChain2 = NULL;
	  for (curr=tempChain;curr!=NULL;curr=curr->next) {
	    mpfr_init2(a,sollya_mpfi_get_prec(*((sollya_mpfi_t *) (curr->value))));
	    mpfr_init2(b,sollya_mpfi_get_prec(*((sollya_mpfi_t *) (curr->value))));
	    sollya_mpfi_get_left(a,*((sollya_mpfi_t *) (curr->value)));
	    sollya_mpfi_get_right(b,*((sollya_mpfi_t *) (curr->value)));
	    tempChain2 = addElement(tempChain2,makeRange(makeConstant(a),makeConstant(b)));
	    mpfr_clear(a);
	    mpfr_clear(b);
	  }
	  tempNode3 = makeList(tempChain2);
	}
	structEntry = (entry *) safeMalloc(sizeof(entry));
	tempString = "poly";
	structEntry->name = (char *) safeCalloc(strlen(tempString)+1,sizeof(char));
	strcpy(structEntry->name,tempString);
	structEntry->value = tempNode2;
	assoclist = addElement(NULL,(void *) structEntry);
	structEntry = (entry *) safeMalloc(sizeof(entry));
	tempString = "radii";
	structEntry->name = (char *) safeCalloc(strlen(tempString)+1,sizeof(char));
	strcpy(structEntry->name,tempString);
	structEntry->value = tempNode3;
	assoclist = addElement(assoclist,(void *) structEntry);
	tempNode = makeStructure(assoclist);
	freeThing(copy);
	copy = tempNode;
      }
      if (tempChain != NULL) freeChain(tempChain,freeMpfiPtr);
    }
    break;
  case COEFF:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1) && isPureTree(copy->child2)) {
      if (evaluateThingToInteger(&resA,copy->child2,NULL)) {
	if (timingString != NULL) pushTimeCounter();
	tempNode = getIthCoefficient(copy->child1, resA);
	freeThing(copy);
	copy = tempNode;
	if (timingString != NULL) popTimeCounter(timingString);
      }
    }
    break;
  case SUBPOLY:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1) &&
	(isPureList(copy->child2) || isPureFinalEllipticList(copy->child2))) {
      if (evaluateThingToIntegerList(&tempChain, &resA, copy->child2)) {
	if (timingString != NULL) pushTimeCounter();
	tempNode = getSubpolynomial(copy->child1, tempChain, resA, tools_precision);
	freeThing(copy);
	copy = tempNode;
	freeChain(tempChain,freeIntPtr);
	if (timingString != NULL) popTimeCounter(timingString);
      }
    }
    break;
  case ROUNDCOEFFICIENTS:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1) &&
	(isPureList(copy->child2) || isPureFinalEllipticList(copy->child2))) {
      if (evaluateThingToExtendedExpansionFormatList(&tempChain, copy->child2)) {
	if (timingString != NULL) pushTimeCounter();
	tempNode = roundPolynomialCoefficients(copy->child1, tempChain, tools_precision);
	freeThing(copy);
	copy = tempNode;
	freeChain(tempChain,freeIntPtr);
	if (timingString != NULL) popTimeCounter(timingString);
      }
    }
    break;
  case RATIONALAPPROX:
    safeFree(copy);
    copy = evaluateThingInnerRationalapprox(tree, timingString);
    break;
  case ACCURATEINFNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    curr = copy->arguments;
    firstArg = (node *) (curr->value);
    curr = curr->next;
    secondArg = (node *) (curr->value);
    curr = curr->next;
    thirdArg = (node *) (curr->value);
    curr = curr->next;
    resA = 1;
    tempChain = NULL;
    if (curr != NULL) {
      if (isPureList((node *) (curr->value))) {
	tempChain = accessThruMemRef(((node *) (curr->value)))->arguments;
	curr = tempChain;
	while (curr != NULL) {
	  if (!isRange((node *) (curr->value))) {
	    resA = 0;
	    break;
	  }
	  curr = curr->next;
	}
      } else {
	resA = 0;
      }
    }
    if (isPureTree(firstArg) &&
	isRange(secondArg) &&
	isPureTree(thirdArg) &&
	resA
	) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      if (evaluateThingToRange(a,b,secondArg)) {
	resB = tools_precision >> 1;
	if (evaluateThingToInteger(&resA,thirdArg,&resB)) {
	  if (resA > 2) {
	    mpfr_init2(c,(mp_prec_t) resA);
	    newChain = NULL;
	    if (tempChain != NULL) {
	      curr = tempChain;
	      while (curr != NULL) {
		rangeTempPtr = (rangetype *) safeMalloc(sizeof(rangetype));
		rangeTempPtr->a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
		rangeTempPtr->b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
		mpfr_init2(*(rangeTempPtr->a),tools_precision);
		mpfr_init2(*(rangeTempPtr->b),tools_precision);
		evaluateThingToRange(*(rangeTempPtr->a),*(rangeTempPtr->b),(node *) (curr->value));
		newChain = addElement(newChain, rangeTempPtr);
		curr = curr->next;
	      }
	    }
	    xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    mpfr_init2(*(xrange.a),tools_precision);
	    mpfr_init2(*(xrange.b),tools_precision);
	    mpfr_set(*(xrange.a),a,GMP_RNDN);
	    mpfr_set(*(xrange.b),b,GMP_RNDN);
	    if (timingString != NULL) pushTimeCounter();
	    resB = accurateInfnorm(c, firstArg, xrange, newChain, tools_precision);
	    if (timingString != NULL) popTimeCounter(timingString);
	    if (!resB) {
	      mpfr_set_nan(c);
	    }
	    mpfr_clear(*(xrange.a));
	    mpfr_clear(*(xrange.b));
	    safeFree(xrange.a);
	    safeFree(xrange.b);
	    if (newChain != NULL) freeChain(newChain,freeRangetypePtr);
	    tempNode = makeConstant(c);
	    freeThing(copy);
	    copy = tempNode;
	    mpfr_clear(c);
	  }
	}
      }
      mpfr_clear(a);
      mpfr_clear(b);
    }
    break;
  case ROUNDTOFORMAT:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    curr = copy->arguments;
    if (isPureTree((node *) (curr->value))) {
      curr = curr->next;
      if (isPureTree((node *) (curr->value)) ||
	  isDefault((node *) (curr->value))  ||
	  isExpansionFormat((node *) (curr->value))) {
	curr = curr->next;
	if (isRoundingSymbol((node *) (curr->value)) || isDefault((node *) (curr->value))) {
	  curr = copy->arguments;
	  firstArg = (node *) (curr->value);
	  if (isConstant(firstArg)) {
	    curr = curr->next;
	    resB = tools_precision;
	    if (isPureTree((node *) (curr->value)) ||
		isDefault((node *) (curr->value))) {
	      if (evaluateThingToInteger(&resA,(node *) (curr->value),&resB)) {
		if (resA >= 2) {
		  curr = curr->next;
		  resD = GMP_RNDN;
		  if (evaluateThingToRoundingSymbol(&resC,(node *) (curr->value),&resD)) {
		    if (timingString != NULL) pushTimeCounter();
		    mpfr_init2(b,(((mp_prec_t) tools_precision > (mp_prec_t) resB) ? (mp_prec_t) tools_precision : (mp_prec_t) resB));
		    resG = 0;
		    if (timingString != NULL) pushTimeCounter();
		    resF = round_constant_expr_to_format_or_expansion_format(&resE, &resG, b, firstArg, 0, 1, resA, (mp_rnd_t) resC);
		    if (timingString != NULL) popTimeCounter(timingString);
		    if (resG) {
		      if (resE == 0) {
			printMessage(2,SOLLYA_MSG_NO_ROUNDING_HAS_HAPPENED,"Information: no rounding has happened.\n");
		      } else {
			if (resE < 0) {
			  printMessage(2,SOLLYA_MSG_ROUND_DOWN_HAS_HAPPENED,"Information: rounding down has happened.\n");
			} else {
			  printMessage(2,SOLLYA_MSG_ROUND_UP_HAS_HAPPENED,"Information: rounding up has happened.\n");
			}
		      }
		    }
		    if (resF) {
		      tempNode = makeConstant(b);
		      freeThing(copy);
		      copy = tempNode;
		    }
		    mpfr_clear(b);
		  }
		} else {
		  printMessage(1,SOLLYA_MSG_ROUND_PREC_MUST_BE_AT_LEAST_TWO_BITS, "Warning: the precision specified when rounding to a particular format must be at least 2 bits.\n");
		}
	      }
	    } else {
	      if (evaluateThingToExpansionFormat(&resA,(node *) (curr->value))) {
		curr = curr->next;
		resD = GMP_RNDN;
		if (evaluateThingToRoundingSymbol(&resC,(node *) (curr->value),&resD)) {
		  mpfr_init2(b,((tools_precision > 200) ? tools_precision : 200));
		  resG = 0;
		  if (timingString != NULL) pushTimeCounter();
		  resF = round_constant_expr_to_format_or_expansion_format(&resE, &resG, b, firstArg, 1, resA, 1, (mp_rnd_t) resC);
		  if (timingString != NULL) popTimeCounter(timingString);
		  if (resG) {
		    if (resE == 0) {
		      printMessage(2,SOLLYA_MSG_NO_ROUNDING_HAS_HAPPENED,"Information: no rounding has happened.\n");
		    } else {
		      if (resE < 0) {
			printMessage(2,SOLLYA_MSG_ROUND_DOWN_HAS_HAPPENED,"Information: rounding down has happened.\n");
		      } else {
			printMessage(2,SOLLYA_MSG_ROUND_UP_HAS_HAPPENED,"Information: rounding up has happened.\n");
		      }
		    }
		  }
		  if (resF) {
		    tempNode = makeConstant(b);
		    freeThing(copy);
		    copy = tempNode;
		  }
		  mpfr_clear(b);
		}
	      }
	    }
	  }
	}
      }
    }
    break;
  case EVALUATE:
    copy->child1 = evaluateThingInner(tree->child1); 
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1)) {
      if (isPureTree(copy->child2)) {
	if (isConstant(copy->child2)) {
	  mpfr_init2(a,tools_precision);
	  if (evaluateThingToConstant(a,copy->child2,NULL,0,0)) {
	    mpfr_init2(b,tools_precision);
	    if (timingString != NULL) pushTimeCounter();
	    if (evaluateFaithful(b, copy->child1, a, tools_precision)) {
	      freeThing(copy);
	      copy = makeConstant(b);
	    } else {
	      xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	      xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	      yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	      yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	      mpfr_init2(*(xrange.a),mpfr_get_prec(a));
	      mpfr_init2(*(xrange.b),mpfr_get_prec(a));
	      mpfr_init2(*(yrange.a),tools_precision);
	      mpfr_init2(*(yrange.b),tools_precision);
	      mpfr_set(*(xrange.a),a,GMP_RNDD);
	      mpfr_set(*(xrange.b),a,GMP_RNDU);
	      evaluateRangeFunction(yrange, copy->child1, xrange, tools_precision * 256);
	      freeThing(copy);
	      if ((mpfr_inf_p(*(yrange.a)) &&
		   mpfr_inf_p(*(yrange.b)) &&
		   (mpfr_sgn(*(yrange.a)) == mpfr_sgn(*(yrange.b)))) ||
		  (mpfr_number_p(*(yrange.a)) && 
		   mpfr_number_p(*(yrange.b)) &&
		   (mpfr_cmp(*(yrange.a),*(yrange.b)) == 0))) {
		copy = makeConstant(*(yrange.a));
	      } else {
		copy = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	      }
	      mpfr_clear(*(xrange.a));
	      mpfr_clear(*(xrange.b));
	      mpfr_clear(*(yrange.a));
	      mpfr_clear(*(yrange.b));
	      safeFree(xrange.a);
	      safeFree(xrange.b);
	      safeFree(yrange.a);
	      safeFree(yrange.b);
	    }
	    if (timingString != NULL) popTimeCounter(timingString);
	    mpfr_clear(b);
	  }
	  mpfr_clear(a);
	} else {
	  tempNode = substitute(copy->child1,copy->child2);
	  freeThing(copy);
	  copy = tempNode;
	}
      } else {
	if (isRange(copy->child2)) {
	  if (timingString != NULL) pushTimeCounter();
	  resA = 0; pTemp = tools_precision;
	  if (mpfr_cmp(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value))==0) {
	    mpfr_init2(a,tools_precision+1);
	    if (evaluateFaithful(a, copy->child1, *(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value), tools_precision+1)) {
	      mpfr_init2(b,mpfr_get_prec(a));
	      mpfr_set(b,a,GMP_RNDN);
	      mpfr_nextabove(b);
	      mpfr_nextbelow(a);
	      pTemp2 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value));
	      pTemp3 = mpfr_get_prec(*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
	      sollya_mpfi_init2(tempIA, (pTemp2 > pTemp3) ? pTemp2 : pTemp3);
	      sollya_mpfi_interv_fr(tempIA, *(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value), *(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value));
	      sollya_mpfi_init2(tempIB, tools_precision + 10);
	      pTemp2 = mpfr_get_prec(a);
	      pTemp2 = mpfr_get_prec(b);
	      sollya_mpfi_init2(tempIC, (pTemp2 > pTemp3) ? pTemp2 : pTemp3);
	      sollya_mpfi_interv_fr(tempIC, a, b);
	      evaluateInterval(tempIB, copy->child1, NULL, tempIA);
	      sollya_mpfi_intersect(tempIC, tempIC, tempIB);
	      sollya_mpfi_get_left(a, tempIC);
	      sollya_mpfi_get_right(b, tempIC);
	      sollya_mpfi_clear(tempIA);
	      sollya_mpfi_clear(tempIB);
	      sollya_mpfi_clear(tempIC);
	      freeThing(copy);
	      mpfr_init2(c,tools_precision);
	      mpfr_init2(d,tools_precision);
	      mpfr_set(c,a,GMP_RNDD);
	      mpfr_set(d,b,GMP_RNDU);
	      copy = makeRange(makeConstant(c),makeConstant(d));
	      mpfr_clear(c);
	      mpfr_clear(d);
	      resA = 1;
	      mpfr_clear(b);
	    } else {
	      pTemp = 256 * tools_precision;
	    }
	    mpfr_clear(a);
	  }
	  if (!resA) {
	    xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    yrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	    mpfr_init2(*(xrange.a),pTemp);
	    mpfr_init2(*(xrange.b),pTemp);
	    mpfr_init2(*(yrange.a),pTemp);
	    mpfr_init2(*(yrange.b),pTemp);
	    mpfr_set(*(xrange.a),*(accessThruMemRef(accessThruMemRef(copy->child2)->child1)->value),GMP_RNDD);
	    mpfr_set(*(xrange.b),*(accessThruMemRef(accessThruMemRef(copy->child2)->child2)->value),GMP_RNDU);
	    evaluateRangeFunction(yrange, copy->child1, xrange, pTemp);
	    freeThing(copy);
	    mpfr_init2(c,tools_precision);
	    mpfr_init2(d,tools_precision);
	    mpfr_set(c,*(yrange.a),GMP_RNDD);
	    mpfr_set(d,*(yrange.b),GMP_RNDU);
	    copy = makeRange(makeConstant(c),makeConstant(d));
	    mpfr_clear(c);
	    mpfr_clear(d);
	    mpfr_clear(*(xrange.a));
	    mpfr_clear(*(xrange.b));
	    mpfr_clear(*(yrange.a));
	    mpfr_clear(*(yrange.b));
	    safeFree(xrange.a);
	    safeFree(xrange.b);
	    safeFree(yrange.a);
	    safeFree(yrange.b);
	  }
	  if (timingString != NULL) popTimeCounter(timingString);
	}
      }
    }
    break;
  case PARSE:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isString(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      if ((tempNode = parseStringInternal(accessThruMemRef(copy->child1)->string)) != NULL) {
	freeThing(copy);
	copy = tempNode;
      } else {
	printMessage(1,SOLLYA_MSG_STRING_CANNOT_BE_PARSED_BY_MINIPARSER,"Warning: the string \"%s\" could not be parsed by the miniparser.\n",accessThruMemRef(copy->child1)->string);
        considerDyingOnError();
      }
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case READXML:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isString(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      if ((tempNode = readXml(accessThruMemRef(copy->child1)->string)) != NULL) {
	freeThing(copy);
	copy = tempNode;
      } else {
	printMessage(1,SOLLYA_MSG_XML_FILE_CANNOT_BE_READ,"Warning: the file \"%s\" could not be read as an XML file.\n",accessThruMemRef(copy->child1)->string);
        considerDyingOnError();
      }
      if (timingString != NULL) popTimeCounter(timingString);
    }
    break;
  case INFNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    curr = copy->arguments;
    firstArg = (node *) (curr->value);
    curr = curr->next;
    secondArg = (node *) (curr->value);
    curr = curr->next;
    fourthArg = NULL;
    if (curr != NULL) {
      if (isString((node *) (curr->value))) {
	fourthArg = (node *) (curr->value);
	curr = curr->next;
      }
    }
    resA = 1;
    tempChain = NULL;
    if (curr != NULL) {
      if (isPureList((node *) (curr->value))) {
	tempChain = accessThruMemRef(((node *) (curr->value)))->arguments;
	curr = tempChain;
	while (curr != NULL) {
	  if (!isRange((node *) (curr->value))) {
	    resA = 0;
	    break;
	  }
	  curr = curr->next;
	}
      } else {
	resA = 0;
      }
    }
    if (isPureTree(firstArg) &&
	isRange(secondArg) &&
	resA
	) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      if (evaluateThingToRange(a,b,secondArg)) {
	resB = 0; fd = NULL;
	if (fourthArg == NULL) resB = 1; else {
	  if (evaluateThingToString(&tempString,fourthArg)) {
	    resB = 1;
	    if ((fd = fopen(tempString,"w")) == NULL) {
	      printMessage(1,SOLLYA_MSG_FILE_COULD_NOT_BE_OPENED_FOR_WRITING_IGNORING,"Warning: the file \"%s\" could not be opened for writing. The proof argument will be ignored.\n",tempString);
              considerDyingOnError();
	    }
	    safeFree(tempString);
	  }
	}
	if (resB) {
	  newChain = NULL;
	  if (tempChain != NULL) {
	    curr = tempChain;
	    while (curr != NULL) {
	      rangeTempPtr = (rangetype *) safeMalloc(sizeof(rangetype));
	      rangeTempPtr->a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	      rangeTempPtr->b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	      mpfr_init2(*(rangeTempPtr->a),tools_precision);
	      mpfr_init2(*(rangeTempPtr->b),tools_precision);
	      evaluateThingToRange(*(rangeTempPtr->a),*(rangeTempPtr->b),(node *) (curr->value));
	      newChain = addElement(newChain, rangeTempPtr);
	      curr = curr->next;
	    }
	  }
	  xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  mpfr_init2(*(xrange.a),tools_precision);
	  mpfr_init2(*(xrange.b),tools_precision);
	  mpfr_set(*(xrange.a),a,GMP_RNDN);
	  mpfr_set(*(xrange.b),b,GMP_RNDN);
	  if (timingString != NULL) pushTimeCounter();
	  yrange = infnorm(firstArg, xrange, newChain, tools_precision, statediam, fd);
	  if (timingString != NULL) popTimeCounter(timingString);
	  if (fd != NULL) fclose(fd);
	  tempNode = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	  mpfr_clear(*(yrange.a));
	  mpfr_clear(*(yrange.b));
	  safeFree(yrange.a);
	  safeFree(yrange.b);
	  mpfr_clear(*(xrange.a));
	  mpfr_clear(*(xrange.b));
	  safeFree(xrange.a);
	  safeFree(xrange.b);
	  if (newChain != NULL) freeChain(newChain,freeRangetypePtr);
	  freeThing(copy);
	  copy = tempNode;
	}
      }
      mpfr_clear(a);
      mpfr_clear(b);
    }
    break;
  case SUPNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    /* supnorm(poly,func,range,mode,accuracy)
       The parser ensures that we have exactly five arguments
    */
    curr = copy->arguments;
    firstArg = (node *) (curr->value);
    curr = curr->next;
    secondArg = (node *) (curr->value);
    curr = curr->next;
    thirdArg = (node *) (curr->value);
    curr = curr->next;
    fourthArg = (node *) (curr->value);
    curr = curr->next;
    fifthArg = (node *) (curr->value);
    if (isPureTree(firstArg) &&
	isPureTree(secondArg) &&
	isPureTree(fifthArg) &&
	isRange(thirdArg) &&
	isExternalPlotMode(fourthArg)) {
      if (isConstant(fifthArg)) {
	mpfr_init2(a,tools_precision);
	mpfr_init2(b,tools_precision);
	if (evaluateThingToRange(a,b,thirdArg)) {
	  mpfr_init2(c,tools_precision);
	  if (evaluateThingToConstant(c,fifthArg,NULL,0,0)) {
	    if (evaluateThingToExternalPlotMode(&resA, fourthArg, NULL)) {
	      pTemp = mpfr_get_prec(a);
	      pTemp2 = mpfr_get_prec(b);
	      if (pTemp2 > pTemp) pTemp = pTemp2;
	      sollya_mpfi_init2(tempIA,pTemp);
	      sollya_mpfi_interv_fr_safe(tempIA,a,b);
	      mpfr_init2(bb,8 * sizeof(mp_prec_t) + 10);
	      mpfr_abs(bb,c,GMP_RNDN);
	      mpfr_log2(bb,bb,GMP_RNDN);
	      mpfr_floor(bb,bb);
	      mpfr_neg(bb,bb,GMP_RNDN);
	      tempUI = mpfr_get_ui(bb,GMP_RNDN);
	      tempUI += 10;
	      mpfr_clear(bb);
	      if (((mp_prec_t) tempUI < tools_precision) || ((mp_prec_t) tempUI > (mp_prec_t) 2048 * tools_precision)) pTemp = (mp_prec_t) tools_precision + 10; else pTemp = (mp_prec_t) tempUI;
	      sollya_mpfi_init2(tempIB,pTemp);
	      resB = supremumnorm(tempIB, firstArg, secondArg, tempIA, resA, c);
	      if (resB) {
		pTemp = sollya_mpfi_get_prec(tempIB);
		mpfr_init2(d,pTemp);
		mpfr_init2(e,pTemp);
		sollya_mpfi_get_left(d,tempIB);
		sollya_mpfi_get_right(e,tempIB);
		tempNode = makeRange(makeConstant(d),makeConstant(e));
		freeThing(copy);
		copy = tempNode;
		mpfr_clear(d);
		mpfr_clear(e);
	      } else {
		printMessage(1,SOLLYA_MSG_SUPNORM_DID_NOT_WORK_OUT_WELL,"Warning: the supremum norm on the error function between the given polynomial and the given function could not be computed.\n");
		considerDyingOnError();
		tempNode = makeError();
		freeThing(copy);
		copy = tempNode;
	      }
	      sollya_mpfi_clear(tempIA);
	      sollya_mpfi_clear(tempIB);
	    }
	  }
	  mpfr_clear(c);
	}
	mpfr_clear(a);
	mpfr_clear(b);
      }
    }
    break;
  case FINDZEROS:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1) &&
	isRange(copy->child2)) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      if (evaluateThingToRange(a,b,copy->child2)) {
	xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	mpfr_init2(*(xrange.a),tools_precision);
	mpfr_init2(*(xrange.b),tools_precision);
	mpfr_set(*(xrange.a),a,GMP_RNDN);
	mpfr_set(*(xrange.b),b,GMP_RNDN);
	if (timingString != NULL) pushTimeCounter();
	tempChain = findZerosFunction(copy->child1, xrange, tools_precision, statediam);
	if (timingString != NULL) popTimeCounter(timingString);
	if (tempChain == NULL) {
	  tempNode = makeEmptyList();
	} else {
	  newChain = NULL;
	  curr = tempChain;
	  while (curr != NULL) {
	    newChain = addElement(newChain,makeRange(makeConstant(*(((rangetype *) (curr->value))->a)),makeConstant(*(((rangetype *) (curr->value))->b))));
	    curr = curr->next;
	  }
	  curr = copyChain(newChain,copyThingOnVoid);
	  freeChain(newChain,freeThingOnVoid);
	  newChain = curr;
	  tempNode = makeList(newChain);
	}
	freeChain(tempChain,freeRangetypePtr);
	mpfr_clear(*(xrange.a));
	mpfr_clear(*(xrange.b));
	safeFree(xrange.a);
	safeFree(xrange.b);
	freeThing(copy);
	copy = tempNode;
      }
      mpfr_clear(a);
      mpfr_clear(b);
    }
    break;
  case FPFINDZEROS:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1) &&
	isRange(copy->child2)) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      if (evaluateThingToRange(a,b,copy->child2)) {
	xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	mpfr_init2(*(xrange.a),tools_precision);
	mpfr_init2(*(xrange.b),tools_precision);
	mpfr_set(*(xrange.a),a,GMP_RNDN);
	mpfr_set(*(xrange.b),b,GMP_RNDN);
	if (timingString != NULL) pushTimeCounter();
	tempChain = fpFindZerosFunction(copy->child1, xrange, tools_precision);
	if (timingString != NULL) popTimeCounter(timingString);
	if (tempChain == NULL) {
	  tempNode = makeEmptyList();
	} else {
	  newChain = NULL;
	  curr = tempChain;
	  while (curr != NULL) {
	    newChain = addElement(newChain,makeConstant(*((mpfr_t *) (curr->value))));
	    curr = curr->next;
	  }
	  curr = copyChain(newChain,copyThingOnVoid);
	  freeChain(newChain,freeThingOnVoid);
	  newChain = curr;
	  tempNode = makeList(newChain);
	}
	freeChain(tempChain,freeMpfrPtr);
	mpfr_clear(*(xrange.a));
	mpfr_clear(*(xrange.b));
	safeFree(xrange.a);
	safeFree(xrange.b);
	freeThing(copy);
	copy = tempNode;
      }
      mpfr_clear(a);
      mpfr_clear(b);
    }
    break;
  case NUMBERROOTS:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1) &&
	isRange(copy->child2)) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      if (evaluateThingToRange(a,b,copy->child2)) {
	mpfr_init2(c,tools_precision);
        sollya_mpfi_init2(tempIA,tools_precision);
        sollya_mpfi_interv_fr_safe(tempIA,a,b);
	if (timingString != NULL) pushTimeCounter();
	resA = getNrRoots(c, copy->child1, tempIA, tools_precision);
	if (timingString != NULL) popTimeCounter(timingString);
        sollya_mpfi_clear(tempIA);
        if (resA) {
          tempNode = makeConstant(c);
          freeThing(copy);
          copy = tempNode;
        }
	mpfr_clear(c);
      }
      mpfr_clear(a);
      mpfr_clear(b);
    }
    break;
  case DIRTYINFNORM:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1) &&
	isRange(copy->child2)) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      if (evaluateThingToRange(a,b,copy->child2)) {
	mpfr_init2(c,tools_precision);
	if (timingString != NULL) pushTimeCounter();
	uncertifiedInfnorm(c, copy->child1, a, b, defaultpoints, tools_precision);
	if (timingString != NULL) popTimeCounter(timingString);
	tempNode = makeConstant(c);
	mpfr_clear(c);
	freeThing(copy);
	copy = tempNode;
      }
      mpfr_clear(a);
      mpfr_clear(b);
    }
    break;
  case INTEGRAL:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1) &&
	isRange(copy->child2)) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      if (evaluateThingToRange(a,b,copy->child2)) {
	xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	mpfr_init2(*(xrange.a),tools_precision);
	mpfr_init2(*(xrange.b),tools_precision);
	mpfr_set(*(xrange.a),a,GMP_RNDN);
	mpfr_set(*(xrange.b),b,GMP_RNDN);
	if (timingString != NULL) pushTimeCounter();
	yrange = integral(copy->child1, xrange, tools_precision, statediam);
	if (timingString != NULL) popTimeCounter(timingString);
	tempNode = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
	mpfr_clear(*(yrange.a));
	mpfr_clear(*(yrange.b));
	safeFree(yrange.a);
	safeFree(yrange.b);
	mpfr_clear(*(xrange.a));
	mpfr_clear(*(xrange.b));
	safeFree(xrange.a);
	safeFree(xrange.b);
	freeThing(copy);
	copy = tempNode;
      }
      mpfr_clear(a);
      mpfr_clear(b);
    }
    break;
  case DIRTYINTEGRAL:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1) &&
	isRange(copy->child2)) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      if (evaluateThingToRange(a,b,copy->child2)) {
	mpfr_init2(c,tools_precision);
	if (timingString != NULL) pushTimeCounter();
	uncertifiedIntegral(c, copy->child1, a, b, defaultpoints, tools_precision);
	if (timingString != NULL) popTimeCounter(timingString);
	tempNode = makeConstant(c);
	mpfr_clear(c);
	freeThing(copy);
	copy = tempNode;
      }
      mpfr_clear(a);
      mpfr_clear(b);
    }
    break;
  case IMPLEMENTPOLY:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    curr = copy->arguments;
    firstArg = (node *) (curr->value);
    curr = curr->next;
    secondArg = (node *) (curr->value);
    curr = curr->next;
    thirdArg = (node *) (curr->value);
    curr = curr->next;
    fourthArg = (node *) (curr->value);
    curr = curr->next;
    fifthArg = (node *) (curr->value);
    curr = curr->next;
    sixthArg = (node *) (curr->value);
    curr = curr->next;
    resA = 1; resB = 0; tempString = NULL;
    if (curr != NULL) {
      seventhArg = (node *) (curr->value);
      if (!(isHonorcoeffprec(seventhArg) || isString(seventhArg))) {
	resA = 0;
      }
      if (resA) {
	if (isHonorcoeffprec(seventhArg)) {
	  resB = 1;
	} else {
	  if (!evaluateThingToString(&tempString,seventhArg)) {
	    resA = 0;
	  }
	}
      }
      curr = curr->next;
      if (curr != NULL) {
	eighthArg = (node *) (curr->value);
	if (!(isHonorcoeffprec(eighthArg) || isString(eighthArg))) {
	  resA = 0;
	}
	if (resA) {
	  if (isHonorcoeffprec(eighthArg)) {
	    resB = 1;
	  } else {
	    if (tempString != NULL) {
	      resA = 0;
	    } else {
	      if (!evaluateThingToString(&tempString,eighthArg)) {
		resA = 0;
	      }
	    }
	  }
	}
      }
    }
    fd = NULL;
    if (tempString != NULL) {
      if ((fd = fopen(tempString,"w")) == NULL) {
	printMessage(1,SOLLYA_MSG_FILE_COULD_NOT_BE_OPENED_FOR_WRITING_IGNORING,"Warning: the file \"%s\" could not be opened for writing. The proof argument will be ignored.\n",tempString);
        considerDyingOnError();
      }
      safeFree(tempString);
    }
    if (isPureTree(firstArg) &&
	isRange(secondArg) &&
	isPureTree(thirdArg) &&
	isRestrictedExpansionFormat(fourthArg) &&
	isString(fifthArg) &&
	isString(sixthArg) &&
	resA) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      mpfr_init2(c,tools_precision);
      if (evaluateThingToRange(a,b,secondArg) &&
	  evaluateThingToConstant(c,thirdArg,NULL,0,0) &&
	  evaluateThingToRestrictedExpansionFormat(&resC,fourthArg) &&
	  evaluateThingToString(&tempString2, fifthArg) &&
	  evaluateThingToString(&tempString3, sixthArg)) {
	if ((fd2 = fopen(tempString3,"w")) != NULL) {
	  xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  mpfr_init2(*(xrange.a),tools_precision);
	  mpfr_init2(*(xrange.b),tools_precision);
	  mpfr_set(*(xrange.a),a,GMP_RNDN);
	  mpfr_set(*(xrange.b),b,GMP_RNDN);
	  if (timingString != NULL) pushTimeCounter();
	  tempNode = implementpoly(firstArg, xrange, &c, resC, fd2, tempString2, resB, tools_precision, fd);
	  if (timingString != NULL) popTimeCounter(timingString);
	  mpfr_clear(*(xrange.a));
	  mpfr_clear(*(xrange.b));
	  safeFree(xrange.a);
	  safeFree(xrange.b);
	  if (tempNode == NULL) {
	    printMessage(1,SOLLYA_MSG_IMPLEMENTATION_HAS_NOT_SUCCEEDED,"Warning: the implementation has not succeeded. The command could not be executed.\n");
            considerDyingOnError();
	    tempNode = makeError();
	  }
	  fclose(fd2);
	} else {
	  printMessage(1,SOLLYA_MSG_FILE_COULD_NOT_BE_OPENED_FOR_WRITING,"Warning: the file \"%s\" could not be opened for writing. The command cannot be executed.\n",tempString3);
          considerDyingOnError();
	  tempNode = makeError();
	}
	safeFree(tempString2);
	safeFree(tempString3);
	freeThing(copy);
	copy = tempNode;
      }
      mpfr_clear(a);
      mpfr_clear(b);
      mpfr_clear(c);
    }
    if (fd != NULL) fclose(fd);
    break;
  case CHECKINFNORM:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    curr = copy->arguments;
    firstArg = (node *) (curr->value);
    curr = curr->next;
    secondArg = (node *) (curr->value);
    curr = curr->next;
    thirdArg = (node *) (curr->value);
    if (isPureTree(firstArg) &&
	isRange(secondArg) &&
	isPureTree(thirdArg)) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      if (evaluateThingToRange(a,b,secondArg)) {
	mpfr_init2(c,tools_precision);
	if (evaluateThingToConstant(c,thirdArg,NULL,0,0)) {
	  xrange.a = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  xrange.b = (mpfr_t *) safeMalloc(sizeof(mpfr_t));
	  mpfr_init2(*(xrange.a),tools_precision);
	  mpfr_init2(*(xrange.b),tools_precision);
	  mpfr_set(*(xrange.a),a,GMP_RNDN);
	  mpfr_set(*(xrange.b),b,GMP_RNDN);
	  if (timingString != NULL) pushTimeCounter();
	  resA = checkInfnorm(firstArg, xrange, c, statediam, tools_precision);
	  if (timingString != NULL) popTimeCounter(timingString);
	  mpfr_clear(*(xrange.a));
	  mpfr_clear(*(xrange.b));
	  safeFree(xrange.a);
	  safeFree(xrange.b);
	  freeThing(copy);
	  if (resA)
	    copy = makeTrue();
	  else
	    copy = makeFalse();
	}
	mpfr_clear(c);
      }
      mpfr_clear(a);
      mpfr_clear(b);
    }
    break;
  case ZERODENOMINATORS:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1) &&
	isRange(copy->child2)) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      if (evaluateThingToRange(a,b,copy->child2)) {
	if (timingString != NULL) pushTimeCounter();
	tempChain = uncertifiedZeroDenominators(copy->child1, a, b, tools_precision);
	if (timingString != NULL) popTimeCounter(timingString);
	if (tempChain == NULL) {
	  tempNode = makeEmptyList();
	} else {
	  newChain = NULL;
	  curr = tempChain;
	  while (curr != NULL) {
	    newChain = addElement(newChain,makeConstant(*((mpfr_t *) (curr->value))));
	    curr = curr->next;
	  }
	  curr = copyChain(newChain,copyThingOnVoid);
	  freeChain(newChain,freeThingOnVoid);
	  newChain = curr;
	  tempNode = makeList(newChain);
	}
	freeChain(tempChain,freeMpfrPtr);
	freeThing(copy);
	copy = tempNode;
      }
      mpfr_clear(a);
      mpfr_clear(b);
    }
    break;
  case ISEVALUABLE:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1) &&
	isPureTree(copy->child2)) {
      mpfr_init2(a,tools_precision);
      if (evaluateThingToConstant(a,copy->child2,NULL,0,0)) {
	if (timingString != NULL) pushTimeCounter();
	mpfr_init2(b,tools_precision);
	if (isEvaluable(copy->child1, a, &b, tools_precision) != ISNOTEVALUABLE) {
	  tempNode = makeTrue();
	} else {
	  tempNode = makeFalse();
	}
	mpfr_clear(b);
	freeThing(copy);
	copy = tempNode;
	if (timingString != NULL) popTimeCounter(timingString);
      }
      mpfr_clear(a);
    }
    break;
  case SEARCHGAL:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    if (lengthChain(copy->arguments) >= 6) {
      curr = copy->arguments;
      firstArg = copyThing((node *) (curr->value));
      curr = curr->next;
      if (isPureTree(firstArg)) {
	firstArg = makeList(addElement(NULL,firstArg));
      }
      secondArg = copyThing((node *) (curr->value));
      curr = curr->next;
      thirdArg = copyThing((node *) (curr->value));
      curr = curr->next;
      fourthArg = copyThing((node *) (curr->value));
      curr = curr->next;
      fifthArg = copyThing((node *) (curr->value));
      curr = curr->next;
      if (isExpansionFormat(fifthArg)) {
	fifthArg = makeList(addElement(NULL,fifthArg));
      }
      sixthArg = copyThing((node *) (curr->value));
      if (isPureTree(sixthArg)) {
	sixthArg = makeList(addElement(NULL,sixthArg));
      }
      if (isPureList(firstArg) &&
	  isPureTree(secondArg) &&
	  isPureTree(thirdArg) &&
	  isPureTree(fourthArg) &&
	  isPureList(fifthArg) &&
	  isPureList(sixthArg) &&
	  (lengthChain(accessThruMemRef(firstArg)->arguments) == lengthChain(accessThruMemRef(fifthArg)->arguments)) &&
	  (lengthChain(accessThruMemRef(fifthArg)->arguments) == lengthChain(accessThruMemRef(sixthArg)->arguments))) {
	if (evaluateThingToPureListOfPureTrees(&tempChain, firstArg)) {
	  mpfr_init2(a,tools_precision);
	  if (evaluateThingToConstant(a,secondArg,NULL,0,0) &&
	      evaluateThingToInteger(&resA,thirdArg,NULL) &&
	      evaluateThingToInteger(&resB,fourthArg,NULL)) {
	    if (evaluateThingToExpansionFormatList(&tempChain2, fifthArg)) {
	      if (evaluateThingToConstantList(&tempChain3, sixthArg)) {
		mpfr_init2(c,tools_precision);
		if (timingString != NULL) pushTimeCounter();
		resC = searchGalValue(tempChain, c, a, (mp_prec_t) resA, resB, tempChain2, tempChain3, tools_precision);
		if (timingString != NULL) popTimeCounter(timingString);
		if (resC) {
		  tempNode = makeList(addElement(NULL,makeConstant(c)));
		} else {
		  tempNode = makeEmptyList();
		}
		freeThing(copy);
		copy = tempNode;
		mpfr_clear(c);
		freeChain(tempChain3, freeMpfrPtr);
	      }
	      freeChain(tempChain2, freeIntPtr);
	    }
	  }
	  mpfr_clear(a);
	  freeChain(tempChain,freeThingOnVoid);
	}
      }
      freeThing(firstArg);
      freeThing(secondArg);
      freeThing(thirdArg);
      freeThing(fourthArg);
      freeThing(fifthArg);
      freeThing(sixthArg);
    }
    break;
  case GUESSDEGREE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    curr = copy->arguments;
    firstArg = copyThing((node *) (curr->value));
    curr = curr->next;
    secondArg = copyThing((node *) (curr->value));
    curr = curr->next;
    thirdArg = copyThing((node *) (curr->value));
    curr = curr->next;

    fourthArg = NULL;
    if (curr != NULL) {
      fourthArg = copyThing((node *) (curr->value));
      curr = curr->next;
    }
    if ( (fourthArg==NULL)||(isDefault(fourthArg)) ) {
      if (fourthArg!=NULL) freeThing(fourthArg);
      fourthArg = makeConstantDouble(1.0);
    }

    fifthArg = NULL;
    if (curr != NULL)
      fifthArg = copyThing((node *) (curr->value));
    if ( (fifthArg==NULL)||(isDefault(fifthArg)) ) {
      if (fifthArg!=NULL) freeThing(fifthArg);
      fifthArg = makeConstantDouble(128.0);
    }

    if (isPureTree(firstArg) &&
	isRange(secondArg) &&
	isPureTree(thirdArg) &&
	isPureTree(fourthArg) &&
        isPureTree(fifthArg)) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      mpfr_init2(c,tools_precision);

      if (evaluateThingToRange(a,b,secondArg) &&
	  evaluateThingToConstant(c,thirdArg, NULL,0,0) &&
          evaluateThingToInteger(&resA,fifthArg,NULL)) {
        if (resA < 0) {
          printMessage(1, SOLLYA_MSG_GUESSDEGREE_FIFTH_ARGUMENT_MUST_BE_NUMBER, "Error: guessdegree: the optional fifth argument must be a positive number.\n");
        }
        else {
          if (timingString != NULL) pushTimeCounter();
          yrange = guessDegreeWrapper(firstArg, fourthArg, a, b, c, resA+1);
          if (timingString != NULL) popTimeCounter(timingString);
          if ((yrange.a != NULL) && (yrange.b != NULL)) {
            tempNode = makeRange(makeConstant(*(yrange.a)),makeConstant(*(yrange.b)));
            freeThing(copy);
            copy = tempNode;
            mpfr_clear(*(yrange.a));
            mpfr_clear(*(yrange.b));
            safeFree(yrange.a);
            safeFree(yrange.b);
          }
        }
      }
      mpfr_clear(a);
      mpfr_clear(b);
      mpfr_clear(c);
    }
    freeThing(firstArg);
    freeThing(secondArg);
    freeThing(thirdArg);
    freeThing(fourthArg);
    freeThing(fifthArg);
    break;
  case DIRTYFINDZEROS:
    copy->child1 = evaluateThingInner(tree->child1);
    copy->child2 = evaluateThingInner(tree->child2);
    if (isPureTree(copy->child1) &&
	isRange(copy->child2)) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      if (evaluateThingToRange(a,b,copy->child2)) {
	if (mpfr_number_p(a) && mpfr_number_p(b)) {
	  if (timingString != NULL) pushTimeCounter();
	  tempChain = uncertifiedFindZeros(copy->child1, a, b, defaultpoints, tools_precision);
	  if (timingString != NULL) popTimeCounter(timingString);
	} else {
	  tempChain = NULL;
	  printMessage(1,SOLLYA_MSG_DOMAIN_IS_NO_CLOSED_INTERVAL_ON_THE_REALS,"Warning: the range to search for zeros in is not bounded by real numbers.\n");
	}
	if (tempChain == NULL) {
	  tempNode = makeEmptyList();
	} else {
	  newChain = NULL;
	  curr = tempChain;
	  while (curr != NULL) {
	    newChain = addElement(newChain,makeConstant(*((mpfr_t *) (curr->value))));
	    curr = curr->next;
	  }
	  curr = copyChain(newChain,copyThingOnVoid);
	  freeChain(newChain,freeThingOnVoid);
	  newChain = curr;
	  tempNode = makeList(newChain);
	}
	freeChain(tempChain,freeMpfrPtr);
	freeThing(copy);
	copy = tempNode;
      }
      mpfr_clear(a);
      mpfr_clear(b);
    }
    break;
  case HEAD:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isList(copy->child1)) {
      if (!isElliptic((node *) (accessThruMemRef(copy->child1)->arguments->value))) {
	if (timingString != NULL) pushTimeCounter();
	tempNode = copyThing((node *) (accessThruMemRef(copy->child1)->arguments->value));
	freeThing(copy);
	copy = tempNode;
	if (timingString != NULL) popTimeCounter(timingString);
      }
    } else {
      if (isFinalEllipticList(copy->child1)) {
	if (!isElliptic((node *) (accessThruMemRef(copy->child1)->arguments->value))) {
	  if (timingString != NULL) pushTimeCounter();
	  tempNode = copyThing((node *) (accessThruMemRef(copy->child1)->arguments->value));
	  freeThing(copy);
	  copy = tempNode;
	  if (timingString != NULL) popTimeCounter(timingString);
	}
      }
    }
    break;
  case ROUNDCORRECTLY:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isRange(copy->child1)) {
      mpfr_init2(a,tools_precision);
      mpfr_init2(b,tools_precision);
      if (evaluateThingToRange(a,b,copy->child1)) {
	mpfr_init2(c,tools_precision);
	if (timingString != NULL) pushTimeCounter();
	if (!roundRangeCorrectly(c, a, b)) {
	  if (!noRoundingWarnings) {
	    printMessage(1,SOLLYA_MSG_ROUND_TO_NEAREST_IMPOSSIBLE_WITH_BOUNDING,"Warning: correct rounding to nearest impossible with the given bounding.\n");
	  }
	}
	if (timingString != NULL) popTimeCounter(timingString);
	tempNode = makeConstant(c);
	freeThing(copy);
	copy = tempNode;
	mpfr_clear(c);
      }
      mpfr_clear(a);
      mpfr_clear(b);
    }
    break;
  case READFILE:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isString(copy->child1)) {
      fd = fopen(accessThruMemRef(copy->child1)->string,"r");
      if (fd != NULL) {
	if (timingString != NULL) pushTimeCounter();
	tempString = readFileIntoString(fd);
	if (timingString != NULL) popTimeCounter(timingString);
	if (tempString != NULL) {
	  tempNode = makeString(tempString);
	  safeFree(tempString);
	  freeThing(copy);
	  copy = tempNode;
	}
	fclose(fd);
      } else {
	printMessage(1,SOLLYA_MSG_FILE_COULD_NOT_BE_OPENED_FOR_READING,"Warning: the file \"%s\" could not be opened for reading.\n",accessThruMemRef(copy->child1)->string);
        considerDyingOnError();
      }
    }
    break;
  case BASHEVALUATE:
    copy->arguments = copyChainWithoutReversal(tree->arguments, evaluateThingInnerOnVoid);
    curr = copy->arguments;
    if (isString((node *) (curr->value))) {
      tempString2 = NULL;
      resA = 1;
      if (curr->next != NULL) {
	if (isString((node *) (curr->next->value))) {
	  tempString2 = accessThruMemRef(((node *) (curr->next->value)))->string;
	} else {
	  resA = 0;
	}
      }
      if (resA) {
	if (timingString != NULL) pushTimeCounter();
	tempString = NULL;
	tempString = evaluateStringAsBashCommand(accessThruMemRef(((node *) (curr->value)))->string, tempString2);
	if (timingString != NULL) popTimeCounter(timingString);
	if (tempString != NULL) {
	  tempNode = makeString(tempString);
	  safeFree(tempString);
	  freeThing(copy);
	  copy = tempNode;
	}
      }
    }
    break;
  case GETSUPPRESSEDMESSAGES:
    if (timingString != NULL) pushTimeCounter();
    if ((suppressedMessages == NULL) || ((resA = getMaxIndexOfSetBit(suppressedMessages)) < 0)) {
      tempNode = makeEmptyList();
    } else {
      tempChain = NULL;
      mpfr_init2(a, 5 + 8 * sizeof(int));
      for (i=resA;i>=0;i--) {
	if (getBitInBitfield(suppressedMessages, (unsigned int) i)) {
	  mpfr_set_si(a, i, GMP_RNDN); /* exact */
	  tempChain = addElement(tempChain, makeConstant(a));
	}
      }
      mpfr_clear(a);
      if (tempChain == NULL) {
	tempNode = makeEmptyList();
      } else {
	tempNode = makeList(tempChain);
      }
    }
    if (timingString != NULL) popTimeCounter(timingString);
    freeThing(copy);
    copy = tempNode;
    break;
  case REVERT:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isList(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      setupRandomAccessOnLists(tree->child1);
      tempNode = makeList(copyChain(accessThruMemRef(copy->child1)->arguments,copyThingOnVoid));
      freeThing(copy);
      copy = tempNode;
      setupRandomAccessOnLists(copy);
      if (timingString != NULL) popTimeCounter(timingString);
    } else {
      if (isEmptyList(copy->child1)) {
	tempNode = makeEmptyList();
	freeThing(copy);
	copy = tempNode;
      }
    }
    break;
  case SORT:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isPureList(copy->child1)) {
      if (evaluateThingToConstantList(&tempChain, copy->child1)) {
	if (timingString != NULL) pushTimeCounter();
	sortChain(tempChain, cmpMpfrPtr);
	newChain = NULL;
	curr = tempChain;
	while (curr != NULL) {
	  newChain = addElement(newChain,makeConstant(*((mpfr_t *) (curr->value))));
	  curr = curr->next;
	}
	tempNode = makeList(newChain);
	freeThing(copy);
	copy = tempNode;
	freeChain(tempChain,freeMpfrPtr);
	if (timingString != NULL) popTimeCounter(timingString);
      }
    } else {
      if (isEmptyList(copy->child1)) {
	tempNode = copyThing(copy->child1);
	freeThing(copy);
	copy = tempNode;
      }
    }
    break;
  case MANTISSA:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isPureTree(copy->child1)) {
      mpfr_init2(a,tools_precision);
      if (evaluateThingToConstant(a,copy->child1,NULL,0,0)) {
	mpfr_init2(b,mpfr_get_prec(a));
	if (timingString != NULL) pushTimeCounter();
	if (mpfr_mant_exp(b, &expo, a) == 0) {
	  tempNode = makeConstant(b);
	  freeThing(copy);
	  copy = tempNode;
	}
	if (timingString != NULL) popTimeCounter(timingString);
	mpfr_clear(b);
      }
      mpfr_clear(a);
    }
    break;
  case EXPONENT:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isPureTree(copy->child1)) {
      mpfr_init2(a,tools_precision);
      if (evaluateThingToConstant(a,copy->child1,NULL,0,0)) {
	mpfr_init2(b,mpfr_get_prec(a));
	if (timingString != NULL) pushTimeCounter();
	if (mpfr_mant_exp(b, &expo, a) == 0) {
	  mpfr_init2(c,sizeof(expo) * 8 + 5);
	  mpfr_set_si(c,expo,GMP_RNDN);
	  tempNode = makeConstant(c);
	  mpfr_clear(c);
	  freeThing(copy);
	  copy = tempNode;
	}
	if (timingString != NULL) popTimeCounter(timingString);
	mpfr_clear(b);
      }
      mpfr_clear(a);
    }
    break;
  case PRECISION:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isPureTree(copy->child1)) {
      mpfr_init2(a,tools_precision);
      if (evaluateThingToConstant(a,copy->child1,NULL,0,0)) {
	mpfr_init2(b,mpfr_get_prec(a));
	if (timingString != NULL) pushTimeCounter();
	if (mpfr_mant_exp(b, &expo, a) == 0) {
	  if (mpfr_zero_p(b)) {
	    tempNode = makeConstantDouble(0.0);
	  } else {
	    pTemp = sizeof(mp_prec_t) * 8 + 5;
	    if (tools_precision > pTemp) pTemp = tools_precision;
	    mpfr_init2(c,pTemp);
	    mpfr_abs(b,b,GMP_RNDN);
	    mpfr_log2(c,b,GMP_RNDU);
	    mpfr_ceil(c,c);
	    if (mpfr_zero_p(c)) {
	      mpfr_set_d(c,1.0,GMP_RNDN);
	    }
	    tempNode = makeConstant(c);
	    mpfr_clear(c);
	  }
	  freeThing(copy);
	  copy = tempNode;
	}
	if (timingString != NULL) popTimeCounter(timingString);
	mpfr_clear(b);
      }
      mpfr_clear(a);
    }
    break;
  case TAIL:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isList(copy->child1)) {
      if (accessThruMemRef(copy->child1)->arguments->next == NULL) {
	if (timingString != NULL) pushTimeCounter();
	freeThing(copy->child1);
	copy->nodeType = EMPTYLIST;
	if (timingString != NULL) popTimeCounter(timingString);
      } else {
	if (!isElliptic((node *) (accessThruMemRef(copy->child1)->arguments->next->value))) {
	  if (timingString != NULL) pushTimeCounter();
	  copy->arguments = copyChainWithoutReversal(accessThruMemRef(copy->child1)->arguments->next,copyThingOnVoid);
	  freeThing(copy->child1);
	  copy->nodeType = LIST;
	  copy->argArray = NULL;
	  copy->argArraySize = 0;
	  copy->argArrayAllocSize = 0;
	  setupRandomAccessOnLists(copy);
	  if (timingString != NULL) popTimeCounter(timingString);
	}
      }
    } else {
      if (isFinalEllipticList(copy->child1)) {
	if (accessThruMemRef(copy->child1)->arguments->next != NULL) {
	  if (!isElliptic((node *) (accessThruMemRef(copy->child1)->arguments->next->value))) {
	    if (timingString != NULL) pushTimeCounter();
	    copy->arguments = copyChainWithoutReversal(accessThruMemRef(copy->child1)->arguments->next,copyThingOnVoid);
	    freeThing(copy->child1);
	    copy->nodeType = FINALELLIPTICLIST;
	    copy->argArray = NULL;
	    copy->argArraySize = 0;
	    copy->argArrayAllocSize = 0;
	    setupRandomAccessOnLists(copy);
	    if (timingString != NULL) popTimeCounter(timingString);
	  }
	} else {
	  if (isPureTree((node *) (accessThruMemRef(copy->child1)->arguments->value))) {
	    mpfr_init2(a,tools_precision);
	    if (evaluateThingToConstant(a,(node *) (accessThruMemRef(copy->child1)->arguments->value),NULL,0,0)) {
	      if (mpfr_integer_p(a)) {
		resA = mpfr_get_si(a, GMP_RNDN);
		mpfr_init2(b, 8 * sizeof(resA) + 5);
		mpfr_set_si(b, resA, GMP_RNDN);
		if (mpfr_cmp(a, b) == 0) {
		  resA++;
		  mpfr_set_si(b, resA, GMP_RNDN);
		  freeThing(copy);
		  copy = makeFinalEllipticList(addElement(NULL, makeConstant(b)));
		} else {
		  tempNode = copyThing(copy->child1);
		  freeThing(copy);
		  copy = tempNode;
		}
		mpfr_clear(b);
	      } else {
		tempNode = copyThing(copy->child1);
		freeThing(copy);
		copy = tempNode;
	      }
	    } else {
	      tempNode = copyThing(copy->child1);
	      freeThing(copy);
	      copy = tempNode;
	    }
	    mpfr_clear(a);
	  } else {
	    tempNode = copyThing(copy->child1);
	    freeThing(copy);
	    copy = tempNode;
	  }
	}
      }
    }
    break;
  case LENGTH:
    copy->child1 = evaluateThingInner(tree->child1);
    if (isEmptyList(copy->child1)) {
      if (timingString != NULL) pushTimeCounter();
      freeThing(copy);
      copy = makeConstantDouble(0.0);
      if (timingString != NULL) popTimeCounter(timingString);
    } else {
      if (isPureList(copy->child1)) {
	if (timingString != NULL) pushTimeCounter();
	if (accessThruMemRef(copy->child1)->argArray != NULL) {
	  resA = accessThruMemRef(copy->child1)->argArraySize;
	} else {
	  setupRandomAccessOnLists(copy->child1);
	  resA = lengthChain(accessThruMemRef(copy->child1)->arguments);
	}
	mpfr_init2(a,sizeof(int) * 8);
	mpfr_set_si(a,resA,GMP_RNDN);
	freeThing(copy);
	copy = makeConstant(a);
	mpfr_clear(a);
	if (timingString != NULL) popTimeCounter(timingString);
      } else {
	if (isFinalEllipticList(copy->child1)) {
	  if (timingString != NULL) pushTimeCounter();
	  mpfr_init2(a,sizeof(int) * 8);
	  mpfr_set_inf(a,1);
	  freeThing(copy);
	  copy = makeConstant(a);
	  mpfr_clear(a);
	  if (timingString != NULL) popTimeCounter(timingString);
	} else {
	  if (isString(copy->child1)) {
	    if (timingString != NULL) pushTimeCounter();
	    resA = strlen(accessThruMemRef(copy->child1)->string);
	    mpfr_init2(a,sizeof(int) * 8);
	    mpfr_set_si(a,resA,GMP_RNDN);
	    freeThing(copy);
	    copy = makeConstant(a);
	    mpfr_clear(a);
	    if (timingString != NULL) popTimeCounter(timingString);
	  }
	}
      }
    }
    break;
  case PRECDEREF:
    if (timingString != NULL) pushTimeCounter();
    mpfr_init2(a,sizeof(int) * 8);
    mpfr_set_ui(a,tools_precision,GMP_RNDN);
    freeThing(copy);
    copy = makeConstant(a);
    mpfr_clear(a);
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case POINTSDEREF:
    if (timingString != NULL) pushTimeCounter();
    mpfr_init2(a,sizeof(int) * 8);
    mpfr_set_si(a,defaultpoints,GMP_RNDN);
    freeThing(copy);
    copy = makeConstant(a);
    mpfr_clear(a);
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case DIAMDEREF:
    if (timingString != NULL) pushTimeCounter();
    freeThing(copy);
    copy = makeConstant(statediam);
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case DISPLAYDEREF:
    if (timingString != NULL) pushTimeCounter();
    freeThing(copy);
    switch (dyadic) {
    case 0:
      copy = makeDecimal();
      break;
    case 1:
      copy = makeDyadic();
      break;
    case 2:
      copy = makePowers();
      break;
    case 3:
      copy = makeBinaryThing();
      break;
    case 4:
      copy = makeHexadecimalThing();
      break;
    default:
      sollyaFprintf(stderr,"Error: display mode in unknown state.\n");
      exit(1);
    }
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case VERBOSITYDEREF:
    if (timingString != NULL) pushTimeCounter();
    mpfr_init2(a,sizeof(int) * 8);
    mpfr_set_si(a,verbosity,GMP_RNDN);
    freeThing(copy);
    copy = makeConstant(a);
    mpfr_clear(a);
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case CANONICALDEREF:
    if (timingString != NULL) pushTimeCounter();
    freeThing(copy);
    if (canonical) {
      copy = makeOn();
    } else {
      copy = makeOff();
    }
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case AUTOSIMPLIFYDEREF:
    if (timingString != NULL) pushTimeCounter();
    freeThing(copy);
    if (autosimplify) {
      copy = makeOn();
    } else {
      copy = makeOff();
    }
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case SHOWMESSAGENUMBERSDEREF:
    if (timingString != NULL) pushTimeCounter();
    freeThing(copy);
    if (activateMessageNumbers) {
      copy = makeOn();
    } else {
      copy = makeOff();
    }
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case TAYLORRECURSDEREF:
    if (timingString != NULL) pushTimeCounter();
    mpfr_init2(a,sizeof(int) * 8);
    mpfr_set_si(a,taylorrecursions,GMP_RNDN);
    freeThing(copy);
    copy = makeConstant(a);
    mpfr_clear(a);
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case TIMINGDEREF:
    if (timingString != NULL) pushTimeCounter();
    freeThing(copy);
    if (timecounting) {
      copy = makeOn();
    } else {
      copy = makeOff();
    }
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case FULLPARENDEREF:
    if (timingString != NULL) pushTimeCounter();
    freeThing(copy);
    if (fullParentheses) {
      copy = makeOn();
    } else {
      copy = makeOff();
    }
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case MIDPOINTDEREF:
    if (timingString != NULL) pushTimeCounter();
    freeThing(copy);
    if (midpointMode) {
      copy = makeOn();
    } else {
      copy = makeOff();
    }
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case DIEONERRORMODEDEREF:
    if (timingString != NULL) pushTimeCounter();
    freeThing(copy);
    if (dieOnErrorMode) {
      copy = makeOn();
    } else {
      copy = makeOff();
    }
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case RATIONALMODEDEREF:
    if (timingString != NULL) pushTimeCounter();
    freeThing(copy);
    if (rationalMode) {
      copy = makeOn();
    } else {
      copy = makeOff();
    }
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case SUPPRESSWARNINGSDEREF:
    if (timingString != NULL) pushTimeCounter();
    freeThing(copy);
    if (noRoundingWarnings) {
      copy = makeOff();
    } else {
      copy = makeOn();
    }
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case HOPITALRECURSDEREF:
    if (timingString != NULL) pushTimeCounter();
    mpfr_init2(a,sizeof(int) * 8);
    mpfr_set_si(a,hopitalrecursions,GMP_RNDN);
    freeThing(copy);
    copy = makeConstant(a);
    mpfr_clear(a);
    if (timingString != NULL) popTimeCounter(timingString);
    break;
  case PROC:
    safeFree(copy);
    copy = copyThing(tree);
    break;
  case PROCILLIM:
    safeFree(copy);
    copy = copyThing(tree);
    break;
  default:
    sollyaFprintf(stderr,"Error: evaluateThingInner: unknown identifier (%d) in the tree\n",tree->nodeType);
    exit(1);
  }

  if (timingString != NULL) safeFree(timingString);

  return copy;
}

