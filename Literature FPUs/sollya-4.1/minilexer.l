/*

Copyright 2007-2013 by

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

%{

#include <stdio.h>
#include <string.h>
#include <errno.h>
#include "expression.h"
#include "miniparser.h"
#include "general.h"
#include "chain.h"

#define YY_NO_UNPUT 1
#define YY_NO_INPUT 1

/* Mess with the mallocs used by the lexer */
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
#define free UNUSED_PARAM(yyscanner); parserFree
/* End of the malloc mess */

/* Mess with fprintf to use sollyaFprintf instead. */
#undef  fprintf
#define fprintf UNUSED_PARAM(yyscanner); sollyaFprintf
/* End of fprintf mess */

%}

%option noyywrap
%option always-interactive
%option prefix="miniyy"
%option reentrant
%option bison-bridge
%option nounput

%x commentstate

CHAR		[a-zA-Z]
NUMBER		[0-9]
HEXNUMBER       (([0-9])|([ABCDEFabcdef]))
SPECIAL         [_$§]

ACONSTANT        ((({NUMBER}+|({NUMBER}*"."{NUMBER}+))(((((" ")*)(([eE]))([+-])?{NUMBER}+)?)))|("infty"|"nan"|"NAN"|"NaN"|"@Inf@"|"@NaN@"))
CONSTANT        ({ACONSTANT})|((("%")({NUMBER})({NUMBER}+)("%"))({ACONSTANT}))
DYADICCONSTANT  ({NUMBER}+)([bB])([+-]?)({NUMBER}+)
HEXCONSTANT     ("0x")({HEXNUMBER}{16}|{HEXNUMBER}{8})

HEXADECIMALCONSTANT ("0x"|"0X")(({HEXNUMBER}*"."{HEXNUMBER}+)|({HEXNUMBER}+((".")?)))(("p"|"P")(([+-])?)({NUMBER}*))

BINARYCONSTANT  (([0-1])+|(([0-1])*"."([0-1])+))"_2"

AMIDPOINTCONSTANT        (({NUMBER}+|({NUMBER}*"."{NUMBER}+))(("~"({NUMBER})+("/")({NUMBER})+("~")))(((((" ")*)(([eE]))([+-])?{NUMBER}+)?)))
MIDPOINTCONSTANT         (({AMIDPOINTCONSTANT})|(("-")((" ")*)({AMIDPOINTCONSTANT})))

IDENTIFIER        ({CHAR}|{SPECIAL})({CHAR}|{NUMBER}|{SPECIAL})*

DOT             "."

LPAR            "("
RPAR            ")"

LBRACKET        "["
RBRACKET        "]"

PI              ("pi")|("Pi")

PLUS            "+"
MINUS           "-"
APPROX          "~"
MUL             "*"
DIV             "/"
POW             "^"
SQRT            "sqrt"
EXP             "exp"
FREEVAR         "_x_"
LOG             "log"
LOG2            "log2"
LOG10           "log10"
SIN             "sin"
COS             "cos"
TAN             "tan"
ASIN            "asin"
ACOS            "acos"
ATAN            "atan"
SINH            "sinh"
COSH            "cosh"
TANH            "tanh"
ASINH           "asinh"
ACOSH           "acosh"
ATANH           "atanh"
ABS             "abs"
ERF             "erf"
ERFC            "erfc"
LOG1P           "log1p"
EXPM1           "expm1"

EQUAL           "="
COMMA           ","
PREC            "prec"
POINTS          "points"
EXCLAMATION     "!"
DOUBLECOLON     "::"
COLON           ":"
DOTCOLON        ".:"
COLONDOT        ":."
ASSIGNEQUAL     ":="

SEMICOLON       ";"
QUIT            "quit"
PRINT           "print"
SUPPRESSMESSAGE "suppressmessage"
UNSUPPRESSMESSAGE "unsuppressmessage"
DIFF            "diff"
DIRTYSIMPLIFY   "dirtysimplify"
CANONICAL       "canonical"
PLOT            "plot"
REMEZ           "remez"
FPMINIMAX       "fpminimax"
INFNORM         "infnorm"
SUPNORM         "supnorm"
DIAM            "diam"

DOUBLELONG       "double"
SINGLELONG       "single"
QUADLONG         "quad"
HALFPRECISIONLONG "halfprecision"
DOUBLEDOUBLELONG "doubledouble"
TRIPLEDOUBLELONG "tripledouble"
DOUBLEEXTENDEDLONG "doubleextended"


DOUBLESHORT      "D"
SINGLESHORT      "SG"
QUADSHORT        "QD"
HALFPRECISIONSHORT "HP"
DOUBLEDOUBLESHORT "DD"
TRIPLEDOUBLESHORT "TD"
DOUBLEEXTENDEDSHORT "DE"


DOUBLE          ({DOUBLELONG}|{DOUBLESHORT})
SINGLE          ({SINGLELONG}|{SINGLESHORT})
QUAD            ({QUADLONG}|{QUADSHORT})
HALFPRECISION   ({HALFPRECISIONLONG}|{HALFPRECISIONSHORT})
DOUBLEDOUBLE    ({DOUBLEDOUBLELONG}|{DOUBLEDOUBLESHORT})
TRIPLEDOUBLE    ({TRIPLEDOUBLELONG}|{TRIPLEDOUBLESHORT})
DOUBLEEXTENDED  ({DOUBLEEXTENDEDLONG}|{DOUBLEEXTENDEDSHORT})

HORNER          "horner"
DEGREE          "degree"
EXPAND          "expand"

SIMPLIFYSAFE1   "simplify"
SIMPLIFYSAFE2   "simplifysafe"

SIMPLIFYSAFE    ({SIMPLIFYSAFE1}|{SIMPLIFYSAFE2})

TAYLOR          "taylor"
TAYLORFORM      "taylorform"
CHEBYSHEVFORM   "chebyshevform"
AUTODIFF        "autodiff"

FINDZEROS       "findzeros"
FPFINDZEROS     "fpfindzeros"
DIRTYINFNORM    "dirtyinfnorm"
NUMBERROOTS     "numberroots"

EVALUATE        "evaluate"


NUMERATOR       "numerator"
DENOMINATOR     "denominator"

DYADIC          "dyadic"
DISPLAY         "display"
ON              "on"
OFF             "off"
POWERS          "powers"
BINARY          "binary"
HEXADECIMAL     "hexadecimal"

INTEGRAL        "integral"
DIRTYINTEGRAL   "dirtyintegral"

STRINGDELIMITER [\"]
OCTALCHAR       [01234567]
OCTAL           ({OCTALCHAR})(({OCTALCHAR})?)(({OCTALCHAR})?)
HEXACHAR        [0123456789ABCDEFabcdef]
HEXA            ({HEXACHAR})(({HEXACHAR})?)
STRING          ({STRINGDELIMITER})((("\\\\")|(("\\")[\"\'\?ntabfrv])|(("\\")({OCTAL}))|(("\\x")({HEXA}))|([^\"\\]))*)({STRINGDELIMITER})


VERBOSITY       "verbosity"
SHOWMESSAGENUMBERS "showmessagenumbers"

WORSTCASE       "worstcase"

LEFTANGLE       "<"
RIGHTANGLEUNDERSCORE ">_"
RIGHTANGLEDOT ">."
RIGHTANGLE      ">"
STARLEFTANGLE   "*<"
RIGHTANGLESTAR  ">*"

COMPAREEQUAL    "=="
EXCLAMATIONEQUAL "!="

AND             "&&"
OR              "||"

SUBSTITUTE      "substitute"
COMPOSEPOLYNOMIALS "composepolynomials"

DOTS            "..."

IMPLEMENTPOLY   "implementpoly"
IMPLEMENTCONST  "implementconstant"

CHECKINFNORM    "checkinfnorm"

TAYLORRECURSIONS "taylorrecursions"

PRINTHEXA       ("printhexa"|"printdouble")
PRINTFLOAT      ("printfloat"|"printsingle")
PRINTBINARY     "printbinary"

ROUNDCOEFFICIENTS "roundcoefficients"


RESTART         "restart"


ZERODENOMINATORS "zerodenominators"
ISEVALUABLE     "isevaluable"
HONORCOEFFPREC  "honorcoeffprec"

ACCURATEINFNORM  "accurateinfnorm"


FILE            "file"
POSTSCRIPT      "postscript"
POSTSCRIPTFILE  "postscriptfile"

PRINTEXPANSION  "printexpansion"

BASHEXECUTE     "bashexecute"
BASHEVALUATE    "bashevaluate"
GETSUPPRESSEDMESSAGES "getsuppressedmessages"
EXTERNALPLOT    "externalplot"
PERTURB         "perturb"

COEFF           "coeff"
SUBPOLY         "subpoly"

QUESTIONMARK    "?"

SEARCHGAL       "searchgal"


RATIONALAPPROX  "rationalapprox"

READ            "read"

COMMENTSTART    "/*"
COMMENTEND      "*/"

ONELINECOMMENT  ("//")([^\n])*"\n"

WRITE           "write"

ASCIIPLOT       "asciiplot"


ROUNDTOFORMAT   "round"
MINUSWORD       "RD"
PLUSWORD        "RU"
ZEROWORD        "RZ"
NEAREST         "RN"


GUESSDEGREE     "guessdegree"

PARSE           "parse"

AUTOSIMPLIFY    "autosimplify"

TIMING          "timing"
TIME            "time"
FULLPARENTHESES "fullparentheses"
MIDPOINTMODE    "midpointmode"
DIEONERRORMODE  "dieonerrormode"
SUPPRESSWARNINGS "roundingwarnings"
RATIONALMODE    "rationalmode"

LIBRARY         "library"
LIBRARYCONSTANT "libraryconstant"

HOPITALRECURSIONS "hopitalrecursions"

HELP            "help"

DIRTYFINDZEROS  "dirtyfindzeros"

CEIL            "ceil"
FLOOR           "floor"
NEARESTINT      "nearestint"

HEAD            "head"
TAIL            "tail"

VERTBAR         "|"
AT              "@"

IF              "if"
THEN            "then"
ELSE            "else"
FOR             "for"
IN              "in"
FROM            "from"
TO              "to"
BY              "by"
DO              "do"
BEGIN           "begin" 
END             "end"
LBRACE          "{"
RBRACE          "}"

WHILEDEF        "while"

TRUE            "true"
FALSE           "false"
DEFAULT         "default"

MATCH           "match"
WITH            "with"

RENAME          "rename"
BIND            "bind"

LENGTH          "length"

ABSOLUTE        "absolute"
RELATIVE        "relative"
DECIMAL         "decimal"
FIXED           "fixed"
FLOATING        "floating"

ERROR           "error"

PRINTXML        "printxml"

INF             "inf"
MID             "mid"
SUP             "sup"

MIN             "min"
MAX             "max"

READXML         "readxml"

MANTISSA        "mantissa"
EXPONENT        "exponent"
PRECISION       "precision"

REVERT          "revert"
SORT            "sort"

READFILE        "readfile"

ROUNDCORRECTLY  "roundcorrectly"

EXECUTE         "execute"

ISBOUND         "isbound"

EXTERNALPROC    "externalproc"
VOID            "void"
CONSTANTTYPE    "constant"
FUNCTION        "function"
OBJECT          "object"
RANGE           "range"
INTEGER         "integer"
STRINGTYPE      "string"
BOOLEAN         "boolean"
LIST            "list"
OF              "of"

VAR             "var"

PROC            "proc"
PROCEDURE       "procedure"
RETURN          "return"
NOP             "nop"


%%

%{

%}




{COMMENTSTART}  { miniparserCharactersRead += yyleng;    BEGIN(commentstate); }

<commentstate>{COMMENTEND} { miniparserCharactersRead += yyleng; BEGIN(INITIAL); }

<commentstate>. { /* Eat up comments */
                  miniparserCharactersRead += yyleng;
                 }

<commentstate>[\n] { /* Eat up newlines in comments */
                     miniparserCharactersRead += yyleng;
		}



{ONELINECOMMENT} {  /* Eat up comments */
                    miniparserCharactersRead += yyleng;
                 }

<<EOF>>         {
                      miniparserEofReached = 1;
                      yyterminate();
                }
{MIDPOINTCONSTANT}                          {
                                              miniparserCharactersRead += yyleng;
					      constBuffer2 = (char *) safeCalloc(yyleng+1,sizeof(char));
					      if (removeSpaces(constBuffer2,yytext)) {
						printMessage(2,SOLLYA_MSG_SPACES_REMOVED_FROM_CONSTANT_IN_SCIENTIF_NOTAT,"Information: removed spaces in scientific notation constant \"%s\", it will be considered as \"%s\"\n",yytext,constBuffer2);
					      }
					      yylval->value = constBuffer2;
                                              return MIDPOINTCONSTANTTOKEN; }
{CONSTANT}                                  {
                                              miniparserCharactersRead += yyleng;
					      constBuffer2 = (char *) safeCalloc(yyleng+1,sizeof(char));
					      if (removeSpaces(constBuffer2,yytext)) {
						printMessage(2,SOLLYA_MSG_SPACES_REMOVED_FROM_CONSTANT_IN_SCIENTIF_NOTAT,"Information: removed spaces in scientific notation constant \"%s\", it will be considered as \"%s\"\n",yytext,constBuffer2);
					      }
					      yylval->value = constBuffer2;
                                               return CONSTANTTOKEN; }
{DYADICCONSTANT} 			    {
                                              miniparserCharactersRead += yyleng;
                                              constBuffer = (char *) safeCalloc(yyleng+1,sizeof(char));
					      strncpy(constBuffer,yytext,yyleng);
					      yylval->value = constBuffer;
                                               return DYADICCONSTANTTOKEN; }
{HEXADECIMALCONSTANT}     		    { miniparserCharactersRead += yyleng;
                                              constBuffer = (char *) safeCalloc(yyleng+1,sizeof(char));
					      strncpy(constBuffer,yytext,yyleng);
					      yylval->value = constBuffer;
                                              return HEXADECIMALCONSTANTTOKEN; }
{HEXCONSTANT}     			    { miniparserCharactersRead += yyleng;
                                              constBuffer = (char *) safeCalloc(yyleng+1,sizeof(char));
					      strncpy(constBuffer,yytext,yyleng);
					      yylval->value = constBuffer;
                                               return HEXCONSTANTTOKEN; }
{BINARYCONSTANT}  			    { miniparserCharactersRead += yyleng;
                                              constBuffer = (char *) safeCalloc(yyleng-1,sizeof(char));
					      strncpy(constBuffer,yytext,yyleng-2);
					      yylval->value = constBuffer;
                                               return BINARYCONSTANTTOKEN; }

{PI}              			    { miniparserCharactersRead += yyleng; return PITOKEN; }

{STRING}          			    {
                                              miniparserCharactersRead += yyleng;
					      constBuffer = (char *) safeCalloc(yyleng-1,sizeof(char));
					      constBuffer2 = (char *) safeCalloc(yyleng-1,sizeof(char));
					      strncpy(constBuffer2,yytext+1,yyleng-2);
					      demaskString(constBuffer,constBuffer2);
					      safeFree(constBuffer2);
					      yylval->value = constBuffer;
                                               return STRINGTOKEN; }

{LPAR}            			    {  miniparserCharactersRead += yyleng; return LPARTOKEN; }
{RPAR}            			    {  miniparserCharactersRead += yyleng; return RPARTOKEN; }
{LBRACKET}        			    {  miniparserCharactersRead += yyleng; return LBRACKETTOKEN; }
{RBRACKET}        			    {  miniparserCharactersRead += yyleng; return RBRACKETTOKEN; }
{EXCLAMATIONEQUAL}			    {  miniparserCharactersRead += yyleng; return EXCLAMATIONEQUALTOKEN; }
{COMPAREEQUAL}                              {  miniparserCharactersRead += yyleng; return COMPAREEQUALTOKEN; }
{EQUAL}           			    {  miniparserCharactersRead += yyleng; return EQUALTOKEN; }
{ASSIGNEQUAL}          			    {  miniparserCharactersRead += yyleng; return ASSIGNEQUALTOKEN; }
{COMMA}           			    {  miniparserCharactersRead += yyleng; return COMMATOKEN; }
{EXCLAMATION}				    {  miniparserCharactersRead += yyleng; return EXCLAMATIONTOKEN; }
{SEMICOLON}       			    {  miniparserCharactersRead += yyleng; return SEMICOLONTOKEN; }
{LEFTANGLE}       			    {  miniparserCharactersRead += yyleng; return LEFTANGLETOKEN; }
{STARLEFTANGLE}   			    {  miniparserCharactersRead += yyleng; return STARLEFTANGLETOKEN; }
{RIGHTANGLEUNDERSCORE}			    {  miniparserCharactersRead += yyleng; return RIGHTANGLEUNDERSCORETOKEN; }
{RIGHTANGLEDOT} 			    {  miniparserCharactersRead += yyleng; return RIGHTANGLEDOTTOKEN; }
{RIGHTANGLESTAR}			    {  miniparserCharactersRead += yyleng; return RIGHTANGLESTARTOKEN; }
{RIGHTANGLE}      			    {  miniparserCharactersRead += yyleng; return RIGHTANGLETOKEN; }
{DOTS}            			    {  miniparserCharactersRead += yyleng; return DOTSTOKEN; }
{DOT}            			    {  miniparserCharactersRead += yyleng; return DOTTOKEN; }
{QUESTIONMARK}				    {  miniparserCharactersRead += yyleng; return QUESTIONMARKTOKEN; }
{AND}         				    {  miniparserCharactersRead += yyleng; return ANDTOKEN; }
{OR}         				    {  miniparserCharactersRead += yyleng; return ORTOKEN; }
{VERTBAR}				    {  miniparserCharactersRead += yyleng; return VERTBARTOKEN; }
{VAR}					    {  miniparserCharactersRead += yyleng; return VARTOKEN; }
{PROC}					    {  miniparserCharactersRead += yyleng; return PROCTOKEN; }
{PROCEDURE}				    {  miniparserCharactersRead += yyleng; return PROCEDURETOKEN; }
{RETURN}				    {  miniparserCharactersRead += yyleng; return RETURNTOKEN; }
{NOP}	         			    {  miniparserCharactersRead += yyleng; return NOPTOKEN; }
{AT}					    {  miniparserCharactersRead += yyleng; return ATTOKEN; }
{DOUBLECOLON}				    {  miniparserCharactersRead += yyleng; return DOUBLECOLONTOKEN; }
{COLON}  				    {  miniparserCharactersRead += yyleng; return COLONTOKEN; }
{DOTCOLON}				    {  miniparserCharactersRead += yyleng; return DOTCOLONTOKEN; }
{COLONDOT}				    {  miniparserCharactersRead += yyleng; return COLONDOTTOKEN; }


{PLUS}            			    {  miniparserCharactersRead += yyleng; return PLUSTOKEN; }
{MINUS}           			    {  miniparserCharactersRead += yyleng; return MINUSTOKEN; }
{MUL}          				    {  miniparserCharactersRead += yyleng; return MULTOKEN; }
{DIV}            			    {  miniparserCharactersRead += yyleng; return DIVTOKEN; }
{POW}            			    {  miniparserCharactersRead += yyleng; return POWTOKEN; }

{SQRT}            			    {  miniparserCharactersRead += yyleng; return SQRTTOKEN; }
{EXP}             			    {  miniparserCharactersRead += yyleng; return EXPTOKEN; }
{FREEVAR}             			    {  miniparserCharactersRead += yyleng; return FREEVARTOKEN; }
{LOG}             			    {  miniparserCharactersRead += yyleng; return LOGTOKEN; }
{LOG2}            			    {  miniparserCharactersRead += yyleng; return LOG2TOKEN; }
{LOG10}           			    {  miniparserCharactersRead += yyleng; return LOG10TOKEN; }
{SIN}             			    {  miniparserCharactersRead += yyleng; return SINTOKEN; }
{COS}             			    {  miniparserCharactersRead += yyleng; return COSTOKEN; }
{TAN}             			    {  miniparserCharactersRead += yyleng; return TANTOKEN; }
{ASIN}            			    {  miniparserCharactersRead += yyleng; return ASINTOKEN; }
{ACOS}            			    {  miniparserCharactersRead += yyleng; return ACOSTOKEN; }
{ATAN}            			    {  miniparserCharactersRead += yyleng; return ATANTOKEN; }
{SINH}            			    {  miniparserCharactersRead += yyleng; return SINHTOKEN; }
{COSH}            			    {  miniparserCharactersRead += yyleng; return COSHTOKEN; }
{TANH}            			    {  miniparserCharactersRead += yyleng; return TANHTOKEN; }
{ASINH}           			    {  miniparserCharactersRead += yyleng; return ASINHTOKEN; }
{ACOSH}           			    {  miniparserCharactersRead += yyleng; return ACOSHTOKEN; }
{ATANH}           			    {  miniparserCharactersRead += yyleng; return ATANHTOKEN; }
{ABS}             			    {  miniparserCharactersRead += yyleng; return ABSTOKEN; }
{ERF}             			    {  miniparserCharactersRead += yyleng; return ERFTOKEN; }
{ERFC}            			    {  miniparserCharactersRead += yyleng; return ERFCTOKEN; }
{LOG1P}           			    {  miniparserCharactersRead += yyleng; return LOG1PTOKEN; }
{EXPM1}           			    {  miniparserCharactersRead += yyleng; return EXPM1TOKEN; }
{DOUBLE}          			    {  miniparserCharactersRead += yyleng; return DOUBLETOKEN; }
{SINGLE}          			    {  miniparserCharactersRead += yyleng; return SINGLETOKEN; }
{QUAD}          			    {  miniparserCharactersRead += yyleng; return QUADTOKEN; }
{HALFPRECISION}          		    {  miniparserCharactersRead += yyleng; return HALFPRECISIONTOKEN; }
{DOUBLEDOUBLE}				    {  miniparserCharactersRead += yyleng; return DOUBLEDOUBLETOKEN; }
{TRIPLEDOUBLE}    			    {  miniparserCharactersRead += yyleng; return TRIPLEDOUBLETOKEN; }
{DOUBLEEXTENDED}  			    {  miniparserCharactersRead += yyleng; return DOUBLEEXTENDEDTOKEN; }
{CEIL}            			    {  miniparserCharactersRead += yyleng; return CEILTOKEN; }
{FLOOR}           			    {  miniparserCharactersRead += yyleng; return FLOORTOKEN; }

{PREC}            			    {  miniparserCharactersRead += yyleng; return PRECTOKEN; }
{POINTS}          			    {  miniparserCharactersRead += yyleng; return POINTSTOKEN; }
{DIAM}            			    {  miniparserCharactersRead += yyleng; return DIAMTOKEN; }
{DISPLAY}          			    {  miniparserCharactersRead += yyleng; return DISPLAYTOKEN; }
{VERBOSITY}       			    {  miniparserCharactersRead += yyleng; return VERBOSITYTOKEN; }
{SHOWMESSAGENUMBERS}       		    {  miniparserCharactersRead += yyleng; return SHOWMESSAGENUMBERSTOKEN; }
{CANONICAL}       			    {  miniparserCharactersRead += yyleng; return CANONICALTOKEN; }
{AUTOSIMPLIFY}    			    {  miniparserCharactersRead += yyleng; return AUTOSIMPLIFYTOKEN; }
{TAYLORRECURSIONS}			    {  miniparserCharactersRead += yyleng; return TAYLORRECURSIONSTOKEN; }
{TIMING}          			    {  miniparserCharactersRead += yyleng; return TIMINGTOKEN; }
{TIME}          			    {  miniparserCharactersRead += yyleng; return TIMETOKEN; }
{FULLPARENTHESES} 			    {  miniparserCharactersRead += yyleng; return FULLPARENTHESESTOKEN; }
{MIDPOINTMODE}    			    {  miniparserCharactersRead += yyleng; return MIDPOINTMODETOKEN; }
{DIEONERRORMODE}    			    {  miniparserCharactersRead += yyleng; return DIEONERRORMODETOKEN; }
{SUPPRESSWARNINGS}			    {  miniparserCharactersRead += yyleng; return SUPPRESSWARNINGSTOKEN; }
{RATIONALMODE}			            {  miniparserCharactersRead += yyleng; return RATIONALMODETOKEN; }
{HOPITALRECURSIONS}			    {  miniparserCharactersRead += yyleng; return HOPITALRECURSIONSTOKEN; }

{ON}              			    {  miniparserCharactersRead += yyleng; return ONTOKEN; }
{OFF}             			    {  miniparserCharactersRead += yyleng; return OFFTOKEN; }
{DYADIC}				    {  miniparserCharactersRead += yyleng; return DYADICTOKEN; }
{POWERS}          			    {  miniparserCharactersRead += yyleng; return POWERSTOKEN; }
{BINARY}          			    {  miniparserCharactersRead += yyleng; return BINARYTOKEN; }
{HEXADECIMAL}          			    {  miniparserCharactersRead += yyleng; return HEXADECIMALTOKEN; }
{FILE}            			    {  miniparserCharactersRead += yyleng; return FILETOKEN; }
{POSTSCRIPT}      			    {  miniparserCharactersRead += yyleng; return POSTSCRIPTTOKEN; }
{POSTSCRIPTFILE}  			    {  miniparserCharactersRead += yyleng; return POSTSCRIPTFILETOKEN; }
{PERTURB}         			    {  miniparserCharactersRead += yyleng; return PERTURBTOKEN; }
{MINUSWORD}       			    {  miniparserCharactersRead += yyleng; return MINUSWORDTOKEN; }
{PLUSWORD}        			    {  miniparserCharactersRead += yyleng; return PLUSWORDTOKEN; }
{ZEROWORD}        			    {  miniparserCharactersRead += yyleng; return ZEROWORDTOKEN; }
{NEAREST}         			    {  miniparserCharactersRead += yyleng; return NEARESTTOKEN; }
{HONORCOEFFPREC} 			    {  miniparserCharactersRead += yyleng; return HONORCOEFFPRECTOKEN; }
{TRUE}					    {  miniparserCharactersRead += yyleng; return TRUETOKEN; }
{FALSE}					    {  miniparserCharactersRead += yyleng; return FALSETOKEN; }
{DEFAULT}				    {  miniparserCharactersRead += yyleng; return DEFAULTTOKEN; }
{MATCH} 				    {  miniparserCharactersRead += yyleng; return MATCHTOKEN; }
{WITH}  				    {  miniparserCharactersRead += yyleng; return WITHTOKEN; }
{HEAD}   				    {  miniparserCharactersRead += yyleng; return HEADTOKEN; }
{ROUNDCORRECTLY}   		       	    {  miniparserCharactersRead += yyleng; return ROUNDCORRECTLYTOKEN; }
{REVERT}   				    {  miniparserCharactersRead += yyleng; return REVERTTOKEN; }
{SORT}   				    {  miniparserCharactersRead += yyleng; return SORTTOKEN; }
{MANTISSA}   				    {  miniparserCharactersRead += yyleng; return MANTISSATOKEN; }
{EXPONENT}   				    {  miniparserCharactersRead += yyleng; return EXPONENTTOKEN; }
{PRECISION}   				    {  miniparserCharactersRead += yyleng; return PRECISIONTOKEN; }
{TAIL}   				    {  miniparserCharactersRead += yyleng; return TAILTOKEN; }
{INF}   				    {  miniparserCharactersRead += yyleng; return INFTOKEN; }
{MID}   				    {  miniparserCharactersRead += yyleng; return MIDTOKEN; }
{SUP}   				    {  miniparserCharactersRead += yyleng; return SUPTOKEN; }
{MIN}   				    {  miniparserCharactersRead += yyleng; return MINTOKEN; }
{MAX}   				    {  miniparserCharactersRead += yyleng; return MAXTOKEN; }
{READXML}   				    {  miniparserCharactersRead += yyleng; return READXMLTOKEN; }
{LENGTH}   				    {  miniparserCharactersRead += yyleng; return LENGTHTOKEN; }
{ABSOLUTE}   				    {  miniparserCharactersRead += yyleng; return ABSOLUTETOKEN; }
{RELATIVE}   				    {  miniparserCharactersRead += yyleng; return RELATIVETOKEN; }
{DECIMAL}   				    {  miniparserCharactersRead += yyleng; return DECIMALTOKEN; }
{FIXED}   				    {  miniparserCharactersRead += yyleng; return FIXEDTOKEN; }
{FLOATING}   				    {  miniparserCharactersRead += yyleng; return FLOATINGTOKEN; }

{ERROR}   				    {  miniparserCharactersRead += yyleng; return ERRORTOKEN; }
{READFILE}   				    {  miniparserCharactersRead += yyleng; return READFILETOKEN; }
{ISBOUND}   				    {  miniparserCharactersRead += yyleng; return ISBOUNDTOKEN; }

{QUIT}             			    {
			                        miniparserCharactersRead += yyleng; return FALSEQUITTOKEN;
                                            }
{RESTART}         			    { miniparserCharactersRead += yyleng; return FALSERESTARTTOKEN; }

{LIBRARY}         			    {  miniparserCharactersRead += yyleng; return LIBRARYTOKEN; }
{LIBRARYCONSTANT}         		    {  miniparserCharactersRead += yyleng; return LIBRARYCONSTANTTOKEN; }

{DIFF}            			    {  miniparserCharactersRead += yyleng; return DIFFTOKEN; }
{DIRTYSIMPLIFY}				    {  miniparserCharactersRead += yyleng; return DIRTYSIMPLIFYTOKEN; }
{REMEZ}           			    {  miniparserCharactersRead += yyleng; return REMEZTOKEN; }
{FPMINIMAX}           			    {  miniparserCharactersRead += yyleng; return FPMINIMAXTOKEN; }
{HORNER}          			    {  miniparserCharactersRead += yyleng; return HORNERTOKEN; }
{EXPAND}          			    {  miniparserCharactersRead += yyleng; return EXPANDTOKEN; }
{SIMPLIFYSAFE}				    {  miniparserCharactersRead += yyleng; return SIMPLIFYSAFETOKEN; }
{TAYLOR}         			    {  miniparserCharactersRead += yyleng; return TAYLORTOKEN; }
{TAYLORFORM}         			    {  miniparserCharactersRead += yyleng; return TAYLORFORMTOKEN; }
{CHEBYSHEVFORM}         		    {  miniparserCharactersRead += yyleng; return CHEBYSHEVFORMTOKEN; }
{AUTODIFF}         			    {  miniparserCharactersRead += yyleng; return AUTODIFFTOKEN; }
{DEGREE}          			    {  miniparserCharactersRead += yyleng; return DEGREETOKEN; }
{NUMERATOR}       			    {  miniparserCharactersRead += yyleng; return NUMERATORTOKEN; }
{DENOMINATOR}     			    {  miniparserCharactersRead += yyleng; return DENOMINATORTOKEN; }
{SUBSTITUTE}      			    {  miniparserCharactersRead += yyleng; return SUBSTITUTETOKEN; }
{COMPOSEPOLYNOMIALS}      		    {  miniparserCharactersRead += yyleng; return COMPOSEPOLYNOMIALSTOKEN; }
{COEFF}           			    {  miniparserCharactersRead += yyleng; return COEFFTOKEN; }
{SUBPOLY}         			    {  miniparserCharactersRead += yyleng; return SUBPOLYTOKEN; }
{ROUNDCOEFFICIENTS} 			    {  miniparserCharactersRead += yyleng; return ROUNDCOEFFICIENTSTOKEN; }
{RATIONALAPPROX}  			    {  miniparserCharactersRead += yyleng; return RATIONALAPPROXTOKEN; }
{APPROX}           			    {  miniparserCharactersRead += yyleng; return APPROXTOKEN; }
{ACCURATEINFNORM}  			    {  miniparserCharactersRead += yyleng; return ACCURATEINFNORMTOKEN; }
{ROUNDTOFORMAT}   			    {  miniparserCharactersRead += yyleng; return ROUNDTOFORMATTOKEN; }
{EVALUATE}        			    {  miniparserCharactersRead += yyleng; return EVALUATETOKEN; }

{PARSE}           			    {  miniparserCharactersRead += yyleng; return PARSETOKEN; }

{PRINT}           			    {  miniparserCharactersRead += yyleng; return PRINTTOKEN; }
{SUPPRESSMESSAGE}           		    {  miniparserCharactersRead += yyleng; return SUPPRESSMESSAGETOKEN; }
{UNSUPPRESSMESSAGE}           		    {  miniparserCharactersRead += yyleng; return UNSUPPRESSMESSAGETOKEN; }
{PRINTXML}           			    {  miniparserCharactersRead += yyleng; return PRINTXMLTOKEN; }
{EXECUTE}           			    {  miniparserCharactersRead += yyleng; return EXECUTETOKEN; }
{PLOT}            			    {  miniparserCharactersRead += yyleng; return PLOTTOKEN; }
{PRINTHEXA}       			    {  miniparserCharactersRead += yyleng; return PRINTHEXATOKEN; }
{PRINTFLOAT}       			    {  miniparserCharactersRead += yyleng; return PRINTFLOATTOKEN; }
{PRINTBINARY}     			    {  miniparserCharactersRead += yyleng; return PRINTBINARYTOKEN; }
{PRINTEXPANSION}  			    {  miniparserCharactersRead += yyleng; return PRINTEXPANSIONTOKEN; }
{BASHEXECUTE}     			    {  miniparserCharactersRead += yyleng; return BASHEXECUTETOKEN; }
{BASHEVALUATE}     			    {  miniparserCharactersRead += yyleng; return BASHEVALUATETOKEN; }
{GETSUPPRESSEDMESSAGES}     		    {  miniparserCharactersRead += yyleng; return GETSUPPRESSEDMESSAGESTOKEN; }
{EXTERNALPLOT}    			    {  miniparserCharactersRead += yyleng; return EXTERNALPLOTTOKEN; }
{WRITE}           			    {  miniparserCharactersRead += yyleng; return WRITETOKEN; }
{ASCIIPLOT}       			    {  miniparserCharactersRead += yyleng; return ASCIIPLOTTOKEN; }
{RENAME}         			    {  miniparserCharactersRead += yyleng; return RENAMETOKEN; }
{BIND}         			            {  miniparserCharactersRead += yyleng; return BINDTOKEN; }


{INFNORM}         			    {  miniparserCharactersRead += yyleng; return INFNORMTOKEN; }
{SUPNORM}         			    {  miniparserCharactersRead += yyleng; return SUPNORMTOKEN; }
{FINDZEROS}       			    {  miniparserCharactersRead += yyleng; return FINDZEROSTOKEN; }
{FPFINDZEROS}     			    {  miniparserCharactersRead += yyleng; return FPFINDZEROSTOKEN; }
{DIRTYINFNORM}    			    {  miniparserCharactersRead += yyleng; return DIRTYINFNORMTOKEN; }
{NUMBERROOTS}    			    {  miniparserCharactersRead += yyleng; return NUMBERROOTSTOKEN; }
{INTEGRAL}        			    {  miniparserCharactersRead += yyleng; return INTEGRALTOKEN; }
{DIRTYINTEGRAL}				    {  miniparserCharactersRead += yyleng; return DIRTYINTEGRALTOKEN; }
{WORSTCASE}       			    {  miniparserCharactersRead += yyleng; return WORSTCASETOKEN; }
{IMPLEMENTPOLY}				    {  miniparserCharactersRead += yyleng; return IMPLEMENTPOLYTOKEN; }
{IMPLEMENTCONST}                            {  miniparserCharactersRead += yyleng; return IMPLEMENTCONSTTOKEN; }
{CHECKINFNORM}    			    {  miniparserCharactersRead += yyleng; return CHECKINFNORMTOKEN; }
{ZERODENOMINATORS}			    {  miniparserCharactersRead += yyleng; return ZERODENOMINATORSTOKEN; }
{ISEVALUABLE}     			    {  miniparserCharactersRead += yyleng; return ISEVALUABLETOKEN; }
{SEARCHGAL}       			    {  miniparserCharactersRead += yyleng; return SEARCHGALTOKEN; }
{GUESSDEGREE}     			    {  miniparserCharactersRead += yyleng; return GUESSDEGREETOKEN; }
{DIRTYFINDZEROS}  			    {  miniparserCharactersRead += yyleng; return DIRTYFINDZEROSTOKEN; }

{IF}					    {  miniparserCharactersRead += yyleng; return IFTOKEN; }
{THEN}					    {  miniparserCharactersRead += yyleng; return THENTOKEN; }
{ELSE}					    {  miniparserCharactersRead += yyleng; return ELSETOKEN; }
{FOR}					    {  miniparserCharactersRead += yyleng; return FORTOKEN; }
{IN}					    {  miniparserCharactersRead += yyleng; return INTOKEN; }
{FROM}					    {  miniparserCharactersRead += yyleng; return FROMTOKEN; }
{TO}					    {  miniparserCharactersRead += yyleng; return TOTOKEN; }
{BY}					    {  miniparserCharactersRead += yyleng; return BYTOKEN; }
{DO}					    {  miniparserCharactersRead += yyleng; return DOTOKEN; }
{BEGIN}					    {  miniparserCharactersRead += yyleng; return BEGINTOKEN; }
{END}					    {  miniparserCharactersRead += yyleng; return ENDTOKEN; }
{LBRACE}				    {  miniparserCharactersRead += yyleng; return LEFTCURLYBRACETOKEN; }
{RBRACE}				    {  miniparserCharactersRead += yyleng; return RIGHTCURLYBRACETOKEN; }
{WHILEDEF}				    {  miniparserCharactersRead += yyleng; return WHILETOKEN; }

{EXTERNALPROC}                              {  miniparserCharactersRead += yyleng; return EXTERNALPROCTOKEN; }
{VOID}                                      {  miniparserCharactersRead += yyleng; return VOIDTOKEN; }
{CONSTANTTYPE}                              {  miniparserCharactersRead += yyleng; return CONSTANTTYPETOKEN; }
{FUNCTION}                                  {  miniparserCharactersRead += yyleng; return FUNCTIONTOKEN; }
{OBJECT}                                    {  miniparserCharactersRead += yyleng; return OBJECTTOKEN; }
{RANGE}                                     {  miniparserCharactersRead += yyleng; return RANGETOKEN; }
{INTEGER}                                   {  miniparserCharactersRead += yyleng; return INTEGERTOKEN; }
{STRINGTYPE}                                {  miniparserCharactersRead += yyleng; return STRINGTYPETOKEN; }
{BOOLEAN}                                   {  miniparserCharactersRead += yyleng; return BOOLEANTOKEN; }
{LIST}                                      {  miniparserCharactersRead += yyleng; return LISTTOKEN; }
{OF}                                        {  miniparserCharactersRead += yyleng; return OFTOKEN; }



[ \t]		{ /* Eat up spaces and tabulators */
                  miniparserCharactersRead += yyleng;
		}

[\n]		{
                  miniparserCharactersRead += yyleng;
		}

{IDENTIFIER}        			    { miniparserCharactersRead += yyleng;
                                              constBuffer = (char *) safeCalloc(yyleng+1,sizeof(char));
					      strncpy(constBuffer,yytext,yyleng);
					      yylval->value = constBuffer;
					       return IDENTIFIERTOKEN; }


.		{ /* otherwise */
                        miniparserCharactersRead += yyleng;
			printMessage(1,SOLLYA_MSG_A_CHARACTER_COULD_NOT_BE_RECOGNIZED,"The character \"%s\" cannot be recognized. Will ignore it.\n",
				yytext);
}

%%

void *startMiniparser(void *scanner, char *str) {
  YY_BUFFER_STATE buf;

  miniparserSemicolonAtEnd = 0;
  miniparserEofReached = 0;
  miniparserCharactersRead = 0;
  buf = miniyy_scan_string(str, scanner);
  miniyy_switch_to_buffer(buf, scanner);

  return NULL;
}

void endMiniparser(void *buf, void *scanner) {
  miniyy_delete_buffer(buf, scanner);
}
