/* A Bison parser, made by GNU Bison 2.7.12-4996.  */

/* Bison implementation for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.7.12-4996"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 1

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
/* Line 371 of yacc.c  */
#line 56 "parser.y"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "expression.h"
#include "assignment.h"
#include "chain.h"
#include "general.h"
#include "execute.h"

#define YYPARSE_PARAM scanner

#include "parser.h"
#include "library.h"
#include "help.h"

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

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
#define YYLEX_PARAM   scanner
#define YYFPRINTF sollyaFprintf

extern int yylex(YYSTYPE *lvalp, void *scanner);
extern FILE *yyget_in(void *scanner);
extern char *getCurrentLexSymbol();

void yyerror(const char *message) {
  char *str;
  if (!feof(yyget_in(scanner))) {
    str = getCurrentLexSymbol();
    printMessage(1,SOLLYA_MSG_SYNTAX_ERROR_ENCOUNTERED_WHILE_PARSING,"Warning: %s.\nThe last symbol read has been \"%s\".\nWill skip input until next semicolon after the unexpected token. May leak memory.\n",message,str);
    safeFree(str);
    promptToBePrinted = 1;
    lastWasSyntaxError = 1;
    considerDyingOnError();
  } 
}

int parserCheckEof() {
  FILE *myFd;

  myFd = yyget_in(scanner);
  if (myFd == NULL) return 0;
  
  return feof(myFd);
}

/* #define WARN_IF_NO_HELP_TEXT 1 */


/* Line 371 of yacc.c  */
#line 137 "parser.c"

# ifndef YY_NULL
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULL nullptr
#  else
#   define YY_NULL 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "y.tab.h".  */
#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     CONSTANTTOKEN = 258,
     MIDPOINTCONSTANTTOKEN = 259,
     DYADICCONSTANTTOKEN = 260,
     HEXCONSTANTTOKEN = 261,
     HEXADECIMALCONSTANTTOKEN = 262,
     BINARYCONSTANTTOKEN = 263,
     PITOKEN = 264,
     IDENTIFIERTOKEN = 265,
     STRINGTOKEN = 266,
     LPARTOKEN = 267,
     RPARTOKEN = 268,
     LBRACKETTOKEN = 269,
     RBRACKETTOKEN = 270,
     EQUALTOKEN = 271,
     ASSIGNEQUALTOKEN = 272,
     COMPAREEQUALTOKEN = 273,
     COMMATOKEN = 274,
     EXCLAMATIONTOKEN = 275,
     SEMICOLONTOKEN = 276,
     STARLEFTANGLETOKEN = 277,
     LEFTANGLETOKEN = 278,
     RIGHTANGLEUNDERSCORETOKEN = 279,
     RIGHTANGLEDOTTOKEN = 280,
     RIGHTANGLESTARTOKEN = 281,
     RIGHTANGLETOKEN = 282,
     DOTSTOKEN = 283,
     DOTTOKEN = 284,
     QUESTIONMARKTOKEN = 285,
     VERTBARTOKEN = 286,
     ATTOKEN = 287,
     DOUBLECOLONTOKEN = 288,
     COLONTOKEN = 289,
     DOTCOLONTOKEN = 290,
     COLONDOTTOKEN = 291,
     EXCLAMATIONEQUALTOKEN = 292,
     APPROXTOKEN = 293,
     ANDTOKEN = 294,
     ORTOKEN = 295,
     PLUSTOKEN = 296,
     MINUSTOKEN = 297,
     MULTOKEN = 298,
     DIVTOKEN = 299,
     POWTOKEN = 300,
     SQRTTOKEN = 301,
     EXPTOKEN = 302,
     FREEVARTOKEN = 303,
     LOGTOKEN = 304,
     LOG2TOKEN = 305,
     LOG10TOKEN = 306,
     SINTOKEN = 307,
     COSTOKEN = 308,
     TANTOKEN = 309,
     ASINTOKEN = 310,
     ACOSTOKEN = 311,
     ATANTOKEN = 312,
     SINHTOKEN = 313,
     COSHTOKEN = 314,
     TANHTOKEN = 315,
     ASINHTOKEN = 316,
     ACOSHTOKEN = 317,
     ATANHTOKEN = 318,
     ABSTOKEN = 319,
     ERFTOKEN = 320,
     ERFCTOKEN = 321,
     LOG1PTOKEN = 322,
     EXPM1TOKEN = 323,
     DOUBLETOKEN = 324,
     SINGLETOKEN = 325,
     HALFPRECISIONTOKEN = 326,
     QUADTOKEN = 327,
     DOUBLEDOUBLETOKEN = 328,
     TRIPLEDOUBLETOKEN = 329,
     DOUBLEEXTENDEDTOKEN = 330,
     CEILTOKEN = 331,
     FLOORTOKEN = 332,
     NEARESTINTTOKEN = 333,
     HEADTOKEN = 334,
     REVERTTOKEN = 335,
     SORTTOKEN = 336,
     TAILTOKEN = 337,
     MANTISSATOKEN = 338,
     EXPONENTTOKEN = 339,
     PRECISIONTOKEN = 340,
     ROUNDCORRECTLYTOKEN = 341,
     PRECTOKEN = 342,
     POINTSTOKEN = 343,
     DIAMTOKEN = 344,
     DISPLAYTOKEN = 345,
     VERBOSITYTOKEN = 346,
     SHOWMESSAGENUMBERSTOKEN = 347,
     CANONICALTOKEN = 348,
     AUTOSIMPLIFYTOKEN = 349,
     TAYLORRECURSIONSTOKEN = 350,
     TIMINGTOKEN = 351,
     TIMETOKEN = 352,
     FULLPARENTHESESTOKEN = 353,
     MIDPOINTMODETOKEN = 354,
     DIEONERRORMODETOKEN = 355,
     SUPPRESSWARNINGSTOKEN = 356,
     RATIONALMODETOKEN = 357,
     HOPITALRECURSIONSTOKEN = 358,
     ONTOKEN = 359,
     OFFTOKEN = 360,
     DYADICTOKEN = 361,
     POWERSTOKEN = 362,
     BINARYTOKEN = 363,
     HEXADECIMALTOKEN = 364,
     FILETOKEN = 365,
     POSTSCRIPTTOKEN = 366,
     POSTSCRIPTFILETOKEN = 367,
     PERTURBTOKEN = 368,
     MINUSWORDTOKEN = 369,
     PLUSWORDTOKEN = 370,
     ZEROWORDTOKEN = 371,
     NEARESTTOKEN = 372,
     HONORCOEFFPRECTOKEN = 373,
     TRUETOKEN = 374,
     FALSETOKEN = 375,
     DEFAULTTOKEN = 376,
     MATCHTOKEN = 377,
     WITHTOKEN = 378,
     ABSOLUTETOKEN = 379,
     DECIMALTOKEN = 380,
     RELATIVETOKEN = 381,
     FIXEDTOKEN = 382,
     FLOATINGTOKEN = 383,
     ERRORTOKEN = 384,
     QUITTOKEN = 385,
     FALSEQUITTOKEN = 386,
     RESTARTTOKEN = 387,
     LIBRARYTOKEN = 388,
     LIBRARYCONSTANTTOKEN = 389,
     DIFFTOKEN = 390,
     DIRTYSIMPLIFYTOKEN = 391,
     REMEZTOKEN = 392,
     BASHEVALUATETOKEN = 393,
     GETSUPPRESSEDMESSAGESTOKEN = 394,
     FPMINIMAXTOKEN = 395,
     HORNERTOKEN = 396,
     EXPANDTOKEN = 397,
     SIMPLIFYSAFETOKEN = 398,
     TAYLORTOKEN = 399,
     TAYLORFORMTOKEN = 400,
     CHEBYSHEVFORMTOKEN = 401,
     AUTODIFFTOKEN = 402,
     DEGREETOKEN = 403,
     NUMERATORTOKEN = 404,
     DENOMINATORTOKEN = 405,
     SUBSTITUTETOKEN = 406,
     COMPOSEPOLYNOMIALSTOKEN = 407,
     COEFFTOKEN = 408,
     SUBPOLYTOKEN = 409,
     ROUNDCOEFFICIENTSTOKEN = 410,
     RATIONALAPPROXTOKEN = 411,
     ACCURATEINFNORMTOKEN = 412,
     ROUNDTOFORMATTOKEN = 413,
     EVALUATETOKEN = 414,
     LENGTHTOKEN = 415,
     INFTOKEN = 416,
     MIDTOKEN = 417,
     SUPTOKEN = 418,
     MINTOKEN = 419,
     MAXTOKEN = 420,
     READXMLTOKEN = 421,
     PARSETOKEN = 422,
     PRINTTOKEN = 423,
     PRINTXMLTOKEN = 424,
     PLOTTOKEN = 425,
     PRINTHEXATOKEN = 426,
     PRINTFLOATTOKEN = 427,
     PRINTBINARYTOKEN = 428,
     SUPPRESSMESSAGETOKEN = 429,
     UNSUPPRESSMESSAGETOKEN = 430,
     PRINTEXPANSIONTOKEN = 431,
     BASHEXECUTETOKEN = 432,
     EXTERNALPLOTTOKEN = 433,
     WRITETOKEN = 434,
     ASCIIPLOTTOKEN = 435,
     RENAMETOKEN = 436,
     BINDTOKEN = 437,
     INFNORMTOKEN = 438,
     SUPNORMTOKEN = 439,
     FINDZEROSTOKEN = 440,
     FPFINDZEROSTOKEN = 441,
     DIRTYINFNORMTOKEN = 442,
     NUMBERROOTSTOKEN = 443,
     INTEGRALTOKEN = 444,
     DIRTYINTEGRALTOKEN = 445,
     WORSTCASETOKEN = 446,
     IMPLEMENTPOLYTOKEN = 447,
     IMPLEMENTCONSTTOKEN = 448,
     CHECKINFNORMTOKEN = 449,
     ZERODENOMINATORSTOKEN = 450,
     ISEVALUABLETOKEN = 451,
     SEARCHGALTOKEN = 452,
     GUESSDEGREETOKEN = 453,
     DIRTYFINDZEROSTOKEN = 454,
     IFTOKEN = 455,
     THENTOKEN = 456,
     ELSETOKEN = 457,
     FORTOKEN = 458,
     INTOKEN = 459,
     FROMTOKEN = 460,
     TOTOKEN = 461,
     BYTOKEN = 462,
     DOTOKEN = 463,
     BEGINTOKEN = 464,
     ENDTOKEN = 465,
     LEFTCURLYBRACETOKEN = 466,
     RIGHTCURLYBRACETOKEN = 467,
     WHILETOKEN = 468,
     READFILETOKEN = 469,
     ISBOUNDTOKEN = 470,
     EXECUTETOKEN = 471,
     EXTERNALPROCTOKEN = 472,
     VOIDTOKEN = 473,
     CONSTANTTYPETOKEN = 474,
     FUNCTIONTOKEN = 475,
     OBJECTTOKEN = 476,
     RANGETOKEN = 477,
     INTEGERTOKEN = 478,
     STRINGTYPETOKEN = 479,
     BOOLEANTOKEN = 480,
     LISTTOKEN = 481,
     OFTOKEN = 482,
     VARTOKEN = 483,
     PROCTOKEN = 484,
     PROCEDURETOKEN = 485,
     RETURNTOKEN = 486,
     NOPTOKEN = 487,
     HELPTOKEN = 488,
     VERSIONTOKEN = 489
   };
#endif
/* Tokens.  */
#define CONSTANTTOKEN 258
#define MIDPOINTCONSTANTTOKEN 259
#define DYADICCONSTANTTOKEN 260
#define HEXCONSTANTTOKEN 261
#define HEXADECIMALCONSTANTTOKEN 262
#define BINARYCONSTANTTOKEN 263
#define PITOKEN 264
#define IDENTIFIERTOKEN 265
#define STRINGTOKEN 266
#define LPARTOKEN 267
#define RPARTOKEN 268
#define LBRACKETTOKEN 269
#define RBRACKETTOKEN 270
#define EQUALTOKEN 271
#define ASSIGNEQUALTOKEN 272
#define COMPAREEQUALTOKEN 273
#define COMMATOKEN 274
#define EXCLAMATIONTOKEN 275
#define SEMICOLONTOKEN 276
#define STARLEFTANGLETOKEN 277
#define LEFTANGLETOKEN 278
#define RIGHTANGLEUNDERSCORETOKEN 279
#define RIGHTANGLEDOTTOKEN 280
#define RIGHTANGLESTARTOKEN 281
#define RIGHTANGLETOKEN 282
#define DOTSTOKEN 283
#define DOTTOKEN 284
#define QUESTIONMARKTOKEN 285
#define VERTBARTOKEN 286
#define ATTOKEN 287
#define DOUBLECOLONTOKEN 288
#define COLONTOKEN 289
#define DOTCOLONTOKEN 290
#define COLONDOTTOKEN 291
#define EXCLAMATIONEQUALTOKEN 292
#define APPROXTOKEN 293
#define ANDTOKEN 294
#define ORTOKEN 295
#define PLUSTOKEN 296
#define MINUSTOKEN 297
#define MULTOKEN 298
#define DIVTOKEN 299
#define POWTOKEN 300
#define SQRTTOKEN 301
#define EXPTOKEN 302
#define FREEVARTOKEN 303
#define LOGTOKEN 304
#define LOG2TOKEN 305
#define LOG10TOKEN 306
#define SINTOKEN 307
#define COSTOKEN 308
#define TANTOKEN 309
#define ASINTOKEN 310
#define ACOSTOKEN 311
#define ATANTOKEN 312
#define SINHTOKEN 313
#define COSHTOKEN 314
#define TANHTOKEN 315
#define ASINHTOKEN 316
#define ACOSHTOKEN 317
#define ATANHTOKEN 318
#define ABSTOKEN 319
#define ERFTOKEN 320
#define ERFCTOKEN 321
#define LOG1PTOKEN 322
#define EXPM1TOKEN 323
#define DOUBLETOKEN 324
#define SINGLETOKEN 325
#define HALFPRECISIONTOKEN 326
#define QUADTOKEN 327
#define DOUBLEDOUBLETOKEN 328
#define TRIPLEDOUBLETOKEN 329
#define DOUBLEEXTENDEDTOKEN 330
#define CEILTOKEN 331
#define FLOORTOKEN 332
#define NEARESTINTTOKEN 333
#define HEADTOKEN 334
#define REVERTTOKEN 335
#define SORTTOKEN 336
#define TAILTOKEN 337
#define MANTISSATOKEN 338
#define EXPONENTTOKEN 339
#define PRECISIONTOKEN 340
#define ROUNDCORRECTLYTOKEN 341
#define PRECTOKEN 342
#define POINTSTOKEN 343
#define DIAMTOKEN 344
#define DISPLAYTOKEN 345
#define VERBOSITYTOKEN 346
#define SHOWMESSAGENUMBERSTOKEN 347
#define CANONICALTOKEN 348
#define AUTOSIMPLIFYTOKEN 349
#define TAYLORRECURSIONSTOKEN 350
#define TIMINGTOKEN 351
#define TIMETOKEN 352
#define FULLPARENTHESESTOKEN 353
#define MIDPOINTMODETOKEN 354
#define DIEONERRORMODETOKEN 355
#define SUPPRESSWARNINGSTOKEN 356
#define RATIONALMODETOKEN 357
#define HOPITALRECURSIONSTOKEN 358
#define ONTOKEN 359
#define OFFTOKEN 360
#define DYADICTOKEN 361
#define POWERSTOKEN 362
#define BINARYTOKEN 363
#define HEXADECIMALTOKEN 364
#define FILETOKEN 365
#define POSTSCRIPTTOKEN 366
#define POSTSCRIPTFILETOKEN 367
#define PERTURBTOKEN 368
#define MINUSWORDTOKEN 369
#define PLUSWORDTOKEN 370
#define ZEROWORDTOKEN 371
#define NEARESTTOKEN 372
#define HONORCOEFFPRECTOKEN 373
#define TRUETOKEN 374
#define FALSETOKEN 375
#define DEFAULTTOKEN 376
#define MATCHTOKEN 377
#define WITHTOKEN 378
#define ABSOLUTETOKEN 379
#define DECIMALTOKEN 380
#define RELATIVETOKEN 381
#define FIXEDTOKEN 382
#define FLOATINGTOKEN 383
#define ERRORTOKEN 384
#define QUITTOKEN 385
#define FALSEQUITTOKEN 386
#define RESTARTTOKEN 387
#define LIBRARYTOKEN 388
#define LIBRARYCONSTANTTOKEN 389
#define DIFFTOKEN 390
#define DIRTYSIMPLIFYTOKEN 391
#define REMEZTOKEN 392
#define BASHEVALUATETOKEN 393
#define GETSUPPRESSEDMESSAGESTOKEN 394
#define FPMINIMAXTOKEN 395
#define HORNERTOKEN 396
#define EXPANDTOKEN 397
#define SIMPLIFYSAFETOKEN 398
#define TAYLORTOKEN 399
#define TAYLORFORMTOKEN 400
#define CHEBYSHEVFORMTOKEN 401
#define AUTODIFFTOKEN 402
#define DEGREETOKEN 403
#define NUMERATORTOKEN 404
#define DENOMINATORTOKEN 405
#define SUBSTITUTETOKEN 406
#define COMPOSEPOLYNOMIALSTOKEN 407
#define COEFFTOKEN 408
#define SUBPOLYTOKEN 409
#define ROUNDCOEFFICIENTSTOKEN 410
#define RATIONALAPPROXTOKEN 411
#define ACCURATEINFNORMTOKEN 412
#define ROUNDTOFORMATTOKEN 413
#define EVALUATETOKEN 414
#define LENGTHTOKEN 415
#define INFTOKEN 416
#define MIDTOKEN 417
#define SUPTOKEN 418
#define MINTOKEN 419
#define MAXTOKEN 420
#define READXMLTOKEN 421
#define PARSETOKEN 422
#define PRINTTOKEN 423
#define PRINTXMLTOKEN 424
#define PLOTTOKEN 425
#define PRINTHEXATOKEN 426
#define PRINTFLOATTOKEN 427
#define PRINTBINARYTOKEN 428
#define SUPPRESSMESSAGETOKEN 429
#define UNSUPPRESSMESSAGETOKEN 430
#define PRINTEXPANSIONTOKEN 431
#define BASHEXECUTETOKEN 432
#define EXTERNALPLOTTOKEN 433
#define WRITETOKEN 434
#define ASCIIPLOTTOKEN 435
#define RENAMETOKEN 436
#define BINDTOKEN 437
#define INFNORMTOKEN 438
#define SUPNORMTOKEN 439
#define FINDZEROSTOKEN 440
#define FPFINDZEROSTOKEN 441
#define DIRTYINFNORMTOKEN 442
#define NUMBERROOTSTOKEN 443
#define INTEGRALTOKEN 444
#define DIRTYINTEGRALTOKEN 445
#define WORSTCASETOKEN 446
#define IMPLEMENTPOLYTOKEN 447
#define IMPLEMENTCONSTTOKEN 448
#define CHECKINFNORMTOKEN 449
#define ZERODENOMINATORSTOKEN 450
#define ISEVALUABLETOKEN 451
#define SEARCHGALTOKEN 452
#define GUESSDEGREETOKEN 453
#define DIRTYFINDZEROSTOKEN 454
#define IFTOKEN 455
#define THENTOKEN 456
#define ELSETOKEN 457
#define FORTOKEN 458
#define INTOKEN 459
#define FROMTOKEN 460
#define TOTOKEN 461
#define BYTOKEN 462
#define DOTOKEN 463
#define BEGINTOKEN 464
#define ENDTOKEN 465
#define LEFTCURLYBRACETOKEN 466
#define RIGHTCURLYBRACETOKEN 467
#define WHILETOKEN 468
#define READFILETOKEN 469
#define ISBOUNDTOKEN 470
#define EXECUTETOKEN 471
#define EXTERNALPROCTOKEN 472
#define VOIDTOKEN 473
#define CONSTANTTYPETOKEN 474
#define FUNCTIONTOKEN 475
#define OBJECTTOKEN 476
#define RANGETOKEN 477
#define INTEGERTOKEN 478
#define STRINGTYPETOKEN 479
#define BOOLEANTOKEN 480
#define LISTTOKEN 481
#define OFTOKEN 482
#define VARTOKEN 483
#define PROCTOKEN 484
#define PROCEDURETOKEN 485
#define RETURNTOKEN 486
#define NOPTOKEN 487
#define HELPTOKEN 488
#define VERSIONTOKEN 489



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 387 of yacc.c  */
#line 131 "parser.y"

  doubleNode *dblnode;
  struct entryStruct *association;
  char *value;
  node *tree;
  chain *list;
  int *integerval;
  int count;
  void *other;


/* Line 387 of yacc.c  */
#line 660 "parser.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

/* Line 390 of yacc.c  */
#line 687 "parser.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef __attribute__
/* This feature is available in gcc versions 2.5 and later.  */
# if (! defined __GNUC__ || __GNUC__ < 2 \
      || (__GNUC__ == 2 && __GNUC_MINOR__ < 5))
#  define __attribute__(Spec) /* empty */
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif


/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(N) (N)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (YYID (0))
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  405
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   9066

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  235
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  47
/* YYNRULES -- Number of rules.  */
#define YYNRULES  630
/* YYNRULES -- Number of states.  */
#define YYNSTATES  1339

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   489

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,   134,
     135,   136,   137,   138,   139,   140,   141,   142,   143,   144,
     145,   146,   147,   148,   149,   150,   151,   152,   153,   154,
     155,   156,   157,   158,   159,   160,   161,   162,   163,   164,
     165,   166,   167,   168,   169,   170,   171,   172,   173,   174,
     175,   176,   177,   178,   179,   180,   181,   182,   183,   184,
     185,   186,   187,   188,   189,   190,   191,   192,   193,   194,
     195,   196,   197,   198,   199,   200,   201,   202,   203,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,   214,
     215,   216,   217,   218,   219,   220,   221,   222,   223,   224,
     225,   226,   227,   228,   229,   230,   231,   232,   233,   234
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     6,     9,    11,    15,    18,    21,    23,
      25,    27,    29,    31,    33,    37,    42,    46,    49,    52,
      57,    60,    64,    70,    78,    88,    94,    97,   101,   104,
     108,   111,   113,   117,   123,   130,   136,   141,   150,   160,
     169,   177,   184,   192,   199,   205,   215,   226,   236,   245,
     254,   264,   273,   281,   293,   306,   318,   329,   331,   333,
     335,   340,   344,   346,   351,   358,   366,   373,   378,   383,
     388,   393,   398,   403,   408,   413,   426,   431,   438,   446,
     453,   458,   463,   470,   478,   491,   498,   505,   517,   519,
     521,   525,   527,   530,   532,   535,   539,   543,   550,   557,
     561,   565,   569,   573,   577,   581,   585,   589,   593,   597,
     601,   605,   609,   613,   617,   621,   625,   629,   633,   637,
     641,   645,   649,   653,   657,   661,   665,   669,   673,   677,
     681,   685,   689,   693,   697,   701,   705,   707,   711,   713,
     717,   719,   721,   726,   728,   733,   735,   739,   743,   746,
     751,   753,   757,   761,   765,   769,   774,   779,   783,   785,
     789,   793,   797,   801,   805,   807,   809,   812,   815,   817,
     820,   823,   827,   831,   836,   841,   846,   851,   853,   857,
     862,   867,   871,   876,   878,   880,   882,   884,   886,   888,
     890,   892,   894,   896,   898,   900,   902,   904,   906,   908,
     910,   912,   914,   916,   918,   920,   922,   924,   926,   928,
     930,   932,   934,   936,   938,   940,   942,   944,   946,   948,
     953,   958,   962,   964,   966,   968,   970,   974,   978,   980,
     982,   986,   993,  1000,  1006,  1009,  1014,  1016,  1019,  1029,
    1036,  1045,  1051,  1060,  1066,  1074,  1079,  1085,  1087,  1089,
    1091,  1093,  1095,  1097,  1099,  1104,  1108,  1114,  1121,  1123,
    1127,  1133,  1139,  1145,  1149,  1153,  1157,  1161,  1166,  1171,
    1176,  1181,  1186,  1191,  1195,  1202,  1211,  1220,  1225,  1230,
    1241,  1246,  1251,  1256,  1261,  1270,  1279,  1288,  1297,  1302,
    1307,  1312,  1319,  1326,  1333,  1340,  1347,  1354,  1363,  1372,
    1379,  1384,  1389,  1396,  1409,  1416,  1423,  1430,  1437,  1444,
    1451,  1466,  1475,  1482,  1489,  1494,  1503,  1510,  1515,  1520,
    1525,  1530,  1535,  1540,  1545,  1550,  1555,  1560,  1565,  1570,
    1575,  1582,  1587,  1592,  1597,  1602,  1607,  1612,  1617,  1622,
    1627,  1632,  1637,  1642,  1647,  1652,  1657,  1662,  1667,  1672,
    1677,  1682,  1687,  1692,  1697,  1702,  1707,  1712,  1717,  1722,
    1727,  1732,  1737,  1740,  1741,  1744,  1747,  1750,  1753,  1756,
    1759,  1762,  1765,  1768,  1771,  1774,  1777,  1780,  1783,  1786,
    1789,  1791,  1793,  1795,  1797,  1799,  1801,  1803,  1807,  1811,
    1815,  1819,  1823,  1827,  1831,  1833,  1835,  1837,  1841,  1843,
    1847,  1849,  1851,  1853,  1855,  1857,  1859,  1861,  1863,  1865,
    1867,  1869,  1871,  1874,  1877,  1879,  1881,  1883,  1885,  1887,
    1889,  1891,  1894,  1896,  1898,  1901,  1903,  1905,  1907,  1909,
    1911,  1913,  1915,  1917,  1919,  1921,  1923,  1925,  1927,  1929,
    1931,  1933,  1935,  1937,  1939,  1941,  1943,  1945,  1947,  1949,
    1951,  1953,  1955,  1957,  1959,  1961,  1963,  1965,  1967,  1969,
    1971,  1973,  1975,  1977,  1979,  1981,  1983,  1985,  1987,  1989,
    1991,  1993,  1995,  1997,  1999,  2001,  2003,  2005,  2007,  2009,
    2011,  2013,  2015,  2017,  2019,  2021,  2023,  2025,  2027,  2029,
    2031,  2033,  2035,  2037,  2039,  2041,  2043,  2045,  2047,  2049,
    2051,  2053,  2055,  2057,  2059,  2061,  2063,  2065,  2067,  2069,
    2071,  2073,  2075,  2077,  2079,  2081,  2083,  2085,  2087,  2089,
    2091,  2093,  2095,  2097,  2099,  2101,  2103,  2105,  2107,  2109,
    2111,  2113,  2115,  2117,  2119,  2121,  2123,  2125,  2127,  2129,
    2131,  2133,  2135,  2137,  2139,  2141,  2143,  2145,  2147,  2149,
    2151,  2153,  2155,  2157,  2159,  2161,  2163,  2165,  2167,  2169,
    2171,  2173,  2175,  2177,  2179,  2181,  2183,  2185,  2187,  2189,
    2191,  2193,  2195,  2197,  2199,  2201,  2203,  2205,  2207,  2209,
    2211,  2213,  2215,  2217,  2219,  2221,  2223,  2225,  2227,  2229,
    2231,  2233,  2235,  2237,  2239,  2241,  2243,  2245,  2247,  2249,
    2251,  2253,  2255,  2257,  2259,  2261,  2263,  2265,  2267,  2269,
    2271,  2273,  2275,  2277,  2279,  2281,  2283,  2285,  2287,  2289,
    2291,  2293,  2295,  2297,  2299,  2301,  2303,  2305,  2307,  2309,
    2311
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     236,     0,    -1,   240,    21,    -1,   237,    21,    -1,    30,
      -1,   237,   281,    21,    -1,   234,    21,    -1,     1,    21,
      -1,   233,    -1,   209,    -1,   211,    -1,   210,    -1,   212,
      -1,   248,    -1,   238,   243,   239,    -1,   238,   244,   243,
     239,    -1,   238,   244,   239,    -1,   238,   239,    -1,   200,
     241,    -1,   213,   258,   208,   240,    -1,   203,   242,    -1,
     258,   201,   240,    -1,   258,   201,   240,   202,   240,    -1,
      10,   205,   258,   206,   258,   208,   240,    -1,    10,   205,
     258,   206,   258,   207,   258,   208,   240,    -1,    10,   204,
     258,   208,   240,    -1,   240,    21,    -1,   240,    21,   243,
      -1,   245,    21,    -1,   245,    21,   244,    -1,   228,   246,
      -1,    10,    -1,    10,    19,   246,    -1,    12,    13,   238,
     243,   239,    -1,    12,    13,   238,   244,   243,   239,    -1,
      12,    13,   238,   244,   239,    -1,    12,    13,   238,   239,
      -1,    12,    13,   238,   243,   231,   258,    21,   239,    -1,
      12,    13,   238,   244,   243,   231,   258,    21,   239,    -1,
      12,    13,   238,   244,   231,   258,    21,   239,    -1,    12,
      13,   238,   231,   258,    21,   239,    -1,    12,   246,    13,
     238,   243,   239,    -1,    12,   246,    13,   238,   244,   243,
     239,    -1,    12,   246,    13,   238,   244,   239,    -1,    12,
     246,    13,   238,   239,    -1,    12,   246,    13,   238,   243,
     231,   258,    21,   239,    -1,    12,   246,    13,   238,   244,
     243,   231,   258,    21,   239,    -1,    12,   246,    13,   238,
     244,   231,   258,    21,   239,    -1,    12,   246,    13,   238,
     231,   258,    21,   239,    -1,    12,    10,    16,    28,    13,
     238,   243,   239,    -1,    12,    10,    16,    28,    13,   238,
     244,   243,   239,    -1,    12,    10,    16,    28,    13,   238,
     244,   239,    -1,    12,    10,    16,    28,    13,   238,   239,
      -1,    12,    10,    16,    28,    13,   238,   243,   231,   258,
      21,   239,    -1,    12,    10,    16,    28,    13,   238,   244,
     243,   231,   258,    21,   239,    -1,    12,    10,    16,    28,
      13,   238,   244,   231,   258,    21,   239,    -1,    12,    10,
      16,    28,    13,   238,   231,   258,    21,   239,    -1,   130,
      -1,   131,    -1,   232,    -1,   232,    12,   258,    13,    -1,
     232,    12,    13,    -1,   132,    -1,   168,    12,   254,    13,
      -1,   168,    12,   254,    13,    27,   258,    -1,   168,    12,
     254,    13,    27,    27,   258,    -1,   170,    12,   258,    19,
     254,    13,    -1,   171,    12,   258,    13,    -1,   172,    12,
     258,    13,    -1,   173,    12,   258,    13,    -1,   174,    12,
     254,    13,    -1,   175,    12,   254,    13,    -1,   176,    12,
     258,    13,    -1,   193,    12,   254,    13,    -1,   177,    12,
     258,    13,    -1,   178,    12,   258,    19,   258,    19,   258,
      19,   258,    19,   254,    13,    -1,   179,    12,   254,    13,
      -1,   179,    12,   254,    13,    27,   258,    -1,   179,    12,
     254,    13,    27,    27,   258,    -1,   180,    12,   258,    19,
     258,    13,    -1,   169,    12,   258,    13,    -1,   216,    12,
     258,    13,    -1,   169,    12,   258,    13,    27,   258,    -1,
     169,    12,   258,    13,    27,    27,   258,    -1,   191,    12,
     258,    19,   258,    19,   258,    19,   258,    19,   254,    13,
      -1,   181,    12,    10,    19,    10,    13,    -1,   181,    12,
      48,    19,    10,    13,    -1,   217,    12,    10,    19,   258,
      19,   280,    42,    27,   278,    13,    -1,   249,    -1,   254,
      -1,   230,    10,   247,    -1,   252,    -1,   253,    20,    -1,
     250,    -1,   250,    20,    -1,    10,    16,   258,    -1,    10,
      17,   258,    -1,    10,    16,   133,    12,   258,    13,    -1,
      10,    16,   134,    12,   258,    13,    -1,   260,    16,   258,
      -1,   260,    17,   258,    -1,   251,    16,   258,    -1,   251,
      17,   258,    -1,   266,    29,    10,    -1,    87,    16,   258,
      -1,    88,    16,   258,    -1,    89,    16,   258,    -1,    90,
      16,   258,    -1,    91,    16,   258,    -1,    92,    16,   258,
      -1,    93,    16,   258,    -1,    94,    16,   258,    -1,    95,
      16,   258,    -1,    96,    16,   258,    -1,    98,    16,   258,
      -1,    99,    16,   258,    -1,   100,    16,   258,    -1,   102,
      16,   258,    -1,   101,    16,   258,    -1,   103,    16,   258,
      -1,    87,    16,   258,    -1,    88,    16,   258,    -1,    89,
      16,   258,    -1,    90,    16,   258,    -1,    91,    16,   258,
      -1,    92,    16,   258,    -1,    93,    16,   258,    -1,    94,
      16,   258,    -1,    95,    16,   258,    -1,    96,    16,   258,
      -1,    98,    16,   258,    -1,    99,    16,   258,    -1,   100,
      16,   258,    -1,   102,    16,   258,    -1,   101,    16,   258,
      -1,   103,    16,   258,    -1,   258,    -1,   258,    19,   254,
      -1,   257,    -1,   257,   256,   255,    -1,    19,    -1,    21,
      -1,    29,    10,    16,   258,    -1,   259,    -1,   122,   259,
     123,   267,    -1,   261,    -1,   258,    39,   261,    -1,   258,
      40,   261,    -1,    20,   261,    -1,   266,    14,   258,    15,
      -1,   262,    -1,   261,    18,   262,    -1,   261,   204,   262,
      -1,   261,    23,   262,    -1,   261,    27,   262,    -1,   261,
      23,    16,   262,    -1,   261,    27,    16,   262,    -1,   261,
      37,   262,    -1,   264,    -1,   262,    41,   264,    -1,   262,
      42,   264,    -1,   262,    32,   264,    -1,   262,    33,   264,
      -1,   262,    36,   264,    -1,    41,    -1,    42,    -1,    41,
     263,    -1,    42,   263,    -1,   265,    -1,   263,   265,    -1,
      38,   265,    -1,   264,    43,   265,    -1,   264,    44,   265,
      -1,   264,    43,   263,   265,    -1,   264,    44,   263,   265,
      -1,   264,    43,    38,   265,    -1,   264,    44,    38,   265,
      -1,   266,    -1,   266,    45,   265,    -1,   266,    45,   263,
     265,    -1,   266,    45,    38,   265,    -1,   266,    35,   265,
      -1,   266,    35,    38,   265,    -1,   104,    -1,   105,    -1,
     106,    -1,   107,    -1,   108,    -1,   109,    -1,   110,    -1,
     111,    -1,   112,    -1,   113,    -1,   114,    -1,   115,    -1,
     116,    -1,   117,    -1,   118,    -1,   119,    -1,   218,    -1,
     120,    -1,   121,    -1,   125,    -1,   124,    -1,   126,    -1,
     127,    -1,   128,    -1,   129,    -1,    69,    -1,    70,    -1,
      72,    -1,    71,    -1,    75,    -1,    48,    -1,    73,    -1,
      74,    -1,    11,    -1,   269,    -1,    10,    -1,   215,    12,
      10,    13,    -1,    10,    12,   254,    13,    -1,    10,    12,
      13,    -1,   270,    -1,   272,    -1,   273,    -1,   274,    -1,
      12,   258,    13,    -1,   211,   255,   212,    -1,   276,    -1,
     260,    -1,   266,    29,    10,    -1,   266,    29,    10,    12,
     254,    13,    -1,    12,   258,    13,    12,   254,    13,    -1,
      12,   258,    13,    12,    13,    -1,   229,   247,    -1,    97,
      12,   240,    13,    -1,   268,    -1,   268,   267,    -1,   258,
      34,   238,   244,   243,   231,   258,    21,   239,    -1,   258,
      34,   238,   244,   243,   239,    -1,   258,    34,   238,   244,
     231,   258,    21,   239,    -1,   258,    34,   238,   244,   239,
      -1,   258,    34,   238,   243,   231,   258,    21,   239,    -1,
     258,    34,   238,   243,   239,    -1,   258,    34,   238,   231,
     258,    21,   239,    -1,   258,    34,   238,   239,    -1,   258,
      34,    12,   258,    13,    -1,     3,    -1,     4,    -1,     5,
      -1,     6,    -1,     7,    -1,     8,    -1,     9,    -1,    14,
      31,    31,    15,    -1,    14,    40,    15,    -1,    14,    31,
     271,    31,    15,    -1,    14,    31,   271,    28,    31,    15,
      -1,   258,    -1,   271,    19,   258,    -1,   271,    19,    28,
      19,   258,    -1,    14,   258,    19,   258,    15,    -1,    14,
     258,    21,   258,    15,    -1,    14,   258,    15,    -1,    22,
     258,    26,    -1,    22,   258,    25,    -1,    22,   258,    24,
      -1,   163,    12,   258,    13,    -1,   162,    12,   258,    13,
      -1,   161,    12,   258,    13,    -1,   135,    12,   258,    13,
      -1,   136,    12,   258,    13,    -1,   138,    12,   258,    13,
      -1,   139,    12,    13,    -1,   138,    12,   258,    19,   258,
      13,    -1,   137,    12,   258,    19,   258,    19,   254,    13,
      -1,   182,    12,   258,    19,    10,    19,   258,    13,    -1,
     164,    12,   254,    13,    -1,   165,    12,   254,    13,    -1,
     140,    12,   258,    19,   258,    19,   258,    19,   254,    13,
      -1,   141,    12,   258,    13,    -1,    93,    12,   258,    13,
      -1,   142,    12,   258,    13,    -1,   143,    12,   258,    13,
      -1,   144,    12,   258,    19,   258,    19,   258,    13,    -1,
     145,    12,   258,    19,   258,    19,   254,    13,    -1,   146,
      12,   258,    19,   258,    19,   258,    13,    -1,   147,    12,
     258,    19,   258,    19,   258,    13,    -1,   148,    12,   258,
      13,    -1,   149,    12,   258,    13,    -1,   150,    12,   258,
      13,    -1,   151,    12,   258,    19,   258,    13,    -1,   152,
      12,   258,    19,   258,    13,    -1,   153,    12,   258,    19,
     258,    13,    -1,   154,    12,   258,    19,   258,    13,    -1,
     155,    12,   258,    19,   258,    13,    -1,   156,    12,   258,
      19,   258,    13,    -1,   157,    12,   258,    19,   258,    19,
     254,    13,    -1,   158,    12,   258,    19,   258,    19,   258,
      13,    -1,   159,    12,   258,    19,   258,    13,    -1,   167,
      12,   258,    13,    -1,   166,    12,   258,    13,    -1,   183,
      12,   258,    19,   254,    13,    -1,   184,    12,   258,    19,
     258,    19,   258,    19,   258,    19,   258,    13,    -1,   185,
      12,   258,    19,   258,    13,    -1,   186,    12,   258,    19,
     258,    13,    -1,   187,    12,   258,    19,   258,    13,    -1,
     188,    12,   258,    19,   258,    13,    -1,   189,    12,   258,
      19,   258,    13,    -1,   190,    12,   258,    19,   258,    13,
      -1,   192,    12,   258,    19,   258,    19,   258,    19,   258,
      19,   258,    19,   254,    13,    -1,   194,    12,   258,    19,
     258,    19,   258,    13,    -1,   195,    12,   258,    19,   258,
      13,    -1,   196,    12,   258,    19,   258,    13,    -1,   197,
      12,   254,    13,    -1,   198,    12,   258,    19,   258,    19,
     254,    13,    -1,   199,    12,   258,    19,   258,    13,    -1,
      79,    12,   258,    13,    -1,    86,    12,   258,    13,    -1,
     214,    12,   258,    13,    -1,    80,    12,   258,    13,    -1,
      81,    12,   258,    13,    -1,    83,    12,   258,    13,    -1,
      84,    12,   258,    13,    -1,    85,    12,   258,    13,    -1,
      82,    12,   258,    13,    -1,    46,    12,   258,    13,    -1,
      47,    12,   258,    13,    -1,    48,    12,   258,    13,    -1,
     220,    12,   258,    13,    -1,   220,    12,   258,    19,   258,
      13,    -1,    49,    12,   258,    13,    -1,    50,    12,   258,
      13,    -1,    51,    12,   258,    13,    -1,    52,    12,   258,
      13,    -1,    53,    12,   258,    13,    -1,    54,    12,   258,
      13,    -1,    55,    12,   258,    13,    -1,    56,    12,   258,
      13,    -1,    57,    12,   258,    13,    -1,    58,    12,   258,
      13,    -1,    59,    12,   258,    13,    -1,    60,    12,   258,
      13,    -1,    61,    12,   258,    13,    -1,    62,    12,   258,
      13,    -1,    63,    12,   258,    13,    -1,    64,    12,   258,
      13,    -1,    65,    12,   258,    13,    -1,    66,    12,   258,
      13,    -1,    67,    12,   258,    13,    -1,    68,    12,   258,
      13,    -1,    69,    12,   258,    13,    -1,    70,    12,   258,
      13,    -1,    72,    12,   258,    13,    -1,    71,    12,   258,
      13,    -1,    73,    12,   258,    13,    -1,    74,    12,   258,
      13,    -1,    75,    12,   258,    13,    -1,    76,    12,   258,
      13,    -1,    77,    12,   258,    13,    -1,    78,    12,   258,
      13,    -1,   160,    12,   258,    13,    -1,    16,    30,    -1,
      -1,    87,   275,    -1,    88,   275,    -1,    89,   275,    -1,
      90,   275,    -1,    91,   275,    -1,    92,   275,    -1,    93,
     275,    -1,    94,   275,    -1,    95,   275,    -1,    96,   275,
      -1,    98,   275,    -1,    99,   275,    -1,   100,   275,    -1,
     102,   275,    -1,   101,   275,    -1,   103,   275,    -1,   219,
      -1,   220,    -1,   221,    -1,   222,    -1,   223,    -1,   224,
      -1,   225,    -1,   226,   227,   219,    -1,   226,   227,   220,
      -1,   226,   227,   221,    -1,   226,   227,   222,    -1,   226,
     227,   223,    -1,   226,   227,   224,    -1,   226,   227,   225,
      -1,   218,    -1,   277,    -1,   277,    -1,   277,    19,   279,
      -1,   278,    -1,    12,   279,    13,    -1,     3,    -1,     5,
      -1,     6,    -1,     7,    -1,     8,    -1,     9,    -1,    10,
      -1,    11,    -1,    12,    -1,    13,    -1,    14,    -1,    15,
      -1,    14,    31,    -1,    31,    15,    -1,    16,    -1,    17,
      -1,    18,    -1,    19,    -1,    20,    -1,    22,    -1,    23,
      -1,    23,    16,    -1,    24,    -1,    25,    -1,    27,    16,
      -1,    29,    -1,    26,    -1,    27,    -1,    28,    -1,    30,
      -1,    31,    -1,    32,    -1,    33,    -1,    35,    -1,    36,
      -1,    37,    -1,    39,    -1,    40,    -1,    41,    -1,    42,
      -1,    38,    -1,    43,    -1,    44,    -1,    45,    -1,    46,
      -1,    47,    -1,    48,    -1,    49,    -1,    50,    -1,    51,
      -1,    52,    -1,    53,    -1,    54,    -1,    55,    -1,    56,
      -1,    57,    -1,    58,    -1,    59,    -1,    60,    -1,    61,
      -1,    62,    -1,    63,    -1,    64,    -1,    65,    -1,    66,
      -1,    67,    -1,    68,    -1,    69,    -1,    70,    -1,    72,
      -1,    71,    -1,    73,    -1,    74,    -1,    75,    -1,    76,
      -1,    77,    -1,    78,    -1,    79,    -1,    86,    -1,   214,
      -1,    80,    -1,    81,    -1,    82,    -1,    87,    -1,    88,
      -1,    89,    -1,    90,    -1,    91,    -1,    92,    -1,    93,
      -1,    94,    -1,    95,    -1,    96,    -1,    97,    -1,    98,
      -1,    99,    -1,   100,    -1,   102,    -1,   101,    -1,   103,
      -1,   104,    -1,   105,    -1,   106,    -1,   107,    -1,   108,
      -1,   109,    -1,   110,    -1,   111,    -1,   112,    -1,   113,
      -1,   114,    -1,   115,    -1,   116,    -1,   117,    -1,   118,
      -1,   119,    -1,   120,    -1,   121,    -1,   122,    -1,   123,
      -1,   124,    -1,   125,    -1,   126,    -1,   127,    -1,   128,
      -1,   129,    -1,   130,    -1,   131,    -1,   132,    -1,   133,
      -1,   134,    -1,   135,    -1,   138,    -1,   139,    -1,   136,
      -1,   137,    -1,   164,    -1,   165,    -1,   140,    -1,   141,
      -1,   142,    -1,   143,    -1,   144,    -1,   145,    -1,   146,
      -1,   147,    -1,   148,    -1,   149,    -1,   150,    -1,   151,
      -1,   152,    -1,   153,    -1,   154,    -1,   155,    -1,   156,
      -1,   157,    -1,   158,    -1,   159,    -1,   160,    -1,   167,
      -1,   168,    -1,   169,    -1,   166,    -1,   170,    -1,   171,
      -1,   172,    -1,   173,    -1,   174,    -1,   175,    -1,   176,
      -1,   177,    -1,   178,    -1,   179,    -1,   180,    -1,   181,
      -1,   182,    -1,   183,    -1,   184,    -1,   185,    -1,   186,
      -1,   187,    -1,   188,    -1,   189,    -1,   190,    -1,   191,
      -1,   192,    -1,   193,    -1,   194,    -1,   195,    -1,   196,
      -1,   197,    -1,   198,    -1,   199,    -1,   200,    -1,   201,
      -1,   202,    -1,   203,    -1,   204,    -1,   205,    -1,   206,
      -1,   207,    -1,   208,    -1,   238,    -1,   239,    -1,   213,
      -1,   161,    -1,   162,    -1,   163,    -1,    84,    -1,    83,
      -1,    85,    -1,   216,    -1,   215,    -1,   234,    -1,   217,
      -1,   218,    -1,   219,    -1,   220,    -1,   221,    -1,   222,
      -1,   223,    -1,   224,    -1,   225,    -1,   226,    -1,   227,
      -1,   228,    -1,   232,    -1,   229,    -1,   230,    -1,   231,
      -1,   233,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   451,   451,   457,   465,   473,   479,   491,   499,   506,
     510,   516,   520,   526,   530,   534,   538,   542,   546,   550,
     554,   560,   564,   572,   577,   582,   590,   594,   600,   604,
     610,   617,   621,   627,   631,   635,   639,   643,   647,   651,
     655,   659,   663,   667,   671,   675,   679,   683,   687,   691,
     695,   699,   703,   707,   711,   715,   719,   726,   730,   734,
     738,   742,   746,   750,   754,   758,   762,   766,   770,   774,
     778,   782,   786,   790,   794,   798,   802,   806,   810,   814,
     818,   822,   826,   830,   834,   838,   844,   849,   854,   858,
     862,   869,   873,   877,   881,   887,   892,   897,   902,   907,
     912,   917,   921,   927,   934,   938,   942,   946,   950,   954,
     958,   962,   966,   970,   974,   978,   982,   986,   990,   994,
    1000,  1004,  1008,  1012,  1016,  1020,  1024,  1028,  1032,  1036,
    1040,  1044,  1048,  1052,  1056,  1060,  1066,  1070,  1076,  1080,
    1086,  1090,  1096,  1106,  1110,  1116,  1120,  1124,  1128,  1134,
    1143,  1147,  1151,  1155,  1159,  1163,  1167,  1171,  1177,  1181,
    1185,  1189,  1193,  1197,  1203,  1207,  1211,  1215,  1222,  1226,
    1233,  1237,  1241,  1245,  1252,  1259,  1263,  1269,  1273,  1277,
    1284,  1288,  1292,  1299,  1303,  1307,  1311,  1315,  1319,  1323,
    1327,  1331,  1335,  1339,  1343,  1347,  1351,  1355,  1359,  1363,
    1367,  1371,  1375,  1379,  1383,  1387,  1391,  1395,  1399,  1403,
    1407,  1411,  1415,  1419,  1423,  1427,  1431,  1442,  1446,  1451,
    1456,  1461,  1466,  1470,  1474,  1478,  1482,  1486,  1490,  1494,
    1499,  1504,  1509,  1513,  1517,  1521,  1527,  1531,  1537,  1541,
    1545,  1549,  1553,  1557,  1561,  1565,  1569,  1575,  1580,  1585,
    1590,  1595,  1600,  1605,  1613,  1617,  1621,  1625,  1631,  1635,
    1639,  1646,  1650,  1654,  1660,  1664,  1668,  1672,  1676,  1680,
    1686,  1690,  1694,  1698,  1702,  1706,  1710,  1715,  1719,  1723,
    1727,  1731,  1735,  1739,  1743,  1747,  1751,  1755,  1759,  1763,
    1767,  1771,  1775,  1779,  1783,  1787,  1791,  1795,  1799,  1803,
    1807,  1811,  1815,  1819,  1823,  1827,  1831,  1835,  1839,  1843,
    1847,  1851,  1855,  1859,  1863,  1867,  1871,  1875,  1879,  1883,
    1887,  1891,  1895,  1899,  1903,  1907,  1911,  1915,  1919,  1923,
    1927,  1931,  1935,  1939,  1943,  1947,  1951,  1955,  1959,  1963,
    1967,  1971,  1975,  1979,  1983,  1987,  1991,  1995,  1999,  2003,
    2007,  2011,  2015,  2019,  2023,  2027,  2031,  2035,  2039,  2043,
    2047,  2051,  2057,  2062,  2067,  2071,  2075,  2079,  2083,  2087,
    2091,  2095,  2099,  2103,  2107,  2111,  2115,  2119,  2123,  2127,
    2133,  2139,  2145,  2151,  2157,  2163,  2169,  2175,  2181,  2187,
    2193,  2199,  2205,  2211,  2219,  2225,  2232,  2236,  2242,  2246,
    2253,  2258,  2263,  2268,  2273,  2278,  2289,  2294,  2299,  2303,
    2307,  2311,  2315,  2319,  2323,  2334,  2345,  2356,  2360,  2371,
    2375,  2386,  2397,  2401,  2405,  2416,  2420,  2424,  2435,  2439,
    2443,  2447,  2458,  2462,  2473,  2484,  2495,  2506,  2517,  2528,
    2539,  2550,  2561,  2572,  2583,  2594,  2605,  2616,  2627,  2638,
    2649,  2660,  2671,  2682,  2693,  2704,  2715,  2726,  2737,  2748,
    2759,  2770,  2782,  2793,  2804,  2815,  2826,  2837,  2848,  2859,
    2870,  2881,  2892,  2903,  2914,  2925,  2936,  2947,  2958,  2969,
    2980,  2991,  3002,  3013,  3024,  3035,  3046,  3057,  3068,  3079,
    3090,  3101,  3112,  3123,  3134,  3145,  3156,  3167,  3178,  3189,
    3200,  3211,  3222,  3233,  3244,  3255,  3266,  3277,  3288,  3299,
    3310,  3321,  3332,  3343,  3354,  3365,  3376,  3387,  3398,  3409,
    3420,  3431,  3442,  3453,  3464,  3475,  3486,  3497,  3508,  3519,
    3530,  3541,  3552,  3563,  3574,  3585,  3596,  3607,  3618,  3629,
    3640,  3651,  3662,  3673,  3684,  3695,  3706,  3717,  3728,  3739,
    3750,  3761,  3772,  3783,  3794,  3805,  3816,  3827,  3838,  3849,
    3860,  3871,  3882,  3893,  3905,  3916,  3927,  3938,  3949,  3960,
    3971,  3982,  3993,  4004,  4015,  4026,  4037,  4048,  4059,  4070,
    4081,  4092,  4100,  4111,  4122,  4133,  4145,  4157,  4168,  4179,
    4190,  4201,  4212,  4223,  4227,  4231,  4235,  4239,  4250,  4254,
    4258,  4262,  4267,  4271,  4275,  4279,  4290,  4301,  4312,  4323,
    4334,  4345,  4356,  4367,  4371,  4381,  4391,  4401,  4411,  4421,
    4431,  4441,  4451,  4461,  4471,  4481,  4491,  4501,  4511,  4521,
    4531
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "\"decimal constant\"", "\"interval\"",
  "\"dyadic constant\"", "\"constant in memory notation\"",
  "\"hexadecimal constant\"", "\"binary constant\"", "\"pi\"",
  "\"identifier\"", "\"character string\"", "\"(\"", "\")\"", "\"[\"",
  "\"]\"", "\"=\"", "\":=\"", "\"==\"", "\",\"", "\"!\"", "\";\"",
  "\"*<\"", "\"<\"", "\">_\"", "\">.\"", "\">*\"", "\">\"", "\"...\"",
  "\".\"", "\"?\"", "\"|\"", "\"@\"", "\"::\"", "\":\"", "\".:\"",
  "\":.\"", "\"!=\"", "\"~\"", "\"&&\"", "\"||\"", "\"+\"", "\"-\"",
  "\"*\"", "\"/\"", "\"^\"", "\"sqrt\"", "\"exp\"", "\"_x_\"", "\"log\"",
  "\"log2\"", "\"log10\"", "\"sin\"", "\"cos\"", "\"tan\"", "\"asin\"",
  "\"acos\"", "\"atan\"", "\"sinh\"", "\"cosh\"", "\"tanh\"", "\"asinh\"",
  "\"acosh\"", "\"atanh\"", "\"abs\"", "\"erf\"", "\"erfc\"", "\"log1p\"",
  "\"expm1\"", "\"D\"", "\"SG\"", "\"HP\"", "\"QD\"", "\"DD\"", "\"TD\"",
  "\"DE\"", "\"ceil\"", "\"floor\"", "\"nearestint\"", "\"head\"",
  "\"revert\"", "\"sort\"", "\"tail\"", "\"mantissa\"", "\"exponent\"",
  "\"precision\"", "\"roundcorrectly\"", "\"prec\"", "\"points\"",
  "\"diam\"", "\"display\"", "\"verbosity\"", "\"showmessagenumbers\"",
  "\"canonical\"", "\"autosimplify\"", "\"taylorrecursions\"",
  "\"timing\"", "\"time\"", "\"fullparentheses\"", "\"midpointmode\"",
  "\"dieonerrormode\"", "\"roundingwarnings\"", "\"rationalmode\"",
  "\"hopitalrecursions\"", "\"on\"", "\"off\"", "\"dyadic\"", "\"powers\"",
  "\"binary\"", "\"hexadecimal\"", "\"file\"", "\"postscript\"",
  "\"postscriptfile\"", "\"perturb\"", "\"RD\"", "\"RU\"", "\"RZ\"",
  "\"RN\"", "\"honorcoeffprec\"", "\"true\"", "\"false\"", "\"default\"",
  "\"match\"", "\"with\"", "\"absolute\"", "\"decimal\"", "\"relative\"",
  "\"fixed\"", "\"floating\"", "\"error\"", "\"quit\"",
  "\"quit in an included file\"", "\"restart\"", "\"library\"",
  "\"libraryconstant\"", "\"diff\"", "\"dirtysimplify\"", "\"remez\"",
  "\"bashevaluate\"", "\"getsuppressedmessages\"", "\"fpminimax\"",
  "\"horner\"", "\"expand\"", "\"simplify\"", "\"taylor\"",
  "\"taylorform\"", "\"chebyshevform\"", "\"autodiff\"", "\"degree\"",
  "\"numerator\"", "\"denominator\"", "\"substitute\"",
  "\"composepolynomials\"", "\"coeff\"", "\"subpoly\"",
  "\"roundcoefficients\"", "\"rationalapprox\"", "\"accurateinfnorm\"",
  "\"round\"", "\"evaluate\"", "\"length\"", "\"inf\"", "\"mid\"",
  "\"sup\"", "\"min\"", "\"max\"", "\"read\"", "\"parse\"", "\"print\"",
  "\"printxml\"", "\"plot\"", "\"printhexa\"", "\"printfloat\"",
  "\"printbinary\"", "\"suppressmessage\"", "\"unsuppressmessage\"",
  "\"printexpansion\"", "\"bashexecute\"", "\"externalplot\"", "\"write\"",
  "\"asciiplot\"", "\"rename\"", "\"bind\"", "\"infnorm\"", "\"supnorm\"",
  "\"findzeros\"", "\"fpfindzeros\"", "\"dirtyinfnorm\"",
  "\"numberroots\"", "\"integral\"", "\"dirtyintegral\"", "\"worstcase\"",
  "\"implementpoly\"", "\"implementconst\"", "\"checkinfnorm\"",
  "\"zerodenominators\"", "\"isevaluable\"", "\"searchgal\"",
  "\"guessdegree\"", "\"dirtyfindzeros\"", "\"if\"", "\"then\"",
  "\"else\"", "\"for\"", "\"in\"", "\"from\"", "\"to\"", "\"by\"",
  "\"do\"", "\"begin\"", "\"end\"", "\"{\"", "\"}\"", "\"while\"",
  "\"readfile\"", "\"isbound\"", "\"execute\"", "\"externalproc\"",
  "\"void\"", "\"constant\"", "\"function\"", "\"object\"", "\"range\"",
  "\"integer\"", "\"string\"", "\"boolean\"", "\"list\"", "\"of\"",
  "\"var\"", "\"proc\"", "\"procedure\"", "\"return\"", "\"nop\"",
  "\"help\"", "\"version\"", "$accept", "startsymbol", "helpmeta",
  "beginsymbol", "endsymbol", "command", "ifcommand", "forcommand",
  "commandlist", "variabledeclarationlist", "variabledeclaration",
  "identifierlist", "procbody", "simplecommand", "assignment",
  "simpleassignment", "structuring", "stateassignment",
  "stillstateassignment", "thinglist", "structelementlist",
  "structelementseparator", "structelement", "thing", "supermegaterm",
  "indexing", "megaterm", "hyperterm", "unaryplusminus", "term", "subterm",
  "basicthing", "matchlist", "matchelement", "constant", "list",
  "simplelist", "range", "debound", "headfunction", "egalquestionmark",
  "statedereference", "externalproctype", "extendedexternalproctype",
  "externalproctypesimplelist", "externalproctypelist", "help", YY_NULL
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,   367,   368,   369,   370,   371,   372,   373,   374,
     375,   376,   377,   378,   379,   380,   381,   382,   383,   384,
     385,   386,   387,   388,   389,   390,   391,   392,   393,   394,
     395,   396,   397,   398,   399,   400,   401,   402,   403,   404,
     405,   406,   407,   408,   409,   410,   411,   412,   413,   414,
     415,   416,   417,   418,   419,   420,   421,   422,   423,   424,
     425,   426,   427,   428,   429,   430,   431,   432,   433,   434,
     435,   436,   437,   438,   439,   440,   441,   442,   443,   444,
     445,   446,   447,   448,   449,   450,   451,   452,   453,   454,
     455,   456,   457,   458,   459,   460,   461,   462,   463,   464,
     465,   466,   467,   468,   469,   470,   471,   472,   473,   474,
     475,   476,   477,   478,   479,   480,   481,   482,   483,   484,
     485,   486,   487,   488,   489
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   235,   236,   236,   236,   236,   236,   236,   237,   238,
     238,   239,   239,   240,   240,   240,   240,   240,   240,   240,
     240,   241,   241,   242,   242,   242,   243,   243,   244,   244,
     245,   246,   246,   247,   247,   247,   247,   247,   247,   247,
     247,   247,   247,   247,   247,   247,   247,   247,   247,   247,
     247,   247,   247,   247,   247,   247,   247,   248,   248,   248,
     248,   248,   248,   248,   248,   248,   248,   248,   248,   248,
     248,   248,   248,   248,   248,   248,   248,   248,   248,   248,
     248,   248,   248,   248,   248,   248,   248,   248,   248,   248,
     248,   249,   249,   249,   249,   250,   250,   250,   250,   250,
     250,   250,   250,   251,   252,   252,   252,   252,   252,   252,
     252,   252,   252,   252,   252,   252,   252,   252,   252,   252,
     253,   253,   253,   253,   253,   253,   253,   253,   253,   253,
     253,   253,   253,   253,   253,   253,   254,   254,   255,   255,
     256,   256,   257,   258,   258,   259,   259,   259,   259,   260,
     261,   261,   261,   261,   261,   261,   261,   261,   262,   262,
     262,   262,   262,   262,   263,   263,   263,   263,   264,   264,
     264,   264,   264,   264,   264,   264,   264,   265,   265,   265,
     265,   265,   265,   266,   266,   266,   266,   266,   266,   266,
     266,   266,   266,   266,   266,   266,   266,   266,   266,   266,
     266,   266,   266,   266,   266,   266,   266,   266,   266,   266,
     266,   266,   266,   266,   266,   266,   266,   266,   266,   266,
     266,   266,   266,   266,   266,   266,   266,   266,   266,   266,
     266,   266,   266,   266,   266,   266,   267,   267,   268,   268,
     268,   268,   268,   268,   268,   268,   268,   269,   269,   269,
     269,   269,   269,   269,   270,   270,   270,   270,   271,   271,
     271,   272,   272,   272,   273,   273,   273,   273,   273,   273,
     274,   274,   274,   274,   274,   274,   274,   274,   274,   274,
     274,   274,   274,   274,   274,   274,   274,   274,   274,   274,
     274,   274,   274,   274,   274,   274,   274,   274,   274,   274,
     274,   274,   274,   274,   274,   274,   274,   274,   274,   274,
     274,   274,   274,   274,   274,   274,   274,   274,   274,   274,
     274,   274,   274,   274,   274,   274,   274,   274,   274,   274,
     274,   274,   274,   274,   274,   274,   274,   274,   274,   274,
     274,   274,   274,   274,   274,   274,   274,   274,   274,   274,
     274,   274,   274,   274,   274,   274,   274,   274,   274,   274,
     274,   274,   275,   275,   276,   276,   276,   276,   276,   276,
     276,   276,   276,   276,   276,   276,   276,   276,   276,   276,
     277,   277,   277,   277,   277,   277,   277,   277,   277,   277,
     277,   277,   277,   277,   278,   278,   279,   279,   280,   280,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     1,     3,     2,     2,     1,     1,
       1,     1,     1,     1,     3,     4,     3,     2,     2,     4,
       2,     3,     5,     7,     9,     5,     2,     3,     2,     3,
       2,     1,     3,     5,     6,     5,     4,     8,     9,     8,
       7,     6,     7,     6,     5,     9,    10,     9,     8,     8,
       9,     8,     7,    11,    12,    11,    10,     1,     1,     1,
       4,     3,     1,     4,     6,     7,     6,     4,     4,     4,
       4,     4,     4,     4,     4,    12,     4,     6,     7,     6,
       4,     4,     6,     7,    12,     6,     6,    11,     1,     1,
       3,     1,     2,     1,     2,     3,     3,     6,     6,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     1,     3,     1,     3,
       1,     1,     4,     1,     4,     1,     3,     3,     2,     4,
       1,     3,     3,     3,     3,     4,     4,     3,     1,     3,
       3,     3,     3,     3,     1,     1,     2,     2,     1,     2,
       2,     3,     3,     4,     4,     4,     4,     1,     3,     4,
       4,     3,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     4,
       4,     3,     1,     1,     1,     1,     3,     3,     1,     1,
       3,     6,     6,     5,     2,     4,     1,     2,     9,     6,
       8,     5,     8,     5,     7,     4,     5,     1,     1,     1,
       1,     1,     1,     1,     4,     3,     5,     6,     1,     3,
       5,     5,     5,     3,     3,     3,     3,     4,     4,     4,
       4,     4,     4,     3,     6,     8,     8,     4,     4,    10,
       4,     4,     4,     4,     8,     8,     8,     8,     4,     4,
       4,     6,     6,     6,     6,     6,     6,     8,     8,     6,
       4,     4,     6,    12,     6,     6,     6,     6,     6,     6,
      14,     8,     6,     6,     4,     8,     6,     4,     4,     4,
       4,     4,     4,     4,     4,     4,     4,     4,     4,     4,
       6,     4,     4,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     4,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     4,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     2,     0,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       1,     1,     1,     1,     1,     1,     1,     3,     3,     3,
       3,     3,     3,     3,     1,     1,     1,     3,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     2,     2,     1,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,     0,   247,   248,   249,   250,   251,   252,   253,   218,
     216,     0,     0,     0,     0,     4,     0,   164,   165,     0,
       0,   213,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   208,   209,   211,   210,   214,   215,   212,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     363,   363,   363,   363,   363,   363,   363,   363,   363,   363,
       0,   363,   363,   363,   363,   363,   363,   183,   184,   185,
     186,   187,   188,   189,   190,   191,   192,   193,   194,   195,
     196,   197,   198,   200,   201,     0,   203,   202,   204,   205,
     206,   207,    57,    58,    62,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     9,    10,     0,     0,     0,     0,     0,   199,
       0,     0,     0,    59,     8,     0,     0,     0,     0,     0,
      13,    88,    93,     0,    91,     0,    89,   136,   143,   229,
     145,   150,     0,   158,   168,   177,   217,   222,   223,   224,
     225,   228,     7,     0,     0,     0,   218,   363,   363,   363,
     363,   363,   363,   363,   363,   363,   363,   363,   363,   363,
     363,   363,   363,     0,     0,   229,   177,     0,     0,     0,
     148,     0,   170,   166,   167,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   364,     0,   365,
       0,   366,     0,   367,     0,   368,     0,   369,     0,     0,
     370,     0,   371,     0,   372,     0,   373,     0,     0,   374,
       0,   375,     0,   376,     0,   378,     0,   377,     0,   379,
       0,   143,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    18,     0,     0,
      20,     0,     0,   138,     0,     0,     0,     0,     0,     0,
       0,   234,     0,     0,     6,     1,   400,   401,   402,   403,
     404,   405,   406,   407,   408,   409,   410,   411,   414,   415,
     416,   417,   418,     3,   419,   420,   422,   423,   426,   427,
     428,   425,   429,   430,   431,   432,   433,   434,   435,   440,
     436,   437,   438,   439,   441,   442,   443,   444,   445,   446,
     447,   448,   449,   450,   451,   452,   453,   454,   455,   456,
     457,   458,   459,   460,   461,   462,   463,   464,   465,   466,
     467,   468,   470,   469,   471,   472,   473,   474,   475,   476,
     477,   480,   481,   482,   609,   608,   610,   478,   483,   484,
     485,   486,   487,   488,   489,   490,   491,   492,   493,   494,
     495,   496,   498,   497,   499,   500,   501,   502,   503,   504,
     505,   506,   507,   508,   509,   510,   511,   512,   513,   514,
     515,   516,   517,   518,   519,   520,   521,   522,   523,   524,
     525,   526,   527,   528,   529,   530,   531,   534,   535,   532,
     533,   538,   539,   540,   541,   542,   543,   544,   545,   546,
     547,   548,   549,   550,   551,   552,   553,   554,   555,   556,
     557,   558,   605,   606,   607,   536,   537,   562,   559,   560,
     561,   563,   564,   565,   566,   567,   568,   569,   570,   571,
     572,   573,   574,   575,   576,   577,   578,   579,   580,   581,
     582,   583,   584,   585,   586,   587,   588,   589,   590,   591,
     592,   593,   594,   595,   596,   597,   598,   599,   600,   601,
      11,    10,    12,   604,   479,   612,   611,   614,   615,   616,
     617,   618,   619,   620,   621,   622,   623,   624,   625,   627,
     628,   629,   626,   630,   613,   602,   603,     0,     0,    17,
       0,     0,     0,     0,     2,    94,     0,     0,    92,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   169,     0,     0,     0,     0,     0,
       0,   221,     0,     0,     0,    95,    96,     0,   226,     0,
       0,   258,     0,   255,   263,     0,     0,   266,   265,   264,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   362,   104,   105,   106,   107,   108,   109,     0,   110,
     111,   112,   113,     0,   114,   115,   116,   118,   117,   119,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   227,   140,   141,     0,     0,     0,     0,     0,     0,
       0,    31,     0,     0,    90,    61,     0,   412,   421,   424,
     413,     5,    31,    30,    26,    14,    16,     0,    28,   101,
     102,   137,   146,   147,    99,   100,   151,     0,   153,     0,
     154,   157,   152,   161,   162,   163,   159,   160,     0,     0,
     171,     0,     0,   172,     0,   230,     0,   181,     0,     0,
     178,   220,     0,     0,     0,   230,   254,     0,     0,     0,
       0,     0,   326,   327,   328,   331,   332,   333,   334,   335,
     336,   337,   338,   339,   340,   341,   342,   343,   344,   345,
     346,   347,   348,   349,   350,   351,   352,   354,   353,   355,
     356,   357,   358,   359,   360,   317,   320,   321,   325,   322,
     323,   324,   318,   281,   235,     0,   144,   236,   270,   271,
       0,   272,     0,     0,   280,   282,   283,     0,     0,     0,
       0,   288,   289,   290,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   361,   269,   268,   267,   277,   278,   301,
     300,    63,    80,     0,    67,    68,    69,    70,    71,    72,
      74,     0,    76,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    73,     0,     0,
       0,   314,     0,     0,    21,     0,     0,     0,   139,    19,
     319,   219,    81,     0,   329,     0,     0,     0,     0,     0,
      60,    27,    15,    29,   155,   156,   175,   173,   176,   174,
     149,     0,   182,   180,   179,     0,     0,   233,     0,     0,
     259,     0,   256,   261,   262,     0,   237,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     142,     0,     0,     0,    32,     0,    36,     0,     0,     0,
       0,    97,    98,   232,     0,   257,     0,     0,     0,   274,
       0,     0,     0,     0,     0,   291,   292,   293,   294,   295,
     296,     0,     0,   299,     0,    64,     0,    82,    66,     0,
       0,    77,    79,    85,    86,     0,   302,     0,   304,   305,
     306,   307,   308,   309,     0,     0,     0,   312,   313,     0,
     316,    22,    25,     0,     0,   330,     0,     0,     0,    33,
       0,    35,     0,     0,    44,     0,     0,   231,   260,     0,
       0,   245,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    65,    83,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   394,   380,   381,   382,   383,
     384,   385,   386,     0,   395,   398,     0,     0,     0,     0,
       0,     0,    34,     0,     0,    41,     0,    43,     0,   246,
       0,     0,   243,     0,   241,     0,   275,     0,   284,   285,
     286,   287,   297,   298,     0,   276,     0,     0,     0,   311,
     315,     0,    23,   396,     0,     0,     0,     0,    52,     0,
       0,    40,     0,     0,     0,     0,     0,     0,     0,    42,
       0,     0,     0,     0,   239,     0,     0,     0,     0,     0,
       0,     0,   399,   387,   388,   389,   390,   391,   392,   393,
       0,     0,     0,    49,     0,    51,     0,    37,    39,     0,
      48,     0,     0,     0,   244,     0,     0,     0,   279,     0,
       0,     0,     0,    24,   397,     0,     0,     0,     0,     0,
      50,    38,    45,    47,     0,   242,   240,     0,     0,     0,
       0,     0,    87,    56,     0,     0,     0,    46,   238,    75,
     303,    84,     0,    53,    55,     0,     0,    54,   310
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,   186,   187,   188,   636,   640,   387,   390,   641,   642,
     643,   833,   401,   190,   191,   192,   193,   194,   195,   196,
     392,   824,   393,   197,   198,   235,   200,   201,   202,   203,
     204,   236,   936,   937,   206,   207,   682,   208,   209,   210,
     287,   211,  1204,  1205,  1244,  1206,   637
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -1183
static const yytype_int16 yypact[] =
{
    1530,    30, -1183, -1183, -1183, -1183, -1183, -1183, -1183,   129,
   -1183,  7021,  4524,  7702,  7021, -1183,  8837,   299,   299,    46,
      63,   118,   140,   148,   162,   172,   175,   204,   206,   212,
     221,   268,   270,   272,   274,   281,   288,   290,   292,   296,
     303,   332,   339,   345,   382,   386,   389,   442,   448,   494,
     504,   522,   540,   543,   546,   549,   550,   551,   562,   596,
      24,    54,   423,   476,   586,   599,    45,   603,   610,   632,
     602,   634,   635,   647,   650,   656,   680, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183,  7021, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183,   604,   643,   690,   692,   695,
     699,   702,   706,   707,   724,   731,   733,   735,   740,   742,
     746,   747,   749,   764,   771,   774,   776,   786,   787,   804,
     813,   822,   829,   840,   846,   847,   851,   857,   858,   886,
     888,   892,   893,   894,   898,   901,   910,   913,   916,   918,
     923,   940,   945,   946,   947,   950,   951,   952,   954,   956,
     957,   959,   988,  1004,  1010,  1022,  1043,  1047,  1049,  1055,
    7021,   791, -1183,   577,  7021,  1058,  1059,  1063,  1064, -1183,
    1069,  1070,   819,  1071, -1183,   431,   612,  1762,  2914,   589,
   -1183, -1183,   640,   120, -1183,   642, -1183,    23, -1183,   205,
       7,  1196,  8837,   336, -1183,    14, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183,  4978,  4751,  7021,  1075,   850,   850,   850,
     850,   850,   850,    91,   850,   850,   850,   850,   850,   850,
     850,   850,   850,   577,    28, -1183,    19,  5205,   649,   691,
       7,  1182, -1183, -1183, -1183,  7021,  7021,  7021,  7021,  7021,
    7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,
    7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,
    7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,
    7021,  7021,  7021,  7021,  7021,  7021,  5432, -1183,  5432, -1183,
    5432, -1183,  5432, -1183,  5432, -1183,  5432, -1183,  7021,  5432,
   -1183,  5432, -1183,  5432, -1183,  5432, -1183,  4294,  5432, -1183,
    5432, -1183,  5432, -1183,  5432, -1183,  5432, -1183,  5432, -1183,
     403,   545,  7021,  7021,  7021,  7021,   855,  7021,  7021,  7021,
    7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,
    7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,
    7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,
    7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,     8,  7021,
    7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,  7021,
    7021,  7021,  7021,  7021,  7021,  7021,  7021, -1183,    -2,   246,
   -1183,   864,   796,    73,   -25,  7021,   882,  7021,  1013,  7021,
      16, -1183,  1070,  5659, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183,  1006, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183,  1072, -1183, -1183, -1183,  1078,
   -1183, -1183, -1183,  1099, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183,  1085,  1100, -1183,
    1116,   -88,  4064,  1119, -1183, -1183,  7021,  7021, -1183,  7021,
    7702,  7702,  7021,  7021,  7702,  7248,  7475,  7702,  7702,  7702,
    7702,  7702,  7702,  7702, -1183,  7929,  8156,  7021,  1131,  8610,
    8383, -1183,  1149,  1151,  1153,   403,   403,  1139,  1158,  1166,
    1164,   403,   163, -1183, -1183,  7021,  7021, -1183, -1183, -1183,
      37,    40,    42,    47,    56,    58,    61,    65,    70,    72,
      75,    78,    80,    86,    89,    93,    95,   100,   103,   108,
     110,   114,   125,   131,   149,   153,   156,   192,   337,   342,
     360,   365,   377,   380,   405,   408,   418,   425,   427,   433,
     436, -1183,   256,   363,   877,   936,   992,  1018,   440,  1023,
    1025,  1029,  1034,  1167,  1040,  1046,  1052,  1057,  1081,  1089,
    7021,   443,   446,   188,    26, -1183,   190,   450,   455,   458,
     422,   578,   590,   684,   461,   464,   468,   686,   694,   698,
     701,   710,   716,   723,   725,   727,   471,   474,   478,   480,
    1171,  1172,   483,   486,  1177,   489,   729,   492,   496,   499,
    1180,  1181,   502,   508,   732,  1183,   734,  1179,  1185,   738,
     741,   751,   756,   763,   765,   770,   773,   775,   778,   781,
    1188,   792,   803,   805,  1189,   807,   809,  4294,  7021,  7021,
    1193, -1183, -1183, -1183,   577,  4294,   511,  1198,   514,  1194,
      33,   161,     1,  1201, -1183, -1183,   517, -1183, -1183, -1183,
   -1183, -1183,  1205, -1183,  4294, -1183, -1183,   -88,  1003,   403,
     403, -1183,     7,     7,   403,   403,  1196,  7702,  1196,  7702,
    1196,  1196,  1196,   336,   336,   336,   336,   336,  8837,  8837,
   -1183,  8837,  8837, -1183,   116,   379,  8837, -1183,  8837,  8837,
   -1183, -1183,  7021,  7021,  5886,  1218, -1183,  6113,  1202,  1219,
     136,   158, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183,   180, -1183,  7021, -1183, -1183,
    7021, -1183,  7021,  7021, -1183, -1183, -1183,  7021,  7021,  7021,
    7021, -1183, -1183, -1183,  7021,  7021,  7021,  7021,  7021,  7021,
    7021,  7021,  7021, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183,  1208,  1221,  7021, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183,  7021,  1222,  7021,  1240,  1241,  1243,  7021,  7021,  7021,
    7021,  7021,  7021,  7021,  7021,  7021,  7021, -1183,  7021,  7021,
    7021, -1183,  7021,  7021,  1053,   -23,    -4,  7021, -1183, -1183,
   -1183, -1183, -1183,  7021, -1183,  7021,  1226,  1100,  1994,     1,
   -1183, -1183, -1183, -1183,  1196,  1196, -1183, -1183, -1183, -1183,
   -1183,  7021, -1183, -1183, -1183,   520,   527, -1183,  1244,  1239,
     403,  1245, -1183, -1183, -1183,    -3, -1183,   811,   530,   814,
     816,   821,   838,   845,   532,   536,   555,   560,   564,   583,
     854,   856,   585,  6340,  6567,  1246,   862,  6794,   588,  1248,
    1249,  1247,  1251,   869,   592,   594,   598,   600,   607,   630,
     872,   880,   884,   639,   644,   902,   646,  4294,  4294,  7021,
     403,   914,   648,  1252, -1183,  7021, -1183,    79,  3144,  2224,
    1254, -1183, -1183, -1183,  7021, -1183,  7021,  2454,  7021, -1183,
    7021,  7021,  7021,  7021,  7021, -1183, -1183, -1183, -1183, -1183,
   -1183,  7021,  7021, -1183,  7021,   403,  7021,   403, -1183,  7021,
    7021,   403, -1183, -1183, -1183,  7021, -1183,  7021, -1183, -1183,
   -1183, -1183, -1183, -1183,  7021,  7021,  7021, -1183, -1183,  7021,
   -1183, -1183, -1183,   -29,   189, -1183,     1,   525,  7021, -1183,
    7021, -1183,   575,  7021, -1183,   655,  3374, -1183,   403,   652,
    7021, -1183,   755,  3604,  1257,   921,   654,  1261,   658,   660,
    1262,   669,   403,   403,   955,   403,   676,   971,   974,   978,
     682,  1263,  7021,  4294,  1020, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183,  1050, -1183, -1183,  1236,  2684,   -88,  1077,
    1083,  7021, -1183,  1091,  7021, -1183,  7021, -1183,   789, -1183,
    1104,  7021, -1183,  7021, -1183,   793, -1183,  7021, -1183, -1183,
   -1183, -1183, -1183, -1183,  7021, -1183,  7021,  7021,  7021, -1183,
   -1183,    -8, -1183,  1265,  1268,  1095,  1255,  7021, -1183,   797,
    3834, -1183,   -88,   -88,  1106,   -88,  1111,  1115,  7021, -1183,
     -88,  1118,  1121,  7021, -1183,  1272,   996,  1000,  1002,  1007,
    4294,  1020, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
    1087,  1127,  7021, -1183,  7021, -1183,   817, -1183, -1183,   -88,
   -1183,   -88,   -88,  1132, -1183,   -88,   -88,  1135, -1183,  7021,
    7021,  7021,  7021, -1183, -1183,  1273,   -88,  1143,  1147,  7021,
   -1183, -1183, -1183, -1183,   -88, -1183, -1183,   -88,  1274,   688,
    1277,  1011, -1183, -1183,   -88,   -88,  1152, -1183, -1183, -1183,
   -1183, -1183,  7021, -1183, -1183,   -88,  1279, -1183, -1183
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
   -1183, -1183, -1183,  -183,   197,     2, -1183, -1183,  -629,  -801,
   -1183,  -630,   891, -1183, -1183, -1183, -1183, -1183, -1183,  -194,
     475, -1183, -1183,   -11,  1206,    90,    -6,  -634,   -12,   557,
      11,   181,   366, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
     361, -1183, -1182,    20,    31, -1183, -1183
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -136
static const yytype_int16 yytable[] =
{
     234,   239,   189,   241,   635,   243,   244,   240,   843,  1106,
     650,   651,  1243,   847,   650,   651,   650,   651,   797,   672,
     856,   858,   860,   861,   862,   654,   831,   242,   667,   832,
     655,   650,   651,   667,   656,   650,   651,   650,   651,   941,
     286,   678,   649,   668,   657,   942,  1014,  1023,   679,   669,
     892,   212,  1015,   893,   669,   894,   798,   298,   245,   670,
     895,   299,   650,   651,   670,   650,   651,   650,   651,   896,
     288,   897,   650,   651,   898,   246,   650,   651,   899,   650,
     651,   650,   651,   900,   320,   901,   650,   651,   902,  1243,
     199,   903,   822,   904,   823,   650,   651,   650,   651,   905,
     650,   651,   906,   298,   650,   651,   907,   677,   908,   650,
     651,   650,   651,   909,   650,   651,   910,   650,   651,   650,
     651,   911,   610,   912,   612,   650,   651,   913,   650,   651,
     247,  1030,   650,   651,   650,   651,   646,   647,   914,   650,
     651,   213,   650,   651,   915,   214,   215,   650,   651,   650,
     651,  1043,   248,   650,   651,   650,   651,   780,   781,   388,
     249,   784,   916,   394,   650,   651,   917,   790,   791,   918,
     650,   651,   795,  1044,   250,   650,   651,  1016,  1192,  1193,
    1017,   205,   887,   825,   251,  1088,   810,   252,   650,   651,
     814,   888,   650,   651,   889,   650,   651,   650,   651,   817,
    1270,  1194,  1089,   675,   676,   919,   172,   940,   611,   943,
     172,   658,   611,   664,  1045,  1021,   253,  1098,   254,   650,
     651,   652,   653,  1024,   255,  1025,   681,   650,   651,   650,
     651,   650,   651,   256,   690,   691,   692,   693,   694,   695,
     696,   697,   698,   699,   700,   701,   702,   703,   704,   705,
     706,   707,   708,   709,   710,   711,   712,   713,   714,   715,
     716,   717,   718,   719,   720,   721,   722,   723,   724,   725,
     726,   727,   728,   729,   730,   732,  -120,   733,   199,   734,
     257,   735,   258,   736,   259,   737,   260,   738,   739,   610,
     740,   612,   741,   261,   742,   650,   651,   744,  1166,   745,
     262,   746,   263,   747,   264,   748,  1173,   749,   265,   743,
    1158,   751,   752,   753,   754,   266,   756,   757,   758,   759,
     760,   761,   762,   763,   764,   765,   766,   767,   768,   769,
     770,   771,   772,   773,   774,   775,   776,   777,   778,   779,
      17,    18,   782,   783,   267,   785,   786,   787,   788,   789,
     920,   268,   792,   793,   794,   921,   796,   269,   799,   800,
     801,   802,   803,   804,   805,   806,   807,   808,   809,   205,
     811,   812,   813,   922,   815,   816,   650,   651,   923,   665,
     666,   650,   651,  -121,   826,   639,   828,  1094,   830,  1097,
     924,  1031,   836,   925,   270,  -103,  -103,   199,   271,   650,
     651,   272,   650,   651,   650,   651,  1250,  1195,  1196,  1197,
    1198,  1199,  1200,  1201,  1202,  1203,   650,   651,   926,   650,
     651,   927,   289,   291,   293,   295,   297,   300,   302,   304,
     306,   928,   309,   311,   313,   315,   317,   319,   929,   290,
     930,   947,   650,   651,   650,   651,   931,   650,   651,   932,
     818,   819,   404,   933,   273,   851,   938,   650,   651,   939,
     274,   650,   651,   944,   650,   651,   650,   651,   945,  1162,
    1165,   946,   650,   651,   951,   650,   651,   952,  1172,   650,
     651,   953,   650,   651,   963,   650,   651,   964,   205,   650,
     651,   965,   292,   966,   650,   651,   969,   650,   651,   970,
     650,   651,   972,   650,   651,   974,   275,   650,   651,   975,
     650,   651,   976,   650,   651,   979,   276,   650,   651,   650,
     651,   980,   650,   651,  1010,   650,   651,  1012,   650,   651,
    1020,   650,   651,  1101,   277,   650,   651,  1218,   650,   651,
    1102,   650,   651,  1109,  1225,  1115,  1208,   650,   651,  1116,
     650,   651,   278,   650,   651,   279,   650,   651,   280,   650,
     651,   281,   282,   283,   650,   651,   650,   651,  1117,   650,
     651,   650,   651,  1118,   284,   650,   651,  1119,  1249,   289,
     291,   293,   295,   297,   300,   302,   304,   306,   309,   311,
     313,   315,   317,   319,   650,   651,  1120,   948,  1123,   650,
     651,  1132,   294,   650,   651,  1138,   391,  1139,   285,   949,
     644,  1140,   405,  1141,   307,   296,   322,   650,   651,   301,
    1142,  1286,   650,   651,   650,   651,   303,   650,   651,   650,
     651,   650,   651,   650,   651,   849,   850,   650,   651,   650,
     651,   854,   855,  1143,   852,   853,   650,   651,   305,  1018,
     308,   310,  1147,   869,   872,   323,   874,  1148,   879,  1150,
     645,  1155,   648,   312,   683,  1219,   314,  1228,   750,   650,
     651,  1230,   316,  1231,   890,   891,   870,   873,   650,   651,
     877,   880,  1233,   650,   651,   650,   651,   650,   651,  1235,
    1038,   650,   651,   650,   651,  1239,   318,   650,   651,   650,
     651,  1330,   324,   950,   325,   954,   684,   326,   650,   651,
     685,   327,   686,   955,   328,   650,   651,   956,   329,   330,
     957,   650,   651,   650,   651,   650,   651,   650,   651,   958,
     650,   651,   199,   650,   651,   959,   331,   650,   651,   935,
     650,   651,   960,   332,   961,   333,   962,   334,   973,   650,
     651,   981,   335,   983,   336,   650,   651,   986,   337,   338,
     987,   339,   650,   651,   650,   651,   650,   651,   650,   651,
     988,   650,   651,   650,   651,   989,   340,   650,   651,  1065,
     650,   651,   990,   341,   991,   610,   342,   612,   343,   992,
     650,   651,   993,  1072,   994,   650,   651,   995,   344,   345,
     996,   389,   650,   651,   650,   651,  1211,  1005,  1006,   650,
     651,   998,   650,   651,   650,   651,   346,   650,   651,  1004,
     650,   651,   999,   205,  1000,   347,  1002,  1009,  1003,   402,
    1108,   650,   651,  1110,   348,  1111,  1099,  1100,   845,   846,
    1112,   349,   650,   651,   650,   651,   650,   651,   650,   651,
     650,   651,   350,   650,   651,   650,   651,  1113,   351,   352,
     650,   651,  1107,   353,  1114,   610,   677,   612,   755,   354,
     355,  1035,  1036,  1121,   820,  1122,  1040,   650,   651,  1026,
    1027,  1129,  1028,  1029,   650,   651,  1214,  1032,  1137,  1033,
    1034,  1144,   827,   650,   651,   650,   651,  -122,   356,  1145,
     357,   650,   651,  1146,   358,   359,   360,   199,   650,   651,
     361,   650,   651,   362,  1174,   199,   650,   651,  1177,   650,
     651,  1149,   363,   650,   651,   364,   935,  1180,   365,  1047,
     366,  1048,  1049,  1154,   199,   367,  1050,  1051,  1052,  1053,
    1227,   650,   651,  1054,  1055,  1056,  1057,  1058,  1059,  1060,
    1061,  1062,   368,   650,   651,  1191,  -123,   369,   370,   371,
     650,   651,   372,   373,   374,   610,   375,   612,   376,   377,
    1066,   378,  1068,  1207,  1234,   650,   651,  1073,  1074,  1075,
    1076,  1077,  1078,  1079,  1080,  1081,  1221,  1082,  1083,  1084,
    1236,  1085,  1086,  1237,   650,   651,  1090,  1238,   205,   610,
     379,   612,  1091,   610,  1092,   612,   205,   610,   821,   612,
     650,   651,  -124,   650,   651,  1299,   380,   650,   651,  1300,
    1258,  1301,   381,   829,  1263,   205,  1302,   610,  1282,   612,
    1332,   650,   651,  1265,   382,   650,   651,   837,  -125,   650,
     651,   650,   651,  -126,  1022,  -127,   650,   651,  1309,  -128,
     650,   651,  1125,  1127,  -129,   383,  1131,   650,   651,   384,
    -130,   385,   650,   651,   650,   651,  -131,   386,   650,   651,
     395,   396,  -132,   650,   651,   397,   398,  -134,  1153,   650,
     651,   399,   400,   403,  1157,   650,   651,   213,   838,  1151,
    1152,   650,   651,  1168,   839,  1169,   650,   651,  1252,  1175,
    1176,  -133,  1178,  1179,  1253,  1318,   841,  1320,   199,  -135,
     842,  1181,  1255,  1182,   840,  1183,   650,   651,  1184,  1185,
     650,   651,   650,   651,  1186,  1260,  1187,  1289,   650,   651,
     650,   651,  1291,  1188,  1189,  1190,  1292,   844,  1336,  1295,
     848,   875,  1296,   650,   651,   650,   651,  1209,  1306,  1210,
     650,   651,  1213,  1314,   650,   651,  1317,   650,   651,  1220,
     650,   651,   881,   882,  1324,   883,   650,   651,  1325,   731,
     884,   650,   651,  1335,   650,   651,   885,   199,   199,   886,
     934,  1241,   650,   651,   967,   968,   650,   651,   199,   199,
     971,   650,   651,   977,   978,  1242,   982,   199,   984,   205,
    1254,   997,  1001,  1256,   985,  1257,   687,   688,   689,  1007,
    1261,  1011,  1262,  1013,  1019,  1096,   863,   864,   865,   866,
     867,   650,   651,  1266,  1017,  1267,  1268,  1269,   659,   660,
    1031,   638,   661,  1041,  1042,  1063,  1281,   662,   663,  1196,
    1197,  1198,  1199,  1200,  1201,  1202,  1203,  1293,  1064,  1067,
    1069,  1070,  1297,  1071,  1093,  1087,   199,  1103,  1104,  1128,
    1105,  1133,  1134,   199,  1136,  1156,  1135,  1167,   205,   205,
    1226,  1307,  1303,  1308,  1229,  1232,  1240,  1245,  1246,   205,
     205,  1272,  1280,   199,  1271,  1298,  1322,  1329,   205,  1319,
    1331,  1321,  1338,   834,  1159,  1161,  1164,   199,  1326,  1008,
    1305,   321,  1304,  1046,  1171,  1195,  1196,  1197,  1198,  1199,
    1200,  1201,  1202,  1203,  1273,  1274,  1275,  1276,  1277,  1278,
    1279,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     199,     0,     0,     0,     0,     0,     0,   205,     0,     0,
       0,     0,     0,     0,   205,     0,     0,     0,     0,  1212,
     199,     0,  1215,  1217,     0,     0,     0,     0,     0,  1222,
    1224,     0,     0,     0,   205,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   205,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1248,  1251,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1259,     0,     0,     0,     0,
       0,     0,  1264,     0,     0,     0,     0,     0,     0,     0,
       0,   205,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1283,  1285,     0,  1287,
    1288,   205,  1290,     0,     0,     0,     0,  1294,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1310,     0,     0,  1311,     0,  1312,  1313,
       0,     0,  1315,  1316,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1323,     0,     0,     0,     0,     0,     0,
       0,  1327,     0,     0,  1328,     0,     0,     0,     0,     0,
       0,  1333,  1334,     0,     0,     0,     0,     0,     0,     0,
       0,     1,  1337,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,     0,    12,     0,     0,     0,     0,     0,
      13,     0,    14,     0,     0,     0,     0,     0,     0,     0,
      15,     0,     0,     0,     0,     0,     0,     0,    16,     0,
       0,    17,    18,     0,     0,     0,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,     0,    96,    97,    98,    99,   100,   101,
     102,   103,   104,     0,     0,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   134,   135,   136,   137,   138,   139,
     140,   141,   142,   143,   144,   145,   146,   147,   148,   149,
     150,   151,   152,   153,   154,   155,   156,   157,   158,   159,
     160,   161,   162,   163,   164,   165,   166,   167,   168,   169,
     170,     0,     0,   171,     0,     0,     0,     0,     0,   172,
       0,   173,     0,   174,   175,   176,   177,   178,   179,     0,
     180,     0,     0,     0,     0,     0,     0,     0,     0,   181,
     182,     0,   183,   184,   185,   406,     0,   407,   408,   409,
     410,   411,   412,   413,   414,   415,   416,   417,   418,   419,
     420,   421,   422,   423,   424,   425,   426,   427,   428,   429,
     430,   431,   432,   433,   434,   435,     0,   436,   437,   438,
     439,   440,   441,   442,   443,   444,   445,   446,   447,   448,
     449,   450,   451,   452,   453,   454,   455,   456,   457,   458,
     459,   460,   461,   462,   463,   464,   465,   466,   467,   468,
     469,   470,   471,   472,   473,   474,   475,   476,   477,   478,
     479,   480,   481,   482,   483,   484,   485,   486,   487,   488,
     489,   490,   491,   492,   493,   494,   495,   496,   497,   498,
     499,   500,   501,   502,   503,   504,   505,   506,   507,   508,
     509,   510,   511,   512,   513,   514,   515,   516,   517,   518,
     519,   520,   521,   522,   523,   524,   525,   526,   527,   528,
     529,   530,   531,   532,   533,   534,   535,   536,   537,   538,
     539,   540,   541,   542,   543,   544,   545,   546,   547,   548,
     549,   550,   551,   552,   553,   554,   555,   556,   557,   558,
     559,   560,   561,   562,   563,   564,   565,   566,   567,   568,
     569,   570,   571,   572,   573,   574,   575,   576,   577,   578,
     579,   580,   581,   582,   583,   584,   585,   586,   587,   588,
     589,   590,   591,   592,   593,   594,   595,   596,   597,   598,
     599,   600,   601,   602,   603,   604,   605,   606,   607,   608,
     609,   172,   610,   611,   612,   613,   614,   615,   616,   617,
     618,   619,   620,   621,   622,   623,   624,   625,   626,   627,
     628,   629,   630,   631,   632,   633,   634,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,     0,    12,     0,
       0,     0,     0,     0,    13,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    16,     0,     0,    17,    18,     0,     0,     0,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,     0,    96,    97,
      98,    99,   100,   101,   102,   103,   104,     0,     0,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,     0,     0,   171,     0,     0,
       0,     0,     0,   172,   610,   173,   612,   174,   175,   176,
     177,   178,   179,     0,   180,     0,     0,     0,     0,     0,
       0,     0,   638,   181,   182,  1095,   183,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,     0,    12,     0,
       0,     0,     0,     0,    13,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    16,     0,     0,    17,    18,     0,     0,     0,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,     0,    96,    97,
      98,    99,   100,   101,   102,   103,   104,     0,     0,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,     0,     0,   171,     0,     0,
       0,     0,     0,   172,   610,   173,   612,   174,   175,   176,
     177,   178,   179,     0,   180,     0,     0,     0,     0,     0,
       0,     0,   638,   181,   182,  1163,   183,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,     0,    12,     0,
       0,     0,     0,     0,    13,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    16,     0,     0,    17,    18,     0,     0,     0,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,     0,    96,    97,
      98,    99,   100,   101,   102,   103,   104,     0,     0,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,     0,     0,   171,     0,     0,
       0,     0,     0,   172,   610,   173,   612,   174,   175,   176,
     177,   178,   179,     0,   180,     0,     0,     0,     0,     0,
       0,     0,   638,   181,   182,  1170,   183,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,     0,    12,     0,
       0,     0,     0,     0,    13,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    16,     0,     0,    17,    18,     0,     0,     0,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,     0,    96,    97,
      98,    99,   100,   101,   102,   103,   104,     0,     0,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,     0,     0,   171,     0,     0,
       0,     0,     0,   172,   610,   173,   612,   174,   175,   176,
     177,   178,   179,     0,   180,     0,     0,     0,     0,     0,
       0,     0,   638,   181,   182,  1247,   183,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,     0,    12,     0,
       0,     0,     0,     0,    13,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    16,     0,     0,    17,    18,     0,     0,     0,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,     0,    96,    97,
      98,    99,   100,   101,   102,   103,   104,     0,     0,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,     0,     0,   171,     0,     0,
       0,     0,     0,   172,   610,   173,   612,   174,   175,   176,
     177,   178,   179,     0,   180,     0,     0,     0,     0,     0,
       0,     0,   638,   181,   182,     0,   183,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,     0,    12,     0,
       0,     0,     0,     0,    13,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    16,     0,     0,    17,    18,     0,     0,     0,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,     0,    96,    97,
      98,    99,   100,   101,   102,   103,   104,     0,     0,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,     0,     0,   171,     0,     0,
       0,     0,     0,   172,   610,   173,   612,   174,   175,   176,
     177,   178,   179,     0,   180,     0,     0,     0,     0,     0,
       0,     0,     0,   181,   182,  1160,   183,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,     0,    12,     0,
       0,     0,     0,     0,    13,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    16,     0,     0,    17,    18,     0,     0,     0,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,     0,    96,    97,
      98,    99,   100,   101,   102,   103,   104,     0,     0,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,     0,     0,   171,     0,     0,
       0,     0,     0,   172,   610,   173,   612,   174,   175,   176,
     177,   178,   179,     0,   180,     0,     0,     0,     0,     0,
       0,     0,     0,   181,   182,  1216,   183,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,     0,    12,     0,
       0,     0,     0,     0,    13,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    16,     0,     0,    17,    18,     0,     0,     0,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,     0,    96,    97,
      98,    99,   100,   101,   102,   103,   104,     0,     0,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,     0,     0,   171,     0,     0,
       0,     0,     0,   172,   610,   173,   612,   174,   175,   176,
     177,   178,   179,     0,   180,     0,     0,     0,     0,     0,
       0,     0,     0,   181,   182,  1223,   183,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,     0,    12,     0,
       0,     0,     0,     0,    13,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    16,     0,     0,    17,    18,     0,     0,     0,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,     0,    96,    97,
      98,    99,   100,   101,   102,   103,   104,     0,     0,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,     0,     0,   171,     0,     0,
       0,     0,     0,   172,   610,   173,   612,   174,   175,   176,
     177,   178,   179,     0,   180,     0,     0,     0,     0,     0,
       0,     0,     0,   181,   182,  1284,   183,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,     0,    12,     0,
       0,     0,     0,     0,    13,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    16,     0,     0,    17,    18,     0,     0,     0,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,     0,    96,    97,
      98,    99,   100,   101,   102,   103,   104,     0,     0,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,     0,     0,   171,     0,     0,
       0,     0,     0,   172,   610,   173,   612,   174,   175,   176,
     177,   178,   179,     0,   180,     0,     0,     0,     0,     0,
       0,     0,     0,   181,   182,     0,   183,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,     0,    12,     0,
       0,     0,     0,     0,    13,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    16,     0,     0,    17,    18,     0,     0,     0,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,     0,    96,    97,
      98,    99,   100,   101,   102,   103,   104,     0,     0,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,     0,     0,   171,     0,     0,
       0,     0,     0,   172,     0,   173,     0,   174,   175,   176,
     177,   178,   179,     0,   180,     0,     0,     0,     0,     0,
       0,     0,     0,   181,   182,     0,   183,     2,     3,     4,
       5,     6,     7,     8,   216,    10,    11,     0,    12,     0,
       0,     0,     0,     0,    13,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,   237,     0,     0,     0,     0,
       0,     0,    16,     0,   238,    17,    18,     0,     0,     0,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,   217,   218,   219,   220,   221,   222,   223,   224,   225,
     226,    70,   227,   228,   229,   230,   231,   232,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,     0,    96,    97,
      98,    99,   100,   101,     0,     0,     0,     0,     0,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   152,   153,   154,   155,
     156,   157,   158,   159,   160,     0,   162,     0,   164,   165,
     166,   167,   168,   169,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   233,     0,     0,   175,   176,
       0,     0,   179,     0,   180,     0,     0,     0,     0,     0,
       0,     0,     0,   181,     2,     3,     4,     5,     6,     7,
       8,   216,    10,    11,     0,    12,     0,     0,     0,     0,
       0,    13,     0,    14,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    16,
       0,     0,    17,    18,     0,     0,     0,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,   217,   218,
     219,   220,   221,   222,   223,   224,   225,   226,    70,   227,
     228,   229,   230,   231,   232,    77,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    95,     0,    96,    97,    98,    99,   100,
     101,     0,     0,     0,   673,   674,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,   134,   135,   136,   137,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   152,   153,   154,   155,   156,   157,   158,
     159,   160,     0,   162,     0,   164,   165,   166,   167,   168,
     169,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   233,     0,     0,   175,   176,     0,     0,   179,
       0,   180,     0,     0,     0,     0,     0,     0,     0,     0,
     181,     2,     3,     4,     5,     6,     7,     8,   216,    10,
      11,   671,    12,     0,     0,     0,     0,     0,    13,     0,
      14,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    16,     0,     0,    17,
      18,     0,     0,     0,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,   217,   218,   219,   220,   221,
     222,   223,   224,   225,   226,    70,   227,   228,   229,   230,
     231,   232,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,     0,    96,    97,    98,    99,   100,   101,     0,     0,
       0,     0,     0,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,   134,   135,   136,   137,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     152,   153,   154,   155,   156,   157,   158,   159,   160,     0,
     162,     0,   164,   165,   166,   167,   168,   169,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   233,
       0,     0,   175,   176,     0,     0,   179,     0,   180,     0,
       0,     0,     0,     0,     0,     0,     0,   181,     2,     3,
       4,     5,     6,     7,     8,   216,    10,    11,     0,    12,
       0,     0,     0,     0,     0,    13,     0,    14,     0,     0,
       0,     0,     0,     0,     0,     0,   680,     0,     0,     0,
       0,     0,     0,    16,     0,     0,    17,    18,     0,     0,
       0,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,   217,   218,   219,   220,   221,   222,   223,   224,
     225,   226,    70,   227,   228,   229,   230,   231,   232,    77,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,     0,    96,
      97,    98,    99,   100,   101,     0,     0,     0,     0,     0,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,   134,
     135,   136,   137,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   152,   153,   154,
     155,   156,   157,   158,   159,   160,     0,   162,     0,   164,
     165,   166,   167,   168,   169,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   233,     0,     0,   175,
     176,     0,     0,   179,     0,   180,     0,     0,     0,     0,
       0,     0,     0,     0,   181,     2,     3,     4,     5,     6,
       7,     8,   216,    10,    11,     0,    12,     0,     0,     0,
       0,     0,    13,     0,    14,     0,     0,     0,     0,     0,
       0,     0,   731,     0,     0,     0,     0,     0,     0,     0,
      16,     0,     0,    17,    18,     0,     0,     0,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    59,   217,
     218,   219,   220,   221,   222,   223,   224,   225,   226,    70,
     227,   228,   229,   230,   231,   232,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,     0,    96,    97,    98,    99,
     100,   101,     0,     0,     0,     0,     0,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,   129,   130,   131,   132,   133,   134,   135,   136,   137,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   152,   153,   154,   155,   156,   157,
     158,   159,   160,     0,   162,     0,   164,   165,   166,   167,
     168,   169,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   233,     0,     0,   175,   176,     0,     0,
     179,     0,   180,     0,     0,     0,     0,     0,     0,     0,
       0,   181,     2,     3,     4,     5,     6,     7,     8,   216,
      10,    11,   835,    12,     0,     0,     0,     0,     0,    13,
       0,    14,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    16,     0,     0,
      17,    18,     0,     0,     0,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,   217,   218,   219,   220,
     221,   222,   223,   224,   225,   226,    70,   227,   228,   229,
     230,   231,   232,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,     0,    96,    97,    98,    99,   100,   101,     0,
       0,     0,     0,     0,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,   134,   135,   136,   137,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   152,   153,   154,   155,   156,   157,   158,   159,   160,
       0,   162,     0,   164,   165,   166,   167,   168,   169,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     233,     0,     0,   175,   176,     0,     0,   179,     0,   180,
       0,     0,     0,     0,     0,     0,     0,     0,   181,     2,
       3,     4,     5,     6,     7,     8,   216,    10,    11,  1037,
      12,     0,     0,     0,     0,     0,    13,     0,    14,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    16,     0,     0,    17,    18,     0,
       0,     0,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    55,    56,
      57,    58,    59,   217,   218,   219,   220,   221,   222,   223,
     224,   225,   226,    70,   227,   228,   229,   230,   231,   232,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    95,     0,
      96,    97,    98,    99,   100,   101,     0,     0,     0,     0,
       0,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,   123,
     124,   125,   126,   127,   128,   129,   130,   131,   132,   133,
     134,   135,   136,   137,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   152,   153,
     154,   155,   156,   157,   158,   159,   160,     0,   162,     0,
     164,   165,   166,   167,   168,   169,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   233,     0,     0,
     175,   176,     0,     0,   179,     0,   180,     0,     0,     0,
       0,     0,     0,     0,     0,   181,     2,     3,     4,     5,
       6,     7,     8,   216,    10,    11,     0,    12,     0,     0,
       0,     0,     0,    13,     0,    14,     0,     0,     0,     0,
       0,  1039,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    16,     0,     0,    17,    18,     0,     0,     0,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
     217,   218,   219,   220,   221,   222,   223,   224,   225,   226,
      70,   227,   228,   229,   230,   231,   232,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,     0,    96,    97,    98,
      99,   100,   101,     0,     0,     0,     0,     0,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
     127,   128,   129,   130,   131,   132,   133,   134,   135,   136,
     137,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   152,   153,   154,   155,   156,
     157,   158,   159,   160,     0,   162,     0,   164,   165,   166,
     167,   168,   169,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   233,     0,     0,   175,   176,     0,
       0,   179,     0,   180,     0,     0,     0,     0,     0,     0,
       0,     0,   181,     2,     3,     4,     5,     6,     7,     8,
     216,    10,    11,     0,    12,     0,     0,     0,     0,     0,
      13,     0,    14,     0,     0,     0,     0,  1124,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    16,     0,
       0,    17,    18,     0,     0,     0,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    54,    55,    56,    57,    58,    59,   217,   218,   219,
     220,   221,   222,   223,   224,   225,   226,    70,   227,   228,
     229,   230,   231,   232,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,     0,    96,    97,    98,    99,   100,   101,
       0,     0,     0,     0,     0,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   134,   135,   136,   137,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   152,   153,   154,   155,   156,   157,   158,   159,
     160,     0,   162,     0,   164,   165,   166,   167,   168,   169,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   233,     0,     0,   175,   176,     0,     0,   179,     0,
     180,     0,     0,     0,     0,     0,     0,     0,     0,   181,
       2,     3,     4,     5,     6,     7,     8,   216,    10,    11,
       0,    12,     0,     0,     0,     0,     0,    13,     0,    14,
       0,     0,     0,     0,  1126,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    16,     0,     0,    17,    18,
       0,     0,     0,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,   217,   218,   219,   220,   221,   222,
     223,   224,   225,   226,    70,   227,   228,   229,   230,   231,
     232,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
       0,    96,    97,    98,    99,   100,   101,     0,     0,     0,
       0,     0,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,   122,
     123,   124,   125,   126,   127,   128,   129,   130,   131,   132,
     133,   134,   135,   136,   137,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   152,
     153,   154,   155,   156,   157,   158,   159,   160,     0,   162,
       0,   164,   165,   166,   167,   168,   169,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   233,     0,
       0,   175,   176,     0,     0,   179,     0,   180,     0,     0,
       0,     0,     0,     0,     0,     0,   181,     2,     3,     4,
       5,     6,     7,     8,   216,    10,    11,     0,    12,     0,
       0,     0,     0,     0,    13,     0,    14,     0,     0,     0,
       0,  1130,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    16,     0,     0,    17,    18,     0,     0,     0,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,   217,   218,   219,   220,   221,   222,   223,   224,   225,
     226,    70,   227,   228,   229,   230,   231,   232,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,     0,    96,    97,
      98,    99,   100,   101,     0,     0,     0,     0,     0,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   152,   153,   154,   155,
     156,   157,   158,   159,   160,     0,   162,     0,   164,   165,
     166,   167,   168,   169,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   233,     0,     0,   175,   176,
       0,     0,   179,     0,   180,     0,     0,     0,     0,     0,
       0,     0,     0,   181,     2,     3,     4,     5,     6,     7,
       8,   216,    10,    11,     0,    12,     0,     0,     0,     0,
       0,    13,     0,    14,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    16,
       0,     0,    17,    18,     0,     0,     0,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,   217,   218,
     219,   220,   221,   222,   223,   224,   225,   226,    70,   227,
     228,   229,   230,   231,   232,    77,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    95,     0,    96,    97,    98,    99,   100,
     101,     0,     0,     0,     0,     0,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,   134,   135,   136,   137,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   152,   153,   154,   155,   156,   157,   158,
     159,   160,     0,   162,     0,   164,   165,   166,   167,   168,
     169,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   233,     0,     0,   175,   176,     0,     0,   179,
       0,   180,     0,     0,     0,     0,     0,     0,     0,     0,
     181,     2,     3,     4,     5,     6,     7,     8,   216,    10,
      11,     0,    12,     0,   857,     0,     0,     0,     0,     0,
      14,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    16,     0,     0,    17,
      18,     0,     0,     0,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,   217,   218,   219,   220,   221,
     222,   223,   224,   225,   226,    70,   227,   228,   229,   230,
     231,   232,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
       0,     0,    96,    97,    98,    99,   100,   101,     0,     0,
       0,     0,     0,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,   134,   135,   136,   137,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     152,   153,   154,   155,   156,   157,   158,   159,   160,     0,
     162,     0,   164,   165,   166,   167,   168,   169,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   233,
       0,     0,   175,   176,     0,     0,   179,     0,   180,     0,
       0,     0,     0,     0,     0,     0,     0,   181,     2,     3,
       4,     5,     6,     7,     8,   216,    10,    11,     0,    12,
       0,   859,     0,     0,     0,     0,     0,    14,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    16,     0,     0,    17,    18,     0,     0,
       0,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,   217,   218,   219,   220,   221,   222,   223,   224,
     225,   226,    70,   227,   228,   229,   230,   231,   232,    77,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,     0,     0,    96,
      97,    98,    99,   100,   101,     0,     0,     0,     0,     0,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,   134,
     135,   136,   137,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   152,   153,   154,
     155,   156,   157,   158,   159,   160,     0,   162,     0,   164,
     165,   166,   167,   168,   169,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   233,     0,     0,   175,
     176,     0,     0,   179,     0,   180,     0,     0,     0,     0,
       0,     0,     0,     0,   181,     2,     3,     4,     5,     6,
       7,     8,   216,    10,    11,     0,    12,     0,     0,     0,
       0,     0,     0,     0,    14,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      16,     0,     0,    17,    18,     0,     0,     0,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    59,   217,
     218,   219,   220,   221,   222,   223,   224,   225,   226,    70,
     227,   228,   229,   230,   231,   232,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,     0,     0,    96,    97,    98,    99,
     100,   101,     0,     0,     0,     0,     0,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,   129,   130,   131,   132,   133,   134,   135,   136,   137,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   152,   153,   154,   155,   156,   157,
     158,   159,   160,     0,   162,     0,   164,   165,   166,   167,
     168,   169,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   233,     0,     0,   175,   176,     0,     0,
     179,     0,   180,     0,     0,     0,     0,     0,     0,     0,
       0,   181,     2,     3,     4,     5,     6,     7,     8,   216,
      10,    11,     0,    12,     0,     0,     0,     0,     0,     0,
       0,    14,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   868,     0,     0,
      17,    18,     0,     0,     0,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,   217,   218,   219,   220,
     221,   222,   223,   224,   225,   226,    70,   227,   228,   229,
     230,   231,   232,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,     0,     0,    96,    97,    98,    99,   100,   101,     0,
       0,     0,     0,     0,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,   134,   135,   136,   137,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   152,   153,   154,   155,   156,   157,   158,   159,   160,
       0,   162,     0,   164,   165,   166,   167,   168,   169,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     233,     0,     0,   175,   176,     0,     0,   179,     0,   180,
       0,     0,     0,     0,     0,     0,     0,     0,   181,     2,
       3,     4,     5,     6,     7,     8,   216,    10,    11,     0,
      12,     0,     0,     0,     0,     0,     0,     0,    14,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   871,     0,     0,    17,    18,     0,
       0,     0,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    55,    56,
      57,    58,    59,   217,   218,   219,   220,   221,   222,   223,
     224,   225,   226,    70,   227,   228,   229,   230,   231,   232,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,     0,     0,
      96,    97,    98,    99,   100,   101,     0,     0,     0,     0,
       0,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,   123,
     124,   125,   126,   127,   128,   129,   130,   131,   132,   133,
     134,   135,   136,   137,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   152,   153,
     154,   155,   156,   157,   158,   159,   160,     0,   162,     0,
     164,   165,   166,   167,   168,   169,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   233,     0,     0,
     175,   176,     0,     0,   179,     0,   180,     0,     0,     0,
       0,     0,     0,     0,     0,   181,     2,     3,     4,     5,
       6,     7,     8,   216,    10,    11,     0,    12,     0,     0,
       0,     0,     0,     0,     0,    14,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   878,     0,     0,    17,    18,     0,     0,     0,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
     217,   218,   219,   220,   221,   222,   223,   224,   225,   226,
      70,   227,   228,   229,   230,   231,   232,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,     0,     0,    96,    97,    98,
      99,   100,   101,     0,     0,     0,     0,     0,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
     127,   128,   129,   130,   131,   132,   133,   134,   135,   136,
     137,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   152,   153,   154,   155,   156,
     157,   158,   159,   160,     0,   162,     0,   164,   165,   166,
     167,   168,   169,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   233,     0,     0,   175,   176,     0,
       0,   179,     0,   180,     0,     0,     0,     0,     0,     0,
       0,     0,   181,     2,     3,     4,     5,     6,     7,     8,
     216,    10,    11,     0,    12,     0,     0,     0,     0,     0,
       0,     0,    14,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   876,     0,
       0,     0,     0,     0,     0,     0,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    54,    55,    56,    57,    58,    59,   217,   218,   219,
     220,   221,   222,   223,   224,   225,   226,    70,   227,   228,
     229,   230,   231,   232,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,     0,     0,    96,    97,    98,    99,   100,   101,
       0,     0,     0,     0,     0,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   134,   135,   136,   137,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   152,   153,   154,   155,   156,   157,   158,   159,
     160,     0,   162,     0,   164,   165,   166,   167,   168,   169,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   233,     0,     0,   175,   176,     0,     0,   179,     0,
     180,     0,     0,     0,     0,     0,     0,     0,     0,   181,
       2,     3,     4,     5,     6,     7,     8,   216,    10,    11,
       0,    12,     0,     0,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,   217,   218,   219,   220,   221,   222,
     223,   224,   225,   226,    70,   227,   228,   229,   230,   231,
     232,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,     0,
       0,    96,    97,    98,    99,   100,   101,     0,     0,     0,
       0,     0,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,   122,
     123,   124,   125,   126,   127,   128,   129,   130,   131,   132,
     133,   134,   135,   136,   137,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   152,
     153,   154,   155,   156,   157,   158,   159,   160,     0,   162,
       0,   164,   165,   166,   167,   168,   169,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   233,     0,
       0,   175,   176,     0,     0,   179,     0,   180,     0,     0,
       0,     0,     0,     0,     0,     0,   181
};

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-1183)))

#define yytable_value_is_error(Yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
      11,    12,     0,    14,   187,    17,    18,    13,   638,    12,
      39,    40,  1194,   642,    39,    40,    39,    40,    10,   213,
     654,   655,   656,   657,   658,    18,    10,    16,    14,    13,
      23,    39,    40,    14,    27,    39,    40,    39,    40,    13,
      16,    13,    19,    29,    37,    19,    13,   848,    29,    35,
      13,    21,    19,    13,    35,    13,    48,    12,    12,    45,
      13,    16,    39,    40,    45,    39,    40,    39,    40,    13,
      16,    13,    39,    40,    13,    12,    39,    40,    13,    39,
      40,    39,    40,    13,    95,    13,    39,    40,    13,  1271,
       0,    13,    19,    13,    21,    39,    40,    39,    40,    13,
      39,    40,    13,    12,    39,    40,    13,    16,    13,    39,
      40,    39,    40,    13,    39,    40,    13,    39,    40,    39,
      40,    13,   210,    13,   212,    39,    40,    13,    39,    40,
      12,    15,    39,    40,    39,    40,    16,    17,    13,    39,
      40,    12,    39,    40,    13,    16,    17,    39,    40,    39,
      40,    15,    12,    39,    40,    39,    40,   351,   352,   170,
      12,   355,    13,   174,    39,    40,    13,   361,   362,    13,
      39,    40,   366,    15,    12,    39,    40,    16,   207,   208,
      19,     0,    19,   208,    12,   208,   380,    12,    39,    40,
     384,    28,    39,    40,    31,    39,    40,    39,    40,   201,
     208,    12,   206,   214,   215,    13,   209,    19,   211,    19,
     209,   204,   211,   202,    34,   844,    12,  1018,    12,    39,
      40,    16,    17,   857,    12,   859,   237,    39,    40,    39,
      40,    39,    40,    12,   245,   246,   247,   248,   249,   250,
     251,   252,   253,   254,   255,   256,   257,   258,   259,   260,
     261,   262,   263,   264,   265,   266,   267,   268,   269,   270,
     271,   272,   273,   274,   275,   276,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,    20,   288,   188,   290,
      12,   292,    12,   294,    12,   296,    12,   298,   299,   210,
     301,   212,   303,    12,   305,    39,    40,   308,  1099,   310,
      12,   312,    12,   314,    12,   316,  1107,   318,    12,   307,
     231,   322,   323,   324,   325,    12,   327,   328,   329,   330,
     331,   332,   333,   334,   335,   336,   337,   338,   339,   340,
     341,   342,   343,   344,   345,   346,   347,   348,   349,   350,
      41,    42,   353,   354,    12,   356,   357,   358,   359,   360,
      13,    12,   363,   364,   365,    13,   367,    12,   369,   370,
     371,   372,   373,   374,   375,   376,   377,   378,   379,   188,
     381,   382,   383,    13,   385,   386,    39,    40,    13,    43,
      44,    39,    40,    20,   395,   188,   397,  1017,   399,  1018,
      13,    12,   403,    13,    12,    16,    17,   307,    12,    39,
      40,    12,    39,    40,    39,    40,  1207,   218,   219,   220,
     221,   222,   223,   224,   225,   226,    39,    40,    13,    39,
      40,    13,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    13,    71,    72,    73,    74,    75,    76,    13,    16,
      13,    19,    39,    40,    39,    40,    13,    39,    40,    13,
     204,   205,    21,    13,    12,   649,    13,    39,    40,    13,
      12,    39,    40,    13,    39,    40,    39,    40,    13,  1098,
    1099,    13,    39,    40,    13,    39,    40,    13,  1107,    39,
      40,    13,    39,    40,    13,    39,    40,    13,   307,    39,
      40,    13,    16,    13,    39,    40,    13,    39,    40,    13,
      39,    40,    13,    39,    40,    13,    12,    39,    40,    13,
      39,    40,    13,    39,    40,    13,    12,    39,    40,    39,
      40,    13,    39,    40,    13,    39,    40,    13,    39,    40,
      13,    39,    40,    13,    12,    39,    40,  1166,    39,    40,
      13,    39,    40,    13,  1173,    13,    21,    39,    40,    13,
      39,    40,    12,    39,    40,    12,    39,    40,    12,    39,
      40,    12,    12,    12,    39,    40,    39,    40,    13,    39,
      40,    39,    40,    13,    12,    39,    40,    13,  1207,   218,
     219,   220,   221,   222,   223,   224,   225,   226,   227,   228,
     229,   230,   231,   232,    39,    40,    13,    19,    13,    39,
      40,    13,    16,    39,    40,    13,    29,    13,    12,    19,
      21,    13,     0,    13,    12,    16,    12,    39,    40,    16,
      13,  1250,    39,    40,    39,    40,    16,    39,    40,    39,
      40,    39,    40,    39,    40,   646,   647,    39,    40,    39,
      40,   652,   653,    13,   650,   651,    39,    40,    16,   832,
      16,    16,    13,   665,   666,    12,   667,    13,   670,    13,
      20,    13,    20,    16,    15,    13,    16,    13,   123,    39,
      40,    13,    16,    13,   685,   686,   665,   666,    39,    40,
     669,   670,    13,    39,    40,    39,    40,    39,    40,    13,
     884,    39,    40,    39,    40,    13,    16,    39,    40,    39,
      40,    13,    12,    19,    12,    19,    15,    12,    39,    40,
      19,    12,    21,    19,    12,    39,    40,    19,    12,    12,
      19,    39,    40,    39,    40,    39,    40,    39,    40,    19,
      39,    40,   642,    39,    40,    19,    12,    39,    40,   750,
      39,    40,    19,    12,    19,    12,    19,    12,    19,    39,
      40,    19,    12,    19,    12,    39,    40,    19,    12,    12,
      19,    12,    39,    40,    39,    40,    39,    40,    39,    40,
      19,    39,    40,    39,    40,    19,    12,    39,    40,   973,
      39,    40,    19,    12,    19,   210,    12,   212,    12,    19,
      39,    40,    19,   987,    19,    39,    40,    19,    12,    12,
      19,    10,    39,    40,    39,    40,   231,   818,   819,    39,
      40,    19,    39,    40,    39,    40,    12,    39,    40,   817,
      39,    40,    19,   642,    19,    12,    19,   825,    19,    10,
      19,    39,    40,    19,    12,    19,  1019,  1031,   641,   642,
      19,    12,    39,    40,    39,    40,    39,    40,    39,    40,
      39,    40,    12,    39,    40,    39,    40,    19,    12,    12,
      39,    40,  1045,    12,    19,   210,    16,   212,    13,    12,
      12,   882,   883,    19,    10,    19,   887,    39,    40,   868,
     869,    19,   871,   872,    39,    40,   231,   876,    19,   878,
     879,    19,    10,    39,    40,    39,    40,    20,    12,    19,
      12,    39,    40,    19,    12,    12,    12,   817,    39,    40,
      12,    39,    40,    12,  1108,   825,    39,    40,  1112,    39,
      40,    19,    12,    39,    40,    12,   937,  1121,    12,   940,
      12,   942,   943,    19,   844,    12,   947,   948,   949,   950,
      19,    39,    40,   954,   955,   956,   957,   958,   959,   960,
     961,   962,    12,    39,    40,  1149,    20,    12,    12,    12,
      39,    40,    12,    12,    12,   210,    12,   212,    12,    12,
     981,    12,   983,  1156,    19,    39,    40,   988,   989,   990,
     991,   992,   993,   994,   995,   996,   231,   998,   999,  1000,
      19,  1002,  1003,    19,    39,    40,  1007,    19,   817,   210,
      12,   212,  1013,   210,  1015,   212,   825,   210,   212,   212,
      39,    40,    20,    39,    40,    19,    12,    39,    40,    19,
     231,    19,    12,    10,   231,   844,    19,   210,   231,   212,
      19,    39,    40,  1227,    12,    39,    40,    31,    20,    39,
      40,    39,    40,    20,   847,    20,    39,    40,   231,    20,
      39,    40,  1063,  1064,    20,    12,  1067,    39,    40,    12,
      20,    12,    39,    40,    39,    40,    20,    12,    39,    40,
      12,    12,    20,    39,    40,    12,    12,    20,  1089,    39,
      40,    12,    12,    12,  1095,    39,    40,    12,    16,  1087,
    1088,    39,    40,  1104,    16,  1106,    39,    40,    21,  1110,
    1111,    20,  1113,  1114,    21,  1299,    21,  1301,  1018,    20,
      10,  1122,    21,  1124,    15,  1126,    39,    40,  1129,  1130,
      39,    40,    39,    40,  1135,    21,  1137,    21,    39,    40,
      39,    40,    21,  1144,  1145,  1146,    21,    21,  1332,    21,
      21,    10,    21,    39,    40,    39,    40,  1158,    21,  1160,
      39,    40,  1163,    21,    39,    40,    21,    39,    40,  1170,
      39,    40,    13,    12,    21,    12,    39,    40,    21,    30,
      12,    39,    40,    21,    39,    40,    10,  1087,  1088,    15,
      13,  1192,    39,    40,    13,    13,    39,    40,  1098,  1099,
      13,    39,    40,    13,    13,  1193,    13,  1107,    19,  1018,
    1211,    13,    13,  1214,    19,  1216,    24,    25,    26,    16,
    1221,    13,  1223,    19,    13,  1018,   659,   660,   661,   662,
     663,    39,    40,  1234,    19,  1236,  1237,  1238,    32,    33,
      12,   228,    36,    31,    15,    27,  1247,    41,    42,   219,
     220,   221,   222,   223,   224,   225,   226,  1258,    27,    27,
      10,    10,  1263,    10,    28,   202,  1166,    13,    19,    13,
      15,    13,    13,  1173,    13,    13,    19,    13,  1087,  1088,
      13,  1282,  1270,  1284,    13,    13,    13,   227,    42,  1098,
    1099,    13,    27,  1193,    19,    13,    13,    13,  1107,  1300,
      13,  1302,    13,   402,  1097,  1098,  1099,  1207,  1309,   824,
    1280,    95,  1271,   937,  1107,   218,   219,   220,   221,   222,
     223,   224,   225,   226,   219,   220,   221,   222,   223,   224,
     225,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1250,    -1,    -1,    -1,    -1,    -1,    -1,  1166,    -1,    -1,
      -1,    -1,    -1,    -1,  1173,    -1,    -1,    -1,    -1,  1162,
    1270,    -1,  1165,  1166,    -1,    -1,    -1,    -1,    -1,  1172,
    1173,    -1,    -1,    -1,  1193,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1207,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1207,  1208,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1218,    -1,    -1,    -1,    -1,
      -1,    -1,  1225,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1250,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1249,  1250,    -1,  1252,
    1253,  1270,  1255,    -1,    -1,    -1,    -1,  1260,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1286,    -1,    -1,  1289,    -1,  1291,  1292,
      -1,    -1,  1295,  1296,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1306,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1314,    -1,    -1,  1317,    -1,    -1,    -1,    -1,    -1,
      -1,  1324,  1325,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     1,  1335,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    -1,    14,    -1,    -1,    -1,    -1,    -1,
      20,    -1,    22,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      30,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    38,    -1,
      -1,    41,    42,    -1,    -1,    -1,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,    97,    98,    99,
     100,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,    -1,   124,   125,   126,   127,   128,   129,
     130,   131,   132,    -1,    -1,   135,   136,   137,   138,   139,
     140,   141,   142,   143,   144,   145,   146,   147,   148,   149,
     150,   151,   152,   153,   154,   155,   156,   157,   158,   159,
     160,   161,   162,   163,   164,   165,   166,   167,   168,   169,
     170,   171,   172,   173,   174,   175,   176,   177,   178,   179,
     180,   181,   182,   183,   184,   185,   186,   187,   188,   189,
     190,   191,   192,   193,   194,   195,   196,   197,   198,   199,
     200,    -1,    -1,   203,    -1,    -1,    -1,    -1,    -1,   209,
      -1,   211,    -1,   213,   214,   215,   216,   217,   218,    -1,
     220,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   229,
     230,    -1,   232,   233,   234,     3,    -1,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    -1,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,    96,    97,
      98,    99,   100,   101,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,   129,   130,   131,   132,   133,   134,   135,   136,   137,
     138,   139,   140,   141,   142,   143,   144,   145,   146,   147,
     148,   149,   150,   151,   152,   153,   154,   155,   156,   157,
     158,   159,   160,   161,   162,   163,   164,   165,   166,   167,
     168,   169,   170,   171,   172,   173,   174,   175,   176,   177,
     178,   179,   180,   181,   182,   183,   184,   185,   186,   187,
     188,   189,   190,   191,   192,   193,   194,   195,   196,   197,
     198,   199,   200,   201,   202,   203,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,   214,   215,   216,   217,
     218,   219,   220,   221,   222,   223,   224,   225,   226,   227,
     228,   229,   230,   231,   232,   233,   234,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,    -1,   124,   125,
     126,   127,   128,   129,   130,   131,   132,    -1,    -1,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,   178,   179,   180,   181,   182,   183,   184,   185,
     186,   187,   188,   189,   190,   191,   192,   193,   194,   195,
     196,   197,   198,   199,   200,    -1,    -1,   203,    -1,    -1,
      -1,    -1,    -1,   209,   210,   211,   212,   213,   214,   215,
     216,   217,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   228,   229,   230,   231,   232,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,    -1,   124,   125,
     126,   127,   128,   129,   130,   131,   132,    -1,    -1,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,   178,   179,   180,   181,   182,   183,   184,   185,
     186,   187,   188,   189,   190,   191,   192,   193,   194,   195,
     196,   197,   198,   199,   200,    -1,    -1,   203,    -1,    -1,
      -1,    -1,    -1,   209,   210,   211,   212,   213,   214,   215,
     216,   217,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   228,   229,   230,   231,   232,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,    -1,   124,   125,
     126,   127,   128,   129,   130,   131,   132,    -1,    -1,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,   178,   179,   180,   181,   182,   183,   184,   185,
     186,   187,   188,   189,   190,   191,   192,   193,   194,   195,
     196,   197,   198,   199,   200,    -1,    -1,   203,    -1,    -1,
      -1,    -1,    -1,   209,   210,   211,   212,   213,   214,   215,
     216,   217,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   228,   229,   230,   231,   232,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,    -1,   124,   125,
     126,   127,   128,   129,   130,   131,   132,    -1,    -1,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,   178,   179,   180,   181,   182,   183,   184,   185,
     186,   187,   188,   189,   190,   191,   192,   193,   194,   195,
     196,   197,   198,   199,   200,    -1,    -1,   203,    -1,    -1,
      -1,    -1,    -1,   209,   210,   211,   212,   213,   214,   215,
     216,   217,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   228,   229,   230,   231,   232,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,    -1,   124,   125,
     126,   127,   128,   129,   130,   131,   132,    -1,    -1,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,   178,   179,   180,   181,   182,   183,   184,   185,
     186,   187,   188,   189,   190,   191,   192,   193,   194,   195,
     196,   197,   198,   199,   200,    -1,    -1,   203,    -1,    -1,
      -1,    -1,    -1,   209,   210,   211,   212,   213,   214,   215,
     216,   217,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   228,   229,   230,    -1,   232,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,    -1,   124,   125,
     126,   127,   128,   129,   130,   131,   132,    -1,    -1,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,   178,   179,   180,   181,   182,   183,   184,   185,
     186,   187,   188,   189,   190,   191,   192,   193,   194,   195,
     196,   197,   198,   199,   200,    -1,    -1,   203,    -1,    -1,
      -1,    -1,    -1,   209,   210,   211,   212,   213,   214,   215,
     216,   217,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   229,   230,   231,   232,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,    -1,   124,   125,
     126,   127,   128,   129,   130,   131,   132,    -1,    -1,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,   178,   179,   180,   181,   182,   183,   184,   185,
     186,   187,   188,   189,   190,   191,   192,   193,   194,   195,
     196,   197,   198,   199,   200,    -1,    -1,   203,    -1,    -1,
      -1,    -1,    -1,   209,   210,   211,   212,   213,   214,   215,
     216,   217,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   229,   230,   231,   232,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,    -1,   124,   125,
     126,   127,   128,   129,   130,   131,   132,    -1,    -1,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,   178,   179,   180,   181,   182,   183,   184,   185,
     186,   187,   188,   189,   190,   191,   192,   193,   194,   195,
     196,   197,   198,   199,   200,    -1,    -1,   203,    -1,    -1,
      -1,    -1,    -1,   209,   210,   211,   212,   213,   214,   215,
     216,   217,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   229,   230,   231,   232,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,    -1,   124,   125,
     126,   127,   128,   129,   130,   131,   132,    -1,    -1,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,   178,   179,   180,   181,   182,   183,   184,   185,
     186,   187,   188,   189,   190,   191,   192,   193,   194,   195,
     196,   197,   198,   199,   200,    -1,    -1,   203,    -1,    -1,
      -1,    -1,    -1,   209,   210,   211,   212,   213,   214,   215,
     216,   217,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   229,   230,   231,   232,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,    -1,   124,   125,
     126,   127,   128,   129,   130,   131,   132,    -1,    -1,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,   178,   179,   180,   181,   182,   183,   184,   185,
     186,   187,   188,   189,   190,   191,   192,   193,   194,   195,
     196,   197,   198,   199,   200,    -1,    -1,   203,    -1,    -1,
      -1,    -1,    -1,   209,   210,   211,   212,   213,   214,   215,
     216,   217,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   229,   230,    -1,   232,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,    -1,   124,   125,
     126,   127,   128,   129,   130,   131,   132,    -1,    -1,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,   178,   179,   180,   181,   182,   183,   184,   185,
     186,   187,   188,   189,   190,   191,   192,   193,   194,   195,
     196,   197,   198,   199,   200,    -1,    -1,   203,    -1,    -1,
      -1,    -1,    -1,   209,    -1,   211,    -1,   213,   214,   215,
     216,   217,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   229,   230,    -1,   232,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    31,    -1,    -1,    -1,    -1,
      -1,    -1,    38,    -1,    40,    41,    42,    -1,    -1,    -1,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,    -1,   124,   125,
     126,   127,   128,   129,    -1,    -1,    -1,    -1,    -1,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   182,   183,   184,   185,
     186,   187,   188,   189,   190,    -1,   192,    -1,   194,   195,
     196,   197,   198,   199,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   211,    -1,    -1,   214,   215,
      -1,    -1,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   229,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    -1,    14,    -1,    -1,    -1,    -1,
      -1,    20,    -1,    22,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    38,
      -1,    -1,    41,    42,    -1,    -1,    -1,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,    97,    98,
      99,   100,   101,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,    -1,   124,   125,   126,   127,   128,
     129,    -1,    -1,    -1,   133,   134,   135,   136,   137,   138,
     139,   140,   141,   142,   143,   144,   145,   146,   147,   148,
     149,   150,   151,   152,   153,   154,   155,   156,   157,   158,
     159,   160,   161,   162,   163,   164,   165,   166,   167,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   182,   183,   184,   185,   186,   187,   188,
     189,   190,    -1,   192,    -1,   194,   195,   196,   197,   198,
     199,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   211,    -1,    -1,   214,   215,    -1,    -1,   218,
      -1,   220,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     229,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    -1,    -1,    -1,    -1,    -1,    20,    -1,
      22,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    38,    -1,    -1,    41,
      42,    -1,    -1,    -1,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    95,    96,    97,    98,    99,   100,   101,
     102,   103,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
     122,    -1,   124,   125,   126,   127,   128,   129,    -1,    -1,
      -1,    -1,    -1,   135,   136,   137,   138,   139,   140,   141,
     142,   143,   144,   145,   146,   147,   148,   149,   150,   151,
     152,   153,   154,   155,   156,   157,   158,   159,   160,   161,
     162,   163,   164,   165,   166,   167,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     182,   183,   184,   185,   186,   187,   188,   189,   190,    -1,
     192,    -1,   194,   195,   196,   197,   198,   199,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,
      -1,    -1,   214,   215,    -1,    -1,   218,    -1,   220,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   229,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    -1,    14,
      -1,    -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    31,    -1,    -1,    -1,
      -1,    -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,
      -1,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,    -1,   124,
     125,   126,   127,   128,   129,    -1,    -1,    -1,    -1,    -1,
     135,   136,   137,   138,   139,   140,   141,   142,   143,   144,
     145,   146,   147,   148,   149,   150,   151,   152,   153,   154,
     155,   156,   157,   158,   159,   160,   161,   162,   163,   164,
     165,   166,   167,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   182,   183,   184,
     185,   186,   187,   188,   189,   190,    -1,   192,    -1,   194,
     195,   196,   197,   198,   199,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   211,    -1,    -1,   214,
     215,    -1,    -1,   218,    -1,   220,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   229,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    -1,    14,    -1,    -1,    -1,
      -1,    -1,    20,    -1,    22,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    30,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      38,    -1,    -1,    41,    42,    -1,    -1,    -1,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,    96,    97,
      98,    99,   100,   101,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,    -1,   124,   125,   126,   127,
     128,   129,    -1,    -1,    -1,    -1,    -1,   135,   136,   137,
     138,   139,   140,   141,   142,   143,   144,   145,   146,   147,
     148,   149,   150,   151,   152,   153,   154,   155,   156,   157,
     158,   159,   160,   161,   162,   163,   164,   165,   166,   167,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   182,   183,   184,   185,   186,   187,
     188,   189,   190,    -1,   192,    -1,   194,   195,   196,   197,
     198,   199,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   211,    -1,    -1,   214,   215,    -1,    -1,
     218,    -1,   220,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   229,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    -1,    -1,    -1,    -1,    -1,    20,
      -1,    22,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    38,    -1,    -1,
      41,    42,    -1,    -1,    -1,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,    99,   100,
     101,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,    -1,   124,   125,   126,   127,   128,   129,    -1,
      -1,    -1,    -1,    -1,   135,   136,   137,   138,   139,   140,
     141,   142,   143,   144,   145,   146,   147,   148,   149,   150,
     151,   152,   153,   154,   155,   156,   157,   158,   159,   160,
     161,   162,   163,   164,   165,   166,   167,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   182,   183,   184,   185,   186,   187,   188,   189,   190,
      -1,   192,    -1,   194,   195,   196,   197,   198,   199,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     211,    -1,    -1,   214,   215,    -1,    -1,   218,    -1,   220,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   229,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    -1,    -1,    -1,    -1,    -1,    20,    -1,    22,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    38,    -1,    -1,    41,    42,    -1,
      -1,    -1,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,    -1,
     124,   125,   126,   127,   128,   129,    -1,    -1,    -1,    -1,
      -1,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   182,   183,
     184,   185,   186,   187,   188,   189,   190,    -1,   192,    -1,
     194,   195,   196,   197,   198,   199,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,    -1,    -1,
     214,   215,    -1,    -1,   218,    -1,   220,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   229,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    -1,    14,    -1,    -1,
      -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      97,    98,    99,   100,   101,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,    -1,   124,   125,   126,
     127,   128,   129,    -1,    -1,    -1,    -1,    -1,   135,   136,
     137,   138,   139,   140,   141,   142,   143,   144,   145,   146,
     147,   148,   149,   150,   151,   152,   153,   154,   155,   156,
     157,   158,   159,   160,   161,   162,   163,   164,   165,   166,
     167,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   182,   183,   184,   185,   186,
     187,   188,   189,   190,    -1,   192,    -1,   194,   195,   196,
     197,   198,   199,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   211,    -1,    -1,   214,   215,    -1,
      -1,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   229,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    -1,    14,    -1,    -1,    -1,    -1,    -1,
      20,    -1,    22,    -1,    -1,    -1,    -1,    27,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    38,    -1,
      -1,    41,    42,    -1,    -1,    -1,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,    97,    98,    99,
     100,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,    -1,   124,   125,   126,   127,   128,   129,
      -1,    -1,    -1,    -1,    -1,   135,   136,   137,   138,   139,
     140,   141,   142,   143,   144,   145,   146,   147,   148,   149,
     150,   151,   152,   153,   154,   155,   156,   157,   158,   159,
     160,   161,   162,   163,   164,   165,   166,   167,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   182,   183,   184,   185,   186,   187,   188,   189,
     190,    -1,   192,    -1,   194,   195,   196,   197,   198,   199,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   211,    -1,    -1,   214,   215,    -1,    -1,   218,    -1,
     220,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   229,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      -1,    14,    -1,    -1,    -1,    -1,    -1,    20,    -1,    22,
      -1,    -1,    -1,    -1,    27,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    38,    -1,    -1,    41,    42,
      -1,    -1,    -1,    46,    47,    48,    49,    50,    51,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,    99,   100,   101,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,   122,
      -1,   124,   125,   126,   127,   128,   129,    -1,    -1,    -1,
      -1,    -1,   135,   136,   137,   138,   139,   140,   141,   142,
     143,   144,   145,   146,   147,   148,   149,   150,   151,   152,
     153,   154,   155,   156,   157,   158,   159,   160,   161,   162,
     163,   164,   165,   166,   167,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   182,
     183,   184,   185,   186,   187,   188,   189,   190,    -1,   192,
      -1,   194,   195,   196,   197,   198,   199,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,    -1,
      -1,   214,   215,    -1,    -1,   218,    -1,   220,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   229,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,
      -1,    27,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,    -1,   124,   125,
     126,   127,   128,   129,    -1,    -1,    -1,    -1,    -1,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   182,   183,   184,   185,
     186,   187,   188,   189,   190,    -1,   192,    -1,   194,   195,
     196,   197,   198,   199,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   211,    -1,    -1,   214,   215,
      -1,    -1,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   229,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    -1,    14,    -1,    -1,    -1,    -1,
      -1,    20,    -1,    22,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    38,
      -1,    -1,    41,    42,    -1,    -1,    -1,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,    97,    98,
      99,   100,   101,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,    -1,   124,   125,   126,   127,   128,
     129,    -1,    -1,    -1,    -1,    -1,   135,   136,   137,   138,
     139,   140,   141,   142,   143,   144,   145,   146,   147,   148,
     149,   150,   151,   152,   153,   154,   155,   156,   157,   158,
     159,   160,   161,   162,   163,   164,   165,   166,   167,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   182,   183,   184,   185,   186,   187,   188,
     189,   190,    -1,   192,    -1,   194,   195,   196,   197,   198,
     199,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   211,    -1,    -1,   214,   215,    -1,    -1,   218,
      -1,   220,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     229,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    -1,    14,    -1,    16,    -1,    -1,    -1,    -1,    -1,
      22,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    38,    -1,    -1,    41,
      42,    -1,    -1,    -1,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    95,    96,    97,    98,    99,   100,   101,
     102,   103,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
      -1,    -1,   124,   125,   126,   127,   128,   129,    -1,    -1,
      -1,    -1,    -1,   135,   136,   137,   138,   139,   140,   141,
     142,   143,   144,   145,   146,   147,   148,   149,   150,   151,
     152,   153,   154,   155,   156,   157,   158,   159,   160,   161,
     162,   163,   164,   165,   166,   167,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     182,   183,   184,   185,   186,   187,   188,   189,   190,    -1,
     192,    -1,   194,   195,   196,   197,   198,   199,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,
      -1,    -1,   214,   215,    -1,    -1,   218,    -1,   220,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   229,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    -1,    14,
      -1,    16,    -1,    -1,    -1,    -1,    -1,    22,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,
      -1,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,    -1,    -1,   124,
     125,   126,   127,   128,   129,    -1,    -1,    -1,    -1,    -1,
     135,   136,   137,   138,   139,   140,   141,   142,   143,   144,
     145,   146,   147,   148,   149,   150,   151,   152,   153,   154,
     155,   156,   157,   158,   159,   160,   161,   162,   163,   164,
     165,   166,   167,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   182,   183,   184,
     185,   186,   187,   188,   189,   190,    -1,   192,    -1,   194,
     195,   196,   197,   198,   199,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   211,    -1,    -1,   214,
     215,    -1,    -1,   218,    -1,   220,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   229,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    -1,    14,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    22,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      38,    -1,    -1,    41,    42,    -1,    -1,    -1,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,    96,    97,
      98,    99,   100,   101,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,    -1,    -1,   124,   125,   126,   127,
     128,   129,    -1,    -1,    -1,    -1,    -1,   135,   136,   137,
     138,   139,   140,   141,   142,   143,   144,   145,   146,   147,
     148,   149,   150,   151,   152,   153,   154,   155,   156,   157,
     158,   159,   160,   161,   162,   163,   164,   165,   166,   167,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   182,   183,   184,   185,   186,   187,
     188,   189,   190,    -1,   192,    -1,   194,   195,   196,   197,
     198,   199,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   211,    -1,    -1,   214,   215,    -1,    -1,
     218,    -1,   220,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   229,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    -1,    14,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    22,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    38,    -1,    -1,
      41,    42,    -1,    -1,    -1,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,    99,   100,
     101,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,    -1,    -1,   124,   125,   126,   127,   128,   129,    -1,
      -1,    -1,    -1,    -1,   135,   136,   137,   138,   139,   140,
     141,   142,   143,   144,   145,   146,   147,   148,   149,   150,
     151,   152,   153,   154,   155,   156,   157,   158,   159,   160,
     161,   162,   163,   164,   165,   166,   167,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   182,   183,   184,   185,   186,   187,   188,   189,   190,
      -1,   192,    -1,   194,   195,   196,   197,   198,   199,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     211,    -1,    -1,   214,   215,    -1,    -1,   218,    -1,   220,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   229,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    -1,
      14,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    22,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    38,    -1,    -1,    41,    42,    -1,
      -1,    -1,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,    -1,    -1,
     124,   125,   126,   127,   128,   129,    -1,    -1,    -1,    -1,
      -1,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   182,   183,
     184,   185,   186,   187,   188,   189,   190,    -1,   192,    -1,
     194,   195,   196,   197,   198,   199,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,    -1,    -1,
     214,   215,    -1,    -1,   218,    -1,   220,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   229,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    -1,    14,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    22,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      97,    98,    99,   100,   101,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,    -1,    -1,   124,   125,   126,
     127,   128,   129,    -1,    -1,    -1,    -1,    -1,   135,   136,
     137,   138,   139,   140,   141,   142,   143,   144,   145,   146,
     147,   148,   149,   150,   151,   152,   153,   154,   155,   156,
     157,   158,   159,   160,   161,   162,   163,   164,   165,   166,
     167,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   182,   183,   184,   185,   186,
     187,   188,   189,   190,    -1,   192,    -1,   194,   195,   196,
     197,   198,   199,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   211,    -1,    -1,   214,   215,    -1,
      -1,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   229,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    -1,    14,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    22,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    38,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,    97,    98,    99,
     100,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,    -1,    -1,   124,   125,   126,   127,   128,   129,
      -1,    -1,    -1,    -1,    -1,   135,   136,   137,   138,   139,
     140,   141,   142,   143,   144,   145,   146,   147,   148,   149,
     150,   151,   152,   153,   154,   155,   156,   157,   158,   159,
     160,   161,   162,   163,   164,   165,   166,   167,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   182,   183,   184,   185,   186,   187,   188,   189,
     190,    -1,   192,    -1,   194,   195,   196,   197,   198,   199,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   211,    -1,    -1,   214,   215,    -1,    -1,   218,    -1,
     220,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   229,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      -1,    14,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    22,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    46,    47,    48,    49,    50,    51,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,    99,   100,   101,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,    -1,
      -1,   124,   125,   126,   127,   128,   129,    -1,    -1,    -1,
      -1,    -1,   135,   136,   137,   138,   139,   140,   141,   142,
     143,   144,   145,   146,   147,   148,   149,   150,   151,   152,
     153,   154,   155,   156,   157,   158,   159,   160,   161,   162,
     163,   164,   165,   166,   167,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   182,
     183,   184,   185,   186,   187,   188,   189,   190,    -1,   192,
      -1,   194,   195,   196,   197,   198,   199,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,    -1,
      -1,   214,   215,    -1,    -1,   218,    -1,   220,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   229
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     1,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    14,    20,    22,    30,    38,    41,    42,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      97,    98,    99,   100,   101,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   124,   125,   126,   127,
     128,   129,   130,   131,   132,   135,   136,   137,   138,   139,
     140,   141,   142,   143,   144,   145,   146,   147,   148,   149,
     150,   151,   152,   153,   154,   155,   156,   157,   158,   159,
     160,   161,   162,   163,   164,   165,   166,   167,   168,   169,
     170,   171,   172,   173,   174,   175,   176,   177,   178,   179,
     180,   181,   182,   183,   184,   185,   186,   187,   188,   189,
     190,   191,   192,   193,   194,   195,   196,   197,   198,   199,
     200,   203,   209,   211,   213,   214,   215,   216,   217,   218,
     220,   229,   230,   232,   233,   234,   236,   237,   238,   240,
     248,   249,   250,   251,   252,   253,   254,   258,   259,   260,
     261,   262,   263,   264,   265,   266,   269,   270,   272,   273,
     274,   276,    21,    12,    16,    17,    10,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,    98,    99,   100,
     101,   102,   103,   211,   258,   260,   266,    31,    40,   258,
     261,   258,   265,   263,   263,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    16,   275,    16,   275,
      16,   275,    16,   275,    16,   275,    16,   275,    12,    16,
     275,    16,   275,    16,   275,    16,   275,    12,    16,   275,
      16,   275,    16,   275,    16,   275,    16,   275,    16,   275,
     258,   259,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,   241,   258,    10,
     242,    29,   255,   257,   258,    12,    12,    12,    12,    12,
      12,   247,    10,    12,    21,     0,     3,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,    97,    98,
      99,   100,   101,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,   134,   135,   136,   137,   138,
     139,   140,   141,   142,   143,   144,   145,   146,   147,   148,
     149,   150,   151,   152,   153,   154,   155,   156,   157,   158,
     159,   160,   161,   162,   163,   164,   165,   166,   167,   168,
     169,   170,   171,   172,   173,   174,   175,   176,   177,   178,
     179,   180,   181,   182,   183,   184,   185,   186,   187,   188,
     189,   190,   191,   192,   193,   194,   195,   196,   197,   198,
     199,   200,   201,   202,   203,   204,   205,   206,   207,   208,
     210,   211,   212,   213,   214,   215,   216,   217,   218,   219,
     220,   221,   222,   223,   224,   225,   226,   227,   228,   229,
     230,   231,   232,   233,   234,   238,   239,   281,   228,   239,
     240,   243,   244,   245,    21,    20,    16,    17,    20,    19,
      39,    40,    16,    17,    18,    23,    27,    37,   204,    32,
      33,    36,    41,    42,   265,    43,    44,    14,    29,    35,
      45,    13,   254,   133,   134,   258,   258,    16,    13,    29,
      31,   258,   271,    15,    15,    19,    21,    24,    25,    26,
     258,   258,   258,   258,   258,   258,   258,   258,   258,   258,
     258,   258,   258,   258,   258,   258,   258,   258,   258,   258,
     258,   258,   258,   258,   258,   258,   258,   258,   258,   258,
     258,   258,   258,   258,   258,   258,   258,   258,   258,   258,
     258,    30,   258,   258,   258,   258,   258,   258,   258,   258,
     258,   258,   258,   240,   258,   258,   258,   258,   258,   258,
     123,   258,   258,   258,   258,    13,   258,   258,   258,   258,
     258,   258,   258,   258,   258,   258,   258,   258,   258,   258,
     258,   258,   258,   258,   258,   258,   258,   258,   258,   258,
     254,   254,   258,   258,   254,   258,   258,   258,   258,   258,
     254,   254,   258,   258,   258,   254,   258,    10,    48,   258,
     258,   258,   258,   258,   258,   258,   258,   258,   258,   258,
     254,   258,   258,   258,   254,   258,   258,   201,   204,   205,
      10,   212,    19,    21,   256,   208,   258,    10,   258,    10,
     258,    10,    13,   246,   247,    13,   258,    31,    16,    16,
      15,    21,    10,   246,    21,   239,   239,   243,    21,   258,
     258,   254,   261,   261,   258,   258,   262,    16,   262,    16,
     262,   262,   262,   264,   264,   264,   264,   264,    38,   263,
     265,    38,   263,   265,   258,    10,    38,   265,    38,   263,
     265,    13,    12,    12,    12,    10,    15,    19,    28,    31,
     258,   258,    13,    13,    13,    13,    13,    13,    13,    13,
      13,    13,    13,    13,    13,    13,    13,    13,    13,    13,
      13,    13,    13,    13,    13,    13,    13,    13,    13,    13,
      13,    13,    13,    13,    13,    13,    13,    13,    13,    13,
      13,    13,    13,    13,    13,   258,   267,   268,    13,    13,
      19,    13,    19,    19,    13,    13,    13,    19,    19,    19,
      19,    13,    13,    13,    19,    19,    19,    19,    19,    19,
      19,    19,    19,    13,    13,    13,    13,    13,    13,    13,
      13,    13,    13,    19,    13,    13,    13,    13,    13,    13,
      13,    19,    13,    19,    19,    19,    19,    19,    19,    19,
      19,    19,    19,    19,    19,    19,    19,    13,    19,    19,
      19,    13,    19,    19,   240,   258,   258,    16,   255,   240,
      13,    13,    13,    19,    13,    19,    16,    19,   238,    13,
      13,   243,   239,   244,   262,   262,   265,   265,   265,   265,
      15,    12,   265,   265,   265,   258,   258,    13,   254,    28,
     258,    31,    15,    15,    15,    34,   267,   258,   258,   258,
     258,   258,   258,   258,   258,   258,   258,   258,   258,   258,
     258,   258,   258,    27,    27,   254,   258,    27,   258,    10,
      10,    10,   254,   258,   258,   258,   258,   258,   258,   258,
     258,   258,   258,   258,   258,   258,   258,   202,   208,   206,
     258,   258,   258,    28,   246,   231,   239,   243,   244,   238,
     254,    13,    13,    13,    19,    15,    12,   238,    19,    13,
      19,    19,    19,    19,    19,    13,    13,    13,    13,    13,
      13,    19,    19,    13,    27,   258,    27,   258,    13,    19,
      27,   258,    13,    13,    13,    19,    13,    19,    13,    13,
      13,    13,    13,    13,    19,    19,    19,    13,    13,    19,
      13,   240,   240,   258,    19,    13,    13,   258,   231,   239,
     231,   239,   243,   231,   239,   243,   244,    13,   258,   258,
     231,   239,   243,   244,   254,   258,   258,   254,   258,   258,
     254,   258,   258,   258,   258,   258,   258,   258,   258,   258,
     258,   254,   207,   208,    12,   218,   219,   220,   221,   222,
     223,   224,   225,   226,   277,   278,   280,   238,    21,   258,
     258,   231,   239,   258,   231,   239,   231,   239,   243,    13,
     258,   231,   239,   231,   239,   243,    13,    19,    13,    13,
      13,    13,    13,    13,    19,    13,    19,    19,    19,    13,
      13,   258,   240,   277,   279,   227,    42,   231,   239,   243,
     244,   239,    21,    21,   258,    21,   258,   258,   231,   239,
      21,   258,   258,   231,   239,   254,   258,   258,   258,   258,
     208,    19,    13,   219,   220,   221,   222,   223,   224,   225,
      27,   258,   231,   239,   231,   239,   243,   239,   239,    21,
     239,    21,    21,   258,   239,    21,    21,   258,    13,    19,
      19,    19,    19,   240,   279,   278,    21,   258,   258,   231,
     239,   239,   239,   239,    21,   239,   239,    21,   254,   258,
     254,   258,    13,   239,    21,    21,   258,   239,   239,    13,
      13,    13,    19,   239,   239,    21,   254,   239,    13
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))

/* Error token number */
#define YYTERROR	1
#define YYERRCODE	256


/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */
#ifdef YYLEX_PARAM
# define YYLEX yylex (&yylval, YYLEX_PARAM)
#else
# define YYLEX yylex (&yylval)
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULL, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULL;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - Assume YYFAIL is not used.  It's too flawed to consider.  See
       <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
       for details.  YYERROR is fine as it does not invoke this
       function.
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULL, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YYUSE (yytype);
}




/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
/* The lookahead symbol.  */
int yychar;


#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
/* Default value used for initialization, for pacifying older GCCs
   or non-GCC compilers.  */
static YYSTYPE yyval_default;
# define YY_INITIAL_VALUE(Value) = Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval YY_INITIAL_VALUE(yyval_default);

    /* Number of syntax errors so far.  */
    int yynerrs;

    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
/* Line 1787 of yacc.c  */
#line 452 "parser.y"
    {
			    parsedThing = (yyvsp[(1) - (2)].tree);
			    (yyval.other) = NULL;
			    YYACCEPT;
			  }
    break;

  case 3:
/* Line 1787 of yacc.c  */
#line 458 "parser.y"
    {
			    outputMode();
                            sollyaPrintf("This is %s.\nType 'help help;' for the list of available commands. Type 'help <command>;' for help on the specific command <command>.\nType 'quit;' for quitting the %s interpreter.\n\nYou can get moral support and help with bugs by writing to %s.\n\n",PACKAGE_NAME,PACKAGE_NAME,PACKAGE_BUGREPORT);
			    parsedThing = NULL;
			    (yyval.other) = NULL;
			    YYACCEPT;
			  }
    break;

  case 4:
/* Line 1787 of yacc.c  */
#line 466 "parser.y"
    {
			    outputMode();
                            sollyaPrintf("This is %s.\nType 'help help;' for the list of available commands. Type 'help <command>;' for help on the specific command <command>.\nType 'quit;' for quitting the %s interpreter.\n\nYou can get moral support and help with bugs by writing to %s.\n\n",PACKAGE_NAME,PACKAGE_NAME,PACKAGE_BUGREPORT);
			    parsedThing = NULL;
			    (yyval.other) = NULL;
			    YYACCEPT;
			  }
    break;

  case 5:
/* Line 1787 of yacc.c  */
#line 474 "parser.y"
    {
			    parsedThing = NULL;
			    (yyval.other) = NULL;
			    YYACCEPT;
			  }
    break;

  case 6:
/* Line 1787 of yacc.c  */
#line 480 "parser.y"
    {
			    outputMode();
			    sollyaPrintf("This is\n\n\t%s.\n\nCopyright 2006-2013 by\n\n    Laboratoire de l'Informatique du Parallelisme,\n    UMR CNRS - ENS Lyon - UCB Lyon 1 - INRIA 5668, Lyon, France,\n\n    LORIA (CNRS, INPL, INRIA, UHP, U-Nancy 2), Nancy, France,\n\n    Laboratoire d'Informatique de Paris 6, equipe PEQUAN,\n    UPMC Universite Paris 06 - CNRS - UMR 7606 - LIP6, Paris, France,\n\nand by\n\n    INRIA Sophia-Antipolis Mediterranee, APICS Team,\n    Sophia-Antipolis, France.\n\nAll rights reserved.\n\nContributors are S. Chevillard, N. Jourdan, M. Joldes and Ch. Lauter.\n\nThis software is governed by the CeCILL-C license under French law and\nabiding by the rules of distribution of free software.  You can  use,\nmodify and/ or redistribute the software under the terms of the CeCILL-C\nlicense as circulated by CEA, CNRS and INRIA at the following URL\n\"http://www.cecill.info\".\n\nPlease send bug reports to %s.\n\nThis program is distributed WITHOUT ANY WARRANTY; without even the\nimplied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n\nThis build of %s is based on GMP %s, MPFR %s and MPFI %s.\n",PACKAGE_STRING,PACKAGE_BUGREPORT,PACKAGE_STRING,gmp_version,mpfr_get_version(),sollya_mpfi_get_version());
#if defined(HAVE_FPLLL_VERSION_STRING)
			    sollyaPrintf("%s uses FPLLL as: \"%s\"\n",PACKAGE_STRING,HAVE_FPLLL_VERSION_STRING);
#endif
			    sollyaPrintf("\n");
			    parsedThing = NULL;
			    (yyval.other) = NULL;
			    YYACCEPT;
			  }
    break;

  case 7:
/* Line 1787 of yacc.c  */
#line 492 "parser.y"
    {
			    parsedThing = NULL;
			    (yyval.other) = NULL;
			    YYACCEPT;
			  }
    break;

  case 8:
/* Line 1787 of yacc.c  */
#line 500 "parser.y"
    {
			    helpNotFinished = 1;
			    (yyval.other) = NULL;
			  }
    break;

  case 9:
/* Line 1787 of yacc.c  */
#line 507 "parser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 10:
/* Line 1787 of yacc.c  */
#line 511 "parser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 11:
/* Line 1787 of yacc.c  */
#line 517 "parser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 12:
/* Line 1787 of yacc.c  */
#line 521 "parser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 13:
/* Line 1787 of yacc.c  */
#line 527 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 14:
/* Line 1787 of yacc.c  */
#line 531 "parser.y"
    {
			    (yyval.tree) = makeCommandList((yyvsp[(2) - (3)].list));
                          }
    break;

  case 15:
/* Line 1787 of yacc.c  */
#line 535 "parser.y"
    {
			    (yyval.tree) = makeCommandList(concatChains((yyvsp[(2) - (4)].list), (yyvsp[(3) - (4)].list)));
                          }
    break;

  case 16:
/* Line 1787 of yacc.c  */
#line 539 "parser.y"
    {
			    (yyval.tree) = makeCommandList((yyvsp[(2) - (3)].list));
                          }
    break;

  case 17:
/* Line 1787 of yacc.c  */
#line 543 "parser.y"
    {
			    (yyval.tree) = makeNop();
                          }
    break;

  case 18:
/* Line 1787 of yacc.c  */
#line 547 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(2) - (2)].tree);
			  }
    break;

  case 19:
/* Line 1787 of yacc.c  */
#line 551 "parser.y"
    {
			    (yyval.tree) = makeWhile((yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree));
			  }
    break;

  case 20:
/* Line 1787 of yacc.c  */
#line 555 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(2) - (2)].tree);
			  }
    break;

  case 21:
/* Line 1787 of yacc.c  */
#line 561 "parser.y"
    {
			    (yyval.tree) = makeIf((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
                          }
    break;

  case 22:
/* Line 1787 of yacc.c  */
#line 565 "parser.y"
    {
			    (yyval.tree) = makeIfElse((yyvsp[(1) - (5)].tree),(yyvsp[(3) - (5)].tree),(yyvsp[(5) - (5)].tree));
                          }
    break;

  case 23:
/* Line 1787 of yacc.c  */
#line 573 "parser.y"
    {
			    (yyval.tree) = makeFor((yyvsp[(1) - (7)].value), (yyvsp[(3) - (7)].tree), (yyvsp[(5) - (7)].tree), makeConstantDouble(1.0), (yyvsp[(7) - (7)].tree));
			    safeFree((yyvsp[(1) - (7)].value));
                          }
    break;

  case 24:
/* Line 1787 of yacc.c  */
#line 578 "parser.y"
    {
			    (yyval.tree) = makeFor((yyvsp[(1) - (9)].value), (yyvsp[(3) - (9)].tree), (yyvsp[(5) - (9)].tree), (yyvsp[(7) - (9)].tree), (yyvsp[(9) - (9)].tree));
			    safeFree((yyvsp[(1) - (9)].value));
                          }
    break;

  case 25:
/* Line 1787 of yacc.c  */
#line 583 "parser.y"
    {
			    (yyval.tree) = makeForIn((yyvsp[(1) - (5)].value), (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree));
			    safeFree((yyvsp[(1) - (5)].value));
                          }
    break;

  case 26:
/* Line 1787 of yacc.c  */
#line 591 "parser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (2)].tree));
			  }
    break;

  case 27:
/* Line 1787 of yacc.c  */
#line 595 "parser.y"
    {
			    (yyval.list) = addElement((yyvsp[(3) - (3)].list), (yyvsp[(1) - (3)].tree));
			  }
    break;

  case 28:
/* Line 1787 of yacc.c  */
#line 601 "parser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (2)].tree));
			  }
    break;

  case 29:
/* Line 1787 of yacc.c  */
#line 605 "parser.y"
    {
			    (yyval.list) = addElement((yyvsp[(3) - (3)].list), (yyvsp[(1) - (3)].tree));
			  }
    break;

  case 30:
/* Line 1787 of yacc.c  */
#line 611 "parser.y"
    {
			    (yyval.tree) = makeVariableDeclaration((yyvsp[(2) - (2)].list));
			  }
    break;

  case 31:
/* Line 1787 of yacc.c  */
#line 618 "parser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (1)].value));
			  }
    break;

  case 32:
/* Line 1787 of yacc.c  */
#line 622 "parser.y"
    {
			    (yyval.list) = addElement((yyvsp[(3) - (3)].list), (yyvsp[(1) - (3)].value));
			  }
    break;

  case 33:
/* Line 1787 of yacc.c  */
#line 628 "parser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList((yyvsp[(4) - (5)].list)), makeUnit());
                          }
    break;

  case 34:
/* Line 1787 of yacc.c  */
#line 632 "parser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList(concatChains((yyvsp[(4) - (6)].list), (yyvsp[(5) - (6)].list))), makeUnit());
                          }
    break;

  case 35:
/* Line 1787 of yacc.c  */
#line 636 "parser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList((yyvsp[(4) - (5)].list)), makeUnit());
                          }
    break;

  case 36:
/* Line 1787 of yacc.c  */
#line 640 "parser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList(addElement(NULL,makeNop())), makeUnit());
                          }
    break;

  case 37:
/* Line 1787 of yacc.c  */
#line 644 "parser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList((yyvsp[(4) - (8)].list)), (yyvsp[(6) - (8)].tree));
                          }
    break;

  case 38:
/* Line 1787 of yacc.c  */
#line 648 "parser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList(concatChains((yyvsp[(4) - (9)].list), (yyvsp[(5) - (9)].list))), (yyvsp[(7) - (9)].tree));
                          }
    break;

  case 39:
/* Line 1787 of yacc.c  */
#line 652 "parser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList((yyvsp[(4) - (8)].list)), (yyvsp[(6) - (8)].tree));
                          }
    break;

  case 40:
/* Line 1787 of yacc.c  */
#line 656 "parser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList(addElement(NULL,makeNop())), (yyvsp[(5) - (7)].tree));
                          }
    break;

  case 41:
/* Line 1787 of yacc.c  */
#line 660 "parser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (6)].list), makeCommandList((yyvsp[(5) - (6)].list)), makeUnit());
                          }
    break;

  case 42:
/* Line 1787 of yacc.c  */
#line 664 "parser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (7)].list), makeCommandList(concatChains((yyvsp[(5) - (7)].list), (yyvsp[(6) - (7)].list))), makeUnit());
                          }
    break;

  case 43:
/* Line 1787 of yacc.c  */
#line 668 "parser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (6)].list), makeCommandList((yyvsp[(5) - (6)].list)), makeUnit());
                          }
    break;

  case 44:
/* Line 1787 of yacc.c  */
#line 672 "parser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (5)].list), makeCommandList(addElement(NULL,makeNop())), makeUnit());
                          }
    break;

  case 45:
/* Line 1787 of yacc.c  */
#line 676 "parser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (9)].list), makeCommandList((yyvsp[(5) - (9)].list)), (yyvsp[(7) - (9)].tree));
                          }
    break;

  case 46:
/* Line 1787 of yacc.c  */
#line 680 "parser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (10)].list), makeCommandList(concatChains((yyvsp[(5) - (10)].list), (yyvsp[(6) - (10)].list))), (yyvsp[(8) - (10)].tree));
                          }
    break;

  case 47:
/* Line 1787 of yacc.c  */
#line 684 "parser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (9)].list), makeCommandList((yyvsp[(5) - (9)].list)), (yyvsp[(7) - (9)].tree));
                          }
    break;

  case 48:
/* Line 1787 of yacc.c  */
#line 688 "parser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (8)].list), makeCommandList(addElement(NULL, makeNop())), (yyvsp[(6) - (8)].tree));
                          }
    break;

  case 49:
/* Line 1787 of yacc.c  */
#line 692 "parser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (8)].value), makeCommandList((yyvsp[(7) - (8)].list)), makeUnit());
                          }
    break;

  case 50:
/* Line 1787 of yacc.c  */
#line 696 "parser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (9)].value), makeCommandList(concatChains((yyvsp[(7) - (9)].list), (yyvsp[(8) - (9)].list))), makeUnit());
                          }
    break;

  case 51:
/* Line 1787 of yacc.c  */
#line 700 "parser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (8)].value), makeCommandList((yyvsp[(7) - (8)].list)), makeUnit());
                          }
    break;

  case 52:
/* Line 1787 of yacc.c  */
#line 704 "parser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (7)].value), makeCommandList(addElement(NULL,makeNop())), makeUnit());
                          }
    break;

  case 53:
/* Line 1787 of yacc.c  */
#line 708 "parser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (11)].value), makeCommandList((yyvsp[(7) - (11)].list)), (yyvsp[(9) - (11)].tree));
                          }
    break;

  case 54:
/* Line 1787 of yacc.c  */
#line 712 "parser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (12)].value), makeCommandList(concatChains((yyvsp[(7) - (12)].list), (yyvsp[(8) - (12)].list))), (yyvsp[(10) - (12)].tree));
                          }
    break;

  case 55:
/* Line 1787 of yacc.c  */
#line 716 "parser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (11)].value), makeCommandList((yyvsp[(7) - (11)].list)), (yyvsp[(9) - (11)].tree));
                          }
    break;

  case 56:
/* Line 1787 of yacc.c  */
#line 720 "parser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (10)].value), makeCommandList(addElement(NULL, makeNop())), (yyvsp[(8) - (10)].tree));
                          }
    break;

  case 57:
/* Line 1787 of yacc.c  */
#line 727 "parser.y"
    {
			    (yyval.tree) = makeQuit();
			  }
    break;

  case 58:
/* Line 1787 of yacc.c  */
#line 731 "parser.y"
    {
			    (yyval.tree) = makeFalseQuit();
			  }
    break;

  case 59:
/* Line 1787 of yacc.c  */
#line 735 "parser.y"
    {
			    (yyval.tree) = makeNop();
			  }
    break;

  case 60:
/* Line 1787 of yacc.c  */
#line 739 "parser.y"
    {
			    (yyval.tree) = makeNopArg((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 61:
/* Line 1787 of yacc.c  */
#line 743 "parser.y"
    {
			    (yyval.tree) = makeNopArg(makeDefault());
			  }
    break;

  case 62:
/* Line 1787 of yacc.c  */
#line 747 "parser.y"
    {
			    (yyval.tree) = makeRestart();
			  }
    break;

  case 63:
/* Line 1787 of yacc.c  */
#line 751 "parser.y"
    {
			    (yyval.tree) = makePrint((yyvsp[(3) - (4)].list));
			  }
    break;

  case 64:
/* Line 1787 of yacc.c  */
#line 755 "parser.y"
    {
			    (yyval.tree) = makeNewFilePrint((yyvsp[(6) - (6)].tree), (yyvsp[(3) - (6)].list));
			  }
    break;

  case 65:
/* Line 1787 of yacc.c  */
#line 759 "parser.y"
    {
			    (yyval.tree) = makeAppendFilePrint((yyvsp[(7) - (7)].tree), (yyvsp[(3) - (7)].list));
			  }
    break;

  case 66:
/* Line 1787 of yacc.c  */
#line 763 "parser.y"
    {
			    (yyval.tree) = makePlot(addElement((yyvsp[(5) - (6)].list), (yyvsp[(3) - (6)].tree)));
			  }
    break;

  case 67:
/* Line 1787 of yacc.c  */
#line 767 "parser.y"
    {
			    (yyval.tree) = makePrintHexa((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 68:
/* Line 1787 of yacc.c  */
#line 771 "parser.y"
    {
			    (yyval.tree) = makePrintFloat((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 69:
/* Line 1787 of yacc.c  */
#line 775 "parser.y"
    {
			    (yyval.tree) = makePrintBinary((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 70:
/* Line 1787 of yacc.c  */
#line 779 "parser.y"
    {
			    (yyval.tree) = makeSuppressMessage((yyvsp[(3) - (4)].list));
			  }
    break;

  case 71:
/* Line 1787 of yacc.c  */
#line 783 "parser.y"
    {
			    (yyval.tree) = makeUnsuppressMessage((yyvsp[(3) - (4)].list));
			  }
    break;

  case 72:
/* Line 1787 of yacc.c  */
#line 787 "parser.y"
    {
			    (yyval.tree) = makePrintExpansion((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 73:
/* Line 1787 of yacc.c  */
#line 791 "parser.y"
    {
			    (yyval.tree) = makeImplementConst((yyvsp[(3) - (4)].list));
			  }
    break;

  case 74:
/* Line 1787 of yacc.c  */
#line 795 "parser.y"
    {
			    (yyval.tree) = makeBashExecute((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 75:
/* Line 1787 of yacc.c  */
#line 799 "parser.y"
    {
			    (yyval.tree) = makeExternalPlot(addElement(addElement(addElement(addElement((yyvsp[(11) - (12)].list),(yyvsp[(9) - (12)].tree)),(yyvsp[(7) - (12)].tree)),(yyvsp[(5) - (12)].tree)),(yyvsp[(3) - (12)].tree)));
			  }
    break;

  case 76:
/* Line 1787 of yacc.c  */
#line 803 "parser.y"
    {
			    (yyval.tree) = makeWrite((yyvsp[(3) - (4)].list));
			  }
    break;

  case 77:
/* Line 1787 of yacc.c  */
#line 807 "parser.y"
    {
			    (yyval.tree) = makeNewFileWrite((yyvsp[(6) - (6)].tree), (yyvsp[(3) - (6)].list));
			  }
    break;

  case 78:
/* Line 1787 of yacc.c  */
#line 811 "parser.y"
    {
			    (yyval.tree) = makeAppendFileWrite((yyvsp[(7) - (7)].tree), (yyvsp[(3) - (7)].list));
			  }
    break;

  case 79:
/* Line 1787 of yacc.c  */
#line 815 "parser.y"
    {
			    (yyval.tree) = makeAsciiPlot((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 80:
/* Line 1787 of yacc.c  */
#line 819 "parser.y"
    {
			    (yyval.tree) = makePrintXml((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 81:
/* Line 1787 of yacc.c  */
#line 823 "parser.y"
    {
			    (yyval.tree) = makeExecute((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 82:
/* Line 1787 of yacc.c  */
#line 827 "parser.y"
    {
			    (yyval.tree) = makePrintXmlNewFile((yyvsp[(3) - (6)].tree),(yyvsp[(6) - (6)].tree));
			  }
    break;

  case 83:
/* Line 1787 of yacc.c  */
#line 831 "parser.y"
    {
			    (yyval.tree) = makePrintXmlAppendFile((yyvsp[(3) - (7)].tree),(yyvsp[(7) - (7)].tree));
			  }
    break;

  case 84:
/* Line 1787 of yacc.c  */
#line 835 "parser.y"
    {
			    (yyval.tree) = makeWorstCase(addElement(addElement(addElement(addElement((yyvsp[(11) - (12)].list), (yyvsp[(9) - (12)].tree)), (yyvsp[(7) - (12)].tree)), (yyvsp[(5) - (12)].tree)), (yyvsp[(3) - (12)].tree)));
			  }
    break;

  case 85:
/* Line 1787 of yacc.c  */
#line 839 "parser.y"
    {
			    (yyval.tree) = makeRename((yyvsp[(3) - (6)].value), (yyvsp[(5) - (6)].value));
			    safeFree((yyvsp[(3) - (6)].value));
			    safeFree((yyvsp[(5) - (6)].value));
			  }
    break;

  case 86:
/* Line 1787 of yacc.c  */
#line 845 "parser.y"
    {
			    (yyval.tree) = makeRename("_x_", (yyvsp[(5) - (6)].value));
			    safeFree((yyvsp[(5) - (6)].value));
			  }
    break;

  case 87:
/* Line 1787 of yacc.c  */
#line 850 "parser.y"
    {
			    (yyval.tree) = makeExternalProc((yyvsp[(3) - (11)].value), (yyvsp[(5) - (11)].tree), addElement((yyvsp[(7) - (11)].list), (yyvsp[(10) - (11)].integerval)));
			    safeFree((yyvsp[(3) - (11)].value));
			  }
    break;

  case 88:
/* Line 1787 of yacc.c  */
#line 855 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 89:
/* Line 1787 of yacc.c  */
#line 859 "parser.y"
    {
			    (yyval.tree) = makeAutoprint((yyvsp[(1) - (1)].list));
			  }
    break;

  case 90:
/* Line 1787 of yacc.c  */
#line 863 "parser.y"
    {
			    (yyval.tree) = makeAssignment((yyvsp[(2) - (3)].value), (yyvsp[(3) - (3)].tree));
			    safeFree((yyvsp[(2) - (3)].value));
			  }
    break;

  case 91:
/* Line 1787 of yacc.c  */
#line 870 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 92:
/* Line 1787 of yacc.c  */
#line 874 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (2)].tree);
			  }
    break;

  case 93:
/* Line 1787 of yacc.c  */
#line 878 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 94:
/* Line 1787 of yacc.c  */
#line 882 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (2)].tree);
			  }
    break;

  case 95:
/* Line 1787 of yacc.c  */
#line 888 "parser.y"
    {
			    (yyval.tree) = makeAssignment((yyvsp[(1) - (3)].value), (yyvsp[(3) - (3)].tree));
			    safeFree((yyvsp[(1) - (3)].value));
			  }
    break;

  case 96:
/* Line 1787 of yacc.c  */
#line 893 "parser.y"
    {
			    (yyval.tree) = makeFloatAssignment((yyvsp[(1) - (3)].value), (yyvsp[(3) - (3)].tree));
			    safeFree((yyvsp[(1) - (3)].value));
			  }
    break;

  case 97:
/* Line 1787 of yacc.c  */
#line 898 "parser.y"
    {
			    (yyval.tree) = makeLibraryBinding((yyvsp[(1) - (6)].value), (yyvsp[(5) - (6)].tree));
			    safeFree((yyvsp[(1) - (6)].value));
			  }
    break;

  case 98:
/* Line 1787 of yacc.c  */
#line 903 "parser.y"
    {
			    (yyval.tree) = makeLibraryConstantBinding((yyvsp[(1) - (6)].value), (yyvsp[(5) - (6)].tree));
			    safeFree((yyvsp[(1) - (6)].value));
			  }
    break;

  case 99:
/* Line 1787 of yacc.c  */
#line 908 "parser.y"
    {
			    (yyval.tree) = makeAssignmentInIndexing((yyvsp[(1) - (3)].dblnode)->a,(yyvsp[(1) - (3)].dblnode)->b,(yyvsp[(3) - (3)].tree));
			    safeFree((yyvsp[(1) - (3)].dblnode));
			  }
    break;

  case 100:
/* Line 1787 of yacc.c  */
#line 913 "parser.y"
    {
			    (yyval.tree) = makeFloatAssignmentInIndexing((yyvsp[(1) - (3)].dblnode)->a,(yyvsp[(1) - (3)].dblnode)->b,(yyvsp[(3) - (3)].tree));
			    safeFree((yyvsp[(1) - (3)].dblnode));
			  }
    break;

  case 101:
/* Line 1787 of yacc.c  */
#line 918 "parser.y"
    {
			    (yyval.tree) = makeProtoAssignmentInStructure((yyvsp[(1) - (3)].tree),(yyvsp[(3) - (3)].tree));
			  }
    break;

  case 102:
/* Line 1787 of yacc.c  */
#line 922 "parser.y"
    {
			    (yyval.tree) = makeProtoFloatAssignmentInStructure((yyvsp[(1) - (3)].tree),(yyvsp[(3) - (3)].tree));
			  }
    break;

  case 103:
/* Line 1787 of yacc.c  */
#line 928 "parser.y"
    {
			    (yyval.tree) = makeStructAccess((yyvsp[(1) - (3)].tree),(yyvsp[(3) - (3)].value));
			    safeFree((yyvsp[(3) - (3)].value));
			  }
    break;

  case 104:
/* Line 1787 of yacc.c  */
#line 935 "parser.y"
    {
			    (yyval.tree) = makePrecAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 105:
/* Line 1787 of yacc.c  */
#line 939 "parser.y"
    {
			    (yyval.tree) = makePointsAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 106:
/* Line 1787 of yacc.c  */
#line 943 "parser.y"
    {
			    (yyval.tree) = makeDiamAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 107:
/* Line 1787 of yacc.c  */
#line 947 "parser.y"
    {
			    (yyval.tree) = makeDisplayAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 108:
/* Line 1787 of yacc.c  */
#line 951 "parser.y"
    {
			    (yyval.tree) = makeVerbosityAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 109:
/* Line 1787 of yacc.c  */
#line 955 "parser.y"
    {
			    (yyval.tree) = makeShowMessageNumbersAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 110:
/* Line 1787 of yacc.c  */
#line 959 "parser.y"
    {
			    (yyval.tree) = makeCanonicalAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 111:
/* Line 1787 of yacc.c  */
#line 963 "parser.y"
    {
			    (yyval.tree) = makeAutoSimplifyAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 112:
/* Line 1787 of yacc.c  */
#line 967 "parser.y"
    {
			    (yyval.tree) = makeTaylorRecursAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 113:
/* Line 1787 of yacc.c  */
#line 971 "parser.y"
    {
			    (yyval.tree) = makeTimingAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 114:
/* Line 1787 of yacc.c  */
#line 975 "parser.y"
    {
			    (yyval.tree) = makeFullParenAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 115:
/* Line 1787 of yacc.c  */
#line 979 "parser.y"
    {
			    (yyval.tree) = makeMidpointAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 116:
/* Line 1787 of yacc.c  */
#line 983 "parser.y"
    {
			    (yyval.tree) = makeDieOnErrorAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 117:
/* Line 1787 of yacc.c  */
#line 987 "parser.y"
    {
			    (yyval.tree) = makeRationalModeAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 118:
/* Line 1787 of yacc.c  */
#line 991 "parser.y"
    {
			    (yyval.tree) = makeSuppressWarningsAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 119:
/* Line 1787 of yacc.c  */
#line 995 "parser.y"
    {
			    (yyval.tree) = makeHopitalRecursAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 120:
/* Line 1787 of yacc.c  */
#line 1001 "parser.y"
    {
			    (yyval.tree) = makePrecStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 121:
/* Line 1787 of yacc.c  */
#line 1005 "parser.y"
    {
			    (yyval.tree) = makePointsStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 122:
/* Line 1787 of yacc.c  */
#line 1009 "parser.y"
    {
			    (yyval.tree) = makeDiamStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 123:
/* Line 1787 of yacc.c  */
#line 1013 "parser.y"
    {
			    (yyval.tree) = makeDisplayStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 124:
/* Line 1787 of yacc.c  */
#line 1017 "parser.y"
    {
			    (yyval.tree) = makeVerbosityStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 125:
/* Line 1787 of yacc.c  */
#line 1021 "parser.y"
    {
			    (yyval.tree) = makeShowMessageNumbersStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 126:
/* Line 1787 of yacc.c  */
#line 1025 "parser.y"
    {
			    (yyval.tree) = makeCanonicalStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 127:
/* Line 1787 of yacc.c  */
#line 1029 "parser.y"
    {
			    (yyval.tree) = makeAutoSimplifyStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 128:
/* Line 1787 of yacc.c  */
#line 1033 "parser.y"
    {
			    (yyval.tree) = makeTaylorRecursStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 129:
/* Line 1787 of yacc.c  */
#line 1037 "parser.y"
    {
			    (yyval.tree) = makeTimingStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 130:
/* Line 1787 of yacc.c  */
#line 1041 "parser.y"
    {
			    (yyval.tree) = makeFullParenStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 131:
/* Line 1787 of yacc.c  */
#line 1045 "parser.y"
    {
			    (yyval.tree) = makeMidpointStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 132:
/* Line 1787 of yacc.c  */
#line 1049 "parser.y"
    {
			    (yyval.tree) = makeDieOnErrorStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 133:
/* Line 1787 of yacc.c  */
#line 1053 "parser.y"
    {
			    (yyval.tree) = makeRationalModeStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 134:
/* Line 1787 of yacc.c  */
#line 1057 "parser.y"
    {
			    (yyval.tree) = makeSuppressWarningsStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 135:
/* Line 1787 of yacc.c  */
#line 1061 "parser.y"
    {
			    (yyval.tree) = makeHopitalRecursStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 136:
/* Line 1787 of yacc.c  */
#line 1067 "parser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (1)].tree));
			  }
    break;

  case 137:
/* Line 1787 of yacc.c  */
#line 1071 "parser.y"
    {
			    (yyval.list) = addElement((yyvsp[(3) - (3)].list), (yyvsp[(1) - (3)].tree));
			  }
    break;

  case 138:
/* Line 1787 of yacc.c  */
#line 1077 "parser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (1)].association));
			  }
    break;

  case 139:
/* Line 1787 of yacc.c  */
#line 1081 "parser.y"
    {
			    (yyval.list) = addElement((yyvsp[(3) - (3)].list), (yyvsp[(1) - (3)].association));
			  }
    break;

  case 140:
/* Line 1787 of yacc.c  */
#line 1087 "parser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 141:
/* Line 1787 of yacc.c  */
#line 1091 "parser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 142:
/* Line 1787 of yacc.c  */
#line 1097 "parser.y"
    {
			    (yyval.association) = (entry *) safeMalloc(sizeof(entry));
			    (yyval.association)->name = (char *) safeCalloc(strlen((yyvsp[(2) - (4)].value)) + 1, sizeof(char));
			    strcpy((yyval.association)->name,(yyvsp[(2) - (4)].value));
			    safeFree((yyvsp[(2) - (4)].value));
			    (yyval.association)->value = (void *) ((yyvsp[(4) - (4)].tree));
			  }
    break;

  case 143:
/* Line 1787 of yacc.c  */
#line 1107 "parser.y"
    {
			   (yyval.tree) = (yyvsp[(1) - (1)].tree);
			 }
    break;

  case 144:
/* Line 1787 of yacc.c  */
#line 1111 "parser.y"
    {
			    (yyval.tree) = makeMatch((yyvsp[(2) - (4)].tree),(yyvsp[(4) - (4)].list));
			  }
    break;

  case 145:
/* Line 1787 of yacc.c  */
#line 1117 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 146:
/* Line 1787 of yacc.c  */
#line 1121 "parser.y"
    {
			    (yyval.tree) = makeAnd((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 147:
/* Line 1787 of yacc.c  */
#line 1125 "parser.y"
    {
			    (yyval.tree) = makeOr((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 148:
/* Line 1787 of yacc.c  */
#line 1129 "parser.y"
    {
			    (yyval.tree) = makeNegation((yyvsp[(2) - (2)].tree));
			  }
    break;

  case 149:
/* Line 1787 of yacc.c  */
#line 1135 "parser.y"
    {
			    (yyval.dblnode) = (doubleNode *) safeMalloc(sizeof(doubleNode));
			    (yyval.dblnode)->a = (yyvsp[(1) - (4)].tree);
			    (yyval.dblnode)->b = (yyvsp[(3) - (4)].tree);
			  }
    break;

  case 150:
/* Line 1787 of yacc.c  */
#line 1144 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 151:
/* Line 1787 of yacc.c  */
#line 1148 "parser.y"
    {
			    (yyval.tree) = makeCompareEqual((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 152:
/* Line 1787 of yacc.c  */
#line 1152 "parser.y"
    {
			    (yyval.tree) = makeCompareIn((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 153:
/* Line 1787 of yacc.c  */
#line 1156 "parser.y"
    {
			    (yyval.tree) = makeCompareLess((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 154:
/* Line 1787 of yacc.c  */
#line 1160 "parser.y"
    {
			    (yyval.tree) = makeCompareGreater((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 155:
/* Line 1787 of yacc.c  */
#line 1164 "parser.y"
    {
			    (yyval.tree) = makeCompareLessEqual((yyvsp[(1) - (4)].tree), (yyvsp[(4) - (4)].tree));
			  }
    break;

  case 156:
/* Line 1787 of yacc.c  */
#line 1168 "parser.y"
    {
			    (yyval.tree) = makeCompareGreaterEqual((yyvsp[(1) - (4)].tree), (yyvsp[(4) - (4)].tree));
			  }
    break;

  case 157:
/* Line 1787 of yacc.c  */
#line 1172 "parser.y"
    {
			    (yyval.tree) = makeCompareNotEqual((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 158:
/* Line 1787 of yacc.c  */
#line 1178 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 159:
/* Line 1787 of yacc.c  */
#line 1182 "parser.y"
    {
			    (yyval.tree) = makeAdd((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 160:
/* Line 1787 of yacc.c  */
#line 1186 "parser.y"
    {
			    (yyval.tree) = makeSub((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 161:
/* Line 1787 of yacc.c  */
#line 1190 "parser.y"
    {
			    (yyval.tree) = makeConcat((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 162:
/* Line 1787 of yacc.c  */
#line 1194 "parser.y"
    {
			    (yyval.tree) = makeAddToList((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 163:
/* Line 1787 of yacc.c  */
#line 1198 "parser.y"
    {
			    (yyval.tree) = makeAppend((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 164:
/* Line 1787 of yacc.c  */
#line 1204 "parser.y"
    {
			    (yyval.count) = 0;
                          }
    break;

  case 165:
/* Line 1787 of yacc.c  */
#line 1208 "parser.y"
    {
			    (yyval.count) = 1;
                          }
    break;

  case 166:
/* Line 1787 of yacc.c  */
#line 1212 "parser.y"
    {
			    (yyval.count) = (yyvsp[(2) - (2)].count);
                          }
    break;

  case 167:
/* Line 1787 of yacc.c  */
#line 1216 "parser.y"
    {
			    (yyval.count) = (yyvsp[(2) - (2)].count)+1;
                          }
    break;

  case 168:
/* Line 1787 of yacc.c  */
#line 1223 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
                          }
    break;

  case 169:
/* Line 1787 of yacc.c  */
#line 1227 "parser.y"
    {
			    tempNode = (yyvsp[(2) - (2)].tree);
			    for (tempInteger=0;tempInteger<(yyvsp[(1) - (2)].count);tempInteger++)
			      tempNode = makeNeg(tempNode);
			    (yyval.tree) = tempNode;
                          }
    break;

  case 170:
/* Line 1787 of yacc.c  */
#line 1234 "parser.y"
    {
			    (yyval.tree) = makeEvalConst((yyvsp[(2) - (2)].tree));
                          }
    break;

  case 171:
/* Line 1787 of yacc.c  */
#line 1238 "parser.y"
    {
			    (yyval.tree) = makeMul((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
                          }
    break;

  case 172:
/* Line 1787 of yacc.c  */
#line 1242 "parser.y"
    {
			    (yyval.tree) = makeDiv((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
                          }
    break;

  case 173:
/* Line 1787 of yacc.c  */
#line 1246 "parser.y"
    {
			    tempNode = (yyvsp[(4) - (4)].tree);
			    for (tempInteger=0;tempInteger<(yyvsp[(3) - (4)].count);tempInteger++)
			      tempNode = makeNeg(tempNode);
			    (yyval.tree) = makeMul((yyvsp[(1) - (4)].tree), tempNode);
                          }
    break;

  case 174:
/* Line 1787 of yacc.c  */
#line 1253 "parser.y"
    {
			    tempNode = (yyvsp[(4) - (4)].tree);
			    for (tempInteger=0;tempInteger<(yyvsp[(3) - (4)].count);tempInteger++)
			      tempNode = makeNeg(tempNode);
			    (yyval.tree) = makeDiv((yyvsp[(1) - (4)].tree), tempNode);
                          }
    break;

  case 175:
/* Line 1787 of yacc.c  */
#line 1260 "parser.y"
    {
			    (yyval.tree) = makeMul((yyvsp[(1) - (4)].tree), makeEvalConst((yyvsp[(4) - (4)].tree)));
                          }
    break;

  case 176:
/* Line 1787 of yacc.c  */
#line 1264 "parser.y"
    {
			    (yyval.tree) = makeDiv((yyvsp[(1) - (4)].tree), makeEvalConst((yyvsp[(4) - (4)].tree)));
                          }
    break;

  case 177:
/* Line 1787 of yacc.c  */
#line 1270 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
                          }
    break;

  case 178:
/* Line 1787 of yacc.c  */
#line 1274 "parser.y"
    {
			    (yyval.tree) = makePow((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
                          }
    break;

  case 179:
/* Line 1787 of yacc.c  */
#line 1278 "parser.y"
    {
			    tempNode = (yyvsp[(4) - (4)].tree);
			    for (tempInteger=0;tempInteger<(yyvsp[(3) - (4)].count);tempInteger++)
			      tempNode = makeNeg(tempNode);
			    (yyval.tree) = makePow((yyvsp[(1) - (4)].tree), tempNode);
                          }
    break;

  case 180:
/* Line 1787 of yacc.c  */
#line 1285 "parser.y"
    {
			    (yyval.tree) = makePow((yyvsp[(1) - (4)].tree), makeEvalConst((yyvsp[(4) - (4)].tree)));
                          }
    break;

  case 181:
/* Line 1787 of yacc.c  */
#line 1289 "parser.y"
    {
			    (yyval.tree) = makePrepend((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 182:
/* Line 1787 of yacc.c  */
#line 1293 "parser.y"
    {
			    (yyval.tree) = makePrepend((yyvsp[(1) - (4)].tree), makeEvalConst((yyvsp[(4) - (4)].tree)));
			  }
    break;

  case 183:
/* Line 1787 of yacc.c  */
#line 1300 "parser.y"
    {
			    (yyval.tree) = makeOn();
			  }
    break;

  case 184:
/* Line 1787 of yacc.c  */
#line 1304 "parser.y"
    {
			    (yyval.tree) = makeOff();
			  }
    break;

  case 185:
/* Line 1787 of yacc.c  */
#line 1308 "parser.y"
    {
			    (yyval.tree) = makeDyadic();
			  }
    break;

  case 186:
/* Line 1787 of yacc.c  */
#line 1312 "parser.y"
    {
			    (yyval.tree) = makePowers();
			  }
    break;

  case 187:
/* Line 1787 of yacc.c  */
#line 1316 "parser.y"
    {
			    (yyval.tree) = makeBinaryThing();
			  }
    break;

  case 188:
/* Line 1787 of yacc.c  */
#line 1320 "parser.y"
    {
			    (yyval.tree) = makeHexadecimalThing();
			  }
    break;

  case 189:
/* Line 1787 of yacc.c  */
#line 1324 "parser.y"
    {
			    (yyval.tree) = makeFile();
			  }
    break;

  case 190:
/* Line 1787 of yacc.c  */
#line 1328 "parser.y"
    {
			    (yyval.tree) = makePostscript();
			  }
    break;

  case 191:
/* Line 1787 of yacc.c  */
#line 1332 "parser.y"
    {
			    (yyval.tree) = makePostscriptFile();
			  }
    break;

  case 192:
/* Line 1787 of yacc.c  */
#line 1336 "parser.y"
    {
			    (yyval.tree) = makePerturb();
			  }
    break;

  case 193:
/* Line 1787 of yacc.c  */
#line 1340 "parser.y"
    {
			    (yyval.tree) = makeRoundDown();
			  }
    break;

  case 194:
/* Line 1787 of yacc.c  */
#line 1344 "parser.y"
    {
			    (yyval.tree) = makeRoundUp();
			  }
    break;

  case 195:
/* Line 1787 of yacc.c  */
#line 1348 "parser.y"
    {
			    (yyval.tree) = makeRoundToZero();
			  }
    break;

  case 196:
/* Line 1787 of yacc.c  */
#line 1352 "parser.y"
    {
			    (yyval.tree) = makeRoundToNearest();
			  }
    break;

  case 197:
/* Line 1787 of yacc.c  */
#line 1356 "parser.y"
    {
			    (yyval.tree) = makeHonorCoeff();
			  }
    break;

  case 198:
/* Line 1787 of yacc.c  */
#line 1360 "parser.y"
    {
			    (yyval.tree) = makeTrue();
			  }
    break;

  case 199:
/* Line 1787 of yacc.c  */
#line 1364 "parser.y"
    {
			    (yyval.tree) = makeUnit();
			  }
    break;

  case 200:
/* Line 1787 of yacc.c  */
#line 1368 "parser.y"
    {
			    (yyval.tree) = makeFalse();
			  }
    break;

  case 201:
/* Line 1787 of yacc.c  */
#line 1372 "parser.y"
    {
			    (yyval.tree) = makeDefault();
			  }
    break;

  case 202:
/* Line 1787 of yacc.c  */
#line 1376 "parser.y"
    {
			    (yyval.tree) = makeDecimal();
			  }
    break;

  case 203:
/* Line 1787 of yacc.c  */
#line 1380 "parser.y"
    {
			    (yyval.tree) = makeAbsolute();
			  }
    break;

  case 204:
/* Line 1787 of yacc.c  */
#line 1384 "parser.y"
    {
			    (yyval.tree) = makeRelative();
			  }
    break;

  case 205:
/* Line 1787 of yacc.c  */
#line 1388 "parser.y"
    {
			    (yyval.tree) = makeFixed();
			  }
    break;

  case 206:
/* Line 1787 of yacc.c  */
#line 1392 "parser.y"
    {
			    (yyval.tree) = makeFloating();
			  }
    break;

  case 207:
/* Line 1787 of yacc.c  */
#line 1396 "parser.y"
    {
			    (yyval.tree) = makeError();
			  }
    break;

  case 208:
/* Line 1787 of yacc.c  */
#line 1400 "parser.y"
    {
			    (yyval.tree) = makeDoubleSymbol();
			  }
    break;

  case 209:
/* Line 1787 of yacc.c  */
#line 1404 "parser.y"
    {
			    (yyval.tree) = makeSingleSymbol();
			  }
    break;

  case 210:
/* Line 1787 of yacc.c  */
#line 1408 "parser.y"
    {
			    (yyval.tree) = makeQuadSymbol();
			  }
    break;

  case 211:
/* Line 1787 of yacc.c  */
#line 1412 "parser.y"
    {
			    (yyval.tree) = makeHalfPrecisionSymbol();
			  }
    break;

  case 212:
/* Line 1787 of yacc.c  */
#line 1416 "parser.y"
    {
			    (yyval.tree) = makeDoubleextendedSymbol();
			  }
    break;

  case 213:
/* Line 1787 of yacc.c  */
#line 1420 "parser.y"
    {
			    (yyval.tree) = makeVariable();
			  }
    break;

  case 214:
/* Line 1787 of yacc.c  */
#line 1424 "parser.y"
    {
			    (yyval.tree) = makeDoubleDoubleSymbol();
			  }
    break;

  case 215:
/* Line 1787 of yacc.c  */
#line 1428 "parser.y"
    {
			    (yyval.tree) = makeTripleDoubleSymbol();
			  }
    break;

  case 216:
/* Line 1787 of yacc.c  */
#line 1432 "parser.y"
    {
			    tempString = safeCalloc(strlen((yyvsp[(1) - (1)].value)) + 1, sizeof(char));
			    strcpy(tempString, (yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			    tempString2 = safeCalloc(strlen(tempString) + 1, sizeof(char));
			    strcpy(tempString2, tempString);
			    safeFree(tempString);
			    (yyval.tree) = makeString(tempString2);
			    safeFree(tempString2);
			  }
    break;

  case 217:
/* Line 1787 of yacc.c  */
#line 1443 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 218:
/* Line 1787 of yacc.c  */
#line 1447 "parser.y"
    {
			    (yyval.tree) = makeTableAccess((yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 219:
/* Line 1787 of yacc.c  */
#line 1452 "parser.y"
    {
			    (yyval.tree) = makeIsBound((yyvsp[(3) - (4)].value));
			    safeFree((yyvsp[(3) - (4)].value));
			  }
    break;

  case 220:
/* Line 1787 of yacc.c  */
#line 1457 "parser.y"
    {
			    (yyval.tree) = makeTableAccessWithSubstitute((yyvsp[(1) - (4)].value), (yyvsp[(3) - (4)].list));
			    safeFree((yyvsp[(1) - (4)].value));
			  }
    break;

  case 221:
/* Line 1787 of yacc.c  */
#line 1462 "parser.y"
    {
			    (yyval.tree) = makeTableAccessWithSubstitute((yyvsp[(1) - (3)].value), NULL);
			    safeFree((yyvsp[(1) - (3)].value));
			  }
    break;

  case 222:
/* Line 1787 of yacc.c  */
#line 1467 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 223:
/* Line 1787 of yacc.c  */
#line 1471 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 224:
/* Line 1787 of yacc.c  */
#line 1475 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 225:
/* Line 1787 of yacc.c  */
#line 1479 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 226:
/* Line 1787 of yacc.c  */
#line 1483 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(2) - (3)].tree);
			  }
    break;

  case 227:
/* Line 1787 of yacc.c  */
#line 1487 "parser.y"
    {
			    (yyval.tree) = makeStructure((yyvsp[(2) - (3)].list));
			  }
    break;

  case 228:
/* Line 1787 of yacc.c  */
#line 1491 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 229:
/* Line 1787 of yacc.c  */
#line 1495 "parser.y"
    {
			    (yyval.tree) = makeIndex((yyvsp[(1) - (1)].dblnode)->a, (yyvsp[(1) - (1)].dblnode)->b);
			    safeFree((yyvsp[(1) - (1)].dblnode));
			  }
    break;

  case 230:
/* Line 1787 of yacc.c  */
#line 1500 "parser.y"
    {
			    (yyval.tree) = makeStructAccess((yyvsp[(1) - (3)].tree),(yyvsp[(3) - (3)].value));
			    safeFree((yyvsp[(3) - (3)].value));
			  }
    break;

  case 231:
/* Line 1787 of yacc.c  */
#line 1505 "parser.y"
    {
			    (yyval.tree) = makeApply(makeStructAccess((yyvsp[(1) - (6)].tree),(yyvsp[(3) - (6)].value)),(yyvsp[(5) - (6)].list));
			    safeFree((yyvsp[(3) - (6)].value));
			  }
    break;

  case 232:
/* Line 1787 of yacc.c  */
#line 1510 "parser.y"
    {
			    (yyval.tree) = makeApply((yyvsp[(2) - (6)].tree),(yyvsp[(5) - (6)].list));
			  }
    break;

  case 233:
/* Line 1787 of yacc.c  */
#line 1514 "parser.y"
    {
			    (yyval.tree) = makeApply((yyvsp[(2) - (5)].tree),addElement(NULL,makeUnit()));
			  }
    break;

  case 234:
/* Line 1787 of yacc.c  */
#line 1518 "parser.y"
    {
			    (yyval.tree) = (yyvsp[(2) - (2)].tree);
			  }
    break;

  case 235:
/* Line 1787 of yacc.c  */
#line 1522 "parser.y"
    {
			    (yyval.tree) = makeTime((yyvsp[(3) - (4)].tree));
                          }
    break;

  case 236:
/* Line 1787 of yacc.c  */
#line 1528 "parser.y"
    {
			    (yyval.list) = addElement(NULL,(yyvsp[(1) - (1)].tree));
			  }
    break;

  case 237:
/* Line 1787 of yacc.c  */
#line 1532 "parser.y"
    {
			    (yyval.list) = addElement((yyvsp[(2) - (2)].list),(yyvsp[(1) - (2)].tree));
			  }
    break;

  case 238:
/* Line 1787 of yacc.c  */
#line 1538 "parser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (9)].tree),makeCommandList(concatChains((yyvsp[(4) - (9)].list), (yyvsp[(5) - (9)].list))),(yyvsp[(7) - (9)].tree));
			  }
    break;

  case 239:
/* Line 1787 of yacc.c  */
#line 1542 "parser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (6)].tree),makeCommandList(concatChains((yyvsp[(4) - (6)].list), (yyvsp[(5) - (6)].list))),makeUnit());
			  }
    break;

  case 240:
/* Line 1787 of yacc.c  */
#line 1546 "parser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (8)].tree),makeCommandList((yyvsp[(4) - (8)].list)),(yyvsp[(6) - (8)].tree));
			  }
    break;

  case 241:
/* Line 1787 of yacc.c  */
#line 1550 "parser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (5)].tree),makeCommandList((yyvsp[(4) - (5)].list)),makeUnit());
			  }
    break;

  case 242:
/* Line 1787 of yacc.c  */
#line 1554 "parser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (8)].tree),makeCommandList((yyvsp[(4) - (8)].list)),(yyvsp[(6) - (8)].tree));
			  }
    break;

  case 243:
/* Line 1787 of yacc.c  */
#line 1558 "parser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (5)].tree),makeCommandList((yyvsp[(4) - (5)].list)),makeUnit());
			  }
    break;

  case 244:
/* Line 1787 of yacc.c  */
#line 1562 "parser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (7)].tree), makeCommandList(addElement(NULL,makeNop())), (yyvsp[(5) - (7)].tree));
			  }
    break;

  case 245:
/* Line 1787 of yacc.c  */
#line 1566 "parser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (4)].tree), makeCommandList(addElement(NULL,makeNop())), makeUnit());
			  }
    break;

  case 246:
/* Line 1787 of yacc.c  */
#line 1570 "parser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (5)].tree), makeCommandList(addElement(NULL,makeNop())), (yyvsp[(4) - (5)].tree));
			  }
    break;

  case 247:
/* Line 1787 of yacc.c  */
#line 1576 "parser.y"
    {
			    (yyval.tree) = makeDecimalConstant((yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 248:
/* Line 1787 of yacc.c  */
#line 1581 "parser.y"
    {
			    (yyval.tree) = makeMidpointConstant((yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 249:
/* Line 1787 of yacc.c  */
#line 1586 "parser.y"
    {
			    (yyval.tree) = makeDyadicConstant((yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 250:
/* Line 1787 of yacc.c  */
#line 1591 "parser.y"
    {
			    (yyval.tree) = makeHexConstant((yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 251:
/* Line 1787 of yacc.c  */
#line 1596 "parser.y"
    {
			    (yyval.tree) = makeHexadecimalConstant((yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 252:
/* Line 1787 of yacc.c  */
#line 1601 "parser.y"
    {
			    (yyval.tree) = makeBinaryConstant((yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 253:
/* Line 1787 of yacc.c  */
#line 1606 "parser.y"
    {
			    (yyval.tree) = makePi();
			  }
    break;

  case 254:
/* Line 1787 of yacc.c  */
#line 1614 "parser.y"
    {
			    (yyval.tree) = makeEmptyList();
			  }
    break;

  case 255:
/* Line 1787 of yacc.c  */
#line 1618 "parser.y"
    {
			    (yyval.tree) = makeEmptyList();
			  }
    break;

  case 256:
/* Line 1787 of yacc.c  */
#line 1622 "parser.y"
    {
			    (yyval.tree) = makeRevertedList((yyvsp[(3) - (5)].list));
			  }
    break;

  case 257:
/* Line 1787 of yacc.c  */
#line 1626 "parser.y"
    {
			    (yyval.tree) = makeRevertedFinalEllipticList((yyvsp[(3) - (6)].list));
			  }
    break;

  case 258:
/* Line 1787 of yacc.c  */
#line 1632 "parser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (1)].tree));
			  }
    break;

  case 259:
/* Line 1787 of yacc.c  */
#line 1636 "parser.y"
    {
			    (yyval.list) = addElement((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 260:
/* Line 1787 of yacc.c  */
#line 1640 "parser.y"
    {
			    (yyval.list) = addElement(addElement((yyvsp[(1) - (5)].list), makeElliptic()), (yyvsp[(5) - (5)].tree));
			  }
    break;

  case 261:
/* Line 1787 of yacc.c  */
#line 1647 "parser.y"
    {
			    (yyval.tree) = makeRange((yyvsp[(2) - (5)].tree), (yyvsp[(4) - (5)].tree));
			  }
    break;

  case 262:
/* Line 1787 of yacc.c  */
#line 1651 "parser.y"
    {
			    (yyval.tree) = makeRange((yyvsp[(2) - (5)].tree), (yyvsp[(4) - (5)].tree));
			  }
    break;

  case 263:
/* Line 1787 of yacc.c  */
#line 1655 "parser.y"
    {
			    (yyval.tree) = makeRange((yyvsp[(2) - (3)].tree), copyThing((yyvsp[(2) - (3)].tree)));
			  }
    break;

  case 264:
/* Line 1787 of yacc.c  */
#line 1661 "parser.y"
    {
			    (yyval.tree) = makeDeboundMax((yyvsp[(2) - (3)].tree));
			  }
    break;

  case 265:
/* Line 1787 of yacc.c  */
#line 1665 "parser.y"
    {
			    (yyval.tree) = makeDeboundMid((yyvsp[(2) - (3)].tree));
			  }
    break;

  case 266:
/* Line 1787 of yacc.c  */
#line 1669 "parser.y"
    {
			    (yyval.tree) = makeDeboundMin((yyvsp[(2) - (3)].tree));
			  }
    break;

  case 267:
/* Line 1787 of yacc.c  */
#line 1673 "parser.y"
    {
			    (yyval.tree) = makeDeboundMax((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 268:
/* Line 1787 of yacc.c  */
#line 1677 "parser.y"
    {
			    (yyval.tree) = makeDeboundMid((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 269:
/* Line 1787 of yacc.c  */
#line 1681 "parser.y"
    {
			    (yyval.tree) = makeDeboundMin((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 270:
/* Line 1787 of yacc.c  */
#line 1687 "parser.y"
    {
			    (yyval.tree) = makeDiff((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 271:
/* Line 1787 of yacc.c  */
#line 1691 "parser.y"
    {
			    (yyval.tree) = makeDirtysimplify((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 272:
/* Line 1787 of yacc.c  */
#line 1695 "parser.y"
    {
			    (yyval.tree) = makeBashevaluate(addElement(NULL,(yyvsp[(3) - (4)].tree)));
			  }
    break;

  case 273:
/* Line 1787 of yacc.c  */
#line 1699 "parser.y"
    {
			    (yyval.tree) = makeGetSuppressedMessages();
			  }
    break;

  case 274:
/* Line 1787 of yacc.c  */
#line 1703 "parser.y"
    {
			    (yyval.tree) = makeBashevaluate(addElement(addElement(NULL,(yyvsp[(5) - (6)].tree)),(yyvsp[(3) - (6)].tree)));
			  }
    break;

  case 275:
/* Line 1787 of yacc.c  */
#line 1707 "parser.y"
    {
			    (yyval.tree) = makeRemez(addElement(addElement((yyvsp[(7) - (8)].list), (yyvsp[(5) - (8)].tree)), (yyvsp[(3) - (8)].tree)));
			  }
    break;

  case 276:
/* Line 1787 of yacc.c  */
#line 1711 "parser.y"
    {
			    (yyval.tree) = makeBind((yyvsp[(3) - (8)].tree), (yyvsp[(5) - (8)].value), (yyvsp[(7) - (8)].tree));
			    safeFree((yyvsp[(5) - (8)].value));
			  }
    break;

  case 277:
/* Line 1787 of yacc.c  */
#line 1716 "parser.y"
    {
			    (yyval.tree) = makeMin((yyvsp[(3) - (4)].list));
			  }
    break;

  case 278:
/* Line 1787 of yacc.c  */
#line 1720 "parser.y"
    {
			    (yyval.tree) = makeMax((yyvsp[(3) - (4)].list));
			  }
    break;

  case 279:
/* Line 1787 of yacc.c  */
#line 1724 "parser.y"
    {
			    (yyval.tree) = makeFPminimax(addElement(addElement(addElement((yyvsp[(9) - (10)].list), (yyvsp[(7) - (10)].tree)), (yyvsp[(5) - (10)].tree)), (yyvsp[(3) - (10)].tree)));
			  }
    break;

  case 280:
/* Line 1787 of yacc.c  */
#line 1728 "parser.y"
    {
			    (yyval.tree) = makeHorner((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 281:
/* Line 1787 of yacc.c  */
#line 1732 "parser.y"
    {
			    (yyval.tree) = makeCanonicalThing((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 282:
/* Line 1787 of yacc.c  */
#line 1736 "parser.y"
    {
			    (yyval.tree) = makeExpand((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 283:
/* Line 1787 of yacc.c  */
#line 1740 "parser.y"
    {
			    (yyval.tree) = makeSimplifySafe((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 284:
/* Line 1787 of yacc.c  */
#line 1744 "parser.y"
    {
			    (yyval.tree) = makeTaylor((yyvsp[(3) - (8)].tree), (yyvsp[(5) - (8)].tree), (yyvsp[(7) - (8)].tree));
			  }
    break;

  case 285:
/* Line 1787 of yacc.c  */
#line 1748 "parser.y"
    {
                            (yyval.tree) = makeTaylorform(addElement(addElement((yyvsp[(7) - (8)].list), (yyvsp[(5) - (8)].tree)), (yyvsp[(3) - (8)].tree)));
			  }
    break;

  case 286:
/* Line 1787 of yacc.c  */
#line 1752 "parser.y"
    {
                            (yyval.tree) = makeChebyshevform(addElement(addElement(addElement(NULL, (yyvsp[(7) - (8)].tree)), (yyvsp[(5) - (8)].tree)), (yyvsp[(3) - (8)].tree)));
			  }
    break;

  case 287:
/* Line 1787 of yacc.c  */
#line 1756 "parser.y"
    {
                            (yyval.tree) = makeAutodiff(addElement(addElement(addElement(NULL, (yyvsp[(7) - (8)].tree)), (yyvsp[(5) - (8)].tree)), (yyvsp[(3) - (8)].tree)));
			  }
    break;

  case 288:
/* Line 1787 of yacc.c  */
#line 1760 "parser.y"
    {
			    (yyval.tree) = makeDegree((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 289:
/* Line 1787 of yacc.c  */
#line 1764 "parser.y"
    {
			    (yyval.tree) = makeNumerator((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 290:
/* Line 1787 of yacc.c  */
#line 1768 "parser.y"
    {
			    (yyval.tree) = makeDenominator((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 291:
/* Line 1787 of yacc.c  */
#line 1772 "parser.y"
    {
			    (yyval.tree) = makeSubstitute((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 292:
/* Line 1787 of yacc.c  */
#line 1776 "parser.y"
    {
			    (yyval.tree) = makeComposePolynomials((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 293:
/* Line 1787 of yacc.c  */
#line 1780 "parser.y"
    {
			    (yyval.tree) = makeCoeff((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 294:
/* Line 1787 of yacc.c  */
#line 1784 "parser.y"
    {
			    (yyval.tree) = makeSubpoly((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 295:
/* Line 1787 of yacc.c  */
#line 1788 "parser.y"
    {
			    (yyval.tree) = makeRoundcoefficients((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 296:
/* Line 1787 of yacc.c  */
#line 1792 "parser.y"
    {
			    (yyval.tree) = makeRationalapprox((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 297:
/* Line 1787 of yacc.c  */
#line 1796 "parser.y"
    {
			    (yyval.tree) = makeAccurateInfnorm(addElement(addElement((yyvsp[(7) - (8)].list), (yyvsp[(5) - (8)].tree)), (yyvsp[(3) - (8)].tree)));
			  }
    break;

  case 298:
/* Line 1787 of yacc.c  */
#line 1800 "parser.y"
    {
			    (yyval.tree) = makeRoundToFormat((yyvsp[(3) - (8)].tree), (yyvsp[(5) - (8)].tree), (yyvsp[(7) - (8)].tree));
			  }
    break;

  case 299:
/* Line 1787 of yacc.c  */
#line 1804 "parser.y"
    {
			    (yyval.tree) = makeEvaluate((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 300:
/* Line 1787 of yacc.c  */
#line 1808 "parser.y"
    {
			    (yyval.tree) = makeParse((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 301:
/* Line 1787 of yacc.c  */
#line 1812 "parser.y"
    {
			    (yyval.tree) = makeReadXml((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 302:
/* Line 1787 of yacc.c  */
#line 1816 "parser.y"
    {
			    (yyval.tree) = makeInfnorm(addElement((yyvsp[(5) - (6)].list), (yyvsp[(3) - (6)].tree)));
			  }
    break;

  case 303:
/* Line 1787 of yacc.c  */
#line 1820 "parser.y"
    {
			    (yyval.tree) = makeSupnorm(addElement(addElement(addElement(addElement(addElement(NULL,(yyvsp[(11) - (12)].tree)),(yyvsp[(9) - (12)].tree)),(yyvsp[(7) - (12)].tree)),(yyvsp[(5) - (12)].tree)),(yyvsp[(3) - (12)].tree)));
			  }
    break;

  case 304:
/* Line 1787 of yacc.c  */
#line 1824 "parser.y"
    {
			    (yyval.tree) = makeFindZeros((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 305:
/* Line 1787 of yacc.c  */
#line 1828 "parser.y"
    {
			    (yyval.tree) = makeFPFindZeros((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 306:
/* Line 1787 of yacc.c  */
#line 1832 "parser.y"
    {
			    (yyval.tree) = makeDirtyInfnorm((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 307:
/* Line 1787 of yacc.c  */
#line 1836 "parser.y"
    {
			    (yyval.tree) = makeNumberRoots((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 308:
/* Line 1787 of yacc.c  */
#line 1840 "parser.y"
    {
			    (yyval.tree) = makeIntegral((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 309:
/* Line 1787 of yacc.c  */
#line 1844 "parser.y"
    {
			    (yyval.tree) = makeDirtyIntegral((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 310:
/* Line 1787 of yacc.c  */
#line 1848 "parser.y"
    {
			    (yyval.tree) = makeImplementPoly(addElement(addElement(addElement(addElement(addElement((yyvsp[(13) - (14)].list), (yyvsp[(11) - (14)].tree)), (yyvsp[(9) - (14)].tree)), (yyvsp[(7) - (14)].tree)), (yyvsp[(5) - (14)].tree)), (yyvsp[(3) - (14)].tree)));
			  }
    break;

  case 311:
/* Line 1787 of yacc.c  */
#line 1852 "parser.y"
    {
			    (yyval.tree) = makeCheckInfnorm((yyvsp[(3) - (8)].tree), (yyvsp[(5) - (8)].tree), (yyvsp[(7) - (8)].tree));
			  }
    break;

  case 312:
/* Line 1787 of yacc.c  */
#line 1856 "parser.y"
    {
			    (yyval.tree) = makeZeroDenominators((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 313:
/* Line 1787 of yacc.c  */
#line 1860 "parser.y"
    {
			    (yyval.tree) = makeIsEvaluable((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 314:
/* Line 1787 of yacc.c  */
#line 1864 "parser.y"
    {
			    (yyval.tree) = makeSearchGal((yyvsp[(3) - (4)].list));
			  }
    break;

  case 315:
/* Line 1787 of yacc.c  */
#line 1868 "parser.y"
    {
			    (yyval.tree) = makeGuessDegree(addElement(addElement((yyvsp[(7) - (8)].list), (yyvsp[(5) - (8)].tree)), (yyvsp[(3) - (8)].tree)));
			  }
    break;

  case 316:
/* Line 1787 of yacc.c  */
#line 1872 "parser.y"
    {
			    (yyval.tree) = makeDirtyFindZeros((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 317:
/* Line 1787 of yacc.c  */
#line 1876 "parser.y"
    {
			    (yyval.tree) = makeHead((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 318:
/* Line 1787 of yacc.c  */
#line 1880 "parser.y"
    {
			    (yyval.tree) = makeRoundCorrectly((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 319:
/* Line 1787 of yacc.c  */
#line 1884 "parser.y"
    {
			    (yyval.tree) = makeReadFile((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 320:
/* Line 1787 of yacc.c  */
#line 1888 "parser.y"
    {
			    (yyval.tree) = makeRevert((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 321:
/* Line 1787 of yacc.c  */
#line 1892 "parser.y"
    {
			    (yyval.tree) = makeSort((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 322:
/* Line 1787 of yacc.c  */
#line 1896 "parser.y"
    {
			    (yyval.tree) = makeMantissa((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 323:
/* Line 1787 of yacc.c  */
#line 1900 "parser.y"
    {
			    (yyval.tree) = makeExponent((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 324:
/* Line 1787 of yacc.c  */
#line 1904 "parser.y"
    {
			    (yyval.tree) = makePrecision((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 325:
/* Line 1787 of yacc.c  */
#line 1908 "parser.y"
    {
			    (yyval.tree) = makeTail((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 326:
/* Line 1787 of yacc.c  */
#line 1912 "parser.y"
    {
			    (yyval.tree) = makeSqrt((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 327:
/* Line 1787 of yacc.c  */
#line 1916 "parser.y"
    {
			    (yyval.tree) = makeExp((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 328:
/* Line 1787 of yacc.c  */
#line 1920 "parser.y"
    {
			    (yyval.tree) = makeApply(makeVariable(),addElement(NULL,(yyvsp[(3) - (4)].tree)));
			  }
    break;

  case 329:
/* Line 1787 of yacc.c  */
#line 1924 "parser.y"
    {
			    (yyval.tree) = makeProcedureFunction((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 330:
/* Line 1787 of yacc.c  */
#line 1928 "parser.y"
    {
			    (yyval.tree) = makeSubstitute(makeProcedureFunction((yyvsp[(3) - (6)].tree)),(yyvsp[(5) - (6)].tree));
			  }
    break;

  case 331:
/* Line 1787 of yacc.c  */
#line 1932 "parser.y"
    {
			    (yyval.tree) = makeLog((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 332:
/* Line 1787 of yacc.c  */
#line 1936 "parser.y"
    {
			    (yyval.tree) = makeLog2((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 333:
/* Line 1787 of yacc.c  */
#line 1940 "parser.y"
    {
			    (yyval.tree) = makeLog10((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 334:
/* Line 1787 of yacc.c  */
#line 1944 "parser.y"
    {
			    (yyval.tree) = makeSin((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 335:
/* Line 1787 of yacc.c  */
#line 1948 "parser.y"
    {
			    (yyval.tree) = makeCos((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 336:
/* Line 1787 of yacc.c  */
#line 1952 "parser.y"
    {
			    (yyval.tree) = makeTan((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 337:
/* Line 1787 of yacc.c  */
#line 1956 "parser.y"
    {
			    (yyval.tree) = makeAsin((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 338:
/* Line 1787 of yacc.c  */
#line 1960 "parser.y"
    {
			    (yyval.tree) = makeAcos((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 339:
/* Line 1787 of yacc.c  */
#line 1964 "parser.y"
    {
			    (yyval.tree) = makeAtan((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 340:
/* Line 1787 of yacc.c  */
#line 1968 "parser.y"
    {
			    (yyval.tree) = makeSinh((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 341:
/* Line 1787 of yacc.c  */
#line 1972 "parser.y"
    {
			    (yyval.tree) = makeCosh((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 342:
/* Line 1787 of yacc.c  */
#line 1976 "parser.y"
    {
			    (yyval.tree) = makeTanh((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 343:
/* Line 1787 of yacc.c  */
#line 1980 "parser.y"
    {
			    (yyval.tree) = makeAsinh((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 344:
/* Line 1787 of yacc.c  */
#line 1984 "parser.y"
    {
			    (yyval.tree) = makeAcosh((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 345:
/* Line 1787 of yacc.c  */
#line 1988 "parser.y"
    {
			    (yyval.tree) = makeAtanh((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 346:
/* Line 1787 of yacc.c  */
#line 1992 "parser.y"
    {
			    (yyval.tree) = makeAbs((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 347:
/* Line 1787 of yacc.c  */
#line 1996 "parser.y"
    {
			    (yyval.tree) = makeErf((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 348:
/* Line 1787 of yacc.c  */
#line 2000 "parser.y"
    {
			    (yyval.tree) = makeErfc((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 349:
/* Line 1787 of yacc.c  */
#line 2004 "parser.y"
    {
			    (yyval.tree) = makeLog1p((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 350:
/* Line 1787 of yacc.c  */
#line 2008 "parser.y"
    {
			    (yyval.tree) = makeExpm1((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 351:
/* Line 1787 of yacc.c  */
#line 2012 "parser.y"
    {
			    (yyval.tree) = makeDouble((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 352:
/* Line 1787 of yacc.c  */
#line 2016 "parser.y"
    {
			    (yyval.tree) = makeSingle((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 353:
/* Line 1787 of yacc.c  */
#line 2020 "parser.y"
    {
			    (yyval.tree) = makeQuad((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 354:
/* Line 1787 of yacc.c  */
#line 2024 "parser.y"
    {
			    (yyval.tree) = makeHalfPrecision((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 355:
/* Line 1787 of yacc.c  */
#line 2028 "parser.y"
    {
			    (yyval.tree) = makeDoubledouble((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 356:
/* Line 1787 of yacc.c  */
#line 2032 "parser.y"
    {
			    (yyval.tree) = makeTripledouble((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 357:
/* Line 1787 of yacc.c  */
#line 2036 "parser.y"
    {
			    (yyval.tree) = makeDoubleextended((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 358:
/* Line 1787 of yacc.c  */
#line 2040 "parser.y"
    {
			    (yyval.tree) = makeCeil((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 359:
/* Line 1787 of yacc.c  */
#line 2044 "parser.y"
    {
			    (yyval.tree) = makeFloor((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 360:
/* Line 1787 of yacc.c  */
#line 2048 "parser.y"
    {
			    (yyval.tree) = makeNearestInt((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 361:
/* Line 1787 of yacc.c  */
#line 2052 "parser.y"
    {
			    (yyval.tree) = makeLength((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 362:
/* Line 1787 of yacc.c  */
#line 2058 "parser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 363:
/* Line 1787 of yacc.c  */
#line 2062 "parser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 364:
/* Line 1787 of yacc.c  */
#line 2068 "parser.y"
    {
			    (yyval.tree) = makePrecDeref();
			  }
    break;

  case 365:
/* Line 1787 of yacc.c  */
#line 2072 "parser.y"
    {
			    (yyval.tree) = makePointsDeref();
			  }
    break;

  case 366:
/* Line 1787 of yacc.c  */
#line 2076 "parser.y"
    {
			    (yyval.tree) = makeDiamDeref();
			  }
    break;

  case 367:
/* Line 1787 of yacc.c  */
#line 2080 "parser.y"
    {
			    (yyval.tree) = makeDisplayDeref();
			  }
    break;

  case 368:
/* Line 1787 of yacc.c  */
#line 2084 "parser.y"
    {
			    (yyval.tree) = makeVerbosityDeref();
			  }
    break;

  case 369:
/* Line 1787 of yacc.c  */
#line 2088 "parser.y"
    {
			    (yyval.tree) = makeShowMessageNumbersDeref();
			  }
    break;

  case 370:
/* Line 1787 of yacc.c  */
#line 2092 "parser.y"
    {
			    (yyval.tree) = makeCanonicalDeref();
			  }
    break;

  case 371:
/* Line 1787 of yacc.c  */
#line 2096 "parser.y"
    {
			    (yyval.tree) = makeAutoSimplifyDeref();
			  }
    break;

  case 372:
/* Line 1787 of yacc.c  */
#line 2100 "parser.y"
    {
			    (yyval.tree) = makeTaylorRecursDeref();
			  }
    break;

  case 373:
/* Line 1787 of yacc.c  */
#line 2104 "parser.y"
    {
			    (yyval.tree) = makeTimingDeref();
			  }
    break;

  case 374:
/* Line 1787 of yacc.c  */
#line 2108 "parser.y"
    {
			    (yyval.tree) = makeFullParenDeref();
			  }
    break;

  case 375:
/* Line 1787 of yacc.c  */
#line 2112 "parser.y"
    {
			    (yyval.tree) = makeMidpointDeref();
			  }
    break;

  case 376:
/* Line 1787 of yacc.c  */
#line 2116 "parser.y"
    {
			    (yyval.tree) = makeDieOnErrorDeref();
			  }
    break;

  case 377:
/* Line 1787 of yacc.c  */
#line 2120 "parser.y"
    {
			    (yyval.tree) = makeRationalModeDeref();
			  }
    break;

  case 378:
/* Line 1787 of yacc.c  */
#line 2124 "parser.y"
    {
			    (yyval.tree) = makeSuppressWarningsDeref();
			  }
    break;

  case 379:
/* Line 1787 of yacc.c  */
#line 2128 "parser.y"
    {
			    (yyval.tree) = makeHopitalRecursDeref();
			  }
    break;

  case 380:
/* Line 1787 of yacc.c  */
#line 2134 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = CONSTANT_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 381:
/* Line 1787 of yacc.c  */
#line 2140 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = FUNCTION_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 382:
/* Line 1787 of yacc.c  */
#line 2146 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = OBJECT_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 383:
/* Line 1787 of yacc.c  */
#line 2152 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = RANGE_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 384:
/* Line 1787 of yacc.c  */
#line 2158 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = INTEGER_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 385:
/* Line 1787 of yacc.c  */
#line 2164 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = STRING_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 386:
/* Line 1787 of yacc.c  */
#line 2170 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = BOOLEAN_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 387:
/* Line 1787 of yacc.c  */
#line 2176 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = CONSTANT_LIST_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 388:
/* Line 1787 of yacc.c  */
#line 2182 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = FUNCTION_LIST_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 389:
/* Line 1787 of yacc.c  */
#line 2188 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = OBJECT_LIST_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 390:
/* Line 1787 of yacc.c  */
#line 2194 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = RANGE_LIST_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 391:
/* Line 1787 of yacc.c  */
#line 2200 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = INTEGER_LIST_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 392:
/* Line 1787 of yacc.c  */
#line 2206 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = STRING_LIST_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 393:
/* Line 1787 of yacc.c  */
#line 2212 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = BOOLEAN_LIST_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 394:
/* Line 1787 of yacc.c  */
#line 2220 "parser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = VOID_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 395:
/* Line 1787 of yacc.c  */
#line 2226 "parser.y"
    {
			    (yyval.integerval) = (yyvsp[(1) - (1)].integerval);
		          }
    break;

  case 396:
/* Line 1787 of yacc.c  */
#line 2233 "parser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (1)].integerval));
			  }
    break;

  case 397:
/* Line 1787 of yacc.c  */
#line 2237 "parser.y"
    {
			    (yyval.list) = addElement((yyvsp[(3) - (3)].list), (yyvsp[(1) - (3)].integerval));
			  }
    break;

  case 398:
/* Line 1787 of yacc.c  */
#line 2243 "parser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (1)].integerval));
			  }
    break;

  case 399:
/* Line 1787 of yacc.c  */
#line 2247 "parser.y"
    {
			    (yyval.list) = (yyvsp[(2) - (3)].list);
			  }
    break;

  case 400:
/* Line 1787 of yacc.c  */
#line 2254 "parser.y"
    {
			    outputMode(); sollyaPrintf("\"%s\" is recognized as a base 10 constant.\n",(yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 401:
/* Line 1787 of yacc.c  */
#line 2259 "parser.y"
    {
			    outputMode(); sollyaPrintf("\"%s\" is recognized as a dyadic number constant.\n",(yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
                          }
    break;

  case 402:
/* Line 1787 of yacc.c  */
#line 2264 "parser.y"
    {
			    outputMode(); sollyaPrintf("\"%s\" is recognized as a double or single precision constant.\n",(yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
                          }
    break;

  case 403:
/* Line 1787 of yacc.c  */
#line 2269 "parser.y"
    {
			    outputMode(); sollyaPrintf("\"%s\" is recognized as a hexadecimal constant.\n",(yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
                          }
    break;

  case 404:
/* Line 1787 of yacc.c  */
#line 2274 "parser.y"
    {
			    outputMode(); sollyaPrintf("\"%s_2\" is recognized as a base 2 constant.\n",(yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
                          }
    break;

  case 405:
/* Line 1787 of yacc.c  */
#line 2279 "parser.y"
    {
#ifdef HELP_PI_TEXT
			    outputMode(); sollyaPrintf(HELP_PI_TEXT);
#else
			    outputMode(); sollyaPrintf("Ratio circonference and diameter of a circle.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PI"
#endif
#endif
                          }
    break;

  case 406:
/* Line 1787 of yacc.c  */
#line 2290 "parser.y"
    {
			    outputMode(); sollyaPrintf("\"%s\" is an identifier.\n",(yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
                          }
    break;

  case 407:
/* Line 1787 of yacc.c  */
#line 2295 "parser.y"
    {
			    outputMode(); sollyaPrintf("\"%s\" is a string constant.\n",(yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
                          }
    break;

  case 408:
/* Line 1787 of yacc.c  */
#line 2300 "parser.y"
    {
			    outputMode(); sollyaPrintf("Left parenthesis.\n");
                          }
    break;

  case 409:
/* Line 1787 of yacc.c  */
#line 2304 "parser.y"
    {
			    outputMode(); sollyaPrintf("Right parenthesis.\n");
                          }
    break;

  case 410:
/* Line 1787 of yacc.c  */
#line 2308 "parser.y"
    {
			    outputMode(); sollyaPrintf("Left bracket - indicates a range.\n");
                          }
    break;

  case 411:
/* Line 1787 of yacc.c  */
#line 2312 "parser.y"
    {
			    outputMode(); sollyaPrintf("Right bracket - indicates a range.\n");
                          }
    break;

  case 412:
/* Line 1787 of yacc.c  */
#line 2316 "parser.y"
    {
			    outputMode(); sollyaPrintf("Left bracket-bar - indicates a list.\n");
                          }
    break;

  case 413:
/* Line 1787 of yacc.c  */
#line 2320 "parser.y"
    {
			    outputMode(); sollyaPrintf("Bar-right bracket - indicates a list.\n");
                          }
    break;

  case 414:
/* Line 1787 of yacc.c  */
#line 2324 "parser.y"
    {
#ifdef HELP_ASSIGNMENT_TEXT
			    outputMode(); sollyaPrintf(HELP_ASSIGNMENT_TEXT);
#else
			    outputMode(); sollyaPrintf("Assignment operator.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ASSIGNMENT"
#endif
#endif
                          }
    break;

  case 415:
/* Line 1787 of yacc.c  */
#line 2335 "parser.y"
    {
#ifdef HELP_FLOATASSIGNMENT_TEXT
			    outputMode(); sollyaPrintf(HELP_FLOATASSIGNMENT_TEXT);
#else
			    outputMode(); sollyaPrintf("Evaluating assignment operator.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for FLOATASSIGNMENT"
#endif
#endif
                          }
    break;

  case 416:
/* Line 1787 of yacc.c  */
#line 2346 "parser.y"
    {
#ifdef HELP_EQUAL_TEXT
			    outputMode(); sollyaPrintf(HELP_EQUAL_TEXT);
#else
			    outputMode(); sollyaPrintf("Equality test.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for EQUAL"
#endif
#endif
                          }
    break;

  case 417:
/* Line 1787 of yacc.c  */
#line 2357 "parser.y"
    {
			    outputMode(); sollyaPrintf("Separator in lists, ranges or structures.\n");
                          }
    break;

  case 418:
/* Line 1787 of yacc.c  */
#line 2361 "parser.y"
    {
#ifdef HELP_NOT_TEXT
			    outputMode(); sollyaPrintf(HELP_NOT_TEXT);
#else
			    outputMode(); sollyaPrintf("Suppresses output on assignments or boolean negation.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for NOT"
#endif
#endif
                          }
    break;

  case 419:
/* Line 1787 of yacc.c  */
#line 2372 "parser.y"
    {
			    outputMode(); sollyaPrintf("Dereferences range bounds.\n");
                          }
    break;

  case 420:
/* Line 1787 of yacc.c  */
#line 2376 "parser.y"
    {
#ifdef HELP_LT_TEXT
			    outputMode(); sollyaPrintf(HELP_LT_TEXT);
#else
			    outputMode(); sollyaPrintf("Comparison less than.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for LT"
#endif
#endif
                          }
    break;

  case 421:
/* Line 1787 of yacc.c  */
#line 2387 "parser.y"
    {
#ifdef HELP_LE_TEXT
			    outputMode(); sollyaPrintf(HELP_LE_TEXT);
#else
			    outputMode(); sollyaPrintf("Comparison less than or equal to.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for LE"
#endif
#endif
                          }
    break;

  case 422:
/* Line 1787 of yacc.c  */
#line 2398 "parser.y"
    {
			    outputMode(); sollyaPrintf("Dereferences the lower range bound.\n");
                          }
    break;

  case 423:
/* Line 1787 of yacc.c  */
#line 2402 "parser.y"
    {
			    outputMode(); sollyaPrintf("Dereferences the mid-point of a range.\n");
                          }
    break;

  case 424:
/* Line 1787 of yacc.c  */
#line 2406 "parser.y"
    {
#ifdef HELP_GE_TEXT
			    outputMode(); sollyaPrintf(HELP_GE_TEXT);
#else
			    outputMode(); sollyaPrintf("Comparison greater than or equal to.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for GE"
#endif
#endif
			  }
    break;

  case 425:
/* Line 1787 of yacc.c  */
#line 2417 "parser.y"
    {
			    outputMode(); sollyaPrintf("Accessing an element in a structured type.\n");
			  }
    break;

  case 426:
/* Line 1787 of yacc.c  */
#line 2421 "parser.y"
    {
			    outputMode(); sollyaPrintf("Dereferences the upper range bound.\n");
                          }
    break;

  case 427:
/* Line 1787 of yacc.c  */
#line 2425 "parser.y"
    {
#ifdef HELP_GT_TEXT
			    outputMode(); sollyaPrintf(HELP_GT_TEXT);
#else
			    outputMode(); sollyaPrintf("Comparison greater than.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for GT"
#endif
#endif
                          }
    break;

  case 428:
/* Line 1787 of yacc.c  */
#line 2436 "parser.y"
    {
			    outputMode(); sollyaPrintf("Ellipsis.\n");
                          }
    break;

  case 429:
/* Line 1787 of yacc.c  */
#line 2440 "parser.y"
    {
			    outputMode(); sollyaPrintf("Dereferences global environment variables.\n");
                          }
    break;

  case 430:
/* Line 1787 of yacc.c  */
#line 2444 "parser.y"
    {
			    outputMode(); sollyaPrintf("Starts or ends a list.\n");
                          }
    break;

  case 431:
/* Line 1787 of yacc.c  */
#line 2448 "parser.y"
    {
#ifdef HELP_CONCAT_TEXT
			    outputMode(); sollyaPrintf(HELP_CONCAT_TEXT);
#else
			    outputMode(); sollyaPrintf("Concatenation of lists or strings.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for CONCAT"
#endif
#endif
                          }
    break;

  case 432:
/* Line 1787 of yacc.c  */
#line 2459 "parser.y"
    {
			    outputMode(); sollyaPrintf("a::b prepends a to list b or appends b to list a, preprending list a to list b if both are lists.\n");
                          }
    break;

  case 433:
/* Line 1787 of yacc.c  */
#line 2463 "parser.y"
    {
#ifdef HELP_PREPEND_TEXT
			    outputMode(); sollyaPrintf(HELP_PREPEND_TEXT);
#else
			    outputMode(); sollyaPrintf("a.:b prepends a to list b.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PREPEND"
#endif
#endif
                          }
    break;

  case 434:
/* Line 1787 of yacc.c  */
#line 2474 "parser.y"
    {
#ifdef HELP_APPEND_TEXT
			    outputMode(); sollyaPrintf(HELP_APPEND_TEXT);
#else
			    outputMode(); sollyaPrintf("a:.b appends b to list a.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for APPEND"
#endif
#endif
                          }
    break;

  case 435:
/* Line 1787 of yacc.c  */
#line 2485 "parser.y"
    {
#ifdef HELP_NEQ_TEXT
			    outputMode(); sollyaPrintf(HELP_NEQ_TEXT);
#else
			    outputMode(); sollyaPrintf("Comparison not equal.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for NEQ"
#endif
#endif
                          }
    break;

  case 436:
/* Line 1787 of yacc.c  */
#line 2496 "parser.y"
    {
#ifdef HELP_AND_TEXT
			    outputMode(); sollyaPrintf(HELP_AND_TEXT);
#else
			    outputMode(); sollyaPrintf("Boolean and.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for AND"
#endif
#endif
                          }
    break;

  case 437:
/* Line 1787 of yacc.c  */
#line 2507 "parser.y"
    {
#ifdef HELP_OR_TEXT
			    outputMode(); sollyaPrintf(HELP_OR_TEXT);
#else
			    outputMode(); sollyaPrintf("Boolean or.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for OR"
#endif
#endif
                          }
    break;

  case 438:
/* Line 1787 of yacc.c  */
#line 2518 "parser.y"
    {
#ifdef HELP_PLUS_TEXT
			    outputMode(); sollyaPrintf(HELP_PLUS_TEXT);
#else
			    outputMode(); sollyaPrintf("Addition.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PLUS"
#endif
#endif
                          }
    break;

  case 439:
/* Line 1787 of yacc.c  */
#line 2529 "parser.y"
    {
#ifdef HELP_MINUS_TEXT
			    outputMode(); sollyaPrintf(HELP_MINUS_TEXT);
#else
			    outputMode(); sollyaPrintf("Substraction.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for MINUS"
#endif
#endif
                          }
    break;

  case 440:
/* Line 1787 of yacc.c  */
#line 2540 "parser.y"
    {
#ifdef HELP_APPROX_TEXT
			    outputMode(); sollyaPrintf(HELP_APPROX_TEXT);
#else
			    outputMode(); sollyaPrintf("Floating-point approximation of a constant expression.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for APPROX"
#endif
#endif
                          }
    break;

  case 441:
/* Line 1787 of yacc.c  */
#line 2551 "parser.y"
    {
#ifdef HELP_MULT_TEXT
			    outputMode(); sollyaPrintf(HELP_MULT_TEXT);
#else
			    outputMode(); sollyaPrintf("Multiplication.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for MULT"
#endif
#endif
                          }
    break;

  case 442:
/* Line 1787 of yacc.c  */
#line 2562 "parser.y"
    {
#ifdef HELP_DIVIDE_TEXT
			    outputMode(); sollyaPrintf(HELP_DIVIDE_TEXT);
#else
			    outputMode(); sollyaPrintf("Division.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DIVIDE"
#endif
#endif
                          }
    break;

  case 443:
/* Line 1787 of yacc.c  */
#line 2573 "parser.y"
    {
#ifdef HELP_POWER_TEXT
			    outputMode(); sollyaPrintf(HELP_POWER_TEXT);
#else
			    outputMode(); sollyaPrintf("Exponentiation.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for POWER"
#endif
#endif
                          }
    break;

  case 444:
/* Line 1787 of yacc.c  */
#line 2584 "parser.y"
    {
#ifdef HELP_SQRT_TEXT
			    outputMode(); sollyaPrintf(HELP_SQRT_TEXT);
#else
			    outputMode(); sollyaPrintf("Square root.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for SQRT"
#endif
#endif
                          }
    break;

  case 445:
/* Line 1787 of yacc.c  */
#line 2595 "parser.y"
    {
#ifdef HELP_EXP_TEXT
			    outputMode(); sollyaPrintf(HELP_EXP_TEXT);
#else
			    outputMode(); sollyaPrintf("Exponential.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for EXP"
#endif
#endif
                          }
    break;

  case 446:
/* Line 1787 of yacc.c  */
#line 2606 "parser.y"
    {
#ifdef HELP_FREEVAR_TEXT
			    outputMode(); sollyaPrintf(HELP_FREEVAR_TEXT);
#else
			    outputMode(); sollyaPrintf("Reserved default free variable _x_.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for FREEVAR"
#endif
#endif
                          }
    break;

  case 447:
/* Line 1787 of yacc.c  */
#line 2617 "parser.y"
    {
#ifdef HELP_LOG_TEXT
			    outputMode(); sollyaPrintf(HELP_LOG_TEXT);
#else
			    outputMode(); sollyaPrintf("Natural logarithm.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for LOG"
#endif
#endif
                          }
    break;

  case 448:
/* Line 1787 of yacc.c  */
#line 2628 "parser.y"
    {
#ifdef HELP_LOG2_TEXT
			    outputMode(); sollyaPrintf(HELP_LOG2_TEXT);
#else
			    outputMode(); sollyaPrintf("Logarithm in base 2.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for LOG2"
#endif
#endif
                          }
    break;

  case 449:
/* Line 1787 of yacc.c  */
#line 2639 "parser.y"
    {
#ifdef HELP_LOG10_TEXT
			    outputMode(); sollyaPrintf(HELP_LOG10_TEXT);
#else
			    outputMode(); sollyaPrintf("Logarithm in base 10.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for LOG10"
#endif
#endif
                          }
    break;

  case 450:
/* Line 1787 of yacc.c  */
#line 2650 "parser.y"
    {
#ifdef HELP_SIN_TEXT
			    outputMode(); sollyaPrintf(HELP_SIN_TEXT);
#else
			    outputMode(); sollyaPrintf("Sine.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for SIN"
#endif
#endif
                          }
    break;

  case 451:
/* Line 1787 of yacc.c  */
#line 2661 "parser.y"
    {
#ifdef HELP_COS_TEXT
			    outputMode(); sollyaPrintf(HELP_COS_TEXT);
#else
			    outputMode(); sollyaPrintf("Cosine.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for COS"
#endif
#endif
                          }
    break;

  case 452:
/* Line 1787 of yacc.c  */
#line 2672 "parser.y"
    {
#ifdef HELP_TAN_TEXT
			    outputMode(); sollyaPrintf(HELP_TAN_TEXT);
#else
			    outputMode(); sollyaPrintf("Tangent.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for TAN"
#endif
#endif
                          }
    break;

  case 453:
/* Line 1787 of yacc.c  */
#line 2683 "parser.y"
    {
#ifdef HELP_ASIN_TEXT
			    outputMode(); sollyaPrintf(HELP_ASIN_TEXT);
#else
			    outputMode(); sollyaPrintf("Arcsine.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ASIN"
#endif
#endif
                          }
    break;

  case 454:
/* Line 1787 of yacc.c  */
#line 2694 "parser.y"
    {
#ifdef HELP_ACOS_TEXT
			    outputMode(); sollyaPrintf(HELP_ACOS_TEXT);
#else
			    outputMode(); sollyaPrintf("Arcosine.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ACOS"
#endif
#endif
                          }
    break;

  case 455:
/* Line 1787 of yacc.c  */
#line 2705 "parser.y"
    {
#ifdef HELP_ATAN_TEXT
			    outputMode(); sollyaPrintf(HELP_ATAN_TEXT);
#else
			    outputMode(); sollyaPrintf("Arctangent.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ATAN"
#endif
#endif
                          }
    break;

  case 456:
/* Line 1787 of yacc.c  */
#line 2716 "parser.y"
    {
#ifdef HELP_SINH_TEXT
			    outputMode(); sollyaPrintf(HELP_SINH_TEXT);
#else
			    outputMode(); sollyaPrintf("Hyperbolic sine.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for SINH"
#endif
#endif
                          }
    break;

  case 457:
/* Line 1787 of yacc.c  */
#line 2727 "parser.y"
    {
#ifdef HELP_COSH_TEXT
			    outputMode(); sollyaPrintf(HELP_COSH_TEXT);
#else
			    outputMode(); sollyaPrintf("Hyperbolic cosine.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for COSH"
#endif
#endif
                          }
    break;

  case 458:
/* Line 1787 of yacc.c  */
#line 2738 "parser.y"
    {
#ifdef HELP_TANH_TEXT
			    outputMode(); sollyaPrintf(HELP_TANH_TEXT);
#else
			    outputMode(); sollyaPrintf("Hyperbolic tangent.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for TANH"
#endif
#endif
                          }
    break;

  case 459:
/* Line 1787 of yacc.c  */
#line 2749 "parser.y"
    {
#ifdef HELP_ASINH_TEXT
			    outputMode(); sollyaPrintf(HELP_ASINH_TEXT);
#else
			    outputMode(); sollyaPrintf("Area sine.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ASINH"
#endif
#endif
                          }
    break;

  case 460:
/* Line 1787 of yacc.c  */
#line 2760 "parser.y"
    {
#ifdef HELP_ACOSH_TEXT
			    outputMode(); sollyaPrintf(HELP_ACOSH_TEXT);
#else
			    outputMode(); sollyaPrintf("Area cosine.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ACOSH"
#endif
#endif
                          }
    break;

  case 461:
/* Line 1787 of yacc.c  */
#line 2771 "parser.y"
    {
#ifdef HELP_ATANH_TEXT
			    outputMode(); sollyaPrintf(HELP_ATANH_TEXT);
#else

			    outputMode(); sollyaPrintf("Area tangent.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ATANH"
#endif
#endif
                          }
    break;

  case 462:
/* Line 1787 of yacc.c  */
#line 2783 "parser.y"
    {
#ifdef HELP_ABS_TEXT
			    outputMode(); sollyaPrintf(HELP_ABS_TEXT);
#else
			    outputMode(); sollyaPrintf("Absolute value.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ABS"
#endif
#endif
                          }
    break;

  case 463:
/* Line 1787 of yacc.c  */
#line 2794 "parser.y"
    {
#ifdef HELP_ERF_TEXT
			    outputMode(); sollyaPrintf(HELP_ERF_TEXT);
#else
			    outputMode(); sollyaPrintf("Error function.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ERF"
#endif
#endif
                          }
    break;

  case 464:
/* Line 1787 of yacc.c  */
#line 2805 "parser.y"
    {
#ifdef HELP_ERFC_TEXT
			    outputMode(); sollyaPrintf(HELP_ERFC_TEXT);
#else
			    outputMode(); sollyaPrintf("Complementary error function.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ERFC"
#endif
#endif
                          }
    break;

  case 465:
/* Line 1787 of yacc.c  */
#line 2816 "parser.y"
    {
#ifdef HELP_LOG1P_TEXT
			    outputMode(); sollyaPrintf(HELP_LOG1P_TEXT);
#else
			    outputMode(); sollyaPrintf("Natural logarithm of 1 plus argument.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for LOG1P"
#endif
#endif
                          }
    break;

  case 466:
/* Line 1787 of yacc.c  */
#line 2827 "parser.y"
    {
#ifdef HELP_EXPM1_TEXT
			    outputMode(); sollyaPrintf(HELP_EXPM1_TEXT);
#else
			    outputMode(); sollyaPrintf("Exponential of argument minus 1.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for EXPM1"
#endif
#endif
                          }
    break;

  case 467:
/* Line 1787 of yacc.c  */
#line 2838 "parser.y"
    {
#ifdef HELP_DOUBLE_TEXT
			    outputMode(); sollyaPrintf(HELP_DOUBLE_TEXT);
#else
			    outputMode(); sollyaPrintf("Double precision rounding operator.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DOUBLE"
#endif
#endif
                          }
    break;

  case 468:
/* Line 1787 of yacc.c  */
#line 2849 "parser.y"
    {
#ifdef HELP_SINGLE_TEXT
			    outputMode(); sollyaPrintf(HELP_SINGLE_TEXT);
#else
			    outputMode(); sollyaPrintf("Single precision rounding operator.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for SINGLE"
#endif
#endif
                          }
    break;

  case 469:
/* Line 1787 of yacc.c  */
#line 2860 "parser.y"
    {
#ifdef HELP_QUAD_TEXT
			    outputMode(); sollyaPrintf(HELP_QUAD_TEXT);
#else
			    outputMode(); sollyaPrintf("Quad precision rounding operator.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for QUAD"
#endif
#endif
                          }
    break;

  case 470:
/* Line 1787 of yacc.c  */
#line 2871 "parser.y"
    {
#ifdef HELP_HALFPRECISION_TEXT
			    outputMode(); sollyaPrintf(HELP_HALFPRECISION_TEXT);
#else
			    outputMode(); sollyaPrintf("Half-precision rounding operator.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for HALFPRECISION"
#endif
#endif
                          }
    break;

  case 471:
/* Line 1787 of yacc.c  */
#line 2882 "parser.y"
    {
#ifdef HELP_DOUBLEDOUBLE_TEXT
			    outputMode(); sollyaPrintf(HELP_DOUBLEDOUBLE_TEXT);
#else
			    outputMode(); sollyaPrintf("Double-double precision rounding operator.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DOUBLEDOUBLE"
#endif
#endif
                          }
    break;

  case 472:
/* Line 1787 of yacc.c  */
#line 2893 "parser.y"
    {
#ifdef HELP_TRIPLEDOUBLE_TEXT
			    outputMode(); sollyaPrintf(HELP_TRIPLEDOUBLE_TEXT);
#else
			    outputMode(); sollyaPrintf("Triple-double precision rounding operator.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for TRIPLEDOUBLE"
#endif
#endif
                          }
    break;

  case 473:
/* Line 1787 of yacc.c  */
#line 2904 "parser.y"
    {
#ifdef HELP_DOUBLEEXTENDED_TEXT
			    outputMode(); sollyaPrintf(HELP_DOUBLEEXTENDED_TEXT);
#else
			    outputMode(); sollyaPrintf("Double-extended precision rounding operator.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DOUBLEEXTENDED"
#endif
#endif
                          }
    break;

  case 474:
/* Line 1787 of yacc.c  */
#line 2915 "parser.y"
    {
#ifdef HELP_CEIL_TEXT
			    outputMode(); sollyaPrintf(HELP_CEIL_TEXT);
#else
			    outputMode(); sollyaPrintf("Ceiling.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for CEIL"
#endif
#endif
                          }
    break;

  case 475:
/* Line 1787 of yacc.c  */
#line 2926 "parser.y"
    {
#ifdef HELP_FLOOR_TEXT
			    outputMode(); sollyaPrintf(HELP_FLOOR_TEXT);
#else
			    outputMode(); sollyaPrintf("Floor.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for FLOOR"
#endif
#endif
                          }
    break;

  case 476:
/* Line 1787 of yacc.c  */
#line 2937 "parser.y"
    {
#ifdef HELP_NEARESTINT_TEXT
			    outputMode(); sollyaPrintf(HELP_NEARESTINT_TEXT);
#else
			    outputMode(); sollyaPrintf("Nearest integer with even tie cases rule.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for NEARESTINT"
#endif
#endif
                          }
    break;

  case 477:
/* Line 1787 of yacc.c  */
#line 2948 "parser.y"
    {
#ifdef HELP_HEAD_TEXT
			    outputMode(); sollyaPrintf(HELP_HEAD_TEXT);
#else
			    outputMode(); sollyaPrintf("Head of a list.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for HEAD"
#endif
#endif
                          }
    break;

  case 478:
/* Line 1787 of yacc.c  */
#line 2959 "parser.y"
    {
#ifdef HELP_ROUNDCORRECTLY_TEXT
			    outputMode(); sollyaPrintf(HELP_ROUNDCORRECTLY_TEXT);
#else
			    outputMode(); sollyaPrintf("Round a bounding to the nearest floating-point value such that correct rounding is possible.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ROUNDCORRECTLY"
#endif
#endif
                          }
    break;

  case 479:
/* Line 1787 of yacc.c  */
#line 2970 "parser.y"
    {
#ifdef HELP_READFILE_TEXT
			    outputMode(); sollyaPrintf(HELP_READFILE_TEXT);
#else
			    outputMode(); sollyaPrintf("Reads a file into a string.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for READFILE"
#endif
#endif
                          }
    break;

  case 480:
/* Line 1787 of yacc.c  */
#line 2981 "parser.y"
    {
#ifdef HELP_REVERT_TEXT
			    outputMode(); sollyaPrintf(HELP_REVERT_TEXT);
#else
			    outputMode(); sollyaPrintf("Reverts a list that is not finally elliptic.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for REVERT"
#endif
#endif
                          }
    break;

  case 481:
/* Line 1787 of yacc.c  */
#line 2992 "parser.y"
    {
#ifdef HELP_SORT_TEXT
			    outputMode(); sollyaPrintf(HELP_SORT_TEXT);
#else
			    outputMode(); sollyaPrintf("Sorts a list of constants in ascending order.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for SORT"
#endif
#endif
                          }
    break;

  case 482:
/* Line 1787 of yacc.c  */
#line 3003 "parser.y"
    {
#ifdef HELP_TAIL_TEXT
			    outputMode(); sollyaPrintf(HELP_TAIL_TEXT);
#else
			    outputMode(); sollyaPrintf("Tail of a list.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for TAIL"
#endif
#endif
                          }
    break;

  case 483:
/* Line 1787 of yacc.c  */
#line 3014 "parser.y"
    {
#ifdef HELP_PREC_TEXT
			    outputMode(); sollyaPrintf(HELP_PREC_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable precision.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PREC"
#endif
#endif
                          }
    break;

  case 484:
/* Line 1787 of yacc.c  */
#line 3025 "parser.y"
    {
#ifdef HELP_POINTS_TEXT
			    outputMode(); sollyaPrintf(HELP_POINTS_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable number of points.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for POINTS"
#endif
#endif
                          }
    break;

  case 485:
/* Line 1787 of yacc.c  */
#line 3036 "parser.y"
    {
#ifdef HELP_DIAM_TEXT
			    outputMode(); sollyaPrintf(HELP_DIAM_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable diameter.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DIAM"
#endif
#endif
                          }
    break;

  case 486:
/* Line 1787 of yacc.c  */
#line 3047 "parser.y"
    {
#ifdef HELP_DISPLAY_TEXT
			    outputMode(); sollyaPrintf(HELP_DISPLAY_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable display mode.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DISPLAY"
#endif
#endif
                          }
    break;

  case 487:
/* Line 1787 of yacc.c  */
#line 3058 "parser.y"
    {
#ifdef HELP_VERBOSITY_TEXT
			    outputMode(); sollyaPrintf(HELP_VERBOSITY_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable verbosity.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for VERBOSITY"
#endif
#endif
                          }
    break;

  case 488:
/* Line 1787 of yacc.c  */
#line 3069 "parser.y"
    {
#ifdef HELP_SHOWMESSAGENUMBERS_TEXT
			    outputMode(); sollyaPrintf(HELP_SHOWMESSAGENUMBERS_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable activating the displaying of message numbers.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for SHOWMESSAGENUMBERS"
#endif
#endif
                          }
    break;

  case 489:
/* Line 1787 of yacc.c  */
#line 3080 "parser.y"
    {
#ifdef HELP_CANONICAL_TEXT
			    outputMode(); sollyaPrintf(HELP_CANONICAL_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable canonical output.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for CANONICAL"
#endif
#endif
                          }
    break;

  case 490:
/* Line 1787 of yacc.c  */
#line 3091 "parser.y"
    {
#ifdef HELP_AUTOSIMPLIFY_TEXT
			    outputMode(); sollyaPrintf(HELP_AUTOSIMPLIFY_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable automatic simplification.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for AUTOSIMPLIFY"
#endif
#endif
                          }
    break;

  case 491:
/* Line 1787 of yacc.c  */
#line 3102 "parser.y"
    {
#ifdef HELP_TAYLORRECURSIONS_TEXT
			    outputMode(); sollyaPrintf(HELP_TAYLORRECURSIONS_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable recursions of Taylor evaluation.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for TAYLORRECURSIONS"
#endif
#endif
                          }
    break;

  case 492:
/* Line 1787 of yacc.c  */
#line 3113 "parser.y"
    {
#ifdef HELP_TIMING_TEXT
			    outputMode(); sollyaPrintf(HELP_TIMING_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable timing of computations.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for TIMING"
#endif
#endif
                          }
    break;

  case 493:
/* Line 1787 of yacc.c  */
#line 3124 "parser.y"
    {
#ifdef HELP_TIME_TEXT
			    outputMode(); sollyaPrintf(HELP_TIME_TEXT);
#else
			    outputMode(); sollyaPrintf("High-level time procedure.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for TIME"
#endif
#endif
                          }
    break;

  case 494:
/* Line 1787 of yacc.c  */
#line 3135 "parser.y"
    {
#ifdef HELP_FULLPARENTHESES_TEXT
			    outputMode(); sollyaPrintf(HELP_FULLPARENTHESES_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable fully parenthized mode.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for FULLPARENTHESES"
#endif
#endif
                          }
    break;

  case 495:
/* Line 1787 of yacc.c  */
#line 3146 "parser.y"
    {
#ifdef HELP_MIDPOINTMODE_TEXT
			    outputMode(); sollyaPrintf(HELP_MIDPOINTMODE_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable midpoint mode.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for MIDPOINTMODE"
#endif
#endif
                          }
    break;

  case 496:
/* Line 1787 of yacc.c  */
#line 3157 "parser.y"
    {
#ifdef HELP_DIEONERRORMODE_TEXT
			    outputMode(); sollyaPrintf(HELP_DIEONERRORMODE_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable for die-on-error mode.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DIEONERRORMODE"
#endif
#endif
                          }
    break;

  case 497:
/* Line 1787 of yacc.c  */
#line 3168 "parser.y"
    {
#ifdef HELP_RATIONALMODE_TEXT
			    outputMode(); sollyaPrintf(HELP_RATIONALMODE_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable rational mode.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for RATIONALMODE"
#endif
#endif
                          }
    break;

  case 498:
/* Line 1787 of yacc.c  */
#line 3179 "parser.y"
    {
#ifdef HELP_ROUNDINGWARNINGS_TEXT
			    outputMode(); sollyaPrintf(HELP_ROUNDINGWARNINGS_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable activating warnings about rounding.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ROUNDINGWARNINGS"
#endif
#endif
                          }
    break;

  case 499:
/* Line 1787 of yacc.c  */
#line 3190 "parser.y"
    {
#ifdef HELP_HOPITALRECURSIONS_TEXT
			    outputMode(); sollyaPrintf(HELP_HOPITALRECURSIONS_TEXT);
#else
			    outputMode(); sollyaPrintf("Global environment variable recursions of Hopital evaluation.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for HOPITALRECURSIONS"
#endif
#endif
                          }
    break;

  case 500:
/* Line 1787 of yacc.c  */
#line 3201 "parser.y"
    {
#ifdef HELP_ON_TEXT
			    outputMode(); sollyaPrintf(HELP_ON_TEXT);
#else
			    outputMode(); sollyaPrintf("Something is switched on.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ON"
#endif
#endif
                          }
    break;

  case 501:
/* Line 1787 of yacc.c  */
#line 3212 "parser.y"
    {
#ifdef HELP_OFF_TEXT
			    outputMode(); sollyaPrintf(HELP_OFF_TEXT);
#else
			    outputMode(); sollyaPrintf("Something is switched off.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for OFF"
#endif
#endif
                          }
    break;

  case 502:
/* Line 1787 of yacc.c  */
#line 3223 "parser.y"
    {
#ifdef HELP_DYADIC_TEXT
			    outputMode(); sollyaPrintf(HELP_DYADIC_TEXT);
#else
			    outputMode(); sollyaPrintf("Display mode is dyadic output.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DYADIC"
#endif
#endif
                          }
    break;

  case 503:
/* Line 1787 of yacc.c  */
#line 3234 "parser.y"
    {
#ifdef HELP_POWERS_TEXT
			    outputMode(); sollyaPrintf(HELP_POWERS_TEXT);
#else
			    outputMode(); sollyaPrintf("Display mode is dyadic output with powers.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for POWERS"
#endif
#endif
                          }
    break;

  case 504:
/* Line 1787 of yacc.c  */
#line 3245 "parser.y"
    {
#ifdef HELP_BINARY_TEXT
			    outputMode(); sollyaPrintf(HELP_BINARY_TEXT);
#else
			    outputMode(); sollyaPrintf("Display mode is binary.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for BINARY"
#endif
#endif
                          }
    break;

  case 505:
/* Line 1787 of yacc.c  */
#line 3256 "parser.y"
    {
#ifdef HELP_HEXADECIMAL_TEXT
			    outputMode(); sollyaPrintf(HELP_HEXADECIMAL_TEXT);
#else
			    outputMode(); sollyaPrintf("Display mode is hexadecimal.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for HEXADECIMAL"
#endif
#endif
                          }
    break;

  case 506:
/* Line 1787 of yacc.c  */
#line 3267 "parser.y"
    {
#ifdef HELP_FILE_TEXT
			    outputMode(); sollyaPrintf(HELP_FILE_TEXT);
#else
			    outputMode(); sollyaPrintf("A file will be specified.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for FILE"
#endif
#endif
                          }
    break;

  case 507:
/* Line 1787 of yacc.c  */
#line 3278 "parser.y"
    {
#ifdef HELP_POSTSCRIPT_TEXT
			    outputMode(); sollyaPrintf(HELP_POSTSCRIPT_TEXT);
#else
			    outputMode(); sollyaPrintf("A postscript file will be specified.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for POSTSCRIPT"
#endif
#endif
                          }
    break;

  case 508:
/* Line 1787 of yacc.c  */
#line 3289 "parser.y"
    {
#ifdef HELP_POSTSCRIPTFILE_TEXT
			    outputMode(); sollyaPrintf(HELP_POSTSCRIPTFILE_TEXT);
#else
			    outputMode(); sollyaPrintf("A postscript file and a file will be specified.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for POSTSCRIPTFILE"
#endif
#endif
                          }
    break;

  case 509:
/* Line 1787 of yacc.c  */
#line 3300 "parser.y"
    {
#ifdef HELP_PERTURB_TEXT
			    outputMode(); sollyaPrintf(HELP_PERTURB_TEXT);
#else
			    outputMode(); sollyaPrintf("Perturbation is demanded.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PERTURB"
#endif
#endif
                          }
    break;

  case 510:
/* Line 1787 of yacc.c  */
#line 3311 "parser.y"
    {
#ifdef HELP_RD_TEXT
			    outputMode(); sollyaPrintf(HELP_RD_TEXT);
#else
			    outputMode(); sollyaPrintf("Round towards minus infinity.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for RD"
#endif
#endif
                          }
    break;

  case 511:
/* Line 1787 of yacc.c  */
#line 3322 "parser.y"
    {
#ifdef HELP_RU_TEXT
			    outputMode(); sollyaPrintf(HELP_RU_TEXT);
#else
			    outputMode(); sollyaPrintf("Round towards plus infinity.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for RU"
#endif
#endif
                          }
    break;

  case 512:
/* Line 1787 of yacc.c  */
#line 3333 "parser.y"
    {
#ifdef HELP_RZ_TEXT
			    outputMode(); sollyaPrintf(HELP_RZ_TEXT);
#else
			    outputMode(); sollyaPrintf("Round towards zero.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for RZ"
#endif
#endif
                          }
    break;

  case 513:
/* Line 1787 of yacc.c  */
#line 3344 "parser.y"
    {
#ifdef HELP_RN_TEXT
			    outputMode(); sollyaPrintf(HELP_RN_TEXT);
#else
			    outputMode(); sollyaPrintf("Round to nearest.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for RN"
#endif
#endif
                          }
    break;

  case 514:
/* Line 1787 of yacc.c  */
#line 3355 "parser.y"
    {
#ifdef HELP_HONORCOEFFPREC_TEXT
			    outputMode(); sollyaPrintf(HELP_HONORCOEFFPREC_TEXT);
#else
			    outputMode(); sollyaPrintf("Honorate the precision of the coefficients.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for HONORCOEFFPREC"
#endif
#endif
                          }
    break;

  case 515:
/* Line 1787 of yacc.c  */
#line 3366 "parser.y"
    {
#ifdef HELP_TRUE_TEXT
			    outputMode(); sollyaPrintf(HELP_TRUE_TEXT);
#else
			    outputMode(); sollyaPrintf("Boolean constant true.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for TRUE"
#endif
#endif
                          }
    break;

  case 516:
/* Line 1787 of yacc.c  */
#line 3377 "parser.y"
    {
#ifdef HELP_FALSE_TEXT
			    outputMode(); sollyaPrintf(HELP_FALSE_TEXT);
#else
			    outputMode(); sollyaPrintf("Boolean constant false.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for FALSE"
#endif
#endif
                          }
    break;

  case 517:
/* Line 1787 of yacc.c  */
#line 3388 "parser.y"
    {
#ifdef HELP_DEFAULT_TEXT
			    outputMode(); sollyaPrintf(HELP_DEFAULT_TEXT);
#else
			    outputMode(); sollyaPrintf("Default value.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DEFAULT"
#endif
#endif
                          }
    break;

  case 518:
/* Line 1787 of yacc.c  */
#line 3399 "parser.y"
    {
#ifdef HELP_MATCH_TEXT
			    outputMode(); sollyaPrintf(HELP_MATCH_TEXT);
#else
			    outputMode(); sollyaPrintf("match ... with ... construct.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for MATCH"
#endif
#endif
                          }
    break;

  case 519:
/* Line 1787 of yacc.c  */
#line 3410 "parser.y"
    {
#ifdef HELP_WITH_TEXT
			    outputMode(); sollyaPrintf(HELP_WITH_TEXT);
#else
			    outputMode(); sollyaPrintf("match ... with ... construct.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for WITH"
#endif
#endif
                          }
    break;

  case 520:
/* Line 1787 of yacc.c  */
#line 3421 "parser.y"
    {
#ifdef HELP_ABSOLUTE_TEXT
			    outputMode(); sollyaPrintf(HELP_ABSOLUTE_TEXT);
#else
			    outputMode(); sollyaPrintf("Consider an absolute error.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ABSOLUTE"
#endif
#endif
                          }
    break;

  case 521:
/* Line 1787 of yacc.c  */
#line 3432 "parser.y"
    {
#ifdef HELP_DECIMAL_TEXT
			    outputMode(); sollyaPrintf(HELP_DECIMAL_TEXT);
#else
			    outputMode(); sollyaPrintf("Display mode is decimal.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DECIMAL"
#endif
#endif
                          }
    break;

  case 522:
/* Line 1787 of yacc.c  */
#line 3443 "parser.y"
    {
#ifdef HELP_RELATIVE_TEXT
			    outputMode(); sollyaPrintf(HELP_RELATIVE_TEXT);
#else
			    outputMode(); sollyaPrintf("Consider a relative error.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for RELATIVE"
#endif
#endif
                          }
    break;

  case 523:
/* Line 1787 of yacc.c  */
#line 3454 "parser.y"
    {
#ifdef HELP_FIXED_TEXT
			    outputMode(); sollyaPrintf(HELP_FIXED_TEXT);
#else
			    outputMode(); sollyaPrintf("Consider fixed-point numbers.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for FIXED"
#endif
#endif
                          }
    break;

  case 524:
/* Line 1787 of yacc.c  */
#line 3465 "parser.y"
    {
#ifdef HELP_FLOATING_TEXT
			    outputMode(); sollyaPrintf(HELP_FLOATING_TEXT);
#else
			    outputMode(); sollyaPrintf("Consider floating-point numbers.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for FLOATING"
#endif
#endif
                          }
    break;

  case 525:
/* Line 1787 of yacc.c  */
#line 3476 "parser.y"
    {
#ifdef HELP_ERROR_TEXT
			    outputMode(); sollyaPrintf(HELP_ERROR_TEXT);
#else
			    outputMode(); sollyaPrintf("Type error meta-value.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ERROR"
#endif
#endif
                          }
    break;

  case 526:
/* Line 1787 of yacc.c  */
#line 3487 "parser.y"
    {
#ifdef HELP_QUIT_TEXT
			    outputMode(); sollyaPrintf(HELP_QUIT_TEXT);
#else
			    outputMode(); sollyaPrintf("Exit from the tool.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for QUIT"
#endif
#endif
                          }
    break;

  case 527:
/* Line 1787 of yacc.c  */
#line 3498 "parser.y"
    {
#ifdef HELP_QUIT_TEXT
			    outputMode(); sollyaPrintf(HELP_QUIT_TEXT);
#else
			    outputMode(); sollyaPrintf("Exit from the tool - help is called inside a read macro.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for QUIT"
#endif
#endif
                          }
    break;

  case 528:
/* Line 1787 of yacc.c  */
#line 3509 "parser.y"
    {
#ifdef HELP_RESTART_TEXT
			    outputMode(); sollyaPrintf(HELP_RESTART_TEXT);
#else
			    outputMode(); sollyaPrintf("Restart the tool.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for RESTART"
#endif
#endif
                          }
    break;

  case 529:
/* Line 1787 of yacc.c  */
#line 3520 "parser.y"
    {
#ifdef HELP_LIBRARY_TEXT
			    outputMode(); sollyaPrintf(HELP_LIBRARY_TEXT);
#else
			    outputMode(); sollyaPrintf("Library binding dereferencer.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for LIBRARY"
#endif
#endif
                          }
    break;

  case 530:
/* Line 1787 of yacc.c  */
#line 3531 "parser.y"
    {
#ifdef HELP_LIBRARYCONSTANT_TEXT
			    outputMode(); sollyaPrintf(HELP_LIBRARYCONSTANT_TEXT);
#else
			    outputMode(); sollyaPrintf("Library constant binding dereferencer.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for LIBRARYCONSTANT"
#endif
#endif
                          }
    break;

  case 531:
/* Line 1787 of yacc.c  */
#line 3542 "parser.y"
    {
#ifdef HELP_DIFF_TEXT
			    outputMode(); sollyaPrintf(HELP_DIFF_TEXT);
#else
			    outputMode(); sollyaPrintf("Differentiation: diff(func).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DIFF"
#endif
#endif
                          }
    break;

  case 532:
/* Line 1787 of yacc.c  */
#line 3553 "parser.y"
    {
#ifdef HELP_BASHEVALUATE_TEXT
			    outputMode(); sollyaPrintf(HELP_BASHEVALUATE_TEXT);
#else
			    outputMode(); sollyaPrintf("Executes a string as a bash command and returns the output as a string.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for BASHEVALUATE"
#endif
#endif
                          }
    break;

  case 533:
/* Line 1787 of yacc.c  */
#line 3564 "parser.y"
    {
#ifdef HELP_GETSUPPRESSEDMESSAGES_TEXT
			    outputMode(); sollyaPrintf(HELP_GETSUPPRESSEDMESSAGES_TEXT);
#else
			    outputMode(); sollyaPrintf("Get a list of message numbers that have been suppressed.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for GETSUPPRESSEDMESSAGES"
#endif
#endif
                          }
    break;

  case 534:
/* Line 1787 of yacc.c  */
#line 3575 "parser.y"
    {
#ifdef HELP_DIRTYSIMPLIFY_TEXT
			    outputMode(); sollyaPrintf(HELP_DIRTYSIMPLIFY_TEXT);
#else
			    outputMode(); sollyaPrintf("Simplify with floating-point evaluation: dirtysimplify(func).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DIRTYSIMPLIFY"
#endif
#endif
                          }
    break;

  case 535:
/* Line 1787 of yacc.c  */
#line 3586 "parser.y"
    {
#ifdef HELP_REMEZ_TEXT
			    outputMode(); sollyaPrintf(HELP_REMEZ_TEXT);
#else
			    outputMode(); sollyaPrintf("Remez: remez(func,degree|monoms,range[,weight[,quality]]).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for REMEZ"
#endif
#endif
                          }
    break;

  case 536:
/* Line 1787 of yacc.c  */
#line 3597 "parser.y"
    {
#ifdef HELP_MIN_TEXT
			    outputMode(); sollyaPrintf(HELP_MIN_TEXT);
#else
			    outputMode(); sollyaPrintf("min(val1,val2,...,valn): computes the minimum of the constant expressions vali.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for MIN"
#endif
#endif
                          }
    break;

  case 537:
/* Line 1787 of yacc.c  */
#line 3608 "parser.y"
    {
#ifdef HELP_MAX_TEXT
			    outputMode(); sollyaPrintf(HELP_MAX_TEXT);
#else
			    outputMode(); sollyaPrintf("max(val1,val2,...,valn): computes the maximum of the constant expressions vali.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for MAX"
#endif
#endif
                          }
    break;

  case 538:
/* Line 1787 of yacc.c  */
#line 3619 "parser.y"
    {
#ifdef HELP_FPMINIMAX_TEXT
			    outputMode(); sollyaPrintf(HELP_FPMINIMAX_TEXT);
#else
			    outputMode(); sollyaPrintf("Fpminimax: fpminimax(func,degree|monoms,formats,range|pointslist[,absolute|relative[,fixed|floating[,constrainedPart[, minimaxpoly]]]]).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for FPMINIMAX"
#endif
#endif
                          }
    break;

  case 539:
/* Line 1787 of yacc.c  */
#line 3630 "parser.y"
    {
#ifdef HELP_HORNER_TEXT
			    outputMode(); sollyaPrintf(HELP_HORNER_TEXT);
#else
			    outputMode(); sollyaPrintf("Horner: horner(func)\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for HORNER"
#endif
#endif
                          }
    break;

  case 540:
/* Line 1787 of yacc.c  */
#line 3641 "parser.y"
    {
#ifdef HELP_EXPAND_TEXT
			    outputMode(); sollyaPrintf(HELP_EXPAND_TEXT);
#else
			    outputMode(); sollyaPrintf("Expand: expand(func).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for EXPAND"
#endif
#endif
                          }
    break;

  case 541:
/* Line 1787 of yacc.c  */
#line 3652 "parser.y"
    {
#ifdef HELP_SIMPLIFY_TEXT
			    outputMode(); sollyaPrintf(HELP_SIMPLIFY_TEXT);
#else
			    outputMode(); sollyaPrintf("Simplification without rounding error: simplify(func).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for SIMPLIFY"
#endif
#endif
                          }
    break;

  case 542:
/* Line 1787 of yacc.c  */
#line 3663 "parser.y"
    {
#ifdef HELP_TAYLOR_TEXT
			    outputMode(); sollyaPrintf(HELP_TAYLOR_TEXT);
#else
			    outputMode(); sollyaPrintf("Taylor expansion: taylor(func,degree,point).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for TAYLOR"
#endif
#endif
                          }
    break;

  case 543:
/* Line 1787 of yacc.c  */
#line 3674 "parser.y"
    {
#ifdef HELP_TAYLORFORM_TEXT
			    outputMode(); sollyaPrintf(HELP_TAYLORFORM_TEXT);
#else
			    outputMode(); sollyaPrintf("Taylor form computation.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for TAYLORFORM"
#endif
#endif
                          }
    break;

  case 544:
/* Line 1787 of yacc.c  */
#line 3685 "parser.y"
    {
#ifdef HELP_CHEBYSHEVFORM_TEXT
			    outputMode(); sollyaPrintf(HELP_CHEBYSHEVFORM_TEXT);
#else
			    outputMode(); sollyaPrintf("Chebyshev form computation.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for CHEBYSHEVFORM"
#endif
#endif
                          }
    break;

  case 545:
/* Line 1787 of yacc.c  */
#line 3696 "parser.y"
    {
#ifdef HELP_AUTODIFF_TEXT
			    outputMode(); sollyaPrintf(HELP_AUTODIFF_TEXT);
#else
			    outputMode(); sollyaPrintf("Automatic differentiation.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for AUTODIFF"
#endif
#endif
                          }
    break;

  case 546:
/* Line 1787 of yacc.c  */
#line 3707 "parser.y"
    {
#ifdef HELP_DEGREE_TEXT
			    outputMode(); sollyaPrintf(HELP_DEGREE_TEXT);
#else
			    outputMode(); sollyaPrintf("Degree of a polynomial: degree(func).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DEGREE"
#endif
#endif
                          }
    break;

  case 547:
/* Line 1787 of yacc.c  */
#line 3718 "parser.y"
    {
#ifdef HELP_NUMERATOR_TEXT
			    outputMode(); sollyaPrintf(HELP_NUMERATOR_TEXT);
#else
			    outputMode(); sollyaPrintf("Numerator of an expression: numerator(func).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for NUMERATOR"
#endif
#endif
                          }
    break;

  case 548:
/* Line 1787 of yacc.c  */
#line 3729 "parser.y"
    {
#ifdef HELP_DENOMINATOR_TEXT
			    outputMode(); sollyaPrintf(HELP_DENOMINATOR_TEXT);
#else
			    outputMode(); sollyaPrintf("Denominator of an expression: denominator(func).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DENOMINATOR"
#endif
#endif
                          }
    break;

  case 549:
/* Line 1787 of yacc.c  */
#line 3740 "parser.y"
    {
#ifdef HELP_SUBSTITUTE_TEXT
			    outputMode(); sollyaPrintf(HELP_SUBSTITUTE_TEXT);
#else
			    outputMode(); sollyaPrintf("Substitute func2 for free variable in func: substitute(func,func2).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for SUBSTITUTE"
#endif
#endif
                          }
    break;

  case 550:
/* Line 1787 of yacc.c  */
#line 3751 "parser.y"
    {
#ifdef HELP_COMPOSEPOLYNOMIALS_TEXT
			    outputMode(); sollyaPrintf(HELP_COMPOSEPOLYNOMIALS_TEXT);
#else
			    outputMode(); sollyaPrintf("Compose two polynomials p and q and round coefficients of p(q).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for COMPOSEPOLYNOMIALS"
#endif
#endif
                          }
    break;

  case 551:
/* Line 1787 of yacc.c  */
#line 3762 "parser.y"
    {
#ifdef HELP_COEFF_TEXT
			    outputMode(); sollyaPrintf(HELP_COEFF_TEXT);
#else
			    outputMode(); sollyaPrintf("i-th coefficient of a polynomial: coeff(func,degree).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for COEFF"
#endif
#endif
                          }
    break;

  case 552:
/* Line 1787 of yacc.c  */
#line 3773 "parser.y"
    {
#ifdef HELP_SUBPOLY_TEXT
			    outputMode(); sollyaPrintf(HELP_SUBPOLY_TEXT);
#else
			    outputMode(); sollyaPrintf("Subpolynomial consisting in monomials: subpoly(func,list of degrees).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for SUBPOLY"
#endif
#endif
                          }
    break;

  case 553:
/* Line 1787 of yacc.c  */
#line 3784 "parser.y"
    {
#ifdef HELP_ROUNDCOEFFICIENTS_TEXT
			    outputMode(); sollyaPrintf(HELP_ROUNDCOEFFICIENTS_TEXT);
#else
			    outputMode(); sollyaPrintf("Round coefficients of a polynomial to format: roundcoefficients(func,list of formats).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ROUNDCOEFFICIENTS"
#endif
#endif
                          }
    break;

  case 554:
/* Line 1787 of yacc.c  */
#line 3795 "parser.y"
    {
#ifdef HELP_RATIONALAPPROX_TEXT
			    outputMode(); sollyaPrintf(HELP_RATIONALAPPROX_TEXT);
#else
			    outputMode(); sollyaPrintf("Rational approximation: rationalapprox(constant).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for RATIONALAPPROX"
#endif
#endif
                          }
    break;

  case 555:
/* Line 1787 of yacc.c  */
#line 3806 "parser.y"
    {
#ifdef HELP_ACCURATEINFNORM_TEXT
			    outputMode(); sollyaPrintf(HELP_ACCURATEINFNORM_TEXT);
#else
			    outputMode(); sollyaPrintf("Faithful rounded infinity norm: accurateinfnorm(func,bits,range,domains to exclude).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ACCURATEINFNORM"
#endif
#endif
                          }
    break;

  case 556:
/* Line 1787 of yacc.c  */
#line 3817 "parser.y"
    {
#ifdef HELP_ROUND_TEXT
			    outputMode(); sollyaPrintf(HELP_ROUND_TEXT);
#else
			    outputMode(); sollyaPrintf("Round to a given format: round(constant,precision,rounding mode).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ROUND"
#endif
#endif
                          }
    break;

  case 557:
/* Line 1787 of yacc.c  */
#line 3828 "parser.y"
    {
#ifdef HELP_EVALUATE_TEXT
			    outputMode(); sollyaPrintf(HELP_EVALUATE_TEXT);
#else
			    outputMode(); sollyaPrintf("Evaluate a function in a point or interval: round(func,constant|range).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for EVALUATE"
#endif
#endif
                          }
    break;

  case 558:
/* Line 1787 of yacc.c  */
#line 3839 "parser.y"
    {
#ifdef HELP_LENGTH_TEXT
			    outputMode(); sollyaPrintf(HELP_LENGTH_TEXT);
#else
			    outputMode(); sollyaPrintf("Length of a list: length(list).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for LENGTH"
#endif
#endif
                          }
    break;

  case 559:
/* Line 1787 of yacc.c  */
#line 3850 "parser.y"
    {
#ifdef HELP_PARSE_TEXT
			    outputMode(); sollyaPrintf(HELP_PARSE_TEXT);
#else
			    outputMode(); sollyaPrintf("Parse a string to function: parse(string).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PARSE"
#endif
#endif
                          }
    break;

  case 560:
/* Line 1787 of yacc.c  */
#line 3861 "parser.y"
    {
#ifdef HELP_PRINT_TEXT
			    outputMode(); sollyaPrintf(HELP_PRINT_TEXT);
#else
			    outputMode(); sollyaPrintf("Print something: print(thing1, thing2, ...).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PRINT"
#endif
#endif
                          }
    break;

  case 561:
/* Line 1787 of yacc.c  */
#line 3872 "parser.y"
    {
#ifdef HELP_PRINTXML_TEXT
			    outputMode(); sollyaPrintf(HELP_PRINTXML_TEXT);
#else
			    outputMode(); sollyaPrintf("Print a function in XML: printxml(func).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PRINTXML"
#endif
#endif
                          }
    break;

  case 562:
/* Line 1787 of yacc.c  */
#line 3883 "parser.y"
    {
#ifdef HELP_READXML_TEXT
			    outputMode(); sollyaPrintf(HELP_READXML_TEXT);
#else
			    outputMode(); sollyaPrintf("Reads a function in XML: readxml(filename).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for READXML"
#endif
#endif
                          }
    break;

  case 563:
/* Line 1787 of yacc.c  */
#line 3894 "parser.y"
    {
#ifdef HELP_PLOT_TEXT
			    outputMode(); sollyaPrintf(HELP_PLOT_TEXT);
#else
			    outputMode(); sollyaPrintf("Plot (a) function(s) in a range: plot(func,func2,...,range).\n");
			    outputMode(); sollyaPrintf("There are further options.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PLOT"
#endif
#endif
                          }
    break;

  case 564:
/* Line 1787 of yacc.c  */
#line 3906 "parser.y"
    {
#ifdef HELP_PRINTHEXA_TEXT
			    outputMode(); sollyaPrintf(HELP_PRINTHEXA_TEXT);
#else
			    outputMode(); sollyaPrintf("Print a constant in hexadecimal: printhexa(constant).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PRINTHEXA"
#endif
#endif
                          }
    break;

  case 565:
/* Line 1787 of yacc.c  */
#line 3917 "parser.y"
    {
#ifdef HELP_PRINTFLOAT_TEXT
			    outputMode(); sollyaPrintf(HELP_PRINTFLOAT_TEXT);
#else
			    outputMode(); sollyaPrintf("Print a constant in hexadecimal simple precision: printfloat(constant).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PRINTFLOAT"
#endif
#endif
                          }
    break;

  case 566:
/* Line 1787 of yacc.c  */
#line 3928 "parser.y"
    {
#ifdef HELP_PRINTBINARY_TEXT
			    outputMode(); sollyaPrintf(HELP_PRINTBINARY_TEXT);
#else
			    outputMode(); sollyaPrintf("Print a constant in binary: printbinary(constant).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PRINTBINARY"
#endif
#endif
                          }
    break;

  case 567:
/* Line 1787 of yacc.c  */
#line 3939 "parser.y"
    {
#ifdef HELP_SUPPRESSMESSAGE_TEXT
			    outputMode(); sollyaPrintf(HELP_SUPPRESSMESSAGE_TEXT);
#else
			    outputMode(); sollyaPrintf("Suppress a message with a certain message number.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for SUPPRESSMESSAGE"
#endif
#endif
                          }
    break;

  case 568:
/* Line 1787 of yacc.c  */
#line 3950 "parser.y"
    {
#ifdef HELP_UNSUPPRESSMESSAGE_TEXT
			    outputMode(); sollyaPrintf(HELP_UNSUPPRESSMESSAGE_TEXT);
#else
			    outputMode(); sollyaPrintf("Unsuppress a message with a certain message number.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for UNSUPPRESSMESSAGE"
#endif
#endif
                          }
    break;

  case 569:
/* Line 1787 of yacc.c  */
#line 3961 "parser.y"
    {
#ifdef HELP_PRINTEXPANSION_TEXT
			    outputMode(); sollyaPrintf(HELP_PRINTEXPANSION_TEXT);
#else
			    outputMode(); sollyaPrintf("Print a polynomial as an expansion of double precision numbers: printexpansion(func).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PRINTEXPANSION"
#endif
#endif
                          }
    break;

  case 570:
/* Line 1787 of yacc.c  */
#line 3972 "parser.y"
    {
#ifdef HELP_BASHEXECUTE_TEXT
			    outputMode(); sollyaPrintf(HELP_BASHEXECUTE_TEXT);
#else
			    outputMode(); sollyaPrintf("Execute a command in a shell: bashexecute(string).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for BASHEXECUTE"
#endif
#endif
                          }
    break;

  case 571:
/* Line 1787 of yacc.c  */
#line 3983 "parser.y"
    {
#ifdef HELP_EXTERNALPLOT_TEXT
			    outputMode(); sollyaPrintf(HELP_EXTERNALPLOT_TEXT);
#else
			    outputMode(); sollyaPrintf("Here should be some help text.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for EXTERNALPLOT"
#endif
#endif
                          }
    break;

  case 572:
/* Line 1787 of yacc.c  */
#line 3994 "parser.y"
    {
#ifdef HELP_WRITE_TEXT
			    outputMode(); sollyaPrintf(HELP_WRITE_TEXT);
#else
			    outputMode(); sollyaPrintf("Write something without adding spaces and newlines: write(thing1, thing2, ...).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for WRITE"
#endif
#endif
                          }
    break;

  case 573:
/* Line 1787 of yacc.c  */
#line 4005 "parser.y"
    {
#ifdef HELP_ASCIIPLOT_TEXT
			    outputMode(); sollyaPrintf(HELP_ASCIIPLOT_TEXT);
#else
			    outputMode(); sollyaPrintf("Plot a function in a range using an ASCII terminal: asciiplot(func,range).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ASCIIPLOT"
#endif
#endif
                          }
    break;

  case 574:
/* Line 1787 of yacc.c  */
#line 4016 "parser.y"
    {
#ifdef HELP_RENAME_TEXT
			    outputMode(); sollyaPrintf(HELP_RENAME_TEXT);
#else
			    outputMode(); sollyaPrintf("Rename free variable string1 to string2: rename(string1, string2).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for RENAME"
#endif
#endif
                          }
    break;

  case 575:
/* Line 1787 of yacc.c  */
#line 4027 "parser.y"
    {
#ifdef HELP_BIND_TEXT
			    outputMode(); sollyaPrintf(HELP_BIND_TEXT);
#else
			    outputMode(); sollyaPrintf("bind(p,ident,term): bind argument ident of procedure p to term, returning a procedure with one argument less.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for BIND"
#endif
#endif
                          }
    break;

  case 576:
/* Line 1787 of yacc.c  */
#line 4038 "parser.y"
    {
#ifdef HELP_INFNORM_TEXT
			    outputMode(); sollyaPrintf(HELP_INFNORM_TEXT);
#else
			    outputMode(); sollyaPrintf("Certified infinity norm: infnorm(func,range[,prooffile[,list of funcs]]).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for INFNORM"
#endif
#endif
                          }
    break;

  case 577:
/* Line 1787 of yacc.c  */
#line 4049 "parser.y"
    {
#ifdef HELP_SUPNORM_TEXT
			    outputMode(); sollyaPrintf(HELP_SUPNORM_TEXT);
#else
			    outputMode(); sollyaPrintf("Validated supremum norm: supnorm(poly,func,range,mode,accuracy).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for SUPNORM"
#endif
#endif
                          }
    break;

  case 578:
/* Line 1787 of yacc.c  */
#line 4060 "parser.y"
    {
#ifdef HELP_FINDZEROS_TEXT
			    outputMode(); sollyaPrintf(HELP_FINDZEROS_TEXT);
#else
			    outputMode(); sollyaPrintf("Certified bounding of zeros: findzeros(func,range).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for FINDZEROS"
#endif
#endif
                          }
    break;

  case 579:
/* Line 1787 of yacc.c  */
#line 4071 "parser.y"
    {
#ifdef HELP_FPFINDZEROS_TEXT
			    outputMode(); sollyaPrintf(HELP_FPFINDZEROS_TEXT);
#else
			    outputMode(); sollyaPrintf("Approximate zeros of a function: fpfindzeros(func,range).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for FPFINDZEROS"
#endif
#endif
                          }
    break;

  case 580:
/* Line 1787 of yacc.c  */
#line 4082 "parser.y"
    {
#ifdef HELP_DIRTYINFNORM_TEXT
			    outputMode(); sollyaPrintf(HELP_DIRTYINFNORM_TEXT);
#else
			    outputMode(); sollyaPrintf("Floating-point infinity norm: dirtyinfnorm(func,range).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DIRTYINFNORM"
#endif
#endif
                          }
    break;

  case 581:
/* Line 1787 of yacc.c  */
#line 4093 "parser.y"
    {
#ifdef HELP_NUMBERROOTS_TEXT
			    outputMode(); sollyaPrintf(HELP_NUMBERROOTS_TEXT);
#else
			    outputMode(); sollyaPrintf("Computes the number of real roots of a polynomial on a domain.\n");
#endif
                          }
    break;

  case 582:
/* Line 1787 of yacc.c  */
#line 4101 "parser.y"
    {
#ifdef HELP_INTEGRAL_TEXT
			    outputMode(); sollyaPrintf(HELP_INTEGRAL_TEXT);
#else
			    outputMode(); sollyaPrintf("Certified integral: integral(func,range).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for INTEGRAL"
#endif
#endif
                          }
    break;

  case 583:
/* Line 1787 of yacc.c  */
#line 4112 "parser.y"
    {
#ifdef HELP_DIRTYINTEGRAL_TEXT
			    outputMode(); sollyaPrintf(HELP_DIRTYINTEGRAL_TEXT);
#else
			    outputMode(); sollyaPrintf("Floating-point integral: dirtyintegral(func,range).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DIRTYINTEGRAL"
#endif
#endif
                          }
    break;

  case 584:
/* Line 1787 of yacc.c  */
#line 4123 "parser.y"
    {
#ifdef HELP_WORSTCASE_TEXT
			    outputMode(); sollyaPrintf(HELP_WORSTCASE_TEXT);
#else
			    outputMode(); sollyaPrintf("Print all worst-cases under a certain bound: worstcase(func,constant,range,constant,constant[,file]).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for WORSTCASE"
#endif
#endif
                          }
    break;

  case 585:
/* Line 1787 of yacc.c  */
#line 4134 "parser.y"
    {
#ifdef HELP_IMPLEMENTPOLY_TEXT
			    outputMode(); sollyaPrintf(HELP_IMPLEMENTPOLY_TEXT);
#else
			    outputMode(); sollyaPrintf("Implement a polynomial in C: implementpoly(func,range,constant,format,string,string2[,honorcoeffprec[,string3]]).\n");
			    outputMode(); sollyaPrintf("Implements func in range with error constant with entering format named in function\nstring writing to file string2 honoring the precision of the coefficients or not with a proof in file string3.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for IMPLEMENTPOLY"
#endif
#endif
			  }
    break;

  case 586:
/* Line 1787 of yacc.c  */
#line 4146 "parser.y"
    {
#ifdef HELP_IMPLEMENTCONSTANT_TEXT
			    outputMode(); sollyaPrintf(HELP_IMPLEMENTCONSTANT_TEXT);
#else
			    outputMode(); sollyaPrintf("Implement a constant expression in arbitrary precision with MPFR: implementconstant(constant)\n");
			    outputMode(); sollyaPrintf("Generates code able to evaluate the given constant at any precision, with a guaranteed error.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for IMPLEMENTCONST"
#endif
#endif
                          }
    break;

  case 587:
/* Line 1787 of yacc.c  */
#line 4158 "parser.y"
    {
#ifdef HELP_CHECKINFNORM_TEXT
			    outputMode(); sollyaPrintf(HELP_CHECKINFNORM_TEXT);
#else
			    outputMode(); sollyaPrintf("Checks whether an infinity norm is bounded: checkinfnorm(func,range,constant).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for CHECKINFNORM"
#endif
#endif
                          }
    break;

  case 588:
/* Line 1787 of yacc.c  */
#line 4169 "parser.y"
    {
#ifdef HELP_ZERODENOMINATORS_TEXT
			    outputMode(); sollyaPrintf(HELP_ZERODENOMINATORS_TEXT);
#else
			    outputMode(); sollyaPrintf("Searches floating-point approximations to zeros of denominators: zerodenominators(func,range).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ZERODENOMINATORS"
#endif
#endif
                          }
    break;

  case 589:
/* Line 1787 of yacc.c  */
#line 4180 "parser.y"
    {
#ifdef HELP_ISEVALUABLE_TEXT
			    outputMode(); sollyaPrintf(HELP_ISEVALUABLE_TEXT);
#else
			    outputMode(); sollyaPrintf("Tests if func is evaluable on range: isevaluable(func,range).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ISEVALUABLE"
#endif
#endif
                          }
    break;

  case 590:
/* Line 1787 of yacc.c  */
#line 4191 "parser.y"
    {
#ifdef HELP_SEARCHGAL_TEXT
			    outputMode(); sollyaPrintf(HELP_SEARCHGAL_TEXT);
#else
			    outputMode(); sollyaPrintf("Searches Gal values for func (or list of func): searchgal(func|list of func, constant, integer, integer, format|list of formats, constant|list of constants).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for SEARCHGAL"
#endif
#endif
                          }
    break;

  case 591:
/* Line 1787 of yacc.c  */
#line 4202 "parser.y"
    {
#ifdef HELP_GUESSDEGREE_TEXT
			    outputMode(); sollyaPrintf(HELP_GUESSDEGREE_TEXT);
#else
			    outputMode(); sollyaPrintf("Guesses the degree needed for approximating func: guessdegree(func,range,constant[,weight]).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for GUESSDEGREE"
#endif
#endif
                          }
    break;

  case 592:
/* Line 1787 of yacc.c  */
#line 4213 "parser.y"
    {
#ifdef HELP_DIRTYFINDZEROS_TEXT
			    outputMode(); sollyaPrintf(HELP_DIRTYFINDZEROS_TEXT);
#else
			    outputMode(); sollyaPrintf("Finds zeros of a function dirtily: dirtyfindzeros(func,range).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for DIRTYFINDZEROS"
#endif
#endif
                          }
    break;

  case 593:
/* Line 1787 of yacc.c  */
#line 4224 "parser.y"
    {
			    outputMode(); sollyaPrintf("If construct: if condition then command or if condition then command else command.\n");
                          }
    break;

  case 594:
/* Line 1787 of yacc.c  */
#line 4228 "parser.y"
    {
			    outputMode(); sollyaPrintf("If construct: if condition then command or if condition then command else command.\n");
                          }
    break;

  case 595:
/* Line 1787 of yacc.c  */
#line 4232 "parser.y"
    {
			    outputMode(); sollyaPrintf("If construct: if condition then command else command\n");
                          }
    break;

  case 596:
/* Line 1787 of yacc.c  */
#line 4236 "parser.y"
    {
			    outputMode(); sollyaPrintf("For construct: for i from const to const2 [by const3] do command\nor for i in list do command.\n");
                          }
    break;

  case 597:
/* Line 1787 of yacc.c  */
#line 4240 "parser.y"
    {
#ifdef HELP_IN_TEXT
			    outputMode(); sollyaPrintf(HELP_IN_TEXT);
#else
			    outputMode(); sollyaPrintf("In construct: for in construct and containment operator.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for IN"
#endif
#endif
                          }
    break;

  case 598:
/* Line 1787 of yacc.c  */
#line 4251 "parser.y"
    {
			    outputMode(); sollyaPrintf("For construct: for i from const to const2 [by const3] do command.\n");
                          }
    break;

  case 599:
/* Line 1787 of yacc.c  */
#line 4255 "parser.y"
    {
			    outputMode(); sollyaPrintf("For construct: for i from const to const2 [by const3] do command.\n");
                          }
    break;

  case 600:
/* Line 1787 of yacc.c  */
#line 4259 "parser.y"
    {
			    outputMode(); sollyaPrintf("For construct: for i from const to const2 by const3 do command.\n");
                          }
    break;

  case 601:
/* Line 1787 of yacc.c  */
#line 4263 "parser.y"
    {
			    outputMode(); sollyaPrintf("For construct: for i from const to const2 [by const3] do command.\n");
			    outputMode(); sollyaPrintf("While construct: while condition do command.\n");
                          }
    break;

  case 602:
/* Line 1787 of yacc.c  */
#line 4268 "parser.y"
    {
			    outputMode(); sollyaPrintf("Begin-end construct: begin command; command; ... end.\n");
                          }
    break;

  case 603:
/* Line 1787 of yacc.c  */
#line 4272 "parser.y"
    {
			    outputMode(); sollyaPrintf("Begin-end construct: begin command; command; ... end.\n");
                          }
    break;

  case 604:
/* Line 1787 of yacc.c  */
#line 4276 "parser.y"
    {
			    outputMode(); sollyaPrintf("While construct: while condition do command.\n");
                          }
    break;

  case 605:
/* Line 1787 of yacc.c  */
#line 4280 "parser.y"
    {
#ifdef HELP_INF_TEXT
			    outputMode(); sollyaPrintf(HELP_INF_TEXT);
#else
			    outputMode(); sollyaPrintf("Dereferencing the infimum of a range: inf(range).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for INF"
#endif
#endif
                          }
    break;

  case 606:
/* Line 1787 of yacc.c  */
#line 4291 "parser.y"
    {
#ifdef HELP_MID_TEXT
			    outputMode(); sollyaPrintf(HELP_MID_TEXT);
#else
			    outputMode(); sollyaPrintf("Dereferencing the midpoint of a range: mid(range).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for MID"
#endif
#endif
                          }
    break;

  case 607:
/* Line 1787 of yacc.c  */
#line 4302 "parser.y"
    {
#ifdef HELP_SUP_TEXT
			    outputMode(); sollyaPrintf(HELP_SUP_TEXT);
#else
			    outputMode(); sollyaPrintf("Dereferencing the supremum of a range: sup(range).\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for SUP"
#endif
#endif
                          }
    break;

  case 608:
/* Line 1787 of yacc.c  */
#line 4313 "parser.y"
    {
#ifdef HELP_EXPONENT_TEXT
			    outputMode(); sollyaPrintf(HELP_EXPONENT_TEXT);
#else
			    outputMode(); sollyaPrintf("exponent(constant): returns an integer such that constant scaled by the power of 2\nof this integer is an odd or zero integer.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for EXPONENT"
#endif
#endif
                          }
    break;

  case 609:
/* Line 1787 of yacc.c  */
#line 4324 "parser.y"
    {
#ifdef HELP_MANTISSA_TEXT
			    outputMode(); sollyaPrintf(HELP_MANTISSA_TEXT);
#else
			    outputMode(); sollyaPrintf("mantissa(constant): returns an odd or zero integer equal to constant scaled by an integer power of 2.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for MANTISSA"
#endif
#endif
                          }
    break;

  case 610:
/* Line 1787 of yacc.c  */
#line 4335 "parser.y"
    {
#ifdef HELP_PRECISION_TEXT
			    outputMode(); sollyaPrintf(HELP_PRECISION_TEXT);
#else
			    outputMode(); sollyaPrintf("precision(constant): returns the least number of bits constant can be written on.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PRECISION"
#endif
#endif
                          }
    break;

  case 611:
/* Line 1787 of yacc.c  */
#line 4346 "parser.y"
    {
#ifdef HELP_EXECUTE_TEXT
			    outputMode(); sollyaPrintf(HELP_EXECUTE_TEXT);
#else
			    outputMode(); sollyaPrintf("execute(string): executes an %s script contained in a file named string.\n",PACKAGE_NAME);
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for EXECUTE"
#endif
#endif
                          }
    break;

  case 612:
/* Line 1787 of yacc.c  */
#line 4357 "parser.y"
    {
#ifdef HELP_ISBOUND_TEXT
			    outputMode(); sollyaPrintf(HELP_ISBOUND_TEXT);
#else
			    outputMode(); sollyaPrintf("isbound(identifier): returns a boolean indicating if identifier is bound.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for ISBOUND"
#endif
#endif
                          }
    break;

  case 613:
/* Line 1787 of yacc.c  */
#line 4368 "parser.y"
    {
			    outputMode(); sollyaPrintf("Prints the version of the software.\n");
                          }
    break;

  case 614:
/* Line 1787 of yacc.c  */
#line 4371 "parser.y"
    {
#ifdef HELP_EXTERNALPROC_TEXT
			    outputMode(); sollyaPrintf(HELP_EXTERNALPROC_TEXT);
#else
			    outputMode(); sollyaPrintf("externalplot(identifier, file, argumentypes -> resulttype): binds identifier to an external procedure with signature argumenttypes -> resulttype in file.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for EXTERNALPROC"
#endif
#endif
                          }
    break;

  case 615:
/* Line 1787 of yacc.c  */
#line 4381 "parser.y"
    {
#ifdef HELP_VOID_TEXT
			    outputMode(); sollyaPrintf(HELP_VOID_TEXT);
#else
			    outputMode(); sollyaPrintf("Represents the void type for externalproc.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for VOID"
#endif
#endif
                          }
    break;

  case 616:
/* Line 1787 of yacc.c  */
#line 4391 "parser.y"
    {
#ifdef HELP_CONSTANT_TEXT
			    outputMode(); sollyaPrintf(HELP_CONSTANT_TEXT);
#else
			    outputMode(); sollyaPrintf("Represents the constant type for externalproc.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for CONSTANT"
#endif
#endif
                          }
    break;

  case 617:
/* Line 1787 of yacc.c  */
#line 4401 "parser.y"
    {
#ifdef HELP_FUNCTION_TEXT
			    outputMode(); sollyaPrintf(HELP_FUNCTION_TEXT);
#else
			    outputMode(); sollyaPrintf("Represents the function type for externalproc or a procedure-based function.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for FUNCTION"
#endif
#endif
                          }
    break;

  case 618:
/* Line 1787 of yacc.c  */
#line 4411 "parser.y"
    {
#ifdef HELP_OBJECT_TEXT
			    outputMode(); sollyaPrintf(HELP_OBJECT_TEXT);
#else
			    outputMode(); sollyaPrintf("Represents the object type for externalproc.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for OBJECT"
#endif
#endif
                          }
    break;

  case 619:
/* Line 1787 of yacc.c  */
#line 4421 "parser.y"
    {
#ifdef HELP_RANGE_TEXT
			    outputMode(); sollyaPrintf(HELP_RANGE_TEXT);
#else
			    outputMode(); sollyaPrintf("Represents the range type for externalproc.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for RANGE"
#endif
#endif
                          }
    break;

  case 620:
/* Line 1787 of yacc.c  */
#line 4431 "parser.y"
    {
#ifdef HELP_INTEGER_TEXT
			    outputMode(); sollyaPrintf(HELP_INTEGER_TEXT);
#else
			    outputMode(); sollyaPrintf("Represents the integer type for externalproc.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for INTEGER"
#endif
#endif
                          }
    break;

  case 621:
/* Line 1787 of yacc.c  */
#line 4441 "parser.y"
    {
#ifdef HELP_STRING_TEXT
			    outputMode(); sollyaPrintf(HELP_STRING_TEXT);
#else
			    outputMode(); sollyaPrintf("Represents the string type for externalproc.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for STRING"
#endif
#endif
                          }
    break;

  case 622:
/* Line 1787 of yacc.c  */
#line 4451 "parser.y"
    {
#ifdef HELP_BOOLEAN_TEXT
			    outputMode(); sollyaPrintf(HELP_BOOLEAN_TEXT);
#else
			    outputMode(); sollyaPrintf("Represents the boolean type for externalproc.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for BOOLEAN"
#endif
#endif
                          }
    break;

  case 623:
/* Line 1787 of yacc.c  */
#line 4461 "parser.y"
    {
#ifdef HELP_LISTOF_TEXT
			    outputMode(); sollyaPrintf(HELP_LISTOF_TEXT);
#else
			    outputMode(); sollyaPrintf("Represents the list type for externalproc.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for LISTOF"
#endif
#endif
                          }
    break;

  case 624:
/* Line 1787 of yacc.c  */
#line 4471 "parser.y"
    {
#ifdef HELP_LISTOF_TEXT
			    outputMode(); sollyaPrintf(HELP_LISTOF_TEXT);
#else
			    outputMode(); sollyaPrintf("Used in list of type for externalproc.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for LISTOF"
#endif
#endif
                          }
    break;

  case 625:
/* Line 1787 of yacc.c  */
#line 4481 "parser.y"
    {
#ifdef HELP_VAR_TEXT
			    outputMode(); sollyaPrintf(HELP_VAR_TEXT);
#else
			    outputMode(); sollyaPrintf("Declares a local variable.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for VAR"
#endif
#endif
                          }
    break;

  case 626:
/* Line 1787 of yacc.c  */
#line 4491 "parser.y"
    {
#ifdef HELP_NOP_TEXT
			    outputMode(); sollyaPrintf(HELP_NOP_TEXT);
#else
			    outputMode(); sollyaPrintf("Does nothing.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for NOP"
#endif
#endif
                          }
    break;

  case 627:
/* Line 1787 of yacc.c  */
#line 4501 "parser.y"
    {
#ifdef HELP_PROC_TEXT
			    outputMode(); sollyaPrintf(HELP_PROC_TEXT);
#else
			    outputMode(); sollyaPrintf("Defines a nameless procedure.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PROC"
#endif
#endif
                          }
    break;

  case 628:
/* Line 1787 of yacc.c  */
#line 4511 "parser.y"
    {
#ifdef HELP_PROCEDURE_TEXT
			    outputMode(); sollyaPrintf(HELP_PROCEDURE_TEXT);
#else
			    outputMode(); sollyaPrintf("Defines a named procedure.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for PROCEDURE"
#endif
#endif
                          }
    break;

  case 629:
/* Line 1787 of yacc.c  */
#line 4521 "parser.y"
    {
#ifdef HELP_RETURN_TEXT
			    outputMode(); sollyaPrintf(HELP_RETURN_TEXT);
#else
			    outputMode(); sollyaPrintf("Returns an expression in a procedure.\n");
#if defined(WARN_IF_NO_HELP_TEXT) && WARN_IF_NO_HELP_TEXT
#warning "No help text for RETURN"
#endif
#endif
                          }
    break;

  case 630:
/* Line 1787 of yacc.c  */
#line 4532 "parser.y"
    {
			    outputMode(); sollyaPrintf("Type \"help <keyword>;\" for help on the keyword <keyword>.\nFor example type \"help implementpoly;\" for help on the command \"implementpoly\".\n\n");
			    sollyaPrintf("Possible keywords in %s are:\n",PACKAGE_NAME);
			    sollyaPrintf("- !\n");
			    sollyaPrintf("- !=\n");
			    sollyaPrintf("- &&\n");
			    sollyaPrintf("- (\n");
			    sollyaPrintf("- )\n");
			    sollyaPrintf("- *\n");
			    sollyaPrintf("- +\n");
			    sollyaPrintf("- ,\n");
			    sollyaPrintf("- -\n");
			    sollyaPrintf("- .\n");
			    sollyaPrintf("- ...\n");
			    sollyaPrintf("- .:\n");
			    sollyaPrintf("- /\n");
			    sollyaPrintf("- :.\n");
			    sollyaPrintf("- :=\n");
			    sollyaPrintf("- ; (separator in ranges)\n");
			    sollyaPrintf("- <\n");
			    sollyaPrintf("- =\n");
			    sollyaPrintf("- ==\n");
			    sollyaPrintf("- >\n");
			    sollyaPrintf("- @\n");
			    sollyaPrintf("- {\n");
			    sollyaPrintf("- [|\n");
			    sollyaPrintf("- |]\n");
			    sollyaPrintf("- ||\n");
			    sollyaPrintf("- }\n");
			    sollyaPrintf("- ~\n");
			    sollyaPrintf("- [\n");
			    sollyaPrintf("- ]\n");
			    sollyaPrintf("- ^\n");
			    sollyaPrintf("- _x_\n");
			    sollyaPrintf("- D\n");
			    sollyaPrintf("- DD\n");
			    sollyaPrintf("- DE\n");
			    sollyaPrintf("- Pi\n");
			    sollyaPrintf("- RD\n");
			    sollyaPrintf("- RN\n");
			    sollyaPrintf("- RU\n");
			    sollyaPrintf("- RZ\n");
			    sollyaPrintf("- SG\n");
			    sollyaPrintf("- TD\n");
			    sollyaPrintf("- abs\n");
			    sollyaPrintf("- absolute\n");
			    sollyaPrintf("- accurateinfnorm\n");
			    sollyaPrintf("- acos\n");
			    sollyaPrintf("- acosh\n");
			    sollyaPrintf("- asciiplot\n");
			    sollyaPrintf("- asin\n");
			    sollyaPrintf("- asinh\n");
			    sollyaPrintf("- atan\n");
			    sollyaPrintf("- atanh\n");
			    sollyaPrintf("- autodiff\n");
			    sollyaPrintf("- autosimplify\n");
			    sollyaPrintf("- bashexecute\n");
			    sollyaPrintf("- begin\n");
			    sollyaPrintf("- binary\n");
			    sollyaPrintf("- bind\n");
			    sollyaPrintf("- boolean\n");
			    sollyaPrintf("- by\n");
			    sollyaPrintf("- canonical\n");
			    sollyaPrintf("- ceil\n");
			    sollyaPrintf("- chebyshevform\n");
			    sollyaPrintf("- checkinfnorm\n");
			    sollyaPrintf("- coeff\n");
			    sollyaPrintf("- composepolynomials\n");
			    sollyaPrintf("- constant\n");
			    sollyaPrintf("- cos\n");
			    sollyaPrintf("- cosh\n");
			    sollyaPrintf("- decimal\n");
			    sollyaPrintf("- default\n");
			    sollyaPrintf("- degree\n");
			    sollyaPrintf("- denominator\n");
			    sollyaPrintf("- diam\n");
			    sollyaPrintf("- dieonerrormode\n");
			    sollyaPrintf("- diff\n");
			    sollyaPrintf("- dirtyfindzeros\n");
			    sollyaPrintf("- dirtyinfnorm\n");
			    sollyaPrintf("- dirtyintegral\n");
			    sollyaPrintf("- dirtysimplify\n");
			    sollyaPrintf("- display\n");
			    sollyaPrintf("- do\n");
			    sollyaPrintf("- double\n");
			    sollyaPrintf("- doubledouble\n");
			    sollyaPrintf("- doubleextended\n");
			    sollyaPrintf("- dyadic\n");
			    sollyaPrintf("- else\n");
			    sollyaPrintf("- end\n");
			    sollyaPrintf("- erf\n");
			    sollyaPrintf("- erfc\n");
			    sollyaPrintf("- error\n");
			    sollyaPrintf("- evaluate\n");
			    sollyaPrintf("- execute\n");
			    sollyaPrintf("- exp\n");
			    sollyaPrintf("- expand\n");
			    sollyaPrintf("- expm1\n");
			    sollyaPrintf("- exponent\n");
			    sollyaPrintf("- externalplot\n");
			    sollyaPrintf("- externalproc\n");
			    sollyaPrintf("- false\n");
			    sollyaPrintf("- file\n");
			    sollyaPrintf("- findzeros\n");
			    sollyaPrintf("- fixed\n");
			    sollyaPrintf("- floating\n");
			    sollyaPrintf("- floor\n");
			    sollyaPrintf("- for\n");
			    sollyaPrintf("- fpfindzeros\n");
			    sollyaPrintf("- fpminimax\n");
			    sollyaPrintf("- from\n");
			    sollyaPrintf("- fullparentheses\n");
			    sollyaPrintf("- function\n");
			    sollyaPrintf("- getsuppressedmessages\n");
			    sollyaPrintf("- guessdegree\n");
			    sollyaPrintf("- head\n");
			    sollyaPrintf("- hexadecimal\n");
			    sollyaPrintf("- honorcoeffprec\n");
			    sollyaPrintf("- hopitalrecursions\n");
			    sollyaPrintf("- horner\n");
			    sollyaPrintf("- if\n");
			    sollyaPrintf("- implementpoly\n");
			    sollyaPrintf("- implementconstant\n");
			    sollyaPrintf("- in\n");
			    sollyaPrintf("- inf\n");
			    sollyaPrintf("- infnorm\n");
			    sollyaPrintf("- integer\n");
			    sollyaPrintf("- integral\n");
			    sollyaPrintf("- isbound\n");
			    sollyaPrintf("- isevaluable\n");
			    sollyaPrintf("- length\n");
			    sollyaPrintf("- library\n");
			    sollyaPrintf("- libraryconstant\n");
			    sollyaPrintf("- list\n");
			    sollyaPrintf("- log\n");
			    sollyaPrintf("- log10\n");
			    sollyaPrintf("- log1p\n");
			    sollyaPrintf("- log2\n");
			    sollyaPrintf("- mantissa\n");
			    sollyaPrintf("- max\n");
			    sollyaPrintf("- mid\n");
			    sollyaPrintf("- midpointmode\n");
			    sollyaPrintf("- min\n");
			    sollyaPrintf("- nearestint\n");
			    sollyaPrintf("- numberroots\n");
			    sollyaPrintf("- nop\n");
			    sollyaPrintf("- numerator\n");
			    sollyaPrintf("- object\n");
			    sollyaPrintf("- of\n");
			    sollyaPrintf("- off\n");
			    sollyaPrintf("- on\n");
			    sollyaPrintf("- parse\n");
			    sollyaPrintf("- perturb\n");
			    sollyaPrintf("- pi\n");
			    sollyaPrintf("- plot\n");
			    sollyaPrintf("- points\n");
			    sollyaPrintf("- postscript\n");
			    sollyaPrintf("- postscriptfile\n");
			    sollyaPrintf("- powers\n");
			    sollyaPrintf("- prec\n");
			    sollyaPrintf("- precision\n");
			    sollyaPrintf("- print\n");
			    sollyaPrintf("- printbinary\n");
			    sollyaPrintf("- printdouble\n");
			    sollyaPrintf("- printexpansion\n");
			    sollyaPrintf("- printfloat\n");
			    sollyaPrintf("- printhexa\n");
			    sollyaPrintf("- printsingle\n");
			    sollyaPrintf("- printxml\n");
			    sollyaPrintf("- proc\n");
			    sollyaPrintf("- procedure\n");
			    sollyaPrintf("- quit\n");
			    sollyaPrintf("- range\n");
			    sollyaPrintf("- rationalapprox\n");
			    sollyaPrintf("- rationalmode\n");
			    sollyaPrintf("- readfile\n");
			    sollyaPrintf("- readxml\n");
			    sollyaPrintf("- relative\n");
			    sollyaPrintf("- remez\n");
			    sollyaPrintf("- rename\n");
			    sollyaPrintf("- restart\n");
			    sollyaPrintf("- return\n");
			    sollyaPrintf("- revert\n");
			    sollyaPrintf("- round\n");
			    sollyaPrintf("- roundcoefficients\n");
			    sollyaPrintf("- roundcorrectly\n");
			    sollyaPrintf("- roundingwarnings\n");
			    sollyaPrintf("- searchgal\n");
			    sollyaPrintf("- showmessagenumbers\n");
			    sollyaPrintf("- simplify\n");
			    sollyaPrintf("- sin\n");
			    sollyaPrintf("- single\n");
			    sollyaPrintf("- sinh\n");
			    sollyaPrintf("- sort\n");
			    sollyaPrintf("- sqrt\n");
			    sollyaPrintf("- string\n");
			    sollyaPrintf("- subpoly\n");
			    sollyaPrintf("- substitute\n");
			    sollyaPrintf("- sup\n");
			    sollyaPrintf("- supnorm\n");
			    sollyaPrintf("- suppressmessage\n");
			    sollyaPrintf("- tail\n");
			    sollyaPrintf("- tan\n");
			    sollyaPrintf("- tanh\n");
			    sollyaPrintf("- taylor\n");
			    sollyaPrintf("- taylorform\n");
			    sollyaPrintf("- taylorrecursions\n");
			    sollyaPrintf("- then\n");
			    sollyaPrintf("- time\n");
			    sollyaPrintf("- timing\n");
			    sollyaPrintf("- to\n");
			    sollyaPrintf("- tripledouble\n");
			    sollyaPrintf("- true\n");
			    sollyaPrintf("- unsuppressmessage\n");
			    sollyaPrintf("- var\n");
			    sollyaPrintf("- verbosity\n");
			    sollyaPrintf("- version\n");
			    sollyaPrintf("- void\n");
			    sollyaPrintf("- while\n");
			    sollyaPrintf("- worstcase\n");
			    sollyaPrintf("- write\n");
			    sollyaPrintf("- zerodenominators\n");
			    sollyaPrintf("\n");
                          }
    break;


/* Line 1787 of yacc.c  */
#line 11418 "parser.c"
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


