/*

Copyright 2007-2013 by

Laboratoire de l'Informatique du Parallelisme,
UMR CNRS - ENS Lyon - UCB Lyon 1 - INRIA 5668,

LORIA (CNRS, INPL, INRIA, UHP, U-Nancy 2)

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

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "expression.h"
#include "assignment.h"
#include "chain.h"
#include "general.h"
#include "execute.h"
#include "internparser.h"

/* Mess with the mallocs used by the parser */
extern void *parserCalloc(size_t, size_t);
extern void *parserMalloc(size_t);
extern void *parserRealloc(void *, size_t);
extern void parserFree(void *);
#undef malloc
#undef realloc
#undef calloc
#undef free
#define malloc parserMalloc
#define realloc parserRealloc
#define calloc parserCalloc
#define free parserFree
/* End of the malloc mess */

#define YYERROR_VERBOSE 1
#define YYFPRINTF sollyaFprintf

extern int internyylex(YYSTYPE *lvalp, void *scanner);
extern FILE *internyyget_in(void *scanner);

 void internyyerror(void *myScanner, const char *message) {
   if (!feof(internyyget_in(myScanner))) {
     printMessage(1,SOLLYA_MSG_SYNTAX_ERROR_ENCOUNTERED_WHILE_PARSING,"Warning: %s.\nWill skip input until next semicolon after the unexpected token. May leak memory.\n",message);
     considerDyingOnError();
   }
 }

%}

%parse-param {void *myScanner}
%lex-param {void *myScanner}

%defines

%name-prefix="internyy"

%expect 2

%pure_parser

%union {
  doubleNode *dblnode;
  struct entryStruct *association;
  char *value;
  node *tree;
  chain *list;
  int *integerval;
  int count;
  void *other;
};




%token  <value> CONSTANTTOKEN "decimal constant"
%token  <value> MIDPOINTCONSTANTTOKEN "interval"
%token  <value> DYADICCONSTANTTOKEN "dyadic constant"
%token  <value> HEXCONSTANTTOKEN "constant in memory notation"
%token  <value> HEXADECIMALCONSTANTTOKEN "hexadecimal constant"
%token  <value> BINARYCONSTANTTOKEN "binary constant"

%token  PITOKEN "pi"

%token  <value> IDENTIFIERTOKEN "identifier"

%token  <value> STRINGTOKEN "character string"

%token  LPARTOKEN "("
%token  RPARTOKEN ")"
%token  LBRACKETTOKEN "["
%token  RBRACKETTOKEN "]"
%token  EQUALTOKEN "="
%token  ASSIGNEQUALTOKEN ":="
%token  COMPAREEQUALTOKEN "=="
%token  COMMATOKEN ","
%token  EXCLAMATIONTOKEN "!"
%token  SEMICOLONTOKEN ";"
%token  STARLEFTANGLETOKEN "*<"
%token  LEFTANGLETOKEN "<"
%token  RIGHTANGLEUNDERSCORETOKEN ">_"
%token  RIGHTANGLEDOTTOKEN ">."
%token  RIGHTANGLESTARTOKEN ">*"
%token  RIGHTANGLETOKEN ">"
%token  DOTSTOKEN "..."
%token  DOTTOKEN "."
%token  QUESTIONMARKTOKEN "?"
%token  VERTBARTOKEN "|"
%token  ATTOKEN "@"
%token  DOUBLECOLONTOKEN "::"
%token  COLONTOKEN ":"
%token  DOTCOLONTOKEN ".:"
%token  COLONDOTTOKEN ":."
%token  EXCLAMATIONEQUALTOKEN "!="
%token  APPROXTOKEN "~"
%token  ANDTOKEN "&&"
%token  ORTOKEN "||"

%token  PLUSTOKEN "+"
%token  MINUSTOKEN "-"
%token  MULTOKEN "*"
%token  DIVTOKEN "/"
%token  POWTOKEN "^"

%token  SQRTTOKEN "sqrt"
%token  EXPTOKEN "exp"
%token  FREEVARTOKEN "_x_"
%token  LOGTOKEN "log"
%token  LOG2TOKEN "log2"
%token  LOG10TOKEN "log10"
%token  SINTOKEN "sin"
%token  COSTOKEN "cos"
%token  TANTOKEN "tan"
%token  ASINTOKEN "asin"
%token  ACOSTOKEN "acos"
%token  ATANTOKEN "atan"
%token  SINHTOKEN "sinh"
%token  COSHTOKEN "cosh"
%token  TANHTOKEN "tanh"
%token  ASINHTOKEN "asinh"
%token  ACOSHTOKEN "acosh"
%token  ATANHTOKEN "atanh"
%token  ABSTOKEN "abs"
%token  ERFTOKEN "erf"
%token  ERFCTOKEN "erfc"
%token  LOG1PTOKEN "log1p"
%token  EXPM1TOKEN "expm1"
%token  DOUBLETOKEN "D"
%token  SINGLETOKEN "SG"
%token  HALFPRECISIONTOKEN "HP"
%token  QUADTOKEN "QD"
%token  DOUBLEDOUBLETOKEN "DD"
%token  TRIPLEDOUBLETOKEN "TD"
%token  DOUBLEEXTENDEDTOKEN "DE"
%token  CEILTOKEN "ceil"
%token  FLOORTOKEN "floor"
%token  NEARESTINTTOKEN "nearestint"

%token  HEADTOKEN "head"
%token  REVERTTOKEN "revert"
%token  SORTTOKEN "sort"
%token  TAILTOKEN "tail"
%token  MANTISSATOKEN "mantissa"
%token  EXPONENTTOKEN "exponent"
%token  PRECISIONTOKEN "precision"
%token  ROUNDCORRECTLYTOKEN "roundcorrectly"

%token  PRECTOKEN "prec"
%token  POINTSTOKEN "points"
%token  DIAMTOKEN "diam"
%token  DISPLAYTOKEN "display"
%token  VERBOSITYTOKEN "verbosity"
%token  SHOWMESSAGENUMBERSTOKEN "showmessagenumbers"
%token  CANONICALTOKEN "canonical"
%token  AUTOSIMPLIFYTOKEN "autosimplify"
%token  TAYLORRECURSIONSTOKEN "taylorrecursions"
%token  TIMINGTOKEN "timing"
%token  TIMETOKEN "time"
%token  FULLPARENTHESESTOKEN "fullparentheses"
%token  MIDPOINTMODETOKEN "midpointmode"
%token  DIEONERRORMODETOKEN "dieonerrormode"
%token  SUPPRESSWARNINGSTOKEN "roundingwarnings"
%token  RATIONALMODETOKEN "rationalmode"
%token  HOPITALRECURSIONSTOKEN "hopitalrecursions"

%token  ONTOKEN "on"
%token  OFFTOKEN "off"
%token  DYADICTOKEN "dyadic"
%token  POWERSTOKEN "powers"
%token  BINARYTOKEN "binary"
%token  HEXADECIMALTOKEN "hexadecimal"
%token  FILETOKEN "file"
%token  POSTSCRIPTTOKEN "postscript"
%token  POSTSCRIPTFILETOKEN "postscriptfile"
%token  PERTURBTOKEN "perturb"
%token  MINUSWORDTOKEN "RD"
%token  PLUSWORDTOKEN "RU"
%token  ZEROWORDTOKEN "RZ"
%token  NEARESTTOKEN "RN"
%token  HONORCOEFFPRECTOKEN "honorcoeffprec"
%token  TRUETOKEN "true"
%token  FALSETOKEN "false"
%token  DEFAULTTOKEN "default"
%token  MATCHTOKEN "match"
%token  WITHTOKEN "with"
%token  ABSOLUTETOKEN "absolute"
%token  DECIMALTOKEN "decimal"
%token  RELATIVETOKEN "relative"
%token  FIXEDTOKEN "fixed"
%token  FLOATINGTOKEN "floating"

%token  ERRORTOKEN "error"

%token  QUITTOKEN "quit"
%token  FALSEQUITTOKEN "quit in an included file"
%token  FALSERESTARTTOKEN "restart"

%token  LIBRARYTOKEN "library"
%token  LIBRARYCONSTANTTOKEN "libraryconstant"

%token  DIFFTOKEN "diff"
%token  DIRTYSIMPLIFYTOKEN "dirtysimplify"
%token  REMEZTOKEN "remez"
%token  BASHEVALUATETOKEN "bashevaluate"
%token  GETSUPPRESSEDMESSAGESTOKEN "getsuppressedmessages"
%token  FPMINIMAXTOKEN "fpminimax"
%token  HORNERTOKEN "horner"
%token  EXPANDTOKEN "expand"
%token  SIMPLIFYSAFETOKEN "simplify"

%token  TAYLORTOKEN "taylor"
%token  TAYLORFORMTOKEN "taylorform"
%token  CHEBYSHEVFORMTOKEN "chebyshevform"
%token  AUTODIFFTOKEN "autodiff"
%token  DEGREETOKEN "degree"
%token  NUMERATORTOKEN "numerator"
%token  DENOMINATORTOKEN "denominator"
%token  SUBSTITUTETOKEN "substitute"
%token  COMPOSEPOLYNOMIALSTOKEN "composepolynomials"
%token  COEFFTOKEN "coeff"
%token  SUBPOLYTOKEN "subpoly"
%token  ROUNDCOEFFICIENTSTOKEN "roundcoefficients"
%token  RATIONALAPPROXTOKEN "rationalapprox"
%token  ACCURATEINFNORMTOKEN "accurateinfnorm"
%token  ROUNDTOFORMATTOKEN "round"
%token  EVALUATETOKEN "evaluate"
%token  LENGTHTOKEN "length"
%token  INFTOKEN "inf"
%token  MIDTOKEN "mid"
%token  SUPTOKEN "sup"
%token  MINTOKEN "min"
%token  MAXTOKEN "max"

%token  READXMLTOKEN "read"
%token  PARSETOKEN "parse"

%token  PRINTTOKEN "print"
%token  PRINTXMLTOKEN "printxml"
%token  PLOTTOKEN "plot"
%token  PRINTHEXATOKEN "printhexa"
%token  PRINTFLOATTOKEN "printfloat"
%token  PRINTBINARYTOKEN "printbinary"
%token  SUPPRESSMESSAGETOKEN "suppressmessage"
%token  UNSUPPRESSMESSAGETOKEN "unsuppressmessage"
%token  PRINTEXPANSIONTOKEN "printexpansion"
%token  BASHEXECUTETOKEN "bashexecute"
%token  EXTERNALPLOTTOKEN "externalplot"
%token  WRITETOKEN "write"
%token  ASCIIPLOTTOKEN "asciiplot"
%token  RENAMETOKEN "rename"
%token  BINDTOKEN "bind"

%token  INFNORMTOKEN "infnorm"
%token  SUPNORMTOKEN "supnorm"
%token  FINDZEROSTOKEN "findzeros"
%token  FPFINDZEROSTOKEN "fpfindzeros"
%token  DIRTYINFNORMTOKEN "dirtyinfnorm"
%token  NUMBERROOTSTOKEN "numberroots"
%token  INTEGRALTOKEN "integral"
%token  DIRTYINTEGRALTOKEN "dirtyintegral"
%token  WORSTCASETOKEN "worstcase"
%token  IMPLEMENTPOLYTOKEN "implementpoly"
%token  IMPLEMENTCONSTTOKEN "implementconst"
%token  CHECKINFNORMTOKEN "checkinfnorm"
%token  ZERODENOMINATORSTOKEN "zerodenominators"
%token  ISEVALUABLETOKEN "isevaluable"
%token  SEARCHGALTOKEN "searchgal"
%token  GUESSDEGREETOKEN "guessdegree"
%token  DIRTYFINDZEROSTOKEN "dirtyfindzeros"

%token  IFTOKEN "if"
%token  THENTOKEN "then"
%token  ELSETOKEN "else"
%token  FORTOKEN "for"
%token  INTOKEN "in"
%token  FROMTOKEN "from"
%token  TOTOKEN "to"
%token  BYTOKEN "by"
%token  DOTOKEN "do"
%token  BEGINTOKEN "begin"
%token  ENDTOKEN "end"
%token  LEFTCURLYBRACETOKEN "{"
%token  RIGHTCURLYBRACETOKEN "}"
%token  WHILETOKEN "while"

%token  READFILETOKEN "readfile"

%token  ISBOUNDTOKEN "isbound"

%token  EXECUTETOKEN "execute"

%token  EXTERNALPROCTOKEN "externalproc"
%token  VOIDTOKEN "void"
%token  CONSTANTTYPETOKEN "constant"
%token  FUNCTIONTOKEN "function"
%token  OBJECTTOKEN "object"
%token  RANGETOKEN "range"
%token  INTEGERTOKEN "integer"
%token  STRINGTYPETOKEN "string"
%token  BOOLEANTOKEN "boolean"
%token  LISTTOKEN "list"
%token  OFTOKEN "of"

%token  VARTOKEN "var"
%token  PROCTOKEN "proc"
%token  PROCEDURETOKEN "procedure"
%token  RETURNTOKEN "return"
%token  NOPTOKEN "nop"


%type <other> startsymbol;
%type <other> egalquestionmark;
%type <count> unaryplusminus;
%type <tree>  startsymbolwitherr;
%type <tree>  command;
%type <tree>  procbody;
%type <tree>  variabledeclaration;
%type <tree>  simplecommand;
%type <list>  commandlist;
%type <list>  variabledeclarationlist;
%type <list>  identifierlist;
%type <tree>  thing;
%type <tree>  supermegaterm;
%type <list>  thinglist;
%type <list>  matchlist;
%type <tree>  matchelement; 
%type <list>  structelementlist;
%type <association>  structelement;
%type <other>  structelementseparator;
%type <tree>  structuring;
%type <tree>  ifcommand;
%type <tree>  forcommand;
%type <tree>  assignment;
%type <tree>  simpleassignment;
%type <tree>  stateassignment;
%type <tree>  stillstateassignment;
%type <tree>  basicthing;
%type <tree>  list;
%type <tree>  constant;
%type <list>  simplelist;
%type <tree>  range;
%type <tree>  debound;
%type <tree>  headfunction;
%type <tree>  term;
%type <tree>  hyperterm;
%type <tree>  subterm;
%type <tree>  megaterm;
%type <tree>  statedereference;
%type <dblnode>  indexing;
%type <integerval> externalproctype;
%type <integerval> extendedexternalproctype;
%type <list>  externalproctypesimplelist;
%type <list>  externalproctypelist;
%type <other> beginsymbol;
%type <other> endsymbol;


%%

startsymbol:            startsymbolwitherr
                          {
			    parsedThingIntern = $1;
			    $$ = NULL;
			    YYACCEPT;
			  }
;


startsymbolwitherr:     command SEMICOLONTOKEN
                          {
			    $$ = $1;
			  }
                      | error SEMICOLONTOKEN
                          {
			    $$ = NULL;
			  }
;

beginsymbol:            BEGINTOKEN
                          {
			    $$ = NULL;
			  }
                      | LEFTCURLYBRACETOKEN
		          {
			    $$ = NULL;
			  }
;

endsymbol:              ENDTOKEN
                          {
			    $$ = NULL;
			  }
                      | RIGHTCURLYBRACETOKEN
		          {
			    $$ = NULL;
			  }
;

command:                simplecommand
                          {
			    $$ = $1;
			  }
                      | beginsymbol commandlist endsymbol
                          {
			    $$ = makeCommandList($2);
                          }
                      | beginsymbol variabledeclarationlist commandlist endsymbol
                          {
			    $$ = makeCommandList(concatChains($2, $3));
                          }
                      | beginsymbol variabledeclarationlist endsymbol
                          {
			    $$ = makeCommandList($2);
                          }
                      | beginsymbol endsymbol
                          {
			    $$ = makeNop();
                          }
                      | IFTOKEN ifcommand
                          {
			    $$ = $2;
			  }
                      | WHILETOKEN thing DOTOKEN command
                          {
			    $$ = makeWhile($2, $4);
			  }
                      | FORTOKEN forcommand
                          {
			    $$ = $2;
			  }
;

ifcommand:              thing THENTOKEN command
                          {
			    $$ = makeIf($1, $3);
                          }
                      | thing THENTOKEN command ELSETOKEN command
                          {
			    $$ = makeIfElse($1,$3,$5);
                          }
;



forcommand:             IDENTIFIERTOKEN FROMTOKEN thing TOTOKEN thing DOTOKEN command
                          {
			    $$ = makeFor($1, $3, $5, makeConstantDouble(1.0), $7);
			    safeFree($1);
                          }
                      | IDENTIFIERTOKEN FROMTOKEN thing TOTOKEN thing BYTOKEN thing DOTOKEN command
                          {
			    $$ = makeFor($1, $3, $5, $7, $9);
			    safeFree($1);
                          }
                      | IDENTIFIERTOKEN INTOKEN thing DOTOKEN command
                          {
			    $$ = makeForIn($1, $3, $5);
			    safeFree($1);
                          }
;


commandlist:            command SEMICOLONTOKEN
                          {
			    $$ = addElement(NULL, $1);
			  }
                      | command SEMICOLONTOKEN commandlist
                          {
			    $$ = addElement($3, $1);
			  }
;

variabledeclarationlist: variabledeclaration SEMICOLONTOKEN
                          {
			    $$ = addElement(NULL, $1);
			  }
                      | variabledeclaration SEMICOLONTOKEN variabledeclarationlist
                          {
			    $$ = addElement($3, $1);
			  }
;

variabledeclaration:    VARTOKEN identifierlist
                          {
			    $$ = makeVariableDeclaration($2);
			  }
;


identifierlist:         IDENTIFIERTOKEN
                          {
			    $$ = addElement(NULL, $1);
			  }
                      | IDENTIFIERTOKEN COMMATOKEN identifierlist
                          {
			    $$ = addElement($3, $1);
			  }
;

procbody:               LPARTOKEN RPARTOKEN beginsymbol commandlist endsymbol
                          {
			    $$ = makeProc(NULL, makeCommandList($4), makeUnit());
                          }
                      | LPARTOKEN RPARTOKEN beginsymbol variabledeclarationlist commandlist endsymbol
                          {
			    $$ = makeProc(NULL, makeCommandList(concatChains($4, $5)), makeUnit());
                          }
                      | LPARTOKEN RPARTOKEN beginsymbol variabledeclarationlist endsymbol
                          {
			    $$ = makeProc(NULL, makeCommandList($4), makeUnit());
                          }
                      | LPARTOKEN RPARTOKEN beginsymbol endsymbol
                          {
			    $$ = makeProc(NULL, makeCommandList(addElement(NULL,makeNop())), makeUnit());
                          }
                      | LPARTOKEN RPARTOKEN beginsymbol commandlist RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeProc(NULL, makeCommandList($4), $6);
                          }
                      | LPARTOKEN RPARTOKEN beginsymbol variabledeclarationlist commandlist RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeProc(NULL, makeCommandList(concatChains($4, $5)), $7);
                          }
                      | LPARTOKEN RPARTOKEN beginsymbol variabledeclarationlist RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeProc(NULL, makeCommandList($4), $6);
                          }
                      | LPARTOKEN RPARTOKEN beginsymbol RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeProc(NULL, makeCommandList(addElement(NULL,makeNop())), $5);
                          }
                      | LPARTOKEN identifierlist RPARTOKEN beginsymbol commandlist endsymbol
                          {
			    $$ = makeProc($2, makeCommandList($5), makeUnit());
                          }
                      | LPARTOKEN identifierlist RPARTOKEN beginsymbol variabledeclarationlist commandlist endsymbol
                          {
			    $$ = makeProc($2, makeCommandList(concatChains($5, $6)), makeUnit());
                          }
                      | LPARTOKEN identifierlist RPARTOKEN beginsymbol variabledeclarationlist endsymbol
                          {
			    $$ = makeProc($2, makeCommandList($5), makeUnit());
                          }
                      | LPARTOKEN identifierlist RPARTOKEN beginsymbol endsymbol
                          {
			    $$ = makeProc($2, makeCommandList(addElement(NULL,makeNop())), makeUnit());
                          }
                      | LPARTOKEN identifierlist RPARTOKEN beginsymbol commandlist RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeProc($2, makeCommandList($5), $7);
                          }
                      | LPARTOKEN identifierlist RPARTOKEN beginsymbol variabledeclarationlist commandlist RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeProc($2, makeCommandList(concatChains($5, $6)), $8);
                          }
                      | LPARTOKEN identifierlist RPARTOKEN beginsymbol variabledeclarationlist RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeProc($2, makeCommandList($5), $7);
                          }
                      | LPARTOKEN identifierlist RPARTOKEN beginsymbol RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeProc($2, makeCommandList(addElement(NULL, makeNop())), $6);
                          }
                      | LPARTOKEN IDENTIFIERTOKEN EQUALTOKEN DOTSTOKEN RPARTOKEN beginsymbol commandlist endsymbol
                          {
			    $$ = makeProcIllim($2, makeCommandList($7), makeUnit());
                          }
                      | LPARTOKEN IDENTIFIERTOKEN EQUALTOKEN DOTSTOKEN RPARTOKEN beginsymbol variabledeclarationlist commandlist endsymbol
                          {
			    $$ = makeProcIllim($2, makeCommandList(concatChains($7, $8)), makeUnit());
                          }
                      | LPARTOKEN IDENTIFIERTOKEN EQUALTOKEN DOTSTOKEN RPARTOKEN beginsymbol variabledeclarationlist endsymbol
                          {
			    $$ = makeProcIllim($2, makeCommandList($7), makeUnit());
                          }
                      | LPARTOKEN IDENTIFIERTOKEN EQUALTOKEN DOTSTOKEN RPARTOKEN beginsymbol endsymbol
                          {
			    $$ = makeProcIllim($2, makeCommandList(addElement(NULL,makeNop())), makeUnit());
                          }
                      | LPARTOKEN IDENTIFIERTOKEN EQUALTOKEN DOTSTOKEN RPARTOKEN beginsymbol commandlist RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeProcIllim($2, makeCommandList($7), $9);
                          }
                      | LPARTOKEN IDENTIFIERTOKEN EQUALTOKEN DOTSTOKEN RPARTOKEN beginsymbol variabledeclarationlist commandlist RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeProcIllim($2, makeCommandList(concatChains($7, $8)), $10);
                          }
                      | LPARTOKEN IDENTIFIERTOKEN EQUALTOKEN DOTSTOKEN RPARTOKEN beginsymbol variabledeclarationlist RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeProcIllim($2, makeCommandList($7), $9);
                          }
                      | LPARTOKEN IDENTIFIERTOKEN EQUALTOKEN DOTSTOKEN RPARTOKEN beginsymbol RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeProcIllim($2, makeCommandList(addElement(NULL, makeNop())), $8);
                          }
;



simplecommand:          FALSEQUITTOKEN
                          {
			    $$ = makeQuit();
			  }
                      | FALSERESTARTTOKEN
                          {
			    $$ = makeFalseRestart();
			  }
                      | NOPTOKEN
                          {
			    $$ = makeNop();
			  }
                      | NOPTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeNopArg($3);
			  }
                      | NOPTOKEN LPARTOKEN RPARTOKEN
                          {
			    $$ = makeNopArg(makeDefault());
			  }
		      | PRINTTOKEN LPARTOKEN thinglist RPARTOKEN
                          {
			    $$ = makePrint($3);
			  }
                      | PRINTTOKEN LPARTOKEN thinglist RPARTOKEN RIGHTANGLETOKEN thing
                          {
			    $$ = makeNewFilePrint($6, $3);
			  }
                      | PRINTTOKEN LPARTOKEN thinglist RPARTOKEN RIGHTANGLETOKEN RIGHTANGLETOKEN thing
                          {
			    $$ = makeAppendFilePrint($7, $3);
			  }
                      | PLOTTOKEN LPARTOKEN thing COMMATOKEN thinglist RPARTOKEN
                          {
			    $$ = makePlot(addElement($5, $3));
			  }
                      | PRINTHEXATOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makePrintHexa($3);
			  }
                      | PRINTFLOATTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makePrintFloat($3);
			  }
                      | PRINTBINARYTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makePrintBinary($3);
			  }
                      | SUPPRESSMESSAGETOKEN LPARTOKEN thinglist RPARTOKEN
                          {
			    $$ = makeSuppressMessage($3);
			  }
                      | UNSUPPRESSMESSAGETOKEN LPARTOKEN thinglist RPARTOKEN
                          {
			    $$ = makeUnsuppressMessage($3);
			  }
                      | PRINTEXPANSIONTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makePrintExpansion($3);
			  }
                      | BASHEXECUTETOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeBashExecute($3);
			  }
                      | EXTERNALPLOTTOKEN LPARTOKEN thing COMMATOKEN thing COMMATOKEN thing COMMATOKEN thing COMMATOKEN thinglist RPARTOKEN
                          {
			    $$ = makeExternalPlot(addElement(addElement(addElement(addElement($11,$9),$7),$5),$3));
			  }
                      | WRITETOKEN LPARTOKEN thinglist RPARTOKEN
                          {
			    $$ = makeWrite($3);
			  }
                      | WRITETOKEN LPARTOKEN thinglist RPARTOKEN RIGHTANGLETOKEN thing
                          {
			    $$ = makeNewFileWrite($6, $3);
			  }
                      | WRITETOKEN LPARTOKEN thinglist RPARTOKEN RIGHTANGLETOKEN RIGHTANGLETOKEN thing
                          {
			    $$ = makeAppendFileWrite($7, $3);
			  }
                      | ASCIIPLOTTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeAsciiPlot($3, $5);
			  }
                      | PRINTXMLTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makePrintXml($3);
			  }
                      | EXECUTETOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeExecute($3);
			  }
                      | PRINTXMLTOKEN LPARTOKEN thing RPARTOKEN RIGHTANGLETOKEN thing
                          {
			    $$ = makePrintXmlNewFile($3,$6);
			  }
                      | PRINTXMLTOKEN LPARTOKEN thing RPARTOKEN RIGHTANGLETOKEN RIGHTANGLETOKEN thing
                          {
			    $$ = makePrintXmlAppendFile($3,$7);
			  }
                      | WORSTCASETOKEN LPARTOKEN thing COMMATOKEN thing COMMATOKEN thing COMMATOKEN thing COMMATOKEN thinglist RPARTOKEN
                          {
			    $$ = makeWorstCase(addElement(addElement(addElement(addElement($11, $9), $7), $5), $3));
			  }
                      | RENAMETOKEN LPARTOKEN IDENTIFIERTOKEN COMMATOKEN IDENTIFIERTOKEN RPARTOKEN
                          {
			    $$ = makeRename($3, $5);
			    safeFree($3);
			    safeFree($5);
			  }
                      | RENAMETOKEN LPARTOKEN FREEVARTOKEN COMMATOKEN IDENTIFIERTOKEN RPARTOKEN
                          {
			    $$ = makeRename("_x_", $5);
			    safeFree($5);
			  }
                      | EXTERNALPROCTOKEN LPARTOKEN IDENTIFIERTOKEN COMMATOKEN thing COMMATOKEN externalproctypelist MINUSTOKEN RIGHTANGLETOKEN extendedexternalproctype RPARTOKEN
                          {
			    $$ = makeExternalProc($3, $5, addElement($7, $10));
			    safeFree($3);
			  }
                      | assignment
                          {
			    $$ = $1;
			  }
                      | thinglist
                          {
			    $$ = makeAutoprint($1);
			  }
                      | PROCEDURETOKEN IDENTIFIERTOKEN procbody
                          {
			    $$ = makeAssignment($2, $3);
			    safeFree($2);
			  }
;

assignment:             stateassignment
                          {
			    $$ = $1;
			  }
                      | stillstateassignment EXCLAMATIONTOKEN
                          {
			    $$ = $1;
			  }
                      | simpleassignment
                          {
			    $$ = $1;
			  }
                      | simpleassignment EXCLAMATIONTOKEN
                          {
			    $$ = $1;
			  }
;

simpleassignment:       IDENTIFIERTOKEN EQUALTOKEN thing
                          {
			    $$ = makeAssignment($1, $3);
			    safeFree($1);
			  }
                      | IDENTIFIERTOKEN ASSIGNEQUALTOKEN thing
                          {
			    $$ = makeFloatAssignment($1, $3);
			    safeFree($1);
			  }
                      | IDENTIFIERTOKEN EQUALTOKEN LIBRARYTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeLibraryBinding($1, $5);
			    safeFree($1);
			  }
                      | IDENTIFIERTOKEN EQUALTOKEN LIBRARYCONSTANTTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeLibraryConstantBinding($1, $5);
			    safeFree($1);
			  }
                      | indexing EQUALTOKEN thing
                          {
			    $$ = makeAssignmentInIndexing($1->a,$1->b,$3);
			    safeFree($1);
			  }
                      | indexing ASSIGNEQUALTOKEN thing
                          {
			    $$ = makeFloatAssignmentInIndexing($1->a,$1->b,$3);
			    safeFree($1);
			  }
                      | structuring EQUALTOKEN thing
                          {
			    $$ = makeProtoAssignmentInStructure($1,$3);
			  }
                      | structuring ASSIGNEQUALTOKEN thing
                          {
			    $$ = makeProtoFloatAssignmentInStructure($1,$3);
			  }
;

structuring:            basicthing DOTTOKEN IDENTIFIERTOKEN 
		          {
			    $$ = makeStructAccess($1,$3);
			    safeFree($3);
			  }
;

stateassignment:        PRECTOKEN EQUALTOKEN thing
                          {
			    $$ = makePrecAssign($3);
			  }
                      | POINTSTOKEN EQUALTOKEN thing
                          {
			    $$ = makePointsAssign($3);
			  }
                      | DIAMTOKEN EQUALTOKEN thing
                          {
			    $$ = makeDiamAssign($3);
			  }
                      | DISPLAYTOKEN EQUALTOKEN thing
                          {
			    $$ = makeDisplayAssign($3);
			  }
                      | VERBOSITYTOKEN EQUALTOKEN thing
                          {
			    $$ = makeVerbosityAssign($3);
			  }
                      | SHOWMESSAGENUMBERSTOKEN EQUALTOKEN thing
                          {
			    $$ = makeShowMessageNumbersAssign($3);
			  }
                      | CANONICALTOKEN EQUALTOKEN thing
                          {
			    $$ = makeCanonicalAssign($3);
			  }
                      | AUTOSIMPLIFYTOKEN EQUALTOKEN thing
                          {
			    $$ = makeAutoSimplifyAssign($3);
			  }
                      | TAYLORRECURSIONSTOKEN EQUALTOKEN thing
                          {
			    $$ = makeTaylorRecursAssign($3);
			  }
                      | TIMINGTOKEN EQUALTOKEN thing
                          {
			    $$ = makeTimingAssign($3);
			  }
                      | FULLPARENTHESESTOKEN EQUALTOKEN thing
                          {
			    $$ = makeFullParenAssign($3);
			  }
                      | MIDPOINTMODETOKEN EQUALTOKEN thing
                          {
			    $$ = makeMidpointAssign($3);
			  }
                      | DIEONERRORMODETOKEN EQUALTOKEN thing
                          {
			    $$ = makeDieOnErrorAssign($3);
			  }
                      | RATIONALMODETOKEN EQUALTOKEN thing
                          {
			    $$ = makeRationalModeAssign($3);
			  }
                      | SUPPRESSWARNINGSTOKEN EQUALTOKEN thing
                          {
			    $$ = makeSuppressWarningsAssign($3);
			  }
                      | HOPITALRECURSIONSTOKEN EQUALTOKEN thing
                          {
			    $$ = makeHopitalRecursAssign($3);
			  }
;

stillstateassignment:   PRECTOKEN EQUALTOKEN thing
                          {
			    $$ = makePrecStillAssign($3);
			  }
                      | POINTSTOKEN EQUALTOKEN thing
                          {
			    $$ = makePointsStillAssign($3);
			  }
                      | DIAMTOKEN EQUALTOKEN thing
                          {
			    $$ = makeDiamStillAssign($3);
			  }
                      | DISPLAYTOKEN EQUALTOKEN thing
                          {
			    $$ = makeDisplayStillAssign($3);
			  }
                      | VERBOSITYTOKEN EQUALTOKEN thing
                          {
			    $$ = makeVerbosityStillAssign($3);
			  }
                      | SHOWMESSAGENUMBERSTOKEN EQUALTOKEN thing
                          {
			    $$ = makeShowMessageNumbersStillAssign($3);
			  }
                      | CANONICALTOKEN EQUALTOKEN thing
                          {
			    $$ = makeCanonicalStillAssign($3);
			  }
                      | AUTOSIMPLIFYTOKEN EQUALTOKEN thing
                          {
			    $$ = makeAutoSimplifyStillAssign($3);
			  }
                      | TAYLORRECURSIONSTOKEN EQUALTOKEN thing
                          {
			    $$ = makeTaylorRecursStillAssign($3);
			  }
                      | TIMINGTOKEN EQUALTOKEN thing
                          {
			    $$ = makeTimingStillAssign($3);
			  }
                      | FULLPARENTHESESTOKEN EQUALTOKEN thing
                          {
			    $$ = makeFullParenStillAssign($3);
			  }
                      | MIDPOINTMODETOKEN EQUALTOKEN thing
                          {
			    $$ = makeMidpointStillAssign($3);
			  }
                      | DIEONERRORMODETOKEN EQUALTOKEN thing
                          {
			    $$ = makeDieOnErrorStillAssign($3);
			  }
                      | RATIONALMODETOKEN EQUALTOKEN thing
                          {
			    $$ = makeRationalModeStillAssign($3);
			  }
                      | SUPPRESSWARNINGSTOKEN EQUALTOKEN thing
                          {
			    $$ = makeSuppressWarningsStillAssign($3);
			  }
                      | HOPITALRECURSIONSTOKEN EQUALTOKEN thing
                          {
			    $$ = makeHopitalRecursStillAssign($3);
			  }
;

thinglist:              thing
                          {
			    $$ = addElement(NULL, $1);
			  }
                      | thing COMMATOKEN thinglist
                          {
			    $$ = addElement($3, $1);
			  }
;

structelementlist:      structelement
                          {
			    $$ = addElement(NULL, $1);
			  }
                      | structelement structelementseparator structelementlist
                          {
			    $$ = addElement($3, $1);
			  }
;

structelementseparator: COMMATOKEN
                          {
			    $$ = NULL;
			  }
                      | SEMICOLONTOKEN
		          {
			    $$ = NULL;
			  }
;

structelement:          DOTTOKEN IDENTIFIERTOKEN EQUALTOKEN thing
                          {
			    $$ = (entry *) safeMalloc(sizeof(entry));
			    $$->name = (char *) safeCalloc(strlen($2) + 1, sizeof(char));
			    strcpy($$->name,$2);
			    safeFree($2);
			    $$->value = (void *) ($4);
			  }
;

thing:                  supermegaterm
                         {
			   $$ = $1;
			 }
                      | MATCHTOKEN supermegaterm WITHTOKEN matchlist
		          {
			    $$ = makeMatch($2,$4);
			  }
;

supermegaterm:          megaterm
                          {
			    $$ = $1;
			  }
                      | thing ANDTOKEN megaterm
                          {
			    $$ = makeAnd($1, $3);
			  }
                      | thing ORTOKEN megaterm
                          {
			    $$ = makeOr($1, $3);
			  }
                      | EXCLAMATIONTOKEN megaterm
                          {
			    $$ = makeNegation($2);
			  }
;

indexing:               basicthing LBRACKETTOKEN thing RBRACKETTOKEN
                          {
			    $$ = (doubleNode *) safeMalloc(sizeof(doubleNode));
			    $$->a = $1;
			    $$->b = $3;
			  }
;


megaterm:               hyperterm
                          {
			    $$ = $1;
			  }
                      | megaterm COMPAREEQUALTOKEN hyperterm
                          {
			    $$ = makeCompareEqual($1, $3);
			  }
                      | megaterm INTOKEN hyperterm
                          {
			    $$ = makeCompareIn($1, $3);
			  }
                      | megaterm LEFTANGLETOKEN hyperterm
                          {
			    $$ = makeCompareLess($1, $3);
			  }
                      | megaterm RIGHTANGLETOKEN hyperterm
                          {
			    $$ = makeCompareGreater($1, $3);
			  }
                      | megaterm LEFTANGLETOKEN EQUALTOKEN hyperterm
                          {
			    $$ = makeCompareLessEqual($1, $4);
			  }
                      | megaterm RIGHTANGLETOKEN EQUALTOKEN hyperterm
                          {
			    $$ = makeCompareGreaterEqual($1, $4);
			  }
                      | megaterm EXCLAMATIONEQUALTOKEN hyperterm
                          {
			    $$ = makeCompareNotEqual($1, $3);
			  }
;

hyperterm:                term
                          {
			    $$ = $1;
			  }
                      | hyperterm PLUSTOKEN term
                          {
			    $$ = makeAdd($1, $3);
			  }
                      | hyperterm MINUSTOKEN term
                          {
			    $$ = makeSub($1, $3);
			  }
                      | hyperterm ATTOKEN term
                          {
			    $$ = makeConcat($1, $3);
			  }
                      | hyperterm DOUBLECOLONTOKEN term
                          {
			    $$ = makeAddToList($1, $3);
			  }
                      | hyperterm COLONDOTTOKEN term
                          {
			    $$ = makeAppend($1, $3);
			  }
;

unaryplusminus:         PLUSTOKEN
                          {
                            $$ = 0;
                          }
                      | MINUSTOKEN
                          {
                            $$ = 1;
                          }
                      | PLUSTOKEN unaryplusminus
                          {
  	                    $$ = $2;
  	                  }
                      | MINUSTOKEN unaryplusminus
  	                  {
  	                    $$ = $2+1;
                          }
;


term:                   subterm
			  {
			    $$ = $1;
                          }
                      | unaryplusminus subterm
                          {
			    tempNode = $2;
			    for (tempInteger=0;tempInteger<$1;tempInteger++)
			      tempNode = makeNeg(tempNode);
			    $$ = tempNode;
			  }
		      |	APPROXTOKEN subterm
                          {
			    $$ = makeEvalConst($2);
                          }
		      |	term MULTOKEN subterm
			  {
			    $$ = makeMul($1, $3);
                          }
		      |	term DIVTOKEN subterm
                          {
			    $$ = makeDiv($1, $3);
                          }
                      | term MULTOKEN unaryplusminus subterm
                          {
			    tempNode = $4;
			    for (tempInteger=0;tempInteger<$3;tempInteger++)
			      tempNode = makeNeg(tempNode);
			    $$ = makeMul($1, tempNode);
			  }
                      | term DIVTOKEN unaryplusminus subterm
                          {
			    tempNode = $4;
			    for (tempInteger=0;tempInteger<$3;tempInteger++)
			      tempNode = makeNeg(tempNode);
			    $$ = makeDiv($1, tempNode);
			  }
                      | term MULTOKEN APPROXTOKEN subterm
                          {
			    $$ = makeMul($1, makeEvalConst($4));
			  }
                      | term DIVTOKEN APPROXTOKEN subterm
                          {
			    $$ = makeDiv($1, makeEvalConst($4));
			  }
;

subterm:                basicthing
                          {
			    $$ = $1;
                          }
                      | basicthing POWTOKEN subterm
                          {
			    $$ = makePow($1, $3);
                          }
                      | basicthing POWTOKEN unaryplusminus subterm
                          {
			    tempNode = $4;
			    for (tempInteger=0;tempInteger<$3;tempInteger++)
			      tempNode = makeNeg(tempNode);
			    $$ = makePow($1, tempNode);
			  }
                      | basicthing POWTOKEN APPROXTOKEN subterm
                          {
			    $$ = makePow($1, makeEvalConst($4));
			  }
                      | basicthing DOTCOLONTOKEN subterm
                          {
			    $$ = makePrepend($1, $3);
			  }
                      | basicthing DOTCOLONTOKEN APPROXTOKEN subterm
                          {
			    $$ = makePrepend($1, makeEvalConst($4));
			  }
;


basicthing:             ONTOKEN
                          {
			    $$ = makeOn();
			  }
                      | OFFTOKEN
                          {
			    $$ = makeOff();
			  }
                      | DYADICTOKEN
                          {
			    $$ = makeDyadic();
			  }
                      | POWERSTOKEN
                          {
			    $$ = makePowers();
			  }
                      | BINARYTOKEN
                          {
			    $$ = makeBinaryThing();
			  }
                      | HEXADECIMALTOKEN
                          {
			    $$ = makeHexadecimalThing();
			  }
                      | FILETOKEN
                          {
			    $$ = makeFile();
			  }
                      | POSTSCRIPTTOKEN
                          {
			    $$ = makePostscript();
			  }
                      | POSTSCRIPTFILETOKEN
                          {
			    $$ = makePostscriptFile();
			  }
                      | PERTURBTOKEN
                          {
			    $$ = makePerturb();
			  }
                      | MINUSWORDTOKEN
                          {
			    $$ = makeRoundDown();
			  }
                      | PLUSWORDTOKEN
                          {
			    $$ = makeRoundUp();
			  }
                      | ZEROWORDTOKEN
                          {
			    $$ = makeRoundToZero();
			  }
                      | NEARESTTOKEN
                          {
			    $$ = makeRoundToNearest();
			  }
                      | HONORCOEFFPRECTOKEN
                          {
			    $$ = makeHonorCoeff();
			  }
                      | TRUETOKEN
                          {
			    $$ = makeTrue();
			  }
                      | VOIDTOKEN
                          {
			    $$ = makeUnit();
			  }
                      | FALSETOKEN
                          {
			    $$ = makeFalse();
			  }
                      | DEFAULTTOKEN
                          {
			    $$ = makeDefault();
			  }
                      | DECIMALTOKEN
                          {
			    $$ = makeDecimal();
			  }
                      | ABSOLUTETOKEN
                          {
			    $$ = makeAbsolute();
			  }
                      | RELATIVETOKEN
                          {
			    $$ = makeRelative();
			  }
                      | FIXEDTOKEN
                          {
			    $$ = makeFixed();
			  }
                      | FLOATINGTOKEN
                          {
			    $$ = makeFloating();
			  }
                      | ERRORTOKEN
                          {
			    $$ = makeError();
			  }
                      | DOUBLETOKEN
                          {
			    $$ = makeDoubleSymbol();
			  }
                      | SINGLETOKEN
                          {
			    $$ = makeSingleSymbol();
			  }
                      | QUADTOKEN
                          {
			    $$ = makeQuadSymbol();
			  }
                      | HALFPRECISIONTOKEN
                          {
			    $$ = makeHalfPrecisionSymbol();
			  }
                      | DOUBLEEXTENDEDTOKEN
                          {
			    $$ = makeDoubleextendedSymbol();
			  }
                      | FREEVARTOKEN
                          {
			    $$ = makeVariable();
			  }
                      | DOUBLEDOUBLETOKEN
                          {
			    $$ = makeDoubleDoubleSymbol();
			  }
                      | TRIPLEDOUBLETOKEN
                          {
			    $$ = makeTripleDoubleSymbol();
			  }
                      | STRINGTOKEN
                          {
			    tempString = safeCalloc(strlen($1) + 1, sizeof(char));
			    strcpy(tempString, $1);
			    safeFree($1);
			    tempString2 = safeCalloc(strlen(tempString) + 1, sizeof(char));
			    strcpy(tempString2, tempString);
			    safeFree(tempString);
			    $$ = makeString(tempString2);
			    safeFree(tempString2);
			  }
                      | constant
                          {
			    $$ = $1;
			  }
                      | IDENTIFIERTOKEN
                          {
			    $$ = makeTableAccess($1);
			    safeFree($1);
			  }
                      | ISBOUNDTOKEN LPARTOKEN IDENTIFIERTOKEN RPARTOKEN
                          {
			    $$ = makeIsBound($3);
			    safeFree($3);
			  }
                      | IDENTIFIERTOKEN LPARTOKEN thinglist RPARTOKEN
                          {
			    $$ = makeTableAccessWithSubstitute($1, $3);
			    safeFree($1);
			  }
                      | IDENTIFIERTOKEN LPARTOKEN RPARTOKEN
                          {
			    $$ = makeTableAccessWithSubstitute($1, NULL);
			    safeFree($1);
			  }
                      | list
                          {
			    $$ = $1;
			  }
                      | range
                          {
			    $$ = $1;
			  }
                      | debound
                          {
			    $$ = $1;
			  }
                      | headfunction
                          {
			    $$ = $1;
			  }
                      | LPARTOKEN thing RPARTOKEN
                          {
			    $$ = $2;
			  }
                      | LEFTCURLYBRACETOKEN structelementlist RIGHTCURLYBRACETOKEN
		          {
			    $$ = makeStructure($2);
			  }
                      | statedereference
                          {
			    $$ = $1;
			  }
                      | indexing
                          {
			    $$ = makeIndex($1->a, $1->b);
			    safeFree($1);
			  }
                      | basicthing DOTTOKEN IDENTIFIERTOKEN 
		          {
			    $$ = makeStructAccess($1,$3);
			    safeFree($3);
			  }
                      | basicthing DOTTOKEN IDENTIFIERTOKEN LPARTOKEN thinglist RPARTOKEN
		          {
			    $$ = makeApply(makeStructAccess($1,$3),$5);
			    safeFree($3);
			  }
                      | LPARTOKEN thing RPARTOKEN LPARTOKEN thinglist RPARTOKEN
                          {
			    $$ = makeApply($2,$5);
			  }
                      | LPARTOKEN thing RPARTOKEN LPARTOKEN RPARTOKEN
                          {
			    $$ = makeApply($2,addElement(NULL,makeUnit()));
			  }
                      | PROCTOKEN procbody
                          {
			    $$ = $2;
			  }
                      | TIMETOKEN LPARTOKEN command RPARTOKEN
                          {
			    $$ = makeTime($3);
                          }
;

matchlist:              matchelement
                          {
			    $$ = addElement(NULL,$1);
			  }
                      | matchelement matchlist
		          {
			    $$ = addElement($2,$1);
			  }
;

matchelement:          thing COLONTOKEN beginsymbol variabledeclarationlist commandlist RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeMatchElement($1,makeCommandList(concatChains($4, $5)),$7);
			  }
                      | thing COLONTOKEN beginsymbol variabledeclarationlist commandlist endsymbol
                          {
			    $$ = makeMatchElement($1,makeCommandList(concatChains($4, $5)),makeUnit());
			  }
                      | thing COLONTOKEN beginsymbol variabledeclarationlist RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeMatchElement($1,makeCommandList($4),$6);
			  }
                      | thing COLONTOKEN beginsymbol variabledeclarationlist endsymbol
                          {
			    $$ = makeMatchElement($1,makeCommandList($4),makeUnit());
			  }
                      | thing COLONTOKEN beginsymbol commandlist RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeMatchElement($1,makeCommandList($4),$6);
			  }
                      | thing COLONTOKEN beginsymbol commandlist endsymbol
                          {
			    $$ = makeMatchElement($1,makeCommandList($4),makeUnit());
			  }
                      | thing COLONTOKEN beginsymbol RETURNTOKEN thing SEMICOLONTOKEN endsymbol
                          {
			    $$ = makeMatchElement($1, makeCommandList(addElement(NULL,makeNop())), $5);
			  }
                      | thing COLONTOKEN beginsymbol endsymbol
                          {
			    $$ = makeMatchElement($1, makeCommandList(addElement(NULL,makeNop())), makeUnit());
			  }
                      | thing COLONTOKEN LPARTOKEN thing RPARTOKEN
		          {
			    $$ = makeMatchElement($1, makeCommandList(addElement(NULL,makeNop())), $4);
			  } 
;

constant:               CONSTANTTOKEN
                          {
			    $$ = makeDecimalConstant($1);
			    safeFree($1);
			  }
                      | MIDPOINTCONSTANTTOKEN
                          {
			    $$ = makeMidpointConstant($1);
			    safeFree($1);
			  }
                      | DYADICCONSTANTTOKEN
                          {
			    $$ = makeDyadicConstant($1);
			    safeFree($1);
			  }
                      | HEXCONSTANTTOKEN
                          {
			    $$ = makeHexConstant($1);
			    safeFree($1);
			  }
                      | HEXADECIMALCONSTANTTOKEN
                          {
			    $$ = makeHexadecimalConstant($1);
			    safeFree($1);
			  }
                      | BINARYCONSTANTTOKEN
                          {
			    $$ = makeBinaryConstant($1);
			    safeFree($1);
			  }
                      | PITOKEN
                          {
			    $$ = makePi();
			  }
;



list:                   LBRACKETTOKEN VERTBARTOKEN VERTBARTOKEN RBRACKETTOKEN
                          {
			    $$ = makeEmptyList();
			  }
                      | LBRACKETTOKEN ORTOKEN RBRACKETTOKEN
                          {
			    $$ = makeEmptyList();
			  }
		      | LBRACKETTOKEN VERTBARTOKEN simplelist VERTBARTOKEN RBRACKETTOKEN
                          {
			    $$ = makeRevertedList($3);
			  }
                      | LBRACKETTOKEN VERTBARTOKEN simplelist DOTSTOKEN VERTBARTOKEN RBRACKETTOKEN
                          {
			    $$ = makeRevertedFinalEllipticList($3);
			  }
;

simplelist:             thing
                          {
			    $$ = addElement(NULL, $1);
			  }
                      | simplelist COMMATOKEN thing
                          {
			    $$ = addElement($1, $3);
			  }
                      | simplelist COMMATOKEN DOTSTOKEN COMMATOKEN thing
                          {
			    $$ = addElement(addElement($1, makeElliptic()), $5);
			  }
;

range:                  LBRACKETTOKEN thing COMMATOKEN thing RBRACKETTOKEN
                          {
			    $$ = makeRange($2, $4);
			  }
                      | LBRACKETTOKEN thing SEMICOLONTOKEN thing RBRACKETTOKEN
                          {
			    $$ = makeRange($2, $4);
			  }
                      | LBRACKETTOKEN thing RBRACKETTOKEN
                          {
			    $$ = makeRange($2, copyThing($2));
			  }
;

debound:                STARLEFTANGLETOKEN thing RIGHTANGLESTARTOKEN
                          {
			    $$ = makeDeboundMax($2);
			  }
                      | STARLEFTANGLETOKEN thing RIGHTANGLEDOTTOKEN
                          {
			    $$ = makeDeboundMid($2);
			  }
                      | STARLEFTANGLETOKEN thing RIGHTANGLEUNDERSCORETOKEN
                          {
			    $$ = makeDeboundMin($2);
			  }
                      | SUPTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeDeboundMax($3);
			  }
                      | MIDTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeDeboundMid($3);
			  }
                      | INFTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeDeboundMin($3);
			  }
;

headfunction:           DIFFTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeDiff($3);
			  }
                      | BASHEVALUATETOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeBashevaluate(addElement(NULL,$3));
			  }
                      | GETSUPPRESSEDMESSAGESTOKEN LPARTOKEN RPARTOKEN
                          {
			    $$ = makeGetSuppressedMessages();
			  }
                      | BASHEVALUATETOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeBashevaluate(addElement(addElement(NULL,$5),$3));
			  }
                      | DIRTYSIMPLIFYTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeDirtysimplify($3);
			  }
                      | REMEZTOKEN LPARTOKEN thing COMMATOKEN thing COMMATOKEN thinglist RPARTOKEN
                          {
			    $$ = makeRemez(addElement(addElement($7, $5), $3));
			  }
                      | BINDTOKEN LPARTOKEN thing COMMATOKEN IDENTIFIERTOKEN COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeBind($3, $5, $7);
			    safeFree($5);
			  }
                      | MINTOKEN LPARTOKEN thinglist RPARTOKEN
                          {
			    $$ = makeMin($3);
			  }
                      | MAXTOKEN LPARTOKEN thinglist RPARTOKEN
                          {
			    $$ = makeMax($3);
			  }
                      | FPMINIMAXTOKEN LPARTOKEN thing COMMATOKEN thing COMMATOKEN thing COMMATOKEN thinglist RPARTOKEN
                          {
			    $$ = makeFPminimax(addElement(addElement(addElement($9, $7), $5), $3));
			  }
                      | HORNERTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeHorner($3);
			  }
                      | CANONICALTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeCanonicalThing($3);
			  }
                      | EXPANDTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeExpand($3);
			  }
                      | SIMPLIFYSAFETOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeSimplifySafe($3);
			  }
                      | TAYLORTOKEN LPARTOKEN thing COMMATOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeTaylor($3, $5, $7);
			  }
                      | TAYLORFORMTOKEN LPARTOKEN thing COMMATOKEN thing COMMATOKEN thinglist RPARTOKEN
                          {
                            $$ = makeTaylorform(addElement(addElement($7, $5), $3));
			  }
                      | AUTODIFFTOKEN LPARTOKEN thing COMMATOKEN thing COMMATOKEN thing RPARTOKEN
                          {
                            $$ = makeAutodiff(addElement(addElement(addElement(NULL, $7), $5), $3));
			  }
                      | DEGREETOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeDegree($3);
			  }
                      | NUMERATORTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeNumerator($3);
			  }
                      | DENOMINATORTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeDenominator($3);
			  }
                      | SUBSTITUTETOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeSubstitute($3, $5);
			  }
                      | COMPOSEPOLYNOMIALSTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeSubstitute($3, $5);
			  }
                      | COEFFTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeCoeff($3, $5);
			  }
                      | SUBPOLYTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeSubpoly($3, $5);
			  }
                      | ROUNDCOEFFICIENTSTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeRoundcoefficients($3, $5);
			  }
                      | RATIONALAPPROXTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeRationalapprox($3, $5);
			  }
                      | ACCURATEINFNORMTOKEN LPARTOKEN thing COMMATOKEN thing COMMATOKEN thinglist RPARTOKEN
                          {
			    $$ = makeAccurateInfnorm(addElement(addElement($7, $5), $3));
			  }
                      | ROUNDTOFORMATTOKEN LPARTOKEN thing COMMATOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeRoundToFormat($3, $5, $7);
			  }
                      | EVALUATETOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeEvaluate($3, $5);
			  }
                      | PARSETOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeParse($3);
			  }
                      | READXMLTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeReadXml($3);
			  }
                      | INFNORMTOKEN LPARTOKEN thing COMMATOKEN thinglist RPARTOKEN
                          {
			    $$ = makeInfnorm(addElement($5, $3));
			  }
                      | SUPNORMTOKEN LPARTOKEN thing COMMATOKEN thing COMMATOKEN thing COMMATOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeSupnorm(addElement(addElement(addElement(addElement(addElement(NULL,$11),$9),$7),$5),$3));
			  }
                      | FINDZEROSTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeFindZeros($3, $5);
			  }
                      | FPFINDZEROSTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeFPFindZeros($3, $5);
			  }
                      | DIRTYINFNORMTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeDirtyInfnorm($3, $5);
			  }
                      | NUMBERROOTSTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeNumberRoots($3, $5);
			  }
                      | INTEGRALTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeIntegral($3, $5);
			  }
                      | DIRTYINTEGRALTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeDirtyIntegral($3, $5);
			  }
                      | IMPLEMENTPOLYTOKEN LPARTOKEN thing COMMATOKEN thing COMMATOKEN thing COMMATOKEN thing COMMATOKEN thing COMMATOKEN thinglist RPARTOKEN
                          {
			    $$ = makeImplementPoly(addElement(addElement(addElement(addElement(addElement($13, $11), $9), $7), $5), $3));
			  }
                      | IMPLEMENTCONSTTOKEN LPARTOKEN thinglist RPARTOKEN
                          {
			    $$ = makeImplementConst($3);
			  }
                      | CHECKINFNORMTOKEN LPARTOKEN thing COMMATOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeCheckInfnorm($3, $5, $7);
			  }
                      | ZERODENOMINATORSTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeZeroDenominators($3, $5);
			  }
                      | ISEVALUABLETOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeIsEvaluable($3, $5);
			  }
                      | SEARCHGALTOKEN LPARTOKEN thinglist RPARTOKEN
                          {
			    $$ = makeSearchGal($3);
			  }
                      | GUESSDEGREETOKEN LPARTOKEN thing COMMATOKEN thing COMMATOKEN thinglist RPARTOKEN
                          {
			    $$ = makeGuessDegree(addElement(addElement($7, $5), $3));
			  }
                      | DIRTYFINDZEROSTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeDirtyFindZeros($3, $5);
			  }
                      | HEADTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeHead($3);
			  }
                      | ROUNDCORRECTLYTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeRoundCorrectly($3);
			  }
                      | READFILETOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeReadFile($3);
			  }
                      | REVERTTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeRevert($3);
			  }
                      | SORTTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeSort($3);
			  }
                      | MANTISSATOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeMantissa($3);
			  }
                      | EXPONENTTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeExponent($3);
			  }
                      | PRECISIONTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makePrecision($3);
			  }
                      | TAILTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeTail($3);
			  }
                      | SQRTTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeSqrt($3);
			  }
                      | EXPTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeExp($3);
			  }
                      | FREEVARTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeApply(makeVariable(),addElement(NULL,$3));
			  }                      
                      | FUNCTIONTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeProcedureFunction($3);
			  }
                      | FUNCTIONTOKEN LPARTOKEN thing COMMATOKEN thing RPARTOKEN
                          {
			    $$ = makeSubstitute(makeProcedureFunction($3),$5);
			  }
                      | LOGTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeLog($3);
			  }
                      | LOG2TOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeLog2($3);
			  }
                      | LOG10TOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeLog10($3);
			  }
                      | SINTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeSin($3);
			  }
                      | COSTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeCos($3);
			  }
                      | TANTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeTan($3);
			  }
                      | ASINTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeAsin($3);
			  }
                      | ACOSTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeAcos($3);
			  }
                      | ATANTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeAtan($3);
			  }
                      | SINHTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeSinh($3);
			  }
                      | COSHTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeCosh($3);
			  }
                      | TANHTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeTanh($3);
			  }
                      | ASINHTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeAsinh($3);
			  }
                      | ACOSHTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeAcosh($3);
			  }
                      | ATANHTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeAtanh($3);
			  }
                      | ABSTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeAbs($3);
			  }
                      | ERFTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeErf($3);
			  }
                      | ERFCTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeErfc($3);
			  }
                      | LOG1PTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeLog1p($3);
			  }
                      | EXPM1TOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeExpm1($3);
			  }
                      | DOUBLETOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeDouble($3);
			  }
                      | SINGLETOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeSingle($3);
			  }
                      | QUADTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeQuad($3);
			  }
                      | HALFPRECISIONTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeHalfPrecision($3);
			  }
                      | DOUBLEDOUBLETOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeDoubledouble($3);
			  }
                      | TRIPLEDOUBLETOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeTripledouble($3);
			  }
                      | DOUBLEEXTENDEDTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeDoubleextended($3);
			  }
                      | CEILTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeCeil($3);
			  }
                      | FLOORTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeFloor($3);
			  }
                      | NEARESTINTTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeNearestInt($3);
			  }
                      | LENGTHTOKEN LPARTOKEN thing RPARTOKEN
                          {
			    $$ = makeLength($3);
			  }
;

egalquestionmark:       EQUALTOKEN QUESTIONMARKTOKEN
                          {
			    $$ = NULL;
			  }
                      |
                          {
			    $$ = NULL;
			  }
;


statedereference:       PRECTOKEN egalquestionmark
                          {
			    $$ = makePrecDeref();
			  }
                      | POINTSTOKEN egalquestionmark
                          {
			    $$ = makePointsDeref();
			  }
                      | DIAMTOKEN egalquestionmark
                          {
			    $$ = makeDiamDeref();
			  }
                      | DISPLAYTOKEN egalquestionmark
                          {
			    $$ = makeDisplayDeref();
			  }
                      | VERBOSITYTOKEN egalquestionmark
                          {
			    $$ = makeVerbosityDeref();
			  }
                      | SHOWMESSAGENUMBERSTOKEN egalquestionmark
                          {
			    $$ = makeShowMessageNumbersDeref();
			  }
                      | CANONICALTOKEN egalquestionmark
                          {
			    $$ = makeCanonicalDeref();
			  }
                      | AUTOSIMPLIFYTOKEN egalquestionmark
                          {
			    $$ = makeAutoSimplifyDeref();
			  }
                      | TAYLORRECURSIONSTOKEN egalquestionmark
                          {
			    $$ = makeTaylorRecursDeref();
			  }
                      | TIMINGTOKEN egalquestionmark
                          {
			    $$ = makeTimingDeref();
			  }
                      | FULLPARENTHESESTOKEN egalquestionmark
                          {
			    $$ = makeFullParenDeref();
			  }
                      | MIDPOINTMODETOKEN egalquestionmark
                          {
			    $$ = makeMidpointDeref();
			  }
                      | DIEONERRORMODETOKEN egalquestionmark
                          {
			    $$ = makeDieOnErrorDeref();
			  }
                      | RATIONALMODETOKEN egalquestionmark
                          {
			    $$ = makeRationalModeDeref();
			  }
                      | SUPPRESSWARNINGSTOKEN egalquestionmark
                          {
			    $$ = makeSuppressWarningsDeref();
			  }
                      | HOPITALRECURSIONSTOKEN egalquestionmark
                          {
			    $$ = makeHopitalRecursDeref();
			  }
;


externalproctype:       CONSTANTTYPETOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = CONSTANT_TYPE;
			    $$ = tempIntPtr;
			  }
                      | FUNCTIONTOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = FUNCTION_TYPE;
			    $$ = tempIntPtr;
			  }
                      | OBJECTTOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = OBJECT_TYPE;
			    $$ = tempIntPtr;
			  }
                      | RANGETOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = RANGE_TYPE;
			    $$ = tempIntPtr;
			  }
                      | INTEGERTOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = INTEGER_TYPE;
			    $$ = tempIntPtr;
			  }
                      | STRINGTYPETOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = STRING_TYPE;
			    $$ = tempIntPtr;
			  }
                      | BOOLEANTOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = BOOLEAN_TYPE;
			    $$ = tempIntPtr;
			  }
                      | LISTTOKEN OFTOKEN CONSTANTTYPETOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = CONSTANT_LIST_TYPE;
			    $$ = tempIntPtr;
			  }
                      | LISTTOKEN OFTOKEN FUNCTIONTOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = FUNCTION_LIST_TYPE;
			    $$ = tempIntPtr;
			  }
                      | LISTTOKEN OFTOKEN OBJECTTOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = OBJECT_LIST_TYPE;
			    $$ = tempIntPtr;
			  }
                      | LISTTOKEN OFTOKEN RANGETOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = RANGE_LIST_TYPE;
			    $$ = tempIntPtr;
			  }
                      | LISTTOKEN OFTOKEN INTEGERTOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = INTEGER_LIST_TYPE;
			    $$ = tempIntPtr;
			  }
                      | LISTTOKEN OFTOKEN STRINGTYPETOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = STRING_LIST_TYPE;
			    $$ = tempIntPtr;
			  }
                      | LISTTOKEN OFTOKEN BOOLEANTOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = BOOLEAN_LIST_TYPE;
			    $$ = tempIntPtr;
			  }
;

extendedexternalproctype: VOIDTOKEN
                          {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = VOID_TYPE;
			    $$ = tempIntPtr;
			  }
                      | externalproctype
		          {
			    $$ = $1;
		          }
;


externalproctypesimplelist:   externalproctype
                          {
			    $$ = addElement(NULL, $1);
			  }
                      | externalproctype COMMATOKEN externalproctypesimplelist
                          {
			    $$ = addElement($3, $1);
			  }
;

externalproctypelist:       extendedexternalproctype
                          {
			    $$ = addElement(NULL, $1);
			  }
                      | LPARTOKEN externalproctypesimplelist RPARTOKEN
                          {
			    $$ = $2;
			  }
;


