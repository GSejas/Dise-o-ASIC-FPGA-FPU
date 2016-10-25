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


/* Substitute the variable and function names.  */
#define yyparse         miniyyparse
#define yylex           miniyylex
#define yyerror         miniyyerror
#define yylval          miniyylval
#define yychar          miniyychar
#define yydebug         miniyydebug
#define yynerrs         miniyynerrs

/* Copy the first part of user declarations.  */
/* Line 371 of yacc.c  */
#line 55 "miniparser.y"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "expression.h"
#include "assignment.h"
#include "chain.h"
#include "general.h"
#include "execute.h"
#include "miniparser.h"

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
#define free safeFree
/* End of the malloc mess */

#define YYERROR_VERBOSE 1
#define YYFPRINTF sollyaFprintf

extern int miniyylex(YYSTYPE *lvalp, void *scanner);

void miniyyerror(void *myScanner, const char *message) {
  UNUSED_PARAM(myScanner);
  printMessage(1,SOLLYA_MSG_SYNTAX_ERROR_ENCOUNTERED_WHILE_PARSING,"Warning: %s. Will try to continue parsing (expecting \";\"). May leak memory.\n",message);
}


/* Line 371 of yacc.c  */
#line 114 "miniparser.c"

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
#ifndef YY_MINIYY_Y_TAB_H_INCLUDED
# define YY_MINIYY_Y_TAB_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int miniyydebug;
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
     FALSERESTARTTOKEN = 387,
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
     NOPTOKEN = 487
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
#define FALSERESTARTTOKEN 387
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



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 387 of yacc.c  */
#line 105 "miniparser.y"

  doubleNode *dblnode;
  struct entryStruct *association;
  char *value;
  node *tree;
  chain *list;
  int *integerval;
  int count;
  void *other;


/* Line 387 of yacc.c  */
#line 633 "miniparser.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int miniyyparse (void *YYPARSE_PARAM);
#else
int miniyyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int miniyyparse (void *myScanner);
#else
int miniyyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_MINIYY_Y_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

/* Line 390 of yacc.c  */
#line 660 "miniparser.c"

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
#define YYFINAL  304
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   8435

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  233
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  46
/* YYNRULES -- Number of rules.  */
#define YYNRULES  395
/* YYNRULES -- Number of states.  */
#define YYNSTATES  1099

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   487

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
     225,   226,   227,   228,   229,   230,   231,   232
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    26,    31,    35,    38,    41,    46,    49,    53,
      59,    67,    77,    83,    86,    90,    93,    97,   100,   102,
     106,   112,   119,   125,   130,   139,   149,   158,   166,   173,
     181,   188,   194,   204,   215,   225,   234,   243,   253,   262,
     270,   282,   295,   307,   318,   320,   322,   324,   329,   333,
     338,   345,   353,   360,   365,   370,   375,   380,   385,   390,
     395,   408,   413,   420,   428,   435,   440,   445,   452,   460,
     473,   480,   487,   499,   501,   503,   507,   509,   512,   514,
     517,   521,   525,   532,   539,   543,   547,   551,   555,   559,
     563,   567,   571,   575,   579,   583,   587,   591,   595,   599,
     603,   607,   611,   615,   619,   623,   627,   631,   635,   639,
     643,   647,   651,   655,   659,   663,   667,   671,   675,   679,
     683,   687,   689,   693,   695,   699,   701,   703,   708,   710,
     715,   717,   721,   725,   728,   733,   735,   739,   743,   747,
     751,   756,   761,   765,   767,   771,   775,   779,   783,   787,
     789,   791,   794,   797,   799,   802,   805,   809,   813,   818,
     823,   828,   833,   835,   839,   844,   849,   853,   858,   860,
     862,   864,   866,   868,   870,   872,   874,   876,   878,   880,
     882,   884,   886,   888,   890,   892,   894,   896,   898,   900,
     902,   904,   906,   908,   910,   912,   914,   916,   918,   920,
     922,   924,   926,   928,   930,   935,   940,   944,   946,   948,
     950,   952,   956,   960,   962,   964,   968,   975,   982,   988,
     991,   996,   998,  1001,  1011,  1018,  1027,  1033,  1042,  1048,
    1056,  1061,  1067,  1069,  1071,  1073,  1075,  1077,  1079,  1081,
    1086,  1090,  1096,  1103,  1105,  1109,  1115,  1121,  1127,  1131,
    1135,  1139,  1143,  1148,  1153,  1158,  1163,  1168,  1172,  1179,
    1184,  1193,  1202,  1207,  1212,  1223,  1228,  1233,  1238,  1243,
    1252,  1261,  1270,  1279,  1284,  1289,  1294,  1301,  1308,  1315,
    1322,  1329,  1336,  1345,  1354,  1361,  1366,  1371,  1378,  1391,
    1398,  1405,  1412,  1419,  1426,  1433,  1448,  1453,  1462,  1469,
    1476,  1481,  1490,  1497,  1502,  1507,  1512,  1517,  1522,  1527,
    1532,  1537,  1542,  1547,  1552,  1557,  1562,  1569,  1574,  1579,
    1584,  1589,  1594,  1599,  1604,  1609,  1614,  1619,  1624,  1629,
    1634,  1639,  1644,  1649,  1654,  1659,  1664,  1669,  1674,  1679,
    1684,  1689,  1694,  1699,  1704,  1709,  1714,  1719,  1724,  1727,
    1728,  1731,  1734,  1737,  1740,  1743,  1746,  1749,  1752,  1755,
    1758,  1761,  1764,  1767,  1770,  1773,  1776,  1778,  1780,  1782,
    1784,  1786,  1788,  1790,  1794,  1798,  1802,  1806,  1810,  1814,
    1818,  1820,  1822,  1824,  1828,  1830
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     234,     0,    -1,   235,    -1,   256,    -1,   256,    21,    -1,
       1,    -1,   209,    -1,   211,    -1,   210,    -1,   212,    -1,
     246,    -1,   236,   241,   237,    -1,   236,   242,   241,   237,
      -1,   236,   242,   237,    -1,   236,   237,    -1,   200,   239,
      -1,   213,   256,   208,   238,    -1,   203,   240,    -1,   256,
     201,   238,    -1,   256,   201,   238,   202,   238,    -1,    10,
     205,   256,   206,   256,   208,   238,    -1,    10,   205,   256,
     206,   256,   207,   256,   208,   238,    -1,    10,   204,   256,
     208,   238,    -1,   238,    21,    -1,   238,    21,   241,    -1,
     243,    21,    -1,   243,    21,   242,    -1,   228,   244,    -1,
      10,    -1,    10,    19,   244,    -1,    12,    13,   236,   241,
     237,    -1,    12,    13,   236,   242,   241,   237,    -1,    12,
      13,   236,   242,   237,    -1,    12,    13,   236,   237,    -1,
      12,    13,   236,   241,   231,   256,    21,   237,    -1,    12,
      13,   236,   242,   241,   231,   256,    21,   237,    -1,    12,
      13,   236,   242,   231,   256,    21,   237,    -1,    12,    13,
     236,   231,   256,    21,   237,    -1,    12,   244,    13,   236,
     241,   237,    -1,    12,   244,    13,   236,   242,   241,   237,
      -1,    12,   244,    13,   236,   242,   237,    -1,    12,   244,
      13,   236,   237,    -1,    12,   244,    13,   236,   241,   231,
     256,    21,   237,    -1,    12,   244,    13,   236,   242,   241,
     231,   256,    21,   237,    -1,    12,   244,    13,   236,   242,
     231,   256,    21,   237,    -1,    12,   244,    13,   236,   231,
     256,    21,   237,    -1,    12,    10,    16,    28,    13,   236,
     241,   237,    -1,    12,    10,    16,    28,    13,   236,   242,
     241,   237,    -1,    12,    10,    16,    28,    13,   236,   242,
     237,    -1,    12,    10,    16,    28,    13,   236,   237,    -1,
      12,    10,    16,    28,    13,   236,   241,   231,   256,    21,
     237,    -1,    12,    10,    16,    28,    13,   236,   242,   241,
     231,   256,    21,   237,    -1,    12,    10,    16,    28,    13,
     236,   242,   231,   256,    21,   237,    -1,    12,    10,    16,
      28,    13,   236,   231,   256,    21,   237,    -1,   131,    -1,
     132,    -1,   232,    -1,   232,    12,   256,    13,    -1,   232,
      12,    13,    -1,   168,    12,   252,    13,    -1,   168,    12,
     252,    13,    27,   256,    -1,   168,    12,   252,    13,    27,
      27,   256,    -1,   170,    12,   256,    19,   252,    13,    -1,
     171,    12,   256,    13,    -1,   172,    12,   256,    13,    -1,
     173,    12,   256,    13,    -1,   174,    12,   252,    13,    -1,
     175,    12,   252,    13,    -1,   176,    12,   256,    13,    -1,
     177,    12,   256,    13,    -1,   178,    12,   256,    19,   256,
      19,   256,    19,   256,    19,   252,    13,    -1,   179,    12,
     252,    13,    -1,   179,    12,   252,    13,    27,   256,    -1,
     179,    12,   252,    13,    27,    27,   256,    -1,   180,    12,
     256,    19,   256,    13,    -1,   169,    12,   256,    13,    -1,
     216,    12,   256,    13,    -1,   169,    12,   256,    13,    27,
     256,    -1,   169,    12,   256,    13,    27,    27,   256,    -1,
     191,    12,   256,    19,   256,    19,   256,    19,   256,    19,
     252,    13,    -1,   181,    12,    10,    19,    10,    13,    -1,
     181,    12,    48,    19,    10,    13,    -1,   217,    12,    10,
      19,   256,    19,   278,    42,    27,   276,    13,    -1,   247,
      -1,   252,    -1,   230,    10,   245,    -1,   250,    -1,   251,
      20,    -1,   248,    -1,   248,    20,    -1,    10,    16,   256,
      -1,    10,    17,   256,    -1,    10,    16,   133,    12,   256,
      13,    -1,    10,    16,   134,    12,   256,    13,    -1,   258,
      16,   256,    -1,   258,    17,   256,    -1,   249,    16,   256,
      -1,   249,    17,   256,    -1,   264,    29,    10,    -1,    87,
      16,   256,    -1,    88,    16,   256,    -1,    89,    16,   256,
      -1,    90,    16,   256,    -1,    91,    16,   256,    -1,    92,
      16,   256,    -1,    93,    16,   256,    -1,    94,    16,   256,
      -1,    95,    16,   256,    -1,    96,    16,   256,    -1,    98,
      16,   256,    -1,    99,    16,   256,    -1,   100,    16,   256,
      -1,   102,    16,   256,    -1,   101,    16,   256,    -1,   103,
      16,   256,    -1,    87,    16,   256,    -1,    88,    16,   256,
      -1,    89,    16,   256,    -1,    90,    16,   256,    -1,    91,
      16,   256,    -1,    92,    16,   256,    -1,    93,    16,   256,
      -1,    94,    16,   256,    -1,    95,    16,   256,    -1,    96,
      16,   256,    -1,    98,    16,   256,    -1,    99,    16,   256,
      -1,   100,    16,   256,    -1,   102,    16,   256,    -1,   101,
      16,   256,    -1,   103,    16,   256,    -1,   256,    -1,   256,
      19,   252,    -1,   255,    -1,   255,   254,   253,    -1,    19,
      -1,    21,    -1,    29,    10,    16,   256,    -1,   257,    -1,
     122,   257,   123,   265,    -1,   259,    -1,   256,    39,   259,
      -1,   256,    40,   259,    -1,    20,   259,    -1,   264,    14,
     256,    15,    -1,   260,    -1,   259,    18,   260,    -1,   259,
     204,   260,    -1,   259,    23,   260,    -1,   259,    27,   260,
      -1,   259,    23,    16,   260,    -1,   259,    27,    16,   260,
      -1,   259,    37,   260,    -1,   262,    -1,   260,    41,   262,
      -1,   260,    42,   262,    -1,   260,    32,   262,    -1,   260,
      33,   262,    -1,   260,    36,   262,    -1,    41,    -1,    42,
      -1,    41,   261,    -1,    42,   261,    -1,   263,    -1,   261,
     263,    -1,    38,   263,    -1,   262,    43,   263,    -1,   262,
      44,   263,    -1,   262,    43,   261,   263,    -1,   262,    44,
     261,   263,    -1,   262,    43,    38,   263,    -1,   262,    44,
      38,   263,    -1,   264,    -1,   264,    45,   263,    -1,   264,
      45,   261,   263,    -1,   264,    45,    38,   263,    -1,   264,
      35,   263,    -1,   264,    35,    38,   263,    -1,   104,    -1,
     105,    -1,   106,    -1,   107,    -1,   108,    -1,   109,    -1,
     110,    -1,   111,    -1,   112,    -1,   113,    -1,   114,    -1,
     115,    -1,   116,    -1,   117,    -1,   118,    -1,   119,    -1,
     218,    -1,   120,    -1,   121,    -1,   125,    -1,   124,    -1,
     126,    -1,   127,    -1,   128,    -1,   129,    -1,    69,    -1,
      70,    -1,    72,    -1,    71,    -1,    75,    -1,    48,    -1,
      73,    -1,    74,    -1,    11,    -1,   267,    -1,    10,    -1,
     215,    12,    10,    13,    -1,    10,    12,   252,    13,    -1,
      10,    12,    13,    -1,   268,    -1,   270,    -1,   271,    -1,
     272,    -1,    12,   256,    13,    -1,   211,   253,   212,    -1,
     274,    -1,   258,    -1,   264,    29,    10,    -1,   264,    29,
      10,    12,   252,    13,    -1,    12,   256,    13,    12,   252,
      13,    -1,    12,   256,    13,    12,    13,    -1,   229,   245,
      -1,    97,    12,   238,    13,    -1,   266,    -1,   266,   265,
      -1,   256,    34,   236,   242,   241,   231,   256,    21,   237,
      -1,   256,    34,   236,   242,   241,   237,    -1,   256,    34,
     236,   242,   231,   256,    21,   237,    -1,   256,    34,   236,
     242,   237,    -1,   256,    34,   236,   241,   231,   256,    21,
     237,    -1,   256,    34,   236,   241,   237,    -1,   256,    34,
     236,   231,   256,    21,   237,    -1,   256,    34,   236,   237,
      -1,   256,    34,    12,   256,    13,    -1,     3,    -1,     4,
      -1,     5,    -1,     6,    -1,     7,    -1,     8,    -1,     9,
      -1,    14,    31,    31,    15,    -1,    14,    40,    15,    -1,
      14,    31,   269,    31,    15,    -1,    14,    31,   269,    28,
      31,    15,    -1,   256,    -1,   269,    19,   256,    -1,   269,
      19,    28,    19,   256,    -1,    14,   256,    19,   256,    15,
      -1,    14,   256,    21,   256,    15,    -1,    14,   256,    15,
      -1,    22,   256,    26,    -1,    22,   256,    25,    -1,    22,
     256,    24,    -1,   163,    12,   256,    13,    -1,   162,    12,
     256,    13,    -1,   161,    12,   256,    13,    -1,   135,    12,
     256,    13,    -1,   138,    12,   256,    13,    -1,   139,    12,
      13,    -1,   138,    12,   256,    19,   256,    13,    -1,   136,
      12,   256,    13,    -1,   137,    12,   256,    19,   256,    19,
     252,    13,    -1,   182,    12,   256,    19,    10,    19,   256,
      13,    -1,   164,    12,   252,    13,    -1,   165,    12,   252,
      13,    -1,   140,    12,   256,    19,   256,    19,   256,    19,
     252,    13,    -1,   141,    12,   256,    13,    -1,    93,    12,
     256,    13,    -1,   142,    12,   256,    13,    -1,   143,    12,
     256,    13,    -1,   144,    12,   256,    19,   256,    19,   256,
      13,    -1,   145,    12,   256,    19,   256,    19,   252,    13,
      -1,   146,    12,   256,    19,   256,    19,   256,    13,    -1,
     147,    12,   256,    19,   256,    19,   256,    13,    -1,   148,
      12,   256,    13,    -1,   149,    12,   256,    13,    -1,   150,
      12,   256,    13,    -1,   151,    12,   256,    19,   256,    13,
      -1,   152,    12,   256,    19,   256,    13,    -1,   153,    12,
     256,    19,   256,    13,    -1,   154,    12,   256,    19,   256,
      13,    -1,   155,    12,   256,    19,   256,    13,    -1,   156,
      12,   256,    19,   256,    13,    -1,   157,    12,   256,    19,
     256,    19,   252,    13,    -1,   158,    12,   256,    19,   256,
      19,   256,    13,    -1,   159,    12,   256,    19,   256,    13,
      -1,   167,    12,   256,    13,    -1,   166,    12,   256,    13,
      -1,   183,    12,   256,    19,   252,    13,    -1,   184,    12,
     256,    19,   256,    19,   256,    19,   256,    19,   256,    13,
      -1,   185,    12,   256,    19,   256,    13,    -1,   186,    12,
     256,    19,   256,    13,    -1,   187,    12,   256,    19,   256,
      13,    -1,   188,    12,   256,    19,   256,    13,    -1,   189,
      12,   256,    19,   256,    13,    -1,   190,    12,   256,    19,
     256,    13,    -1,   192,    12,   256,    19,   256,    19,   256,
      19,   256,    19,   256,    19,   252,    13,    -1,   193,    12,
     252,    13,    -1,   194,    12,   256,    19,   256,    19,   256,
      13,    -1,   195,    12,   256,    19,   256,    13,    -1,   196,
      12,   256,    19,   256,    13,    -1,   197,    12,   252,    13,
      -1,   198,    12,   256,    19,   256,    19,   252,    13,    -1,
     199,    12,   256,    19,   256,    13,    -1,    79,    12,   256,
      13,    -1,    86,    12,   256,    13,    -1,   214,    12,   256,
      13,    -1,    80,    12,   256,    13,    -1,    81,    12,   256,
      13,    -1,    83,    12,   256,    13,    -1,    84,    12,   256,
      13,    -1,    85,    12,   256,    13,    -1,    82,    12,   256,
      13,    -1,    46,    12,   256,    13,    -1,    47,    12,   256,
      13,    -1,    48,    12,   256,    13,    -1,   220,    12,   256,
      13,    -1,   220,    12,   256,    19,   256,    13,    -1,    49,
      12,   256,    13,    -1,    50,    12,   256,    13,    -1,    51,
      12,   256,    13,    -1,    52,    12,   256,    13,    -1,    53,
      12,   256,    13,    -1,    54,    12,   256,    13,    -1,    55,
      12,   256,    13,    -1,    56,    12,   256,    13,    -1,    57,
      12,   256,    13,    -1,    58,    12,   256,    13,    -1,    59,
      12,   256,    13,    -1,    60,    12,   256,    13,    -1,    61,
      12,   256,    13,    -1,    62,    12,   256,    13,    -1,    63,
      12,   256,    13,    -1,    64,    12,   256,    13,    -1,    65,
      12,   256,    13,    -1,    66,    12,   256,    13,    -1,    67,
      12,   256,    13,    -1,    68,    12,   256,    13,    -1,    69,
      12,   256,    13,    -1,    70,    12,   256,    13,    -1,    72,
      12,   256,    13,    -1,    71,    12,   256,    13,    -1,    73,
      12,   256,    13,    -1,    74,    12,   256,    13,    -1,    75,
      12,   256,    13,    -1,    76,    12,   256,    13,    -1,    77,
      12,   256,    13,    -1,    78,    12,   256,    13,    -1,   160,
      12,   256,    13,    -1,    16,    30,    -1,    -1,    87,   273,
      -1,    88,   273,    -1,    89,   273,    -1,    90,   273,    -1,
      91,   273,    -1,    92,   273,    -1,    93,   273,    -1,    94,
     273,    -1,    95,   273,    -1,    96,   273,    -1,    98,   273,
      -1,    99,   273,    -1,   100,   273,    -1,   102,   273,    -1,
     101,   273,    -1,   103,   273,    -1,   219,    -1,   220,    -1,
     221,    -1,   222,    -1,   223,    -1,   224,    -1,   225,    -1,
     226,   227,   219,    -1,   226,   227,   220,    -1,   226,   227,
     221,    -1,   226,   227,   222,    -1,   226,   227,   223,    -1,
     226,   227,   224,    -1,   226,   227,   225,    -1,   218,    -1,
     275,    -1,   275,    -1,   275,    19,   277,    -1,   276,    -1,
      12,   277,    13,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   420,   420,   429,   433,   438,   444,   448,   454,   458,
     464,   468,   472,   476,   480,   484,   488,   492,   498,   502,
     510,   515,   520,   528,   532,   538,   542,   548,   555,   559,
     565,   569,   573,   577,   581,   585,   589,   593,   597,   601,
     605,   609,   613,   617,   621,   625,   629,   633,   637,   641,
     645,   649,   653,   657,   665,   669,   673,   677,   681,   685,
     689,   693,   697,   701,   705,   709,   713,   717,   721,   725,
     729,   733,   737,   741,   745,   749,   753,   757,   761,   765,
     769,   775,   780,   785,   789,   793,   800,   804,   808,   812,
     818,   823,   828,   833,   838,   843,   848,   852,   858,   865,
     869,   873,   877,   881,   885,   889,   893,   897,   901,   905,
     909,   913,   917,   921,   925,   931,   935,   939,   943,   947,
     951,   955,   959,   963,   967,   971,   975,   979,   983,   987,
     991,   997,  1001,  1007,  1011,  1017,  1021,  1027,  1037,  1041,
    1047,  1051,  1055,  1059,  1065,  1074,  1078,  1082,  1086,  1090,
    1094,  1098,  1102,  1108,  1112,  1116,  1120,  1124,  1128,  1134,
    1138,  1142,  1146,  1153,  1157,  1164,  1168,  1172,  1176,  1183,
    1190,  1194,  1200,  1204,  1208,  1215,  1219,  1223,  1230,  1234,
    1238,  1242,  1246,  1250,  1254,  1258,  1262,  1266,  1270,  1274,
    1278,  1282,  1286,  1290,  1294,  1298,  1302,  1306,  1310,  1314,
    1318,  1322,  1326,  1330,  1334,  1338,  1342,  1346,  1350,  1354,
    1358,  1362,  1373,  1377,  1382,  1387,  1392,  1397,  1401,  1405,
    1409,  1413,  1417,  1421,  1425,  1430,  1435,  1440,  1444,  1448,
    1452,  1458,  1462,  1468,  1472,  1476,  1480,  1484,  1488,  1492,
    1496,  1500,  1506,  1511,  1516,  1521,  1526,  1531,  1536,  1544,
    1548,  1552,  1556,  1562,  1566,  1570,  1576,  1580,  1584,  1590,
    1594,  1598,  1602,  1606,  1610,  1616,  1620,  1624,  1628,  1632,
    1636,  1640,  1645,  1649,  1653,  1657,  1661,  1665,  1669,  1673,
    1677,  1681,  1685,  1689,  1693,  1697,  1701,  1705,  1709,  1713,
    1717,  1721,  1725,  1729,  1733,  1737,  1741,  1745,  1749,  1753,
    1757,  1761,  1765,  1769,  1773,  1777,  1781,  1785,  1789,  1793,
    1797,  1801,  1805,  1809,  1813,  1817,  1821,  1825,  1829,  1833,
    1837,  1841,  1845,  1849,  1853,  1857,  1861,  1865,  1869,  1873,
    1877,  1881,  1885,  1889,  1893,  1897,  1901,  1905,  1909,  1913,
    1917,  1921,  1925,  1929,  1933,  1937,  1941,  1945,  1949,  1953,
    1957,  1961,  1965,  1969,  1973,  1977,  1981,  1985,  1991,  1996,
    2002,  2006,  2010,  2014,  2018,  2022,  2026,  2030,  2034,  2038,
    2042,  2046,  2050,  2054,  2058,  2062,  2069,  2075,  2081,  2087,
    2093,  2099,  2105,  2111,  2117,  2123,  2129,  2135,  2141,  2147,
    2155,  2161,  2168,  2172,  2178,  2182
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
  "$accept", "startsymbol", "startsymbolwitherr", "beginsymbol",
  "endsymbol", "command", "ifcommand", "forcommand", "commandlist",
  "variabledeclarationlist", "variabledeclaration", "identifierlist",
  "procbody", "simplecommand", "assignment", "simpleassignment",
  "structuring", "stateassignment", "stillstateassignment", "thinglist",
  "structelementlist", "structelementseparator", "structelement", "thing",
  "supermegaterm", "indexing", "megaterm", "hyperterm", "unaryplusminus",
  "term", "subterm", "basicthing", "matchlist", "matchelement", "constant",
  "list", "simplelist", "range", "debound", "headfunction",
  "egalquestionmark", "statedereference", "externalproctype",
  "extendedexternalproctype", "externalproctypesimplelist",
  "externalproctypelist", YY_NULL
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
     485,   486,   487
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   233,   234,   235,   235,   235,   236,   236,   237,   237,
     238,   238,   238,   238,   238,   238,   238,   238,   239,   239,
     240,   240,   240,   241,   241,   242,   242,   243,   244,   244,
     245,   245,   245,   245,   245,   245,   245,   245,   245,   245,
     245,   245,   245,   245,   245,   245,   245,   245,   245,   245,
     245,   245,   245,   245,   246,   246,   246,   246,   246,   246,
     246,   246,   246,   246,   246,   246,   246,   246,   246,   246,
     246,   246,   246,   246,   246,   246,   246,   246,   246,   246,
     246,   246,   246,   246,   246,   246,   247,   247,   247,   247,
     248,   248,   248,   248,   248,   248,   248,   248,   249,   250,
     250,   250,   250,   250,   250,   250,   250,   250,   250,   250,
     250,   250,   250,   250,   250,   251,   251,   251,   251,   251,
     251,   251,   251,   251,   251,   251,   251,   251,   251,   251,
     251,   252,   252,   253,   253,   254,   254,   255,   256,   256,
     257,   257,   257,   257,   258,   259,   259,   259,   259,   259,
     259,   259,   259,   260,   260,   260,   260,   260,   260,   261,
     261,   261,   261,   262,   262,   262,   262,   262,   262,   262,
     262,   262,   263,   263,   263,   263,   263,   263,   264,   264,
     264,   264,   264,   264,   264,   264,   264,   264,   264,   264,
     264,   264,   264,   264,   264,   264,   264,   264,   264,   264,
     264,   264,   264,   264,   264,   264,   264,   264,   264,   264,
     264,   264,   264,   264,   264,   264,   264,   264,   264,   264,
     264,   264,   264,   264,   264,   264,   264,   264,   264,   264,
     264,   265,   265,   266,   266,   266,   266,   266,   266,   266,
     266,   266,   267,   267,   267,   267,   267,   267,   267,   268,
     268,   268,   268,   269,   269,   269,   270,   270,   270,   271,
     271,   271,   271,   271,   271,   272,   272,   272,   272,   272,
     272,   272,   272,   272,   272,   272,   272,   272,   272,   272,
     272,   272,   272,   272,   272,   272,   272,   272,   272,   272,
     272,   272,   272,   272,   272,   272,   272,   272,   272,   272,
     272,   272,   272,   272,   272,   272,   272,   272,   272,   272,
     272,   272,   272,   272,   272,   272,   272,   272,   272,   272,
     272,   272,   272,   272,   272,   272,   272,   272,   272,   272,
     272,   272,   272,   272,   272,   272,   272,   272,   272,   272,
     272,   272,   272,   272,   272,   272,   272,   272,   272,   272,
     272,   272,   272,   272,   272,   272,   272,   272,   273,   273,
     274,   274,   274,   274,   274,   274,   274,   274,   274,   274,
     274,   274,   274,   274,   274,   274,   275,   275,   275,   275,
     275,   275,   275,   275,   275,   275,   275,   275,   275,   275,
     276,   276,   277,   277,   278,   278
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     3,     4,     3,     2,     2,     4,     2,     3,     5,
       7,     9,     5,     2,     3,     2,     3,     2,     1,     3,
       5,     6,     5,     4,     8,     9,     8,     7,     6,     7,
       6,     5,     9,    10,     9,     8,     8,     9,     8,     7,
      11,    12,    11,    10,     1,     1,     1,     4,     3,     4,
       6,     7,     6,     4,     4,     4,     4,     4,     4,     4,
      12,     4,     6,     7,     6,     4,     4,     6,     7,    12,
       6,     6,    11,     1,     1,     3,     1,     2,     1,     2,
       3,     3,     6,     6,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     1,     3,     1,     3,     1,     1,     4,     1,     4,
       1,     3,     3,     2,     4,     1,     3,     3,     3,     3,
       4,     4,     3,     1,     3,     3,     3,     3,     3,     1,
       1,     2,     2,     1,     2,     2,     3,     3,     4,     4,
       4,     4,     1,     3,     4,     4,     3,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     4,     4,     3,     1,     1,     1,
       1,     3,     3,     1,     1,     3,     6,     6,     5,     2,
       4,     1,     2,     9,     6,     8,     5,     8,     5,     7,
       4,     5,     1,     1,     1,     1,     1,     1,     1,     4,
       3,     5,     6,     1,     3,     5,     5,     5,     3,     3,
       3,     3,     4,     4,     4,     4,     4,     3,     6,     4,
       8,     8,     4,     4,    10,     4,     4,     4,     4,     8,
       8,     8,     8,     4,     4,     4,     6,     6,     6,     6,
       6,     6,     8,     8,     6,     4,     4,     6,    12,     6,
       6,     6,     6,     6,     6,    14,     4,     8,     6,     6,
       4,     8,     6,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     4,     4,     4,     4,     6,     4,     4,     4,
       4,     4,     4,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     4,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     4,     4,     4,     4,     4,     4,     2,     0,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     1,     1,     1,
       1,     1,     1,     3,     3,     3,     3,     3,     3,     3,
       1,     1,     1,     3,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,     5,   242,   243,   244,   245,   246,   247,   248,   213,
     211,     0,     0,     0,     0,     0,   159,   160,     0,     0,
     208,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   203,   204,   206,   205,   209,   210,   207,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   359,
     359,   359,   359,   359,   359,   359,   359,   359,   359,     0,
     359,   359,   359,   359,   359,   359,   178,   179,   180,   181,
     182,   183,   184,   185,   186,   187,   188,   189,   190,   191,
     192,   193,   195,   196,     0,   198,   197,   199,   200,   201,
     202,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   194,     0,     0,     0,     2,     3,
     138,   224,   140,   145,     0,   153,   163,   172,   212,   217,
     218,   219,   220,   223,     0,     0,     0,     0,     0,   143,
       0,   165,   161,   162,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   360,   361,   362,   363,
     364,   365,     0,   366,   367,   368,   369,     0,   370,   371,
     372,   374,   373,   375,     0,   138,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   133,     0,
       0,     0,     0,   229,     1,     4,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   164,     0,
       0,     0,     0,     0,     0,   216,     0,   131,   221,     0,
     253,     0,   250,   258,     0,     0,   261,   260,   259,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     358,     0,   213,   359,   359,   359,   359,   359,   359,   359,
     359,   359,   359,   359,   359,   359,   359,   359,   359,    54,
      55,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     6,     7,
       0,     0,     0,     0,    56,     0,     0,    10,    83,    88,
       0,    86,     0,    84,   224,   172,     0,     0,     0,     0,
       0,   267,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   222,   135,
     136,     0,     0,     0,     0,    28,     0,     0,   141,   142,
     146,     0,   148,     0,   149,   152,   147,   156,   157,   158,
     154,   155,     0,     0,   166,     0,     0,   167,     0,   225,
       0,   176,     0,     0,   173,   215,     0,     0,   249,     0,
       0,     0,     0,     0,   322,   323,   324,   327,   328,   329,
     330,   331,   332,   333,   334,   335,   336,   337,   338,   339,
     340,   341,   342,   343,   344,   345,   346,   347,   348,   350,
     349,   351,   352,   353,   354,   355,   356,   313,   316,   317,
     321,   318,   319,   320,   314,   276,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    15,
       0,     0,    17,     0,     0,     0,     0,     0,     8,     9,
       0,    14,     0,     0,     0,     0,   230,    89,     0,     0,
      87,     0,     0,     0,     0,   139,   231,   265,   269,     0,
     266,     0,     0,   275,   277,   278,     0,     0,     0,     0,
     283,   284,   285,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   357,   264,   263,   262,   272,   273,   296,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     306,     0,     0,     0,   310,     0,     0,     0,   134,   315,
     214,   325,     0,     0,     0,     7,     0,     0,   150,   151,
     170,   168,   171,   169,   144,     0,   177,   175,   174,   132,
     228,     0,     0,   254,     0,   251,   256,   257,     0,     0,
      90,    91,    99,   100,   101,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   113,   112,   114,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      85,    58,     0,    28,    27,    23,    11,    13,     0,    25,
      96,    97,    94,    95,   225,     0,   232,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   137,     0,
       0,    29,     0,    33,     0,     0,     0,     0,   227,     0,
     252,     0,     0,    59,    75,     0,    63,    64,    65,    66,
      67,    68,    69,     0,    71,     0,     0,     0,     0,    18,
       0,     0,    16,    76,     0,    57,    24,    12,    26,     0,
       0,     0,   268,     0,     0,     0,     0,     0,   286,   287,
     288,   289,   290,   291,     0,     0,   294,     0,   297,     0,
     299,   300,   301,   302,   303,   304,     0,     0,   308,   309,
       0,   312,   326,     0,     0,     0,    30,     0,    32,     0,
       0,    41,     0,     0,   226,   255,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   240,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    31,     0,     0,    38,     0,    40,
       0,    92,    93,     0,    60,     0,    77,    62,     0,     0,
      72,    74,    80,    81,     0,    19,    22,     0,     0,   241,
       0,     0,   238,     0,   236,     0,   270,     0,   279,   280,
     281,   282,   292,   293,   271,     0,     0,   307,   311,     0,
      49,     0,     0,    37,     0,     0,     0,     0,     0,     0,
       0,    39,    61,    78,     0,    73,     0,     0,     0,     0,
     390,   376,   377,   378,   379,   380,   381,   382,     0,   391,
     394,     0,     0,     0,     0,     0,   234,     0,     0,     0,
       0,     0,    46,     0,    48,     0,    34,    36,     0,    45,
       0,     0,     0,     0,     0,     0,    20,   392,     0,     0,
       0,   239,     0,     0,     0,   274,     0,     0,     0,     0,
       0,     0,    47,    35,    42,    44,     0,     0,     0,     0,
       0,   395,   383,   384,   385,   386,   387,   388,   389,     0,
     237,   235,     0,     0,     0,    53,     0,     0,     0,    43,
       0,     0,    21,   393,     0,   233,   298,     0,    50,    52,
       0,     0,     0,    82,     0,    51,    70,    79,   305
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,   157,   158,   425,   621,   622,   609,   612,   623,   624,
     625,   497,   303,   427,   428,   429,   430,   431,   432,   433,
     297,   491,   298,   327,   160,   161,   162,   163,   164,   165,
     166,   167,   635,   636,   168,   169,   331,   170,   171,   172,
     226,   173,  1009,  1010,  1038,  1011
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -981
static const yytype_int16 yypact[] =
{
    3666,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,   111,
    -981,  6390,  3893,  7071,  6390,  8206,    45,    45,   137,   143,
     157,   162,   171,   215,   221,   238,   277,   321,   335,   340,
     349,   385,   402,   423,   440,   451,   454,   478,   500,   503,
     504,   506,   529,   531,   541,   548,   556,   558,   559,   588,
     589,   607,   610,   614,   623,   625,   650,   651,   653,    56,
      56,    56,    56,    56,    56,    15,    56,    56,    56,   656,
      56,    56,    56,    56,    56,    56,  -981,  -981,  -981,  -981,
    -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,
    -981,  -981,  -981,  -981,  6390,  -981,  -981,  -981,  -981,  -981,
    -981,   668,   690,   716,   733,   746,   747,   750,   760,   763,
     796,   798,   803,   813,   814,   820,   822,   827,   831,   834,
     836,   838,   852,   854,   858,   860,   861,   863,   870,   872,
     888,   899,   901,   903,   938,   940,   944,   973,   975,   977,
     982,   990,  1000,  1007,  1010,  1014,  1015,  1017,  1054,  1056,
    1061,   117,  1070,  1079,  -981,  1083,  1086,    34,  -981,    62,
    -981,  -981,    41,  2269,  8206,   134,  -981,     7,  -981,  -981,
    -981,  -981,  -981,  -981,  4347,    60,  4574,   260,   790,    41,
    2060,  -981,  -981,  -981,  6390,  6390,  6390,  6390,  6390,  6390,
    6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,
    6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,
    6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,
    6390,  6390,  6390,  6390,  6390,   278,  -981,  -981,  -981,  -981,
    -981,  -981,  6390,  -981,  -981,  -981,  -981,  3436,  -981,  -981,
    -981,  -981,  -981,  -981,   284,   191,  6390,  6390,  6390,  6390,
     397,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,
    6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,
    6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,
    6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,
    6390,  6390,  6390,  6390,  6390,  6390,   448,   230,     5,  6390,
     484,  6390,    61,  -981,  -981,  -981,  7071,  7071,  7071,  6617,
    6844,  7071,  7071,  7071,  7071,  7071,  7071,  7071,  -981,  7298,
    7525,  6390,   518,  7979,  7752,  -981,   443,     1,  1092,   532,
     284,     4,  -981,  -981,  6390,  6390,  -981,  -981,  -981,    64,
      66,    68,    72,    78,    80,   100,   103,   108,   112,   114,
     118,   125,   128,   131,   263,   280,   291,   300,   302,   304,
     309,   314,   316,   319,   323,   344,   347,   351,   369,   379,
     382,   386,   390,   392,   398,   414,   421,   428,   430,   432,
    -981,   434,   377,   689,   697,   705,   845,   881,   930,   150,
     939,   970,   987,   995,  1027,  1096,  1097,  1101,  1116,  -981,
    -981,  1123,  1126,  1145,  1151,  1152,  1153,  1154,  1156,  1157,
    1158,  1159,  1160,  1161,  1163,  1164,  6390,   758,  -981,   117,
    6390,  1167,  1247,   766,  1254,  2056,   905,  -981,  -981,  1049,
     384,  -981,  1108,  -981,   463,    53,  6390,   436,   438,    90,
      50,  -981,   141,   442,   444,   446,   306,   778,   788,   797,
     449,   452,   474,   801,   812,   823,   839,   841,   849,   855,
     864,   867,   480,   482,   487,   491,   927,   968,   494,   498,
     877,   882,   889,   891,   895,   918,   920,   925,   928,   932,
    1012,   934,   943,   959,  1256,   961,   965,  1322,  -981,  -981,
    -981,   117,   510,  1257,    57,    76,   -48,  1328,    41,    41,
    2269,  7071,  2269,  7071,  2269,  2269,  2269,   134,   134,   134,
     134,   134,  8206,  8206,  -981,  8206,  8206,  -981,   373,  1330,
    8206,  -981,  8206,  8206,  -981,  -981,  6390,  4801,  -981,  5028,
    1313,  1340,   524,   784,  -981,  -981,  -981,  -981,  -981,  -981,
    -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,
    -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,
    -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,
    -981,  -981,  -981,  -981,  -981,  -981,  4120,  6390,  5255,  5255,
    5255,  5255,  5255,  5255,  5255,  5255,  5255,  5255,  5255,  5255,
    5255,  5255,  5255,  5255,  6390,  6390,  6390,  6390,  6390,  6390,
    6390,  6390,  6390,  6390,  6390,  6390,  6390,    12,  6390,  -981,
     -22,   202,  -981,   -33,  6390,  1349,  1086,  5482,  -981,  -981,
    1372,  -981,  1364,   236,  3206,  1368,  -981,  -981,  6390,  6390,
    -981,  6390,  6390,  1374,    -1,  -981,  6390,  -981,  -981,  6390,
    -981,  6390,  6390,  -981,  -981,  -981,  6390,  6390,  6390,  6390,
    -981,  -981,  -981,  6390,  6390,  6390,  6390,  6390,  6390,  6390,
    6390,  6390,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,
    1377,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,  6390,
    -981,  6390,  6390,  6390,  -981,  6390,  6390,  6390,  -981,  -981,
    -981,  -981,  6390,  1378,  1372,  -981,  1136,   -48,  2269,  2269,
    -981,  -981,  -981,  -981,  -981,  6390,  -981,  -981,  -981,  -981,
    -981,  1392,  1470,   284,  1396,  -981,  -981,  -981,  1484,  1487,
     284,   284,   298,   516,   885,  1323,  1359,  1361,  1363,  1370,
    1548,  1550,  1552,  1573,  1589,  1591,  1600,  1778,  1554,   512,
     969,   519,   522,   527,  1558,  1560,   533,   535,   974,  1561,
     991,  1481,  1566,   997,  3436,  6390,  6390,  3436,   581,  1598,
    -981,  -981,   594,  1602,  -981,  3436,  -981,  -981,   236,  1387,
     284,   284,   284,   284,   773,    17,  -981,   999,   605,  1001,
    1005,  1009,  1013,  1016,   612,   627,   630,   658,   671,   678,
    1031,  1035,   686,  1603,  1606,  1038,   691,   693,   696,   699,
     701,   703,  1041,  1044,   707,   709,  1046,   711,   284,   714,
    1610,  -981,  6390,  -981,   -86,  2286,  1366,  1611,  -981,  6390,
    -981,  6390,  6390,  1599,  1608,  6390,  -981,  -981,  -981,  -981,
    -981,  -981,  -981,  6390,  1609,  6390,  1615,  1617,  6390,  1439,
      22,   -24,  -981,  -981,  6390,  -981,  -981,  -981,  -981,  6390,
    1596,  6390,  -981,  6390,  6390,  6390,  6390,  6390,  -981,  -981,
    -981,  -981,  -981,  -981,  6390,  6390,  -981,  6390,  -981,  6390,
    -981,  -981,  -981,  -981,  -981,  -981,  6390,  6390,  -981,  -981,
    6390,  -981,  -981,   -48,   584,  6390,  -981,  6390,  -981,   186,
    6390,  -981,   192,  2516,  -981,   284,   721,   724,  5709,  5936,
    1706,  1048,  6163,   731,  1713,  1716,  1053,  3436,  3436,  6390,
    1057,   739,  6390,  -981,   293,  2746,  1717,  1060,   744,  1784,
     752,   754,  1787,   756,   761,  1071,  1075,   764,  1789,  1826,
     236,   902,   956,  6390,  -981,  1593,  6390,  -981,  6390,  -981,
     906,  -981,  -981,  6390,   284,  6390,   284,  -981,  6390,  6390,
     284,  -981,  -981,  -981,  6390,  -981,  -981,   -35,    18,  -981,
    1780,  6390,  -981,  6390,  -981,   924,  -981,  6390,  -981,  -981,
    -981,  -981,  -981,  -981,  -981,  6390,  6390,  -981,  -981,  6390,
    -981,   949,  2976,  -981,   236,   236,  1782,   236,  1802,  1818,
    6390,  -981,   284,   284,  1082,   284,  1084,  6390,  3436,  2288,
    -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  1577,  -981,
    -981,  1773,   236,  1822,  1830,  6390,  -981,  1831,  1087,  1090,
    2009,  6390,  -981,  6390,  -981,   950,  -981,  -981,   236,  -981,
     236,   236,  2011,  6390,  6390,    26,  -981,  1828,  1832,  1172,
    1823,  -981,   236,   236,  2013,  -981,  6390,  6390,   236,  2048,
    2050,  6390,  -981,  -981,  -981,  -981,   236,  1112,  1318,  3436,
    2288,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  2094,
    -981,  -981,   236,   774,  1321,  -981,   236,   236,  2052,  -981,
    6390,  6390,  -981,  -981,  1836,  -981,  -981,  6390,  -981,  -981,
     236,  1839,  1840,  -981,  1841,  -981,  -981,  -981,  -981
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -981,  -981,  -981,  -468,    77,  -212,  -981,  -981,  -465,  -694,
    -981,  -610,  1239,  -981,  -981,  -981,  -981,  -981,  -981,  -161,
    1365,  -981,  -981,     0,  1765,  -200,   -10,  -175,    -8,   296,
     -14,  -127,  1224,  -981,  -981,  -981,  -981,  -981,  -981,  -981,
     -17,  -981,  -980,   794,   805,  -981
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -131
static const yytype_int16 yytable[] =
{
     159,   181,   815,   179,   306,   307,   306,   307,   182,   183,
     764,   175,   178,   326,   180,   306,   307,   306,   307,  1037,
     526,   321,   751,   529,   489,   426,   490,   232,   696,   849,
     999,   225,   530,   775,   304,   531,   322,   434,   306,   307,
     306,   307,   323,   227,   228,   229,   230,   231,   233,   234,
     235,   236,   324,   238,   239,   240,   241,   242,   243,   308,
     752,   306,   307,   640,   309,   306,   307,   321,   310,   641,
     691,   495,   225,   328,   496,   848,   692,   534,   311,   535,
    1037,   536,   633,   305,   811,   537,    16,    17,   323,   306,
     307,   538,   693,   539,   244,   694,   306,   307,   324,   306,
     307,   306,   307,   306,   307,   306,   307,   306,   307,   639,
     435,   306,   307,   540,   466,   467,   541,   306,   307,   306,
     307,   542,   893,   174,   618,   543,   619,   544,   480,   306,
     307,   545,   484,   500,   502,   504,   505,   506,   546,   306,
     307,   547,   306,   307,   548,   885,   296,   306,   307,   184,
     318,   306,   307,   306,   307,   185,   915,   306,   307,   768,
     642,   418,   232,   695,   306,   307,   584,   306,   307,   186,
     306,   307,   997,   998,   187,   757,   330,   319,   320,   754,
     306,   307,   909,   188,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,   367,   368,   369,   370,   371,   372,   373,   374,
     375,   376,   377,   378,   379,   434,   418,   189,   695,   816,
     908,   814,   381,   190,  1059,   982,  1000,  1001,  1002,  1003,
    1004,  1005,  1006,  1007,  1008,   312,   437,   438,   439,   440,
     191,   442,   443,   444,   445,   446,   447,   448,   449,   450,
     451,   452,   453,   454,   455,   456,   457,   458,   459,   460,
     461,   462,   463,   464,   465,   332,   549,   468,   469,   470,
     471,   472,   473,   474,   475,   476,   477,   478,   479,   192,
     481,   482,   483,   550,   485,   486,   498,   499,   435,   492,
     846,   494,   306,   307,   551,   514,   517,   850,   380,   521,
     524,   513,   516,   552,   436,   553,   523,   554,  -115,   306,
     307,   518,   555,   306,   307,   646,   698,   556,   699,   557,
     306,   307,   558,   193,   532,   533,   559,   306,   307,   306,
     307,   306,   307,   306,   307,   306,   307,   194,   306,   307,
     889,   892,   195,   306,   307,   306,   307,   560,   306,   307,
     561,   196,   306,   307,   562,   709,   711,   227,   228,   229,
     230,   231,   233,   234,   235,   236,   238,   239,   240,   241,
     242,   243,   563,   306,   307,   914,   306,   307,   704,   174,
     306,   307,   564,   576,   577,   565,   618,   197,   619,   566,
     628,   629,   618,   567,   619,   568,   755,   756,   306,   307,
     441,   569,   306,   307,   198,   929,   610,   933,   306,   307,
     613,   306,   307,   936,   434,   306,   307,   570,   940,   306,
     307,   306,   307,   738,   571,   199,   634,   306,   307,   744,
     745,   572,   488,   573,   749,   574,   618,   575,   619,   637,
     965,   638,   200,   306,   307,   643,   525,   644,   487,   645,
     306,   307,   650,   201,   981,   651,   202,   306,   307,   306,
     307,   306,   307,   306,   307,   306,   307,   306,   307,   631,
     632,   306,   307,   306,   307,   306,   307,   652,   306,   307,
     203,   306,   307,   662,   493,   663,   434,   435,   700,   701,
     664,   702,   703,   618,   665,   619,   706,   668,   707,   708,
     794,   669,   204,   306,   307,   205,   206,  1025,   207,   306,
     307,   306,   307,   689,   961,   824,   306,   307,   519,   713,
     306,   307,   826,   306,   307,   827,  -116,   306,   307,   716,
     828,   208,   839,   209,   817,   842,   831,   528,   832,   306,
     307,   306,   307,   210,   434,   306,   307,   434,   306,   307,
     211,   306,   307,   306,   307,   434,   306,   307,   212,   435,
     213,   214,   306,   307,   306,   307,   720,   721,   722,   723,
     724,   725,   726,   727,   728,   729,   730,   731,   732,   733,
     734,   735,   736,   737,   843,   739,   740,   741,   742,   743,
     215,   216,   746,   747,   748,   930,   750,   845,   753,   507,
     508,   509,   510,   511,   758,   434,   434,   762,   852,   217,
     306,   307,   218,   306,   307,   858,   219,   435,   770,   771,
     435,   772,   773,   306,   307,   220,   634,   221,   435,   777,
     859,   778,   779,   860,   306,   307,   780,   781,   782,   783,
     434,   306,   307,   784,   785,   786,   787,   788,   789,   790,
     791,   792,   222,   223,   900,   224,   306,   307,   237,   306,
     307,   861,   795,   796,   797,   798,   799,   800,   801,   802,
     246,   803,   804,   805,   862,   806,   807,   808,   435,   435,
     916,   863,   809,   434,   919,   955,   956,   306,   307,   866,
     766,   767,   247,   922,   870,   578,   871,   434,   434,   872,
     306,   307,   873,   579,   874,   434,   875,   306,   307,   928,
     878,   580,   879,   435,   881,   306,   307,   882,   248,   434,
     306,   307,   306,   307,   941,   306,   307,   942,   306,   307,
     306,   307,   306,   307,   951,   249,   306,   307,   306,   307,
     306,   307,   959,   306,   307,   840,   841,   968,   250,   251,
     306,   307,   252,   306,   307,   970,   435,   971,   611,   973,
     306,   307,   253,   813,   974,   254,   616,   977,   306,   307,
     435,   435,   434,   306,   307,   705,  1036,  1086,   435,   -98,
     -98,   306,   307,   306,   307,   306,   307,   647,   434,   717,
     306,   307,   435,   306,   307,   333,  1017,   648,   255,   334,
     256,   335,   884,   306,   307,   257,   649,   306,   307,   895,
     653,   896,   897,   306,   307,   258,   259,   306,   307,   306,
     307,   654,   260,   901,   261,   903,   306,   307,   906,   262,
     306,   307,   655,   263,   910,   847,   264,  1082,   265,   911,
     266,   306,   307,   917,   918,   435,   920,   921,   656,   434,
     657,   581,   306,   307,   267,   923,   268,   924,   658,   925,
     269,   435,   270,   271,   659,   272,   926,   927,   306,   307,
     306,   307,   273,   660,   274,   931,   661,   932,   306,   307,
     935,   886,   888,   891,   306,   307,   670,   582,   944,   946,
     275,   671,   950,   306,   307,  -117,   306,   307,   672,   957,
     673,   276,   960,   277,   674,   278,   306,   307,   626,  1091,
    1092,   306,   307,   984,   306,   307,  1094,   913,   306,   307,
     306,   307,   435,   986,   306,   307,   988,   675,   989,   676,
     666,   306,   307,   992,   677,   993,   583,   678,   994,   995,
     279,   679,   280,   681,   996,   585,   281,   306,   307,   306,
     307,  1013,   682,  1014,   306,   307,   934,   306,   307,   937,
     939,   306,   307,   306,   307,  1018,  1019,   985,   683,  1020,
     685,   667,   306,   307,   686,   282,   586,   283,   825,   284,
    1032,   962,   964,   833,   285,   306,   307,  1035,   306,   307,
     306,   307,   286,   587,   306,   307,   980,   983,   306,   307,
     835,   588,   287,   306,   307,  1044,   838,   991,   851,   288,
     853,  1049,   289,  1050,   854,   680,   290,   291,   855,   292,
     306,   307,   856,  1057,  1058,   857,   306,   307,   306,   307,
     306,   307,  1016,   589,   306,   307,  1073,  1074,   306,   307,
     864,  1078,   306,   307,   865,   306,   307,   869,  1022,  1024,
     876,  1026,  1027,   877,  1029,   880,   293,   948,   294,   627,
     306,   307,   954,   295,   306,   307,   958,   306,   307,   967,
     306,   307,   299,   306,   307,   306,   307,   306,   307,  1041,
     975,   300,   306,   307,   976,   301,   306,   307,   302,   306,
     307,  1033,  1052,  1034,   527,  1053,  1046,  1054,  1055,  1047,
     306,   307,   590,   591,   306,   307,   618,   592,   619,  1070,
    1071,   306,   307,   306,   307,  1075,   306,   307,   630,   306,
     307,  1080,   593,  1079,   618,   594,   619,   990,   595,     2,
       3,     4,     5,     6,     7,     8,   382,    10,    11,  1085,
      12,   306,   307,  1088,  1089,  1015,    13,   596,    14,   618,
     618,   619,   619,   597,   598,   599,   600,  1095,   601,   602,
     603,   604,   605,   606,    15,   607,   608,    16,    17,   614,
    1021,  1051,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,   383,   384,   385,   386,   387,   388,   389,
     390,   391,   392,    69,   393,   394,   395,   396,   397,   398,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,   615,
      95,    96,    97,    98,    99,   100,   617,   399,   400,   684,
     690,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   401,   402,   403,   404,   405,   406,
     407,   408,   409,   410,   411,   412,   413,   414,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   415,   143,   144,
     145,   146,   147,   148,   149,   150,   416,  1081,   687,   417,
    1087,   697,   705,  -118,   714,   418,   618,   419,   619,   420,
     152,   153,   421,   422,   154,   715,   155,   306,   307,   759,
     306,   307,   306,   307,   620,   156,   423,   812,   424,     2,
       3,     4,     5,     6,     7,     8,   382,    10,    11,  -119,
      12,  -120,   763,  -121,   774,   765,    13,   793,    14,   769,
    -122,  1062,  1063,  1064,  1065,  1066,  1067,  1068,   306,   307,
     306,   307,   306,   307,    15,   818,   810,    16,    17,   306,
     307,   820,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,   383,   384,   385,   386,   387,   388,   389,
     390,   391,   392,    69,   393,   394,   395,   396,   397,   398,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,   819,
      95,    96,    97,    98,    99,   100,   821,   399,   400,   822,
     836,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   401,   402,   403,   404,   405,   406,
     407,   408,   409,   410,   411,   412,   413,   414,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   415,   143,   144,
     145,   146,   147,   148,   149,   150,   416,   823,  -123,   417,
    -124,   829,  -125,   830,   834,   418,   618,   419,   619,   420,
     152,   153,   421,   422,   154,   837,   155,   306,   307,   306,
     307,   306,   307,  -126,   620,   156,   423,   890,   424,     2,
       3,     4,     5,     6,     7,     8,   382,    10,    11,  -127,
      12,  -129,   306,   307,   987,   620,    13,   844,    14,   868,
    -128,   694,   867,   883,   894,   904,   898,   905,   306,   307,
     306,   307,   306,   307,    15,   899,   902,    16,    17,   306,
     307,   907,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,   383,   384,   385,   386,   387,   388,   389,
     390,   391,   392,    69,   393,   394,   395,   396,   397,   398,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,   947,
      95,    96,    97,    98,    99,   100,   952,   399,   400,   953,
     966,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   401,   402,   403,   404,   405,   406,
     407,   408,   409,   410,   411,   412,   413,   414,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   415,   143,   144,
     145,   146,   147,   148,   149,   150,   416,   969,  -130,   417,
     972,  1012,   978,  1028,  1039,   418,   618,   419,   619,   420,
     152,   153,   421,   422,   154,  1040,   155,   306,   307,   306,
     307,   306,   307,  1030,   620,   156,   423,   912,   424,     2,
       3,     4,     5,     6,     7,     8,   382,    10,    11,  1031,
      12,   306,   307,  1042,  1045,  1061,    13,  1060,    14,  1093,
    1069,  1043,  1096,  1097,  1098,   760,   688,   306,   307,   245,
     776,   306,   307,  1084,    15,  1083,     0,    16,    17,   306,
     307,     0,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,   383,   384,   385,   386,   387,   388,   389,
     390,   391,   392,    69,   393,   394,   395,   396,   397,   398,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,     0,
      95,    96,    97,    98,    99,   100,     0,   399,   400,     0,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   401,   402,   403,   404,   405,   406,
     407,   408,   409,   410,   411,   412,   413,   414,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   415,   143,   144,
     145,   146,   147,   148,   149,   150,   416,     0,     0,   417,
    1048,     0,  1056,     0,  1072,   418,   618,   419,   619,   420,
     152,   153,   421,   422,   154,     0,   155,     0,   306,   307,
     306,   307,   306,   307,   620,   156,   423,   979,   424,     2,
       3,     4,     5,     6,     7,     8,   382,    10,    11,  1076,
      12,  1077,     0,  1090,     0,     0,    13,     0,    14,     0,
       0,     0,     0,     0,   336,   337,   338,   306,   307,   306,
     307,   306,   307,     0,    15,     0,     0,    16,    17,   306,
     307,     0,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,   383,   384,   385,   386,   387,   388,   389,
     390,   391,   392,    69,   393,   394,   395,   396,   397,   398,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,     0,
      95,    96,    97,    98,    99,   100,     0,   399,   400,     0,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   401,   402,   403,   404,   405,   406,
     407,   408,   409,   410,   411,   412,   413,   414,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   415,   143,   144,
     145,   146,   147,   148,   149,   150,   416,     0,     0,   417,
       0,     0,     0,     0,     0,   418,   618,   419,   619,   420,
     152,   153,   421,   422,   154,     0,   155,     0,     0,     0,
       0,     0,     0,     0,   620,   156,   423,     0,   424,     2,
       3,     4,     5,     6,     7,     8,   382,    10,    11,     0,
      12,   313,   314,     0,     0,   315,    13,     0,    14,     0,
     316,   317,  1000,  1001,  1002,  1003,  1004,  1005,  1006,  1007,
    1008,     0,     0,     0,    15,     0,     0,    16,    17,     0,
       0,     0,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,   383,   384,   385,   386,   387,   388,   389,
     390,   391,   392,    69,   393,   394,   395,   396,   397,   398,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,     0,
      95,    96,    97,    98,    99,   100,     0,   399,   400,     0,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   401,   402,   403,   404,   405,   406,
     407,   408,   409,   410,   411,   412,   413,   414,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   415,   143,   144,
     145,   146,   147,   148,   149,   150,   416,     0,     0,   417,
       0,     0,     0,     0,     0,   418,   618,   419,   619,   420,
     152,   153,   421,   422,   154,     0,   155,  1001,  1002,  1003,
    1004,  1005,  1006,  1007,  1008,   156,   423,   887,   424,     2,
       3,     4,     5,     6,     7,     8,   382,    10,    11,     0,
      12,     0,     0,     0,     0,     0,    13,     0,    14,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    15,     0,     0,    16,    17,     0,
       0,     0,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,   383,   384,   385,   386,   387,   388,   389,
     390,   391,   392,    69,   393,   394,   395,   396,   397,   398,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,     0,
      95,    96,    97,    98,    99,   100,     0,   399,   400,     0,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   401,   402,   403,   404,   405,   406,
     407,   408,   409,   410,   411,   412,   413,   414,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   415,   143,   144,
     145,   146,   147,   148,   149,   150,   416,     0,     0,   417,
       0,     0,     0,     0,     0,   418,   618,   419,   619,   420,
     152,   153,   421,   422,   154,     0,   155,     0,     0,     0,
       0,     0,     0,     0,     0,   156,   423,   938,   424,     2,
       3,     4,     5,     6,     7,     8,   382,    10,    11,     0,
      12,     0,     0,     0,     0,     0,    13,     0,    14,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    15,     0,     0,    16,    17,     0,
       0,     0,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,   383,   384,   385,   386,   387,   388,   389,
     390,   391,   392,    69,   393,   394,   395,   396,   397,   398,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,     0,
      95,    96,    97,    98,    99,   100,     0,   399,   400,     0,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   401,   402,   403,   404,   405,   406,
     407,   408,   409,   410,   411,   412,   413,   414,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   415,   143,   144,
     145,   146,   147,   148,   149,   150,   416,     0,     0,   417,
       0,     0,     0,     0,     0,   418,   618,   419,   619,   420,
     152,   153,   421,   422,   154,     0,   155,     0,     0,     0,
       0,     0,     0,     0,     0,   156,   423,   963,   424,     2,
       3,     4,     5,     6,     7,     8,   382,    10,    11,     0,
      12,     0,     0,     0,     0,     0,    13,     0,    14,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    15,     0,     0,    16,    17,     0,
       0,     0,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,   383,   384,   385,   386,   387,   388,   389,
     390,   391,   392,    69,   393,   394,   395,   396,   397,   398,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,     0,
      95,    96,    97,    98,    99,   100,     0,   399,   400,     0,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   401,   402,   403,   404,   405,   406,
     407,   408,   409,   410,   411,   412,   413,   414,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   415,   143,   144,
     145,   146,   147,   148,   149,   150,   416,     0,     0,   417,
       0,     0,     0,     0,     0,   418,   618,   419,   619,   420,
     152,   153,   421,   422,   154,     0,   155,     0,     0,     0,
       0,     0,     0,     0,     0,   156,   423,  1023,   424,     2,
       3,     4,     5,     6,     7,     8,   382,    10,    11,     0,
      12,     0,     0,     0,     0,     0,    13,     0,    14,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    15,     0,     0,    16,    17,     0,
       0,     0,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,   383,   384,   385,   386,   387,   388,   389,
     390,   391,   392,    69,   393,   394,   395,   396,   397,   398,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,     0,
      95,    96,    97,    98,    99,   100,     0,   399,   400,     0,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   401,   402,   403,   404,   405,   406,
     407,   408,   409,   410,   411,   412,   413,   414,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   415,   143,   144,
     145,   146,   147,   148,   149,   150,   416,     0,     0,   417,
       0,     0,     0,     0,     0,   418,   618,   419,   619,   420,
     152,   153,   421,   422,   154,     0,   155,     0,     0,     0,
       0,     0,     0,     0,     0,   156,   423,     0,   424,     2,
       3,     4,     5,     6,     7,     8,   382,    10,    11,     0,
      12,     0,     0,     0,     0,     0,    13,     0,    14,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    15,     0,     0,    16,    17,     0,
       0,     0,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,   383,   384,   385,   386,   387,   388,   389,
     390,   391,   392,    69,   393,   394,   395,   396,   397,   398,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,     0,
      95,    96,    97,    98,    99,   100,     0,   399,   400,     0,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   401,   402,   403,   404,   405,   406,
     407,   408,   409,   410,   411,   412,   413,   414,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   415,   143,   144,
     145,   146,   147,   148,   149,   150,   416,     0,     0,   417,
       0,     0,     0,     0,     0,   418,     0,   419,     0,   420,
     152,   153,   421,   422,   154,     0,   155,     0,     0,     0,
       0,     0,     0,     0,     0,   156,   423,     1,   424,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,     0,
      12,     0,     0,     0,     0,     0,    13,     0,    14,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    15,     0,     0,    16,    17,     0,
       0,     0,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,     0,
      95,    96,    97,    98,    99,   100,     0,     0,     0,     0,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   134,   135,
     136,   137,   138,   139,   140,   141,   142,     0,   143,   144,
     145,   146,   147,   148,   149,   150,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   151,     0,     0,
     152,   153,     0,     0,   154,     0,   155,     0,     0,     0,
       0,     0,     0,     0,     0,   156,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,     0,    12,     0,     0,
       0,     0,     0,    13,     0,    14,     0,     0,     0,     0,
       0,     0,     0,     0,   176,     0,     0,     0,     0,     0,
       0,    15,     0,   177,    16,    17,     0,     0,     0,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,     0,    95,    96,    97,
      98,    99,   100,     0,     0,     0,     0,     0,   101,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,   122,
     123,   124,   125,   126,   127,   128,   129,   130,   131,   132,
     133,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   134,   135,   136,   137,   138,
     139,   140,   141,   142,     0,   143,   144,   145,   146,   147,
     148,   149,   150,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   151,     0,     0,   152,   153,     0,
       0,   154,     0,   155,     0,     0,     0,     0,     0,     0,
       0,     0,   156,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,     0,    12,     0,     0,     0,     0,     0,
      13,     0,    14,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    15,     0,
       0,    16,    17,     0,     0,     0,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,     0,    95,    96,    97,    98,    99,   100,
       0,     0,     0,   718,   719,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   134,   135,   136,   137,   138,   139,   140,   141,
     142,     0,   143,   144,   145,   146,   147,   148,   149,   150,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   151,     0,     0,   152,   153,     0,     0,   154,     0,
     155,     0,     0,     0,     0,     0,     0,     0,     0,   156,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
     325,    12,     0,     0,     0,     0,     0,    13,     0,    14,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    15,     0,     0,    16,    17,
       0,     0,     0,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
       0,    95,    96,    97,    98,    99,   100,     0,     0,     0,
       0,     0,   101,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   134,
     135,   136,   137,   138,   139,   140,   141,   142,     0,   143,
     144,   145,   146,   147,   148,   149,   150,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   151,     0,
       0,   152,   153,     0,     0,   154,     0,   155,     0,     0,
       0,     0,     0,     0,     0,     0,   156,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,     0,    12,     0,
       0,     0,     0,     0,    13,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,   329,     0,     0,     0,     0,
       0,     0,    15,     0,     0,    16,    17,     0,     0,     0,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,     0,    95,    96,
      97,    98,    99,   100,     0,     0,     0,     0,     0,   101,
     102,   103,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   134,   135,   136,   137,
     138,   139,   140,   141,   142,     0,   143,   144,   145,   146,
     147,   148,   149,   150,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   151,     0,     0,   152,   153,
       0,     0,   154,     0,   155,     0,     0,     0,     0,     0,
       0,     0,     0,   156,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,   710,    12,     0,     0,     0,     0,
       0,    13,     0,    14,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    15,
       0,     0,    16,    17,     0,     0,     0,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,     0,    95,    96,    97,    98,    99,
     100,     0,     0,     0,     0,     0,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   134,   135,   136,   137,   138,   139,   140,
     141,   142,     0,   143,   144,   145,   146,   147,   148,   149,
     150,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   151,     0,     0,   152,   153,     0,     0,   154,
       0,   155,     0,     0,     0,     0,     0,     0,     0,     0,
     156,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,     0,    12,     0,     0,     0,     0,     0,    13,     0,
      14,     0,     0,     0,     0,     0,   712,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    15,     0,     0,    16,
      17,     0,     0,     0,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,     0,    95,    96,    97,    98,    99,   100,     0,     0,
       0,     0,     0,   101,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,   129,   130,   131,   132,   133,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     134,   135,   136,   137,   138,   139,   140,   141,   142,     0,
     143,   144,   145,   146,   147,   148,   149,   150,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   151,
       0,     0,   152,   153,     0,     0,   154,     0,   155,     0,
       0,     0,     0,     0,     0,     0,     0,   156,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,     0,    12,
       0,     0,     0,     0,     0,    13,     0,    14,     0,     0,
       0,     0,     0,     0,     0,   380,     0,     0,     0,     0,
       0,     0,     0,    15,     0,     0,    16,    17,     0,     0,
       0,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,     0,    95,
      96,    97,    98,    99,   100,     0,     0,     0,     0,     0,
     101,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   134,   135,   136,
     137,   138,   139,   140,   141,   142,     0,   143,   144,   145,
     146,   147,   148,   149,   150,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   151,     0,     0,   152,
     153,     0,     0,   154,     0,   155,     0,     0,     0,     0,
       0,     0,     0,     0,   156,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,   761,    12,     0,     0,     0,
       0,     0,    13,     0,    14,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      15,     0,     0,    16,    17,     0,     0,     0,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,     0,    95,    96,    97,    98,
      99,   100,     0,     0,     0,     0,     0,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,   123,
     124,   125,   126,   127,   128,   129,   130,   131,   132,   133,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   134,   135,   136,   137,   138,   139,
     140,   141,   142,     0,   143,   144,   145,   146,   147,   148,
     149,   150,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   151,     0,     0,   152,   153,     0,     0,
     154,     0,   155,     0,     0,     0,     0,     0,     0,     0,
       0,   156,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,     0,    12,     0,     0,     0,     0,     0,    13,
       0,    14,     0,     0,     0,     0,   943,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    15,     0,     0,
      16,    17,     0,     0,     0,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,     0,    95,    96,    97,    98,    99,   100,     0,
       0,     0,     0,     0,   101,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
     127,   128,   129,   130,   131,   132,   133,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   134,   135,   136,   137,   138,   139,   140,   141,   142,
       0,   143,   144,   145,   146,   147,   148,   149,   150,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     151,     0,     0,   152,   153,     0,     0,   154,     0,   155,
       0,     0,     0,     0,     0,     0,     0,     0,   156,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,     0,
      12,     0,     0,     0,     0,     0,    13,     0,    14,     0,
       0,     0,     0,   945,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    15,     0,     0,    16,    17,     0,
       0,     0,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,     0,
      95,    96,    97,    98,    99,   100,     0,     0,     0,     0,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   134,   135,
     136,   137,   138,   139,   140,   141,   142,     0,   143,   144,
     145,   146,   147,   148,   149,   150,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   151,     0,     0,
     152,   153,     0,     0,   154,     0,   155,     0,     0,     0,
       0,     0,     0,     0,     0,   156,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,     0,    12,     0,     0,
       0,     0,     0,    13,     0,    14,     0,     0,     0,     0,
     949,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    15,     0,     0,    16,    17,     0,     0,     0,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,     0,    95,    96,    97,
      98,    99,   100,     0,     0,     0,     0,     0,   101,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,   122,
     123,   124,   125,   126,   127,   128,   129,   130,   131,   132,
     133,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   134,   135,   136,   137,   138,
     139,   140,   141,   142,     0,   143,   144,   145,   146,   147,
     148,   149,   150,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   151,     0,     0,   152,   153,     0,
       0,   154,     0,   155,     0,     0,     0,     0,     0,     0,
       0,     0,   156,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,     0,    12,     0,     0,     0,     0,     0,
      13,     0,    14,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    15,     0,
       0,    16,    17,     0,     0,     0,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,     0,    95,    96,    97,    98,    99,   100,
       0,     0,     0,     0,     0,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   134,   135,   136,   137,   138,   139,   140,   141,
     142,     0,   143,   144,   145,   146,   147,   148,   149,   150,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   151,     0,     0,   152,   153,     0,     0,   154,     0,
     155,     0,     0,     0,     0,     0,     0,     0,     0,   156,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
       0,    12,     0,   501,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    15,     0,     0,    16,    17,
       0,     0,     0,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,     0,
       0,    95,    96,    97,    98,    99,   100,     0,     0,     0,
       0,     0,   101,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   134,
     135,   136,   137,   138,   139,   140,   141,   142,     0,   143,
     144,   145,   146,   147,   148,   149,   150,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   151,     0,
       0,   152,   153,     0,     0,   154,     0,   155,     0,     0,
       0,     0,     0,     0,     0,     0,   156,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,     0,    12,     0,
     503,     0,     0,     0,     0,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    15,     0,     0,    16,    17,     0,     0,     0,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,     0,     0,    95,    96,
      97,    98,    99,   100,     0,     0,     0,     0,     0,   101,
     102,   103,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   134,   135,   136,   137,
     138,   139,   140,   141,   142,     0,   143,   144,   145,   146,
     147,   148,   149,   150,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   151,     0,     0,   152,   153,
       0,     0,   154,     0,   155,     0,     0,     0,     0,     0,
       0,     0,     0,   156,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,     0,    12,     0,     0,     0,     0,
       0,     0,     0,    14,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    15,
       0,     0,    16,    17,     0,     0,     0,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,     0,     0,    95,    96,    97,    98,    99,
     100,     0,     0,     0,     0,     0,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   134,   135,   136,   137,   138,   139,   140,
     141,   142,     0,   143,   144,   145,   146,   147,   148,   149,
     150,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   151,     0,     0,   152,   153,     0,     0,   154,
       0,   155,     0,     0,     0,     0,     0,     0,     0,     0,
     156,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,     0,    12,     0,     0,     0,     0,     0,     0,     0,
      14,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   512,     0,     0,    16,
      17,     0,     0,     0,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
       0,     0,    95,    96,    97,    98,    99,   100,     0,     0,
       0,     0,     0,   101,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,   129,   130,   131,   132,   133,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     134,   135,   136,   137,   138,   139,   140,   141,   142,     0,
     143,   144,   145,   146,   147,   148,   149,   150,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   151,
       0,     0,   152,   153,     0,     0,   154,     0,   155,     0,
       0,     0,     0,     0,     0,     0,     0,   156,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,     0,    12,
       0,     0,     0,     0,     0,     0,     0,    14,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   515,     0,     0,    16,    17,     0,     0,
       0,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,     0,     0,    95,
      96,    97,    98,    99,   100,     0,     0,     0,     0,     0,
     101,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   134,   135,   136,
     137,   138,   139,   140,   141,   142,     0,   143,   144,   145,
     146,   147,   148,   149,   150,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   151,     0,     0,   152,
     153,     0,     0,   154,     0,   155,     0,     0,     0,     0,
       0,     0,     0,     0,   156,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,     0,    12,     0,     0,     0,
       0,     0,     0,     0,    14,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     522,     0,     0,    16,    17,     0,     0,     0,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,     0,     0,    95,    96,    97,    98,
      99,   100,     0,     0,     0,     0,     0,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,   123,
     124,   125,   126,   127,   128,   129,   130,   131,   132,   133,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   134,   135,   136,   137,   138,   139,
     140,   141,   142,     0,   143,   144,   145,   146,   147,   148,
     149,   150,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   151,     0,     0,   152,   153,     0,     0,
     154,     0,   155,     0,     0,     0,     0,     0,     0,     0,
       0,   156,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,     0,    12,     0,     0,     0,     0,     0,     0,
       0,    14,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   520,     0,     0,
       0,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,     0,     0,    95,    96,    97,    98,    99,   100,     0,
       0,     0,     0,     0,   101,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
     127,   128,   129,   130,   131,   132,   133,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   134,   135,   136,   137,   138,   139,   140,   141,   142,
       0,   143,   144,   145,   146,   147,   148,   149,   150,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     151,     0,     0,   152,   153,     0,     0,   154,     0,   155,
       0,     0,     0,     0,     0,     0,     0,     0,   156,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,     0,
      12,     0,     0,     0,     0,     0,     0,     0,    14,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,     0,     0,
      95,    96,    97,    98,    99,   100,     0,     0,     0,     0,
       0,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   134,   135,
     136,   137,   138,   139,   140,   141,   142,     0,   143,   144,
     145,   146,   147,   148,   149,   150,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   151,     0,     0,
     152,   153,     0,     0,   154,     0,   155,     0,     0,     0,
       0,     0,     0,     0,     0,   156
};

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-981)))

#define yytable_value_is_error(Yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
       0,    15,   696,    13,    39,    40,    39,    40,    16,    17,
     620,    11,    12,   174,    14,    39,    40,    39,    40,   999,
      19,    14,    10,    19,    19,   237,    21,    12,   496,    12,
      12,    16,    28,    34,     0,    31,    29,   237,    39,    40,
      39,    40,    35,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    45,    70,    71,    72,    73,    74,    75,    18,
      48,    39,    40,    13,    23,    39,    40,    14,    27,    19,
      13,    10,    16,    13,    13,   769,    19,    13,    37,    13,
    1060,    13,    29,    21,   694,    13,    41,    42,    35,    39,
      40,    13,    16,    13,    94,    19,    39,    40,    45,    39,
      40,    39,    40,    39,    40,    39,    40,    39,    40,    19,
     237,    39,    40,    13,   275,   276,    13,    39,    40,    39,
      40,    13,   816,    12,   210,    13,   212,    13,   289,    39,
      40,    13,   293,   308,   309,   310,   311,   312,    13,    39,
      40,    13,    39,    40,    13,   231,    29,    39,    40,    12,
     164,    39,    40,    39,    40,    12,   850,    39,    40,   624,
      19,   209,    12,   211,    39,    40,    16,    39,    40,    12,
      39,    40,   207,   208,    12,   208,   176,    43,    44,   201,
      39,    40,   206,    12,   184,   185,   186,   187,   188,   189,
     190,   191,   192,   193,   194,   195,   196,   197,   198,   199,
     200,   201,   202,   203,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,   214,   215,   216,   217,   218,   219,
     220,   221,   222,   223,   224,   425,   209,    12,   211,   697,
     208,   696,   232,    12,   208,   929,   218,   219,   220,   221,
     222,   223,   224,   225,   226,   204,   246,   247,   248,   249,
      12,   251,   252,   253,   254,   255,   256,   257,   258,   259,
     260,   261,   262,   263,   264,   265,   266,   267,   268,   269,
     270,   271,   272,   273,   274,    15,    13,   277,   278,   279,
     280,   281,   282,   283,   284,   285,   286,   287,   288,    12,
     290,   291,   292,    13,   294,   295,   306,   307,   425,   299,
     765,   301,    39,    40,    13,   319,   320,   775,    30,   323,
     324,   319,   320,    13,   123,    13,   324,    13,    20,    39,
      40,   321,    13,    39,    40,    19,   501,    13,   503,    13,
      39,    40,    13,    12,   334,   335,    13,    39,    40,    39,
      40,    39,    40,    39,    40,    39,    40,    12,    39,    40,
     815,   816,    12,    39,    40,    39,    40,    13,    39,    40,
      13,    12,    39,    40,    13,   526,   527,   384,   385,   386,
     387,   388,   389,   390,   391,   392,   393,   394,   395,   396,
     397,   398,    13,    39,    40,   850,    39,    40,    15,    12,
      39,    40,    13,    16,    17,    13,   210,    12,   212,    13,
      16,    17,   210,    13,   212,    13,   204,   205,    39,    40,
      13,    13,    39,    40,    12,   883,   416,   231,    39,    40,
     420,    39,    40,   231,   624,    39,    40,    13,   893,    39,
      40,    39,    40,   594,    13,    12,   436,    39,    40,   600,
     601,    13,   212,    13,   605,    13,   210,    13,   212,    13,
     915,    13,    12,    39,    40,    13,    13,    13,    10,    13,
      39,    40,    13,    12,   929,    13,    12,    39,    40,    39,
      40,    39,    40,    39,    40,    39,    40,    39,    40,    16,
      17,    39,    40,    39,    40,    39,    40,    13,    39,    40,
      12,    39,    40,    13,    10,    13,   696,   624,   512,   513,
      13,   515,   516,   210,    13,   212,   520,    13,   522,   523,
     671,    13,    12,    39,    40,    12,    12,   982,    12,    39,
      40,    39,    40,    13,   231,    13,    39,    40,    10,   529,
      39,    40,    13,    39,    40,    13,    20,    39,    40,    15,
      13,    12,   754,    12,   705,   757,    13,    15,    13,    39,
      40,    39,    40,    12,   754,    39,    40,   757,    39,    40,
      12,    39,    40,    39,    40,   765,    39,    40,    12,   696,
      12,    12,    39,    40,    39,    40,   576,   577,   578,   579,
     580,   581,   582,   583,   584,   585,   586,   587,   588,   589,
     590,   591,   592,   593,    13,   595,   596,   597,   598,   599,
      12,    12,   602,   603,   604,    21,   606,    13,   608,   313,
     314,   315,   316,   317,   614,   815,   816,   617,    13,    12,
      39,    40,    12,    39,    40,    13,    12,   754,   628,   629,
     757,   631,   632,    39,    40,    12,   636,    12,   765,   639,
      13,   641,   642,    13,    39,    40,   646,   647,   648,   649,
     850,    39,    40,   653,   654,   655,   656,   657,   658,   659,
     660,   661,    12,    12,   825,    12,    39,    40,    12,    39,
      40,    13,   672,   673,   674,   675,   676,   677,   678,   679,
      12,   681,   682,   683,    13,   685,   686,   687,   815,   816,
     851,    13,   692,   893,   855,   907,   908,    39,    40,    13,
     623,   624,    12,   864,    13,    16,    13,   907,   908,    13,
      39,    40,    13,    16,    13,   915,    13,    39,    40,   880,
      13,    16,    13,   850,    13,    39,    40,    13,    12,   929,
      39,    40,    39,    40,    13,    39,    40,    13,    39,    40,
      39,    40,    39,    40,    13,    12,    39,    40,    39,    40,
      39,    40,    13,    39,    40,   755,   756,    13,    12,    12,
      39,    40,    12,    39,    40,    13,   893,    13,    10,    13,
      39,    40,    12,   696,    13,    12,    10,    13,    39,    40,
     907,   908,   982,    39,    40,    12,   998,    13,   915,    16,
      17,    39,    40,    39,    40,    39,    40,    19,   998,    15,
      39,    40,   929,    39,    40,    15,   967,    19,    12,    19,
      12,    21,   812,    39,    40,    12,    19,    39,    40,   819,
      19,   821,   822,    39,    40,    12,    12,    39,    40,    39,
      40,    19,    12,   833,    12,   835,    39,    40,   838,    12,
      39,    40,    19,    12,   844,   768,    12,  1059,    12,   849,
      12,    39,    40,   853,   854,   982,   856,   857,    19,  1059,
      19,    16,    39,    40,    12,   865,    12,   867,    19,   869,
      12,   998,    12,    12,    19,    12,   876,   877,    39,    40,
      39,    40,    12,    19,    12,   885,    19,   887,    39,    40,
     890,   814,   815,   816,    39,    40,    19,    16,   898,   899,
      12,    19,   902,    39,    40,    20,    39,    40,    19,   909,
      19,    12,   912,    12,    19,    12,    39,    40,    13,  1080,
    1081,    39,    40,    21,    39,    40,  1087,   850,    39,    40,
      39,    40,  1059,   933,    39,    40,   936,    19,   938,    19,
      13,    39,    40,   943,    19,   945,    16,    19,   948,   949,
      12,    19,    12,    19,   954,    16,    12,    39,    40,    39,
      40,   961,    19,   963,    39,    40,   889,    39,    40,   892,
     893,    39,    40,    39,    40,   975,   976,    21,    19,   979,
      19,    13,    39,    40,    19,    12,    16,    12,    19,    12,
     990,   914,   915,    19,    12,    39,    40,   997,    39,    40,
      39,    40,    12,    16,    39,    40,   929,   930,    39,    40,
      19,    16,    12,    39,    40,  1015,    19,   940,    19,    12,
      19,  1021,    12,  1023,    19,    13,    12,    12,    19,    12,
      39,    40,    19,  1033,  1034,    19,    39,    40,    39,    40,
      39,    40,   965,    16,    39,    40,  1046,  1047,    39,    40,
      19,  1051,    39,    40,    19,    39,    40,    19,   981,   982,
      19,   984,   985,    19,   987,    19,    12,    19,    12,    20,
      39,    40,    19,    12,    39,    40,    19,    39,    40,    19,
      39,    40,    12,    39,    40,    39,    40,    39,    40,  1012,
      19,    12,    39,    40,    19,    12,    39,    40,    12,    39,
      40,    19,  1025,    19,    12,  1028,    19,  1030,  1031,    19,
      39,    40,    16,    16,    39,    40,   210,    16,   212,  1042,
    1043,    39,    40,    39,    40,  1048,    39,    40,    20,    39,
      40,    19,    16,  1056,   210,    12,   212,   231,    12,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,  1072,
      14,    39,    40,  1076,  1077,   231,    20,    12,    22,   210,
     210,   212,   212,    12,    12,    12,    12,  1090,    12,    12,
      12,    12,    12,    12,    38,    12,    12,    41,    42,    12,
     231,   231,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,    12,
     124,   125,   126,   127,   128,   129,    12,   131,   132,    13,
      13,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,   178,   179,   180,   181,   182,   183,
     184,   185,   186,   187,   188,   189,   190,   191,   192,   193,
     194,   195,   196,   197,   198,   199,   200,    19,    16,   203,
      19,    13,    12,    20,    31,   209,   210,   211,   212,   213,
     214,   215,   216,   217,   218,    15,   220,    39,    40,    10,
      39,    40,    39,    40,   228,   229,   230,   231,   232,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    20,
      14,    20,    10,    20,    10,    21,    20,    10,    22,    21,
      20,   219,   220,   221,   222,   223,   224,   225,    39,    40,
      39,    40,    39,    40,    38,    13,    28,    41,    42,    39,
      40,    15,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,    19,
     124,   125,   126,   127,   128,   129,    12,   131,   132,    12,
      19,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,   178,   179,   180,   181,   182,   183,
     184,   185,   186,   187,   188,   189,   190,   191,   192,   193,
     194,   195,   196,   197,   198,   199,   200,    13,    20,   203,
      20,    13,    20,    13,    13,   209,   210,   211,   212,   213,
     214,   215,   216,   217,   218,    19,   220,    39,    40,    39,
      40,    39,    40,    20,   228,   229,   230,   231,   232,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    20,
      14,    20,    39,    40,    21,   228,    20,    19,    22,    13,
      20,    19,    19,    13,    13,    10,    27,    10,    39,    40,
      39,    40,    39,    40,    38,    27,    27,    41,    42,    39,
      40,   202,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,    13,
     124,   125,   126,   127,   128,   129,    13,   131,   132,    13,
      13,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,   178,   179,   180,   181,   182,   183,
     184,   185,   186,   187,   188,   189,   190,   191,   192,   193,
     194,   195,   196,   197,   198,   199,   200,    13,    20,   203,
      13,    21,    13,    21,   227,   209,   210,   211,   212,   213,
     214,   215,   216,   217,   218,    42,   220,    39,    40,    39,
      40,    39,    40,    21,   228,   229,   230,   231,   232,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    21,
      14,    39,    40,    21,    13,    13,    20,    19,    22,    13,
      27,    21,    13,    13,    13,   616,   491,    39,    40,    94,
     636,    39,    40,  1069,    38,  1060,    -1,    41,    42,    39,
      40,    -1,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,    -1,
     124,   125,   126,   127,   128,   129,    -1,   131,   132,    -1,
      -1,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,   178,   179,   180,   181,   182,   183,
     184,   185,   186,   187,   188,   189,   190,   191,   192,   193,
     194,   195,   196,   197,   198,   199,   200,    -1,    -1,   203,
      21,    -1,    21,    -1,    21,   209,   210,   211,   212,   213,
     214,   215,   216,   217,   218,    -1,   220,    -1,    39,    40,
      39,    40,    39,    40,   228,   229,   230,   231,   232,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    21,
      14,    21,    -1,    21,    -1,    -1,    20,    -1,    22,    -1,
      -1,    -1,    -1,    -1,    24,    25,    26,    39,    40,    39,
      40,    39,    40,    -1,    38,    -1,    -1,    41,    42,    39,
      40,    -1,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,    -1,
     124,   125,   126,   127,   128,   129,    -1,   131,   132,    -1,
      -1,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,   178,   179,   180,   181,   182,   183,
     184,   185,   186,   187,   188,   189,   190,   191,   192,   193,
     194,   195,   196,   197,   198,   199,   200,    -1,    -1,   203,
      -1,    -1,    -1,    -1,    -1,   209,   210,   211,   212,   213,
     214,   215,   216,   217,   218,    -1,   220,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   228,   229,   230,    -1,   232,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    -1,
      14,    32,    33,    -1,    -1,    36,    20,    -1,    22,    -1,
      41,    42,   218,   219,   220,   221,   222,   223,   224,   225,
     226,    -1,    -1,    -1,    38,    -1,    -1,    41,    42,    -1,
      -1,    -1,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,    -1,
     124,   125,   126,   127,   128,   129,    -1,   131,   132,    -1,
      -1,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,   178,   179,   180,   181,   182,   183,
     184,   185,   186,   187,   188,   189,   190,   191,   192,   193,
     194,   195,   196,   197,   198,   199,   200,    -1,    -1,   203,
      -1,    -1,    -1,    -1,    -1,   209,   210,   211,   212,   213,
     214,   215,   216,   217,   218,    -1,   220,   219,   220,   221,
     222,   223,   224,   225,   226,   229,   230,   231,   232,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    -1,
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
     124,   125,   126,   127,   128,   129,    -1,   131,   132,    -1,
      -1,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,   178,   179,   180,   181,   182,   183,
     184,   185,   186,   187,   188,   189,   190,   191,   192,   193,
     194,   195,   196,   197,   198,   199,   200,    -1,    -1,   203,
      -1,    -1,    -1,    -1,    -1,   209,   210,   211,   212,   213,
     214,   215,   216,   217,   218,    -1,   220,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   229,   230,   231,   232,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    -1,
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
     124,   125,   126,   127,   128,   129,    -1,   131,   132,    -1,
      -1,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,   178,   179,   180,   181,   182,   183,
     184,   185,   186,   187,   188,   189,   190,   191,   192,   193,
     194,   195,   196,   197,   198,   199,   200,    -1,    -1,   203,
      -1,    -1,    -1,    -1,    -1,   209,   210,   211,   212,   213,
     214,   215,   216,   217,   218,    -1,   220,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   229,   230,   231,   232,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    -1,
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
     124,   125,   126,   127,   128,   129,    -1,   131,   132,    -1,
      -1,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,   178,   179,   180,   181,   182,   183,
     184,   185,   186,   187,   188,   189,   190,   191,   192,   193,
     194,   195,   196,   197,   198,   199,   200,    -1,    -1,   203,
      -1,    -1,    -1,    -1,    -1,   209,   210,   211,   212,   213,
     214,   215,   216,   217,   218,    -1,   220,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   229,   230,   231,   232,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    -1,
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
     124,   125,   126,   127,   128,   129,    -1,   131,   132,    -1,
      -1,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,   178,   179,   180,   181,   182,   183,
     184,   185,   186,   187,   188,   189,   190,   191,   192,   193,
     194,   195,   196,   197,   198,   199,   200,    -1,    -1,   203,
      -1,    -1,    -1,    -1,    -1,   209,   210,   211,   212,   213,
     214,   215,   216,   217,   218,    -1,   220,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   229,   230,    -1,   232,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    -1,
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
     124,   125,   126,   127,   128,   129,    -1,   131,   132,    -1,
      -1,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,   178,   179,   180,   181,   182,   183,
     184,   185,   186,   187,   188,   189,   190,   191,   192,   193,
     194,   195,   196,   197,   198,   199,   200,    -1,    -1,   203,
      -1,    -1,    -1,    -1,    -1,   209,    -1,   211,    -1,   213,
     214,   215,   216,   217,   218,    -1,   220,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   229,   230,     1,   232,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    -1,
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
     184,   185,   186,   187,   188,   189,   190,    -1,   192,   193,
     194,   195,   196,   197,   198,   199,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,    -1,    -1,
     214,   215,    -1,    -1,   218,    -1,   220,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   229,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    -1,    14,    -1,    -1,
      -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    31,    -1,    -1,    -1,    -1,    -1,
      -1,    38,    -1,    40,    41,    42,    -1,    -1,    -1,    46,
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
     187,   188,   189,   190,    -1,   192,   193,   194,   195,   196,
     197,   198,   199,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   211,    -1,    -1,   214,   215,    -1,
      -1,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   229,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    -1,    14,    -1,    -1,    -1,    -1,    -1,
      20,    -1,    22,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
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
      -1,    -1,    -1,   133,   134,   135,   136,   137,   138,   139,
     140,   141,   142,   143,   144,   145,   146,   147,   148,   149,
     150,   151,   152,   153,   154,   155,   156,   157,   158,   159,
     160,   161,   162,   163,   164,   165,   166,   167,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   182,   183,   184,   185,   186,   187,   188,   189,
     190,    -1,   192,   193,   194,   195,   196,   197,   198,   199,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   211,    -1,    -1,   214,   215,    -1,    -1,   218,    -1,
     220,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   229,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    -1,    -1,    -1,    -1,    -1,    20,    -1,    22,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
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
     193,   194,   195,   196,   197,   198,   199,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,    -1,
      -1,   214,   215,    -1,    -1,   218,    -1,   220,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   229,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    31,    -1,    -1,    -1,    -1,
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
     186,   187,   188,   189,   190,    -1,   192,   193,   194,   195,
     196,   197,   198,   199,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   211,    -1,    -1,   214,   215,
      -1,    -1,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   229,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    -1,    -1,    -1,    -1,
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
     189,   190,    -1,   192,   193,   194,   195,   196,   197,   198,
     199,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   211,    -1,    -1,   214,   215,    -1,    -1,   218,
      -1,   220,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     229,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    -1,    14,    -1,    -1,    -1,    -1,    -1,    20,    -1,
      22,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
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
     192,   193,   194,   195,   196,   197,   198,   199,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,
      -1,    -1,   214,   215,    -1,    -1,   218,    -1,   220,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   229,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    -1,    14,
      -1,    -1,    -1,    -1,    -1,    20,    -1,    22,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    30,    -1,    -1,    -1,    -1,
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
     185,   186,   187,   188,   189,   190,    -1,   192,   193,   194,
     195,   196,   197,   198,   199,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   211,    -1,    -1,   214,
     215,    -1,    -1,   218,    -1,   220,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   229,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    -1,    -1,    -1,
      -1,    -1,    20,    -1,    22,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
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
     188,   189,   190,    -1,   192,   193,   194,   195,   196,   197,
     198,   199,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   211,    -1,    -1,   214,   215,    -1,    -1,
     218,    -1,   220,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   229,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    -1,    14,    -1,    -1,    -1,    -1,    -1,    20,
      -1,    22,    -1,    -1,    -1,    -1,    27,    -1,    -1,    -1,
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
      -1,   192,   193,   194,   195,   196,   197,   198,   199,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     211,    -1,    -1,   214,   215,    -1,    -1,   218,    -1,   220,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   229,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    -1,
      14,    -1,    -1,    -1,    -1,    -1,    20,    -1,    22,    -1,
      -1,    -1,    -1,    27,    -1,    -1,    -1,    -1,    -1,    -1,
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
     184,   185,   186,   187,   188,   189,   190,    -1,   192,   193,
     194,   195,   196,   197,   198,   199,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,    -1,    -1,
     214,   215,    -1,    -1,   218,    -1,   220,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   229,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    -1,    14,    -1,    -1,
      -1,    -1,    -1,    20,    -1,    22,    -1,    -1,    -1,    -1,
      27,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
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
     187,   188,   189,   190,    -1,   192,   193,   194,   195,   196,
     197,   198,   199,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   211,    -1,    -1,   214,   215,    -1,
      -1,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   229,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    -1,    14,    -1,    -1,    -1,    -1,    -1,
      20,    -1,    22,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
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
     190,    -1,   192,   193,   194,   195,   196,   197,   198,   199,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   211,    -1,    -1,   214,   215,    -1,    -1,   218,    -1,
     220,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   229,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      -1,    14,    -1,    16,    -1,    -1,    -1,    -1,    -1,    22,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    38,    -1,    -1,    41,    42,
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
     193,   194,   195,   196,   197,   198,   199,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,    -1,
      -1,   214,   215,    -1,    -1,   218,    -1,   220,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   229,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    14,    -1,
      16,    -1,    -1,    -1,    -1,    -1,    22,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    38,    -1,    -1,    41,    42,    -1,    -1,    -1,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,    -1,    -1,   124,   125,
     126,   127,   128,   129,    -1,    -1,    -1,    -1,    -1,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   182,   183,   184,   185,
     186,   187,   188,   189,   190,    -1,   192,   193,   194,   195,
     196,   197,   198,   199,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   211,    -1,    -1,   214,   215,
      -1,    -1,   218,    -1,   220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   229,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    -1,    14,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    22,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    38,
      -1,    -1,    41,    42,    -1,    -1,    -1,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,    97,    98,
      99,   100,   101,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,    -1,    -1,   124,   125,   126,   127,   128,
     129,    -1,    -1,    -1,    -1,    -1,   135,   136,   137,   138,
     139,   140,   141,   142,   143,   144,   145,   146,   147,   148,
     149,   150,   151,   152,   153,   154,   155,   156,   157,   158,
     159,   160,   161,   162,   163,   164,   165,   166,   167,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   182,   183,   184,   185,   186,   187,   188,
     189,   190,    -1,   192,   193,   194,   195,   196,   197,   198,
     199,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   211,    -1,    -1,   214,   215,    -1,    -1,   218,
      -1,   220,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     229,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    -1,    14,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
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
     192,   193,   194,   195,   196,   197,   198,   199,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,
      -1,    -1,   214,   215,    -1,    -1,   218,    -1,   220,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   229,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    -1,    14,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    22,    -1,    -1,
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
     185,   186,   187,   188,   189,   190,    -1,   192,   193,   194,
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
     188,   189,   190,    -1,   192,   193,   194,   195,   196,   197,
     198,   199,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   211,    -1,    -1,   214,   215,    -1,    -1,
     218,    -1,   220,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   229,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    -1,    14,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    22,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    38,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    46,    47,    48,    49,    50,
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
      -1,   192,   193,   194,   195,   196,   197,   198,   199,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     211,    -1,    -1,   214,   215,    -1,    -1,   218,    -1,   220,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   229,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    -1,
      14,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    22,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
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
     184,   185,   186,   187,   188,   189,   190,    -1,   192,   193,
     194,   195,   196,   197,   198,   199,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,    -1,    -1,
     214,   215,    -1,    -1,   218,    -1,   220,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   229
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     1,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    14,    20,    22,    38,    41,    42,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,    96,    97,
      98,    99,   100,   101,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   124,   125,   126,   127,   128,
     129,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   182,   183,   184,   185,   186,   187,
     188,   189,   190,   192,   193,   194,   195,   196,   197,   198,
     199,   211,   214,   215,   218,   220,   229,   234,   235,   256,
     257,   258,   259,   260,   261,   262,   263,   264,   267,   268,
     270,   271,   272,   274,    12,   256,    31,    40,   256,   259,
     256,   263,   261,   261,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    16,   273,   273,   273,   273,
     273,   273,    12,   273,   273,   273,   273,    12,   273,   273,
     273,   273,   273,   273,   256,   257,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    29,   253,   255,    12,
      12,    12,    12,   245,     0,    21,    39,    40,    18,    23,
      27,    37,   204,    32,    33,    36,    41,    42,   263,    43,
      44,    14,    29,    35,    45,    13,   252,   256,    13,    31,
     256,   269,    15,    15,    19,    21,    24,    25,    26,   256,
     256,   256,   256,   256,   256,   256,   256,   256,   256,   256,
     256,   256,   256,   256,   256,   256,   256,   256,   256,   256,
     256,   256,   256,   256,   256,   256,   256,   256,   256,   256,
     256,   256,   256,   256,   256,   256,   256,   256,   256,   256,
      30,   256,    10,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    98,    99,   100,   101,   102,   103,   131,
     132,   168,   169,   170,   171,   172,   173,   174,   175,   176,
     177,   178,   179,   180,   181,   191,   200,   203,   209,   211,
     213,   216,   217,   230,   232,   236,   238,   246,   247,   248,
     249,   250,   251,   252,   258,   264,   123,   256,   256,   256,
     256,    13,   256,   256,   256,   256,   256,   256,   256,   256,
     256,   256,   256,   256,   256,   256,   256,   256,   256,   256,
     256,   256,   256,   256,   256,   256,   252,   252,   256,   256,
     256,   256,   256,   256,   256,   256,   256,   256,   256,   256,
     252,   256,   256,   256,   252,   256,   256,    10,   212,    19,
      21,   254,   256,    10,   256,    10,    13,   244,   259,   259,
     260,    16,   260,    16,   260,   260,   260,   262,   262,   262,
     262,   262,    38,   261,   263,    38,   261,   263,   256,    10,
      38,   263,    38,   261,   263,    13,    19,    12,    15,    19,
      28,    31,   256,   256,    13,    13,    13,    13,    13,    13,
      13,    13,    13,    13,    13,    13,    13,    13,    13,    13,
      13,    13,    13,    13,    13,    13,    13,    13,    13,    13,
      13,    13,    13,    13,    13,    13,    13,    13,    13,    13,
      13,    13,    13,    13,    13,    13,    16,    17,    16,    16,
      16,    16,    16,    16,    16,    16,    16,    16,    16,    16,
      16,    16,    16,    16,    12,    12,    12,    12,    12,    12,
      12,    12,    12,    12,    12,    12,    12,    12,    12,   239,
     256,    10,   240,   256,    12,    12,    10,    12,   210,   212,
     228,   237,   238,   241,   242,   243,    13,    20,    16,    17,
      20,    16,    17,    29,   256,   265,   266,    13,    13,    19,
      13,    19,    19,    13,    13,    13,    19,    19,    19,    19,
      13,    13,    13,    19,    19,    19,    19,    19,    19,    19,
      19,    19,    13,    13,    13,    13,    13,    13,    13,    13,
      19,    19,    19,    19,    19,    19,    19,    19,    19,    19,
      13,    19,    19,    19,    13,    19,    19,    16,   253,    13,
      13,    13,    19,    16,    19,   211,   236,    13,   260,   260,
     263,   263,   263,   263,    15,    12,   263,   263,   263,   252,
      13,   252,    28,   256,    31,    15,    15,    15,   133,   134,
     256,   256,   256,   256,   256,   256,   256,   256,   256,   256,
     256,   256,   256,   256,   256,   256,   256,   256,   252,   256,
     256,   256,   256,   256,   252,   252,   256,   256,   256,   252,
     256,    10,    48,   256,   201,   204,   205,   208,   256,    10,
     245,    13,   256,    10,   244,    21,   237,   237,   241,    21,
     256,   256,   256,   256,    10,    34,   265,   256,   256,   256,
     256,   256,   256,   256,   256,   256,   256,   256,   256,   256,
     256,   256,   256,    10,   252,   256,   256,   256,   256,   256,
     256,   256,   256,   256,   256,   256,   256,   256,   256,   256,
      28,   244,   231,   237,   241,   242,   236,   252,    13,    19,
      15,    12,    12,    13,    13,    19,    13,    13,    13,    13,
      13,    13,    13,    19,    13,    19,    19,    19,    19,   238,
     256,   256,   238,    13,    19,    13,   241,   237,   242,    12,
     236,    19,    13,    19,    19,    19,    19,    19,    13,    13,
      13,    13,    13,    13,    19,    19,    13,    19,    13,    19,
      13,    13,    13,    13,    13,    13,    19,    19,    13,    13,
      19,    13,    13,    13,   256,   231,   237,   231,   237,   241,
     231,   237,   241,   242,    13,   256,   256,   256,    27,    27,
     252,   256,    27,   256,    10,    10,   256,   202,   208,   206,
     256,   256,   231,   237,   241,   242,   252,   256,   256,   252,
     256,   256,   252,   256,   256,   256,   256,   256,   252,   236,
      21,   256,   256,   231,   237,   256,   231,   237,   231,   237,
     241,    13,    13,    27,   256,    27,   256,    13,    19,    27,
     256,    13,    13,    13,    19,   238,   238,   256,    19,    13,
     256,   231,   237,   231,   237,   241,    13,    19,    13,    13,
      13,    13,    13,    13,    13,    19,    19,    13,    13,   231,
     237,   241,   242,   237,    21,    21,   256,    21,   256,   256,
     231,   237,   256,   256,   256,   256,   256,   207,   208,    12,
     218,   219,   220,   221,   222,   223,   224,   225,   226,   275,
     276,   278,    21,   256,   256,   231,   237,   252,   256,   256,
     256,   231,   237,   231,   237,   241,   237,   237,    21,   237,
      21,    21,   256,    19,    19,   256,   238,   275,   277,   227,
      42,   237,    21,    21,   256,    13,    19,    19,    21,   256,
     256,   231,   237,   237,   237,   237,    21,   256,   256,   208,
      19,    13,   219,   220,   221,   222,   223,   224,   225,    27,
     237,   237,    21,   256,   256,   237,    21,    21,   256,   237,
      19,    19,   238,   277,   276,   237,    13,    19,   237,   237,
      21,   252,   252,    13,   252,   237,    13,    13,    13
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
      yyerror (myScanner, YY_("syntax error: cannot back up")); \
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
# define YYLEX yylex (&yylval, myScanner)
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
		  Type, Value, myScanner); \
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
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, void *myScanner)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, myScanner)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    void *myScanner;
#endif
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
  YYUSE (myScanner);
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
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, void *myScanner)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, myScanner)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    void *myScanner;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep, myScanner);
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
yy_reduce_print (YYSTYPE *yyvsp, int yyrule, void *myScanner)
#else
static void
yy_reduce_print (yyvsp, yyrule, myScanner)
    YYSTYPE *yyvsp;
    int yyrule;
    void *myScanner;
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
		       		       , myScanner);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule, myScanner); \
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
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, void *myScanner)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, myScanner)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    void *myScanner;
#endif
{
  YYUSE (yyvaluep);
  YYUSE (myScanner);

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
yyparse (void *myScanner)
#else
int
yyparse (myScanner)
    void *myScanner;
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
#line 421 "miniparser.y"
    {
			    minitree = (yyvsp[(1) - (1)].tree);
			    (yyval.other) = NULL;
			    YYACCEPT;
			  }
    break;

  case 3:
/* Line 1787 of yacc.c  */
#line 430 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 4:
/* Line 1787 of yacc.c  */
#line 434 "miniparser.y"
    {
                            miniparserSemicolonAtEnd = 1;
			    (yyval.tree) = (yyvsp[(1) - (2)].tree);
			  }
    break;

  case 5:
/* Line 1787 of yacc.c  */
#line 439 "miniparser.y"
    {
			    (yyval.tree) = NULL;
			  }
    break;

  case 6:
/* Line 1787 of yacc.c  */
#line 445 "miniparser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 7:
/* Line 1787 of yacc.c  */
#line 449 "miniparser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 8:
/* Line 1787 of yacc.c  */
#line 455 "miniparser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 9:
/* Line 1787 of yacc.c  */
#line 459 "miniparser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 10:
/* Line 1787 of yacc.c  */
#line 465 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 11:
/* Line 1787 of yacc.c  */
#line 469 "miniparser.y"
    {
			    (yyval.tree) = makeCommandList((yyvsp[(2) - (3)].list));
                          }
    break;

  case 12:
/* Line 1787 of yacc.c  */
#line 473 "miniparser.y"
    {
			    (yyval.tree) = makeCommandList(concatChains((yyvsp[(2) - (4)].list), (yyvsp[(3) - (4)].list)));
                          }
    break;

  case 13:
/* Line 1787 of yacc.c  */
#line 477 "miniparser.y"
    {
			    (yyval.tree) = makeCommandList((yyvsp[(2) - (3)].list));
                          }
    break;

  case 14:
/* Line 1787 of yacc.c  */
#line 481 "miniparser.y"
    {
			    (yyval.tree) = makeNop();
                          }
    break;

  case 15:
/* Line 1787 of yacc.c  */
#line 485 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(2) - (2)].tree);
			  }
    break;

  case 16:
/* Line 1787 of yacc.c  */
#line 489 "miniparser.y"
    {
			    (yyval.tree) = makeWhile((yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree));
			  }
    break;

  case 17:
/* Line 1787 of yacc.c  */
#line 493 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(2) - (2)].tree);
			  }
    break;

  case 18:
/* Line 1787 of yacc.c  */
#line 499 "miniparser.y"
    {
			    (yyval.tree) = makeIf((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
                          }
    break;

  case 19:
/* Line 1787 of yacc.c  */
#line 503 "miniparser.y"
    {
			    (yyval.tree) = makeIfElse((yyvsp[(1) - (5)].tree),(yyvsp[(3) - (5)].tree),(yyvsp[(5) - (5)].tree));
                          }
    break;

  case 20:
/* Line 1787 of yacc.c  */
#line 511 "miniparser.y"
    {
			    (yyval.tree) = makeFor((yyvsp[(1) - (7)].value), (yyvsp[(3) - (7)].tree), (yyvsp[(5) - (7)].tree), makeConstantDouble(1.0), (yyvsp[(7) - (7)].tree));
			    safeFree((yyvsp[(1) - (7)].value));
                          }
    break;

  case 21:
/* Line 1787 of yacc.c  */
#line 516 "miniparser.y"
    {
			    (yyval.tree) = makeFor((yyvsp[(1) - (9)].value), (yyvsp[(3) - (9)].tree), (yyvsp[(5) - (9)].tree), (yyvsp[(7) - (9)].tree), (yyvsp[(9) - (9)].tree));
			    safeFree((yyvsp[(1) - (9)].value));
                          }
    break;

  case 22:
/* Line 1787 of yacc.c  */
#line 521 "miniparser.y"
    {
			    (yyval.tree) = makeForIn((yyvsp[(1) - (5)].value), (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree));
			    safeFree((yyvsp[(1) - (5)].value));
                          }
    break;

  case 23:
/* Line 1787 of yacc.c  */
#line 529 "miniparser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (2)].tree));
			  }
    break;

  case 24:
/* Line 1787 of yacc.c  */
#line 533 "miniparser.y"
    {
			    (yyval.list) = addElement((yyvsp[(3) - (3)].list), (yyvsp[(1) - (3)].tree));
			  }
    break;

  case 25:
/* Line 1787 of yacc.c  */
#line 539 "miniparser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (2)].tree));
			  }
    break;

  case 26:
/* Line 1787 of yacc.c  */
#line 543 "miniparser.y"
    {
			    (yyval.list) = addElement((yyvsp[(3) - (3)].list), (yyvsp[(1) - (3)].tree));
			  }
    break;

  case 27:
/* Line 1787 of yacc.c  */
#line 549 "miniparser.y"
    {
			    (yyval.tree) = makeVariableDeclaration((yyvsp[(2) - (2)].list));
			  }
    break;

  case 28:
/* Line 1787 of yacc.c  */
#line 556 "miniparser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (1)].value));
			  }
    break;

  case 29:
/* Line 1787 of yacc.c  */
#line 560 "miniparser.y"
    {
			    (yyval.list) = addElement((yyvsp[(3) - (3)].list), (yyvsp[(1) - (3)].value));
			  }
    break;

  case 30:
/* Line 1787 of yacc.c  */
#line 566 "miniparser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList((yyvsp[(4) - (5)].list)), makeUnit());
                          }
    break;

  case 31:
/* Line 1787 of yacc.c  */
#line 570 "miniparser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList(concatChains((yyvsp[(4) - (6)].list), (yyvsp[(5) - (6)].list))), makeUnit());
                          }
    break;

  case 32:
/* Line 1787 of yacc.c  */
#line 574 "miniparser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList((yyvsp[(4) - (5)].list)), makeUnit());
                          }
    break;

  case 33:
/* Line 1787 of yacc.c  */
#line 578 "miniparser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList(addElement(NULL,makeNop())), makeUnit());
                          }
    break;

  case 34:
/* Line 1787 of yacc.c  */
#line 582 "miniparser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList((yyvsp[(4) - (8)].list)), (yyvsp[(6) - (8)].tree));
                          }
    break;

  case 35:
/* Line 1787 of yacc.c  */
#line 586 "miniparser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList(concatChains((yyvsp[(4) - (9)].list), (yyvsp[(5) - (9)].list))), (yyvsp[(7) - (9)].tree));
                          }
    break;

  case 36:
/* Line 1787 of yacc.c  */
#line 590 "miniparser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList((yyvsp[(4) - (8)].list)), (yyvsp[(6) - (8)].tree));
                          }
    break;

  case 37:
/* Line 1787 of yacc.c  */
#line 594 "miniparser.y"
    {
			    (yyval.tree) = makeProc(NULL, makeCommandList(addElement(NULL,makeNop())), (yyvsp[(5) - (7)].tree));
                          }
    break;

  case 38:
/* Line 1787 of yacc.c  */
#line 598 "miniparser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (6)].list), makeCommandList((yyvsp[(5) - (6)].list)), makeUnit());
                          }
    break;

  case 39:
/* Line 1787 of yacc.c  */
#line 602 "miniparser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (7)].list), makeCommandList(concatChains((yyvsp[(5) - (7)].list), (yyvsp[(6) - (7)].list))), makeUnit());
                          }
    break;

  case 40:
/* Line 1787 of yacc.c  */
#line 606 "miniparser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (6)].list), makeCommandList((yyvsp[(5) - (6)].list)), makeUnit());
                          }
    break;

  case 41:
/* Line 1787 of yacc.c  */
#line 610 "miniparser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (5)].list), makeCommandList(addElement(NULL,makeNop())), makeUnit());
                          }
    break;

  case 42:
/* Line 1787 of yacc.c  */
#line 614 "miniparser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (9)].list), makeCommandList((yyvsp[(5) - (9)].list)), (yyvsp[(7) - (9)].tree));
                          }
    break;

  case 43:
/* Line 1787 of yacc.c  */
#line 618 "miniparser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (10)].list), makeCommandList(concatChains((yyvsp[(5) - (10)].list), (yyvsp[(6) - (10)].list))), (yyvsp[(8) - (10)].tree));
                          }
    break;

  case 44:
/* Line 1787 of yacc.c  */
#line 622 "miniparser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (9)].list), makeCommandList((yyvsp[(5) - (9)].list)), (yyvsp[(7) - (9)].tree));
                          }
    break;

  case 45:
/* Line 1787 of yacc.c  */
#line 626 "miniparser.y"
    {
			    (yyval.tree) = makeProc((yyvsp[(2) - (8)].list), makeCommandList(addElement(NULL, makeNop())), (yyvsp[(6) - (8)].tree));
                          }
    break;

  case 46:
/* Line 1787 of yacc.c  */
#line 630 "miniparser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (8)].value), makeCommandList((yyvsp[(7) - (8)].list)), makeUnit());
                          }
    break;

  case 47:
/* Line 1787 of yacc.c  */
#line 634 "miniparser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (9)].value), makeCommandList(concatChains((yyvsp[(7) - (9)].list), (yyvsp[(8) - (9)].list))), makeUnit());
                          }
    break;

  case 48:
/* Line 1787 of yacc.c  */
#line 638 "miniparser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (8)].value), makeCommandList((yyvsp[(7) - (8)].list)), makeUnit());
                          }
    break;

  case 49:
/* Line 1787 of yacc.c  */
#line 642 "miniparser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (7)].value), makeCommandList(addElement(NULL,makeNop())), makeUnit());
                          }
    break;

  case 50:
/* Line 1787 of yacc.c  */
#line 646 "miniparser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (11)].value), makeCommandList((yyvsp[(7) - (11)].list)), (yyvsp[(9) - (11)].tree));
                          }
    break;

  case 51:
/* Line 1787 of yacc.c  */
#line 650 "miniparser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (12)].value), makeCommandList(concatChains((yyvsp[(7) - (12)].list), (yyvsp[(8) - (12)].list))), (yyvsp[(10) - (12)].tree));
                          }
    break;

  case 52:
/* Line 1787 of yacc.c  */
#line 654 "miniparser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (11)].value), makeCommandList((yyvsp[(7) - (11)].list)), (yyvsp[(9) - (11)].tree));
                          }
    break;

  case 53:
/* Line 1787 of yacc.c  */
#line 658 "miniparser.y"
    {
			    (yyval.tree) = makeProcIllim((yyvsp[(2) - (10)].value), makeCommandList(addElement(NULL, makeNop())), (yyvsp[(8) - (10)].tree));
                          }
    break;

  case 54:
/* Line 1787 of yacc.c  */
#line 666 "miniparser.y"
    {
			    (yyval.tree) = makeQuit();
			  }
    break;

  case 55:
/* Line 1787 of yacc.c  */
#line 670 "miniparser.y"
    {
			    (yyval.tree) = makeFalseRestart();
			  }
    break;

  case 56:
/* Line 1787 of yacc.c  */
#line 674 "miniparser.y"
    {
			    (yyval.tree) = makeNop();
			  }
    break;

  case 57:
/* Line 1787 of yacc.c  */
#line 678 "miniparser.y"
    {
			    (yyval.tree) = makeNopArg((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 58:
/* Line 1787 of yacc.c  */
#line 682 "miniparser.y"
    {
			    (yyval.tree) = makeNopArg(makeDefault());
			  }
    break;

  case 59:
/* Line 1787 of yacc.c  */
#line 686 "miniparser.y"
    {
			    (yyval.tree) = makePrint((yyvsp[(3) - (4)].list));
			  }
    break;

  case 60:
/* Line 1787 of yacc.c  */
#line 690 "miniparser.y"
    {
			    (yyval.tree) = makeNewFilePrint((yyvsp[(6) - (6)].tree), (yyvsp[(3) - (6)].list));
			  }
    break;

  case 61:
/* Line 1787 of yacc.c  */
#line 694 "miniparser.y"
    {
			    (yyval.tree) = makeAppendFilePrint((yyvsp[(7) - (7)].tree), (yyvsp[(3) - (7)].list));
			  }
    break;

  case 62:
/* Line 1787 of yacc.c  */
#line 698 "miniparser.y"
    {
			    (yyval.tree) = makePlot(addElement((yyvsp[(5) - (6)].list), (yyvsp[(3) - (6)].tree)));
			  }
    break;

  case 63:
/* Line 1787 of yacc.c  */
#line 702 "miniparser.y"
    {
			    (yyval.tree) = makePrintHexa((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 64:
/* Line 1787 of yacc.c  */
#line 706 "miniparser.y"
    {
			    (yyval.tree) = makePrintFloat((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 65:
/* Line 1787 of yacc.c  */
#line 710 "miniparser.y"
    {
			    (yyval.tree) = makePrintBinary((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 66:
/* Line 1787 of yacc.c  */
#line 714 "miniparser.y"
    {
			    (yyval.tree) = makeSuppressMessage((yyvsp[(3) - (4)].list));
			  }
    break;

  case 67:
/* Line 1787 of yacc.c  */
#line 718 "miniparser.y"
    {
			    (yyval.tree) = makeUnsuppressMessage((yyvsp[(3) - (4)].list));
			  }
    break;

  case 68:
/* Line 1787 of yacc.c  */
#line 722 "miniparser.y"
    {
			    (yyval.tree) = makePrintExpansion((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 69:
/* Line 1787 of yacc.c  */
#line 726 "miniparser.y"
    {
			    (yyval.tree) = makeBashExecute((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 70:
/* Line 1787 of yacc.c  */
#line 730 "miniparser.y"
    {
			    (yyval.tree) = makeExternalPlot(addElement(addElement(addElement(addElement((yyvsp[(11) - (12)].list),(yyvsp[(9) - (12)].tree)),(yyvsp[(7) - (12)].tree)),(yyvsp[(5) - (12)].tree)),(yyvsp[(3) - (12)].tree)));
			  }
    break;

  case 71:
/* Line 1787 of yacc.c  */
#line 734 "miniparser.y"
    {
			    (yyval.tree) = makeWrite((yyvsp[(3) - (4)].list));
			  }
    break;

  case 72:
/* Line 1787 of yacc.c  */
#line 738 "miniparser.y"
    {
			    (yyval.tree) = makeNewFileWrite((yyvsp[(6) - (6)].tree), (yyvsp[(3) - (6)].list));
			  }
    break;

  case 73:
/* Line 1787 of yacc.c  */
#line 742 "miniparser.y"
    {
			    (yyval.tree) = makeAppendFileWrite((yyvsp[(7) - (7)].tree), (yyvsp[(3) - (7)].list));
			  }
    break;

  case 74:
/* Line 1787 of yacc.c  */
#line 746 "miniparser.y"
    {
			    (yyval.tree) = makeAsciiPlot((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 75:
/* Line 1787 of yacc.c  */
#line 750 "miniparser.y"
    {
			    (yyval.tree) = makePrintXml((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 76:
/* Line 1787 of yacc.c  */
#line 754 "miniparser.y"
    {
			    (yyval.tree) = makeExecute((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 77:
/* Line 1787 of yacc.c  */
#line 758 "miniparser.y"
    {
			    (yyval.tree) = makePrintXmlNewFile((yyvsp[(3) - (6)].tree),(yyvsp[(6) - (6)].tree));
			  }
    break;

  case 78:
/* Line 1787 of yacc.c  */
#line 762 "miniparser.y"
    {
			    (yyval.tree) = makePrintXmlAppendFile((yyvsp[(3) - (7)].tree),(yyvsp[(7) - (7)].tree));
			  }
    break;

  case 79:
/* Line 1787 of yacc.c  */
#line 766 "miniparser.y"
    {
			    (yyval.tree) = makeWorstCase(addElement(addElement(addElement(addElement((yyvsp[(11) - (12)].list), (yyvsp[(9) - (12)].tree)), (yyvsp[(7) - (12)].tree)), (yyvsp[(5) - (12)].tree)), (yyvsp[(3) - (12)].tree)));
			  }
    break;

  case 80:
/* Line 1787 of yacc.c  */
#line 770 "miniparser.y"
    {
			    (yyval.tree) = makeRename((yyvsp[(3) - (6)].value), (yyvsp[(5) - (6)].value));
			    safeFree((yyvsp[(3) - (6)].value));
			    safeFree((yyvsp[(5) - (6)].value));
			  }
    break;

  case 81:
/* Line 1787 of yacc.c  */
#line 776 "miniparser.y"
    {
			    (yyval.tree) = makeRename("_x_", (yyvsp[(5) - (6)].value));
			    safeFree((yyvsp[(5) - (6)].value));
			  }
    break;

  case 82:
/* Line 1787 of yacc.c  */
#line 781 "miniparser.y"
    {
			    (yyval.tree) = makeExternalProc((yyvsp[(3) - (11)].value), (yyvsp[(5) - (11)].tree), addElement((yyvsp[(7) - (11)].list), (yyvsp[(10) - (11)].integerval)));
			    safeFree((yyvsp[(3) - (11)].value));
			  }
    break;

  case 83:
/* Line 1787 of yacc.c  */
#line 786 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 84:
/* Line 1787 of yacc.c  */
#line 790 "miniparser.y"
    {
			    (yyval.tree) = makeAutoprint((yyvsp[(1) - (1)].list));
			  }
    break;

  case 85:
/* Line 1787 of yacc.c  */
#line 794 "miniparser.y"
    {
			    (yyval.tree) = makeAssignment((yyvsp[(2) - (3)].value), (yyvsp[(3) - (3)].tree));
			    safeFree((yyvsp[(2) - (3)].value));
			  }
    break;

  case 86:
/* Line 1787 of yacc.c  */
#line 801 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 87:
/* Line 1787 of yacc.c  */
#line 805 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (2)].tree);
			  }
    break;

  case 88:
/* Line 1787 of yacc.c  */
#line 809 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 89:
/* Line 1787 of yacc.c  */
#line 813 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (2)].tree);
			  }
    break;

  case 90:
/* Line 1787 of yacc.c  */
#line 819 "miniparser.y"
    {
			    (yyval.tree) = makeAssignment((yyvsp[(1) - (3)].value), (yyvsp[(3) - (3)].tree));
			    safeFree((yyvsp[(1) - (3)].value));
			  }
    break;

  case 91:
/* Line 1787 of yacc.c  */
#line 824 "miniparser.y"
    {
			    (yyval.tree) = makeFloatAssignment((yyvsp[(1) - (3)].value), (yyvsp[(3) - (3)].tree));
			    safeFree((yyvsp[(1) - (3)].value));
			  }
    break;

  case 92:
/* Line 1787 of yacc.c  */
#line 829 "miniparser.y"
    {
			    (yyval.tree) = makeLibraryBinding((yyvsp[(1) - (6)].value), (yyvsp[(5) - (6)].tree));
			    safeFree((yyvsp[(1) - (6)].value));
			  }
    break;

  case 93:
/* Line 1787 of yacc.c  */
#line 834 "miniparser.y"
    {
			    (yyval.tree) = makeLibraryConstantBinding((yyvsp[(1) - (6)].value), (yyvsp[(5) - (6)].tree));
			    safeFree((yyvsp[(1) - (6)].value));
			  }
    break;

  case 94:
/* Line 1787 of yacc.c  */
#line 839 "miniparser.y"
    {
			    (yyval.tree) = makeAssignmentInIndexing((yyvsp[(1) - (3)].dblnode)->a,(yyvsp[(1) - (3)].dblnode)->b,(yyvsp[(3) - (3)].tree));
			    safeFree((yyvsp[(1) - (3)].dblnode));
			  }
    break;

  case 95:
/* Line 1787 of yacc.c  */
#line 844 "miniparser.y"
    {
			    (yyval.tree) = makeFloatAssignmentInIndexing((yyvsp[(1) - (3)].dblnode)->a,(yyvsp[(1) - (3)].dblnode)->b,(yyvsp[(3) - (3)].tree));
			    safeFree((yyvsp[(1) - (3)].dblnode));
			  }
    break;

  case 96:
/* Line 1787 of yacc.c  */
#line 849 "miniparser.y"
    {
			    (yyval.tree) = makeProtoAssignmentInStructure((yyvsp[(1) - (3)].tree),(yyvsp[(3) - (3)].tree));
			  }
    break;

  case 97:
/* Line 1787 of yacc.c  */
#line 853 "miniparser.y"
    {
			    (yyval.tree) = makeProtoFloatAssignmentInStructure((yyvsp[(1) - (3)].tree),(yyvsp[(3) - (3)].tree));
			  }
    break;

  case 98:
/* Line 1787 of yacc.c  */
#line 859 "miniparser.y"
    {
			    (yyval.tree) = makeStructAccess((yyvsp[(1) - (3)].tree),(yyvsp[(3) - (3)].value));
			    safeFree((yyvsp[(3) - (3)].value));
			  }
    break;

  case 99:
/* Line 1787 of yacc.c  */
#line 866 "miniparser.y"
    {
			    (yyval.tree) = makePrecAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 100:
/* Line 1787 of yacc.c  */
#line 870 "miniparser.y"
    {
			    (yyval.tree) = makePointsAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 101:
/* Line 1787 of yacc.c  */
#line 874 "miniparser.y"
    {
			    (yyval.tree) = makeDiamAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 102:
/* Line 1787 of yacc.c  */
#line 878 "miniparser.y"
    {
			    (yyval.tree) = makeDisplayAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 103:
/* Line 1787 of yacc.c  */
#line 882 "miniparser.y"
    {
			    (yyval.tree) = makeVerbosityAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 104:
/* Line 1787 of yacc.c  */
#line 886 "miniparser.y"
    {
			    (yyval.tree) = makeShowMessageNumbersAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 105:
/* Line 1787 of yacc.c  */
#line 890 "miniparser.y"
    {
			    (yyval.tree) = makeCanonicalAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 106:
/* Line 1787 of yacc.c  */
#line 894 "miniparser.y"
    {
			    (yyval.tree) = makeAutoSimplifyAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 107:
/* Line 1787 of yacc.c  */
#line 898 "miniparser.y"
    {
			    (yyval.tree) = makeTaylorRecursAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 108:
/* Line 1787 of yacc.c  */
#line 902 "miniparser.y"
    {
			    (yyval.tree) = makeTimingAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 109:
/* Line 1787 of yacc.c  */
#line 906 "miniparser.y"
    {
			    (yyval.tree) = makeFullParenAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 110:
/* Line 1787 of yacc.c  */
#line 910 "miniparser.y"
    {
			    (yyval.tree) = makeMidpointAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 111:
/* Line 1787 of yacc.c  */
#line 914 "miniparser.y"
    {
			    (yyval.tree) = makeDieOnErrorAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 112:
/* Line 1787 of yacc.c  */
#line 918 "miniparser.y"
    {
			    (yyval.tree) = makeRationalModeAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 113:
/* Line 1787 of yacc.c  */
#line 922 "miniparser.y"
    {
			    (yyval.tree) = makeSuppressWarningsAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 114:
/* Line 1787 of yacc.c  */
#line 926 "miniparser.y"
    {
			    (yyval.tree) = makeHopitalRecursAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 115:
/* Line 1787 of yacc.c  */
#line 932 "miniparser.y"
    {
			    (yyval.tree) = makePrecStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 116:
/* Line 1787 of yacc.c  */
#line 936 "miniparser.y"
    {
			    (yyval.tree) = makePointsStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 117:
/* Line 1787 of yacc.c  */
#line 940 "miniparser.y"
    {
			    (yyval.tree) = makeDiamStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 118:
/* Line 1787 of yacc.c  */
#line 944 "miniparser.y"
    {
			    (yyval.tree) = makeDisplayStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 119:
/* Line 1787 of yacc.c  */
#line 948 "miniparser.y"
    {
			    (yyval.tree) = makeVerbosityStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 120:
/* Line 1787 of yacc.c  */
#line 952 "miniparser.y"
    {
			    (yyval.tree) = makeShowMessageNumbersStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 121:
/* Line 1787 of yacc.c  */
#line 956 "miniparser.y"
    {
			    (yyval.tree) = makeCanonicalStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 122:
/* Line 1787 of yacc.c  */
#line 960 "miniparser.y"
    {
			    (yyval.tree) = makeAutoSimplifyStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 123:
/* Line 1787 of yacc.c  */
#line 964 "miniparser.y"
    {
			    (yyval.tree) = makeTaylorRecursStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 124:
/* Line 1787 of yacc.c  */
#line 968 "miniparser.y"
    {
			    (yyval.tree) = makeTimingStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 125:
/* Line 1787 of yacc.c  */
#line 972 "miniparser.y"
    {
			    (yyval.tree) = makeFullParenStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 126:
/* Line 1787 of yacc.c  */
#line 976 "miniparser.y"
    {
			    (yyval.tree) = makeMidpointStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 127:
/* Line 1787 of yacc.c  */
#line 980 "miniparser.y"
    {
			    (yyval.tree) = makeDieOnErrorStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 128:
/* Line 1787 of yacc.c  */
#line 984 "miniparser.y"
    {
			    (yyval.tree) = makeRationalModeStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 129:
/* Line 1787 of yacc.c  */
#line 988 "miniparser.y"
    {
			    (yyval.tree) = makeSuppressWarningsStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 130:
/* Line 1787 of yacc.c  */
#line 992 "miniparser.y"
    {
			    (yyval.tree) = makeHopitalRecursStillAssign((yyvsp[(3) - (3)].tree));
			  }
    break;

  case 131:
/* Line 1787 of yacc.c  */
#line 998 "miniparser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (1)].tree));
			  }
    break;

  case 132:
/* Line 1787 of yacc.c  */
#line 1002 "miniparser.y"
    {
			    (yyval.list) = addElement((yyvsp[(3) - (3)].list), (yyvsp[(1) - (3)].tree));
			  }
    break;

  case 133:
/* Line 1787 of yacc.c  */
#line 1008 "miniparser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (1)].association));
			  }
    break;

  case 134:
/* Line 1787 of yacc.c  */
#line 1012 "miniparser.y"
    {
			    (yyval.list) = addElement((yyvsp[(3) - (3)].list), (yyvsp[(1) - (3)].association));
			  }
    break;

  case 135:
/* Line 1787 of yacc.c  */
#line 1018 "miniparser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 136:
/* Line 1787 of yacc.c  */
#line 1022 "miniparser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 137:
/* Line 1787 of yacc.c  */
#line 1028 "miniparser.y"
    {
			    (yyval.association) = (entry *) safeMalloc(sizeof(entry));
			    (yyval.association)->name = (char *) safeCalloc(strlen((yyvsp[(2) - (4)].value)) + 1, sizeof(char));
			    strcpy((yyval.association)->name,(yyvsp[(2) - (4)].value));
			    safeFree((yyvsp[(2) - (4)].value));
			    (yyval.association)->value = (void *) ((yyvsp[(4) - (4)].tree));
			  }
    break;

  case 138:
/* Line 1787 of yacc.c  */
#line 1038 "miniparser.y"
    {
			   (yyval.tree) = (yyvsp[(1) - (1)].tree);
			 }
    break;

  case 139:
/* Line 1787 of yacc.c  */
#line 1042 "miniparser.y"
    {
			    (yyval.tree) = makeMatch((yyvsp[(2) - (4)].tree),(yyvsp[(4) - (4)].list));
			  }
    break;

  case 140:
/* Line 1787 of yacc.c  */
#line 1048 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 141:
/* Line 1787 of yacc.c  */
#line 1052 "miniparser.y"
    {
			    (yyval.tree) = makeAnd((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 142:
/* Line 1787 of yacc.c  */
#line 1056 "miniparser.y"
    {
			    (yyval.tree) = makeOr((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 143:
/* Line 1787 of yacc.c  */
#line 1060 "miniparser.y"
    {
			    (yyval.tree) = makeNegation((yyvsp[(2) - (2)].tree));
			  }
    break;

  case 144:
/* Line 1787 of yacc.c  */
#line 1066 "miniparser.y"
    {
			    (yyval.dblnode) = (doubleNode *) safeMalloc(sizeof(doubleNode));
			    (yyval.dblnode)->a = (yyvsp[(1) - (4)].tree);
			    (yyval.dblnode)->b = (yyvsp[(3) - (4)].tree);
			  }
    break;

  case 145:
/* Line 1787 of yacc.c  */
#line 1075 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 146:
/* Line 1787 of yacc.c  */
#line 1079 "miniparser.y"
    {
			    (yyval.tree) = makeCompareEqual((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 147:
/* Line 1787 of yacc.c  */
#line 1083 "miniparser.y"
    {
			    (yyval.tree) = makeCompareIn((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 148:
/* Line 1787 of yacc.c  */
#line 1087 "miniparser.y"
    {
			    (yyval.tree) = makeCompareLess((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 149:
/* Line 1787 of yacc.c  */
#line 1091 "miniparser.y"
    {
			    (yyval.tree) = makeCompareGreater((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 150:
/* Line 1787 of yacc.c  */
#line 1095 "miniparser.y"
    {
			    (yyval.tree) = makeCompareLessEqual((yyvsp[(1) - (4)].tree), (yyvsp[(4) - (4)].tree));
			  }
    break;

  case 151:
/* Line 1787 of yacc.c  */
#line 1099 "miniparser.y"
    {
			    (yyval.tree) = makeCompareGreaterEqual((yyvsp[(1) - (4)].tree), (yyvsp[(4) - (4)].tree));
			  }
    break;

  case 152:
/* Line 1787 of yacc.c  */
#line 1103 "miniparser.y"
    {
			    (yyval.tree) = makeCompareNotEqual((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 153:
/* Line 1787 of yacc.c  */
#line 1109 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 154:
/* Line 1787 of yacc.c  */
#line 1113 "miniparser.y"
    {
			    (yyval.tree) = makeAdd((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 155:
/* Line 1787 of yacc.c  */
#line 1117 "miniparser.y"
    {
			    (yyval.tree) = makeSub((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 156:
/* Line 1787 of yacc.c  */
#line 1121 "miniparser.y"
    {
			    (yyval.tree) = makeConcat((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 157:
/* Line 1787 of yacc.c  */
#line 1125 "miniparser.y"
    {
			    (yyval.tree) = makeAddToList((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 158:
/* Line 1787 of yacc.c  */
#line 1129 "miniparser.y"
    {
			    (yyval.tree) = makeAppend((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 159:
/* Line 1787 of yacc.c  */
#line 1135 "miniparser.y"
    {
                            (yyval.count) = 0;
                          }
    break;

  case 160:
/* Line 1787 of yacc.c  */
#line 1139 "miniparser.y"
    {
                            (yyval.count) = 1;
                          }
    break;

  case 161:
/* Line 1787 of yacc.c  */
#line 1143 "miniparser.y"
    {
  	                    (yyval.count) = (yyvsp[(2) - (2)].count);
  	                  }
    break;

  case 162:
/* Line 1787 of yacc.c  */
#line 1147 "miniparser.y"
    {
  	                    (yyval.count) = (yyvsp[(2) - (2)].count)+1;
                          }
    break;

  case 163:
/* Line 1787 of yacc.c  */
#line 1154 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
                          }
    break;

  case 164:
/* Line 1787 of yacc.c  */
#line 1158 "miniparser.y"
    {
			    tempNode = (yyvsp[(2) - (2)].tree);
			    for (tempInteger=0;tempInteger<(yyvsp[(1) - (2)].count);tempInteger++)
			      tempNode = makeNeg(tempNode);
			    (yyval.tree) = tempNode;
			  }
    break;

  case 165:
/* Line 1787 of yacc.c  */
#line 1165 "miniparser.y"
    {
			    (yyval.tree) = makeEvalConst((yyvsp[(2) - (2)].tree));
                          }
    break;

  case 166:
/* Line 1787 of yacc.c  */
#line 1169 "miniparser.y"
    {
			    (yyval.tree) = makeMul((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
                          }
    break;

  case 167:
/* Line 1787 of yacc.c  */
#line 1173 "miniparser.y"
    {
			    (yyval.tree) = makeDiv((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
                          }
    break;

  case 168:
/* Line 1787 of yacc.c  */
#line 1177 "miniparser.y"
    {
			    tempNode = (yyvsp[(4) - (4)].tree);
			    for (tempInteger=0;tempInteger<(yyvsp[(3) - (4)].count);tempInteger++)
			      tempNode = makeNeg(tempNode);
			    (yyval.tree) = makeMul((yyvsp[(1) - (4)].tree), tempNode);
			  }
    break;

  case 169:
/* Line 1787 of yacc.c  */
#line 1184 "miniparser.y"
    {
			    tempNode = (yyvsp[(4) - (4)].tree);
			    for (tempInteger=0;tempInteger<(yyvsp[(3) - (4)].count);tempInteger++)
			      tempNode = makeNeg(tempNode);
			    (yyval.tree) = makeDiv((yyvsp[(1) - (4)].tree), tempNode);
			  }
    break;

  case 170:
/* Line 1787 of yacc.c  */
#line 1191 "miniparser.y"
    {
			    (yyval.tree) = makeMul((yyvsp[(1) - (4)].tree), makeEvalConst((yyvsp[(4) - (4)].tree)));
			  }
    break;

  case 171:
/* Line 1787 of yacc.c  */
#line 1195 "miniparser.y"
    {
			    (yyval.tree) = makeDiv((yyvsp[(1) - (4)].tree), makeEvalConst((yyvsp[(4) - (4)].tree)));
			  }
    break;

  case 172:
/* Line 1787 of yacc.c  */
#line 1201 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
                          }
    break;

  case 173:
/* Line 1787 of yacc.c  */
#line 1205 "miniparser.y"
    {
			    (yyval.tree) = makePow((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
                          }
    break;

  case 174:
/* Line 1787 of yacc.c  */
#line 1209 "miniparser.y"
    {
			    tempNode = (yyvsp[(4) - (4)].tree);
			    for (tempInteger=0;tempInteger<(yyvsp[(3) - (4)].count);tempInteger++)
			      tempNode = makeNeg(tempNode);
			    (yyval.tree) = makePow((yyvsp[(1) - (4)].tree), tempNode);
			  }
    break;

  case 175:
/* Line 1787 of yacc.c  */
#line 1216 "miniparser.y"
    {
			    (yyval.tree) = makePow((yyvsp[(1) - (4)].tree), makeEvalConst((yyvsp[(4) - (4)].tree)));
			  }
    break;

  case 176:
/* Line 1787 of yacc.c  */
#line 1220 "miniparser.y"
    {
			    (yyval.tree) = makePrepend((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 177:
/* Line 1787 of yacc.c  */
#line 1224 "miniparser.y"
    {
			    (yyval.tree) = makePrepend((yyvsp[(1) - (4)].tree), makeEvalConst((yyvsp[(4) - (4)].tree)));
			  }
    break;

  case 178:
/* Line 1787 of yacc.c  */
#line 1231 "miniparser.y"
    {
			    (yyval.tree) = makeOn();
			  }
    break;

  case 179:
/* Line 1787 of yacc.c  */
#line 1235 "miniparser.y"
    {
			    (yyval.tree) = makeOff();
			  }
    break;

  case 180:
/* Line 1787 of yacc.c  */
#line 1239 "miniparser.y"
    {
			    (yyval.tree) = makeDyadic();
			  }
    break;

  case 181:
/* Line 1787 of yacc.c  */
#line 1243 "miniparser.y"
    {
			    (yyval.tree) = makePowers();
			  }
    break;

  case 182:
/* Line 1787 of yacc.c  */
#line 1247 "miniparser.y"
    {
			    (yyval.tree) = makeBinaryThing();
			  }
    break;

  case 183:
/* Line 1787 of yacc.c  */
#line 1251 "miniparser.y"
    {
			    (yyval.tree) = makeHexadecimalThing();
			  }
    break;

  case 184:
/* Line 1787 of yacc.c  */
#line 1255 "miniparser.y"
    {
			    (yyval.tree) = makeFile();
			  }
    break;

  case 185:
/* Line 1787 of yacc.c  */
#line 1259 "miniparser.y"
    {
			    (yyval.tree) = makePostscript();
			  }
    break;

  case 186:
/* Line 1787 of yacc.c  */
#line 1263 "miniparser.y"
    {
			    (yyval.tree) = makePostscriptFile();
			  }
    break;

  case 187:
/* Line 1787 of yacc.c  */
#line 1267 "miniparser.y"
    {
			    (yyval.tree) = makePerturb();
			  }
    break;

  case 188:
/* Line 1787 of yacc.c  */
#line 1271 "miniparser.y"
    {
			    (yyval.tree) = makeRoundDown();
			  }
    break;

  case 189:
/* Line 1787 of yacc.c  */
#line 1275 "miniparser.y"
    {
			    (yyval.tree) = makeRoundUp();
			  }
    break;

  case 190:
/* Line 1787 of yacc.c  */
#line 1279 "miniparser.y"
    {
			    (yyval.tree) = makeRoundToZero();
			  }
    break;

  case 191:
/* Line 1787 of yacc.c  */
#line 1283 "miniparser.y"
    {
			    (yyval.tree) = makeRoundToNearest();
			  }
    break;

  case 192:
/* Line 1787 of yacc.c  */
#line 1287 "miniparser.y"
    {
			    (yyval.tree) = makeHonorCoeff();
			  }
    break;

  case 193:
/* Line 1787 of yacc.c  */
#line 1291 "miniparser.y"
    {
			    (yyval.tree) = makeTrue();
			  }
    break;

  case 194:
/* Line 1787 of yacc.c  */
#line 1295 "miniparser.y"
    {
			    (yyval.tree) = makeUnit();
			  }
    break;

  case 195:
/* Line 1787 of yacc.c  */
#line 1299 "miniparser.y"
    {
			    (yyval.tree) = makeFalse();
			  }
    break;

  case 196:
/* Line 1787 of yacc.c  */
#line 1303 "miniparser.y"
    {
			    (yyval.tree) = makeDefault();
			  }
    break;

  case 197:
/* Line 1787 of yacc.c  */
#line 1307 "miniparser.y"
    {
			    (yyval.tree) = makeDecimal();
			  }
    break;

  case 198:
/* Line 1787 of yacc.c  */
#line 1311 "miniparser.y"
    {
			    (yyval.tree) = makeAbsolute();
			  }
    break;

  case 199:
/* Line 1787 of yacc.c  */
#line 1315 "miniparser.y"
    {
			    (yyval.tree) = makeRelative();
			  }
    break;

  case 200:
/* Line 1787 of yacc.c  */
#line 1319 "miniparser.y"
    {
			    (yyval.tree) = makeFixed();
			  }
    break;

  case 201:
/* Line 1787 of yacc.c  */
#line 1323 "miniparser.y"
    {
			    (yyval.tree) = makeFloating();
			  }
    break;

  case 202:
/* Line 1787 of yacc.c  */
#line 1327 "miniparser.y"
    {
			    (yyval.tree) = makeError();
			  }
    break;

  case 203:
/* Line 1787 of yacc.c  */
#line 1331 "miniparser.y"
    {
			    (yyval.tree) = makeDoubleSymbol();
			  }
    break;

  case 204:
/* Line 1787 of yacc.c  */
#line 1335 "miniparser.y"
    {
			    (yyval.tree) = makeSingleSymbol();
			  }
    break;

  case 205:
/* Line 1787 of yacc.c  */
#line 1339 "miniparser.y"
    {
			    (yyval.tree) = makeQuadSymbol();
			  }
    break;

  case 206:
/* Line 1787 of yacc.c  */
#line 1343 "miniparser.y"
    {
			    (yyval.tree) = makeHalfPrecisionSymbol();
			  }
    break;

  case 207:
/* Line 1787 of yacc.c  */
#line 1347 "miniparser.y"
    {
			    (yyval.tree) = makeDoubleextendedSymbol();
			  }
    break;

  case 208:
/* Line 1787 of yacc.c  */
#line 1351 "miniparser.y"
    {
			    (yyval.tree) = makeVariable();
			  }
    break;

  case 209:
/* Line 1787 of yacc.c  */
#line 1355 "miniparser.y"
    {
			    (yyval.tree) = makeDoubleDoubleSymbol();
			  }
    break;

  case 210:
/* Line 1787 of yacc.c  */
#line 1359 "miniparser.y"
    {
			    (yyval.tree) = makeTripleDoubleSymbol();
			  }
    break;

  case 211:
/* Line 1787 of yacc.c  */
#line 1363 "miniparser.y"
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

  case 212:
/* Line 1787 of yacc.c  */
#line 1374 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 213:
/* Line 1787 of yacc.c  */
#line 1378 "miniparser.y"
    {
			    (yyval.tree) = makeTableAccess((yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 214:
/* Line 1787 of yacc.c  */
#line 1383 "miniparser.y"
    {
			    (yyval.tree) = makeIsBound((yyvsp[(3) - (4)].value));
			    safeFree((yyvsp[(3) - (4)].value));
			  }
    break;

  case 215:
/* Line 1787 of yacc.c  */
#line 1388 "miniparser.y"
    {
			    (yyval.tree) = makeTableAccessWithSubstitute((yyvsp[(1) - (4)].value), (yyvsp[(3) - (4)].list));
			    safeFree((yyvsp[(1) - (4)].value));
			  }
    break;

  case 216:
/* Line 1787 of yacc.c  */
#line 1393 "miniparser.y"
    {
			    (yyval.tree) = makeTableAccessWithSubstitute((yyvsp[(1) - (3)].value), NULL);
			    safeFree((yyvsp[(1) - (3)].value));
			  }
    break;

  case 217:
/* Line 1787 of yacc.c  */
#line 1398 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 218:
/* Line 1787 of yacc.c  */
#line 1402 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 219:
/* Line 1787 of yacc.c  */
#line 1406 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 220:
/* Line 1787 of yacc.c  */
#line 1410 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 221:
/* Line 1787 of yacc.c  */
#line 1414 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(2) - (3)].tree);
			  }
    break;

  case 222:
/* Line 1787 of yacc.c  */
#line 1418 "miniparser.y"
    {
			    (yyval.tree) = makeStructure((yyvsp[(2) - (3)].list));
			  }
    break;

  case 223:
/* Line 1787 of yacc.c  */
#line 1422 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(1) - (1)].tree);
			  }
    break;

  case 224:
/* Line 1787 of yacc.c  */
#line 1426 "miniparser.y"
    {
			    (yyval.tree) = makeIndex((yyvsp[(1) - (1)].dblnode)->a, (yyvsp[(1) - (1)].dblnode)->b);
			    safeFree((yyvsp[(1) - (1)].dblnode));
			  }
    break;

  case 225:
/* Line 1787 of yacc.c  */
#line 1431 "miniparser.y"
    {
			    (yyval.tree) = makeStructAccess((yyvsp[(1) - (3)].tree),(yyvsp[(3) - (3)].value));
			    safeFree((yyvsp[(3) - (3)].value));
			  }
    break;

  case 226:
/* Line 1787 of yacc.c  */
#line 1436 "miniparser.y"
    {
			    (yyval.tree) = makeApply(makeStructAccess((yyvsp[(1) - (6)].tree),(yyvsp[(3) - (6)].value)),(yyvsp[(5) - (6)].list));
			    safeFree((yyvsp[(3) - (6)].value));
			  }
    break;

  case 227:
/* Line 1787 of yacc.c  */
#line 1441 "miniparser.y"
    {
			    (yyval.tree) = makeApply((yyvsp[(2) - (6)].tree),(yyvsp[(5) - (6)].list));
			  }
    break;

  case 228:
/* Line 1787 of yacc.c  */
#line 1445 "miniparser.y"
    {
			    (yyval.tree) = makeApply((yyvsp[(2) - (5)].tree),addElement(NULL,makeUnit()));
			  }
    break;

  case 229:
/* Line 1787 of yacc.c  */
#line 1449 "miniparser.y"
    {
			    (yyval.tree) = (yyvsp[(2) - (2)].tree);
			  }
    break;

  case 230:
/* Line 1787 of yacc.c  */
#line 1453 "miniparser.y"
    {
			    (yyval.tree) = makeTime((yyvsp[(3) - (4)].tree));
                          }
    break;

  case 231:
/* Line 1787 of yacc.c  */
#line 1459 "miniparser.y"
    {
			    (yyval.list) = addElement(NULL,(yyvsp[(1) - (1)].tree));
			  }
    break;

  case 232:
/* Line 1787 of yacc.c  */
#line 1463 "miniparser.y"
    {
			    (yyval.list) = addElement((yyvsp[(2) - (2)].list),(yyvsp[(1) - (2)].tree));
			  }
    break;

  case 233:
/* Line 1787 of yacc.c  */
#line 1469 "miniparser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (9)].tree),makeCommandList(concatChains((yyvsp[(4) - (9)].list), (yyvsp[(5) - (9)].list))),(yyvsp[(7) - (9)].tree));
			  }
    break;

  case 234:
/* Line 1787 of yacc.c  */
#line 1473 "miniparser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (6)].tree),makeCommandList(concatChains((yyvsp[(4) - (6)].list), (yyvsp[(5) - (6)].list))),makeUnit());
			  }
    break;

  case 235:
/* Line 1787 of yacc.c  */
#line 1477 "miniparser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (8)].tree),makeCommandList((yyvsp[(4) - (8)].list)),(yyvsp[(6) - (8)].tree));
			  }
    break;

  case 236:
/* Line 1787 of yacc.c  */
#line 1481 "miniparser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (5)].tree),makeCommandList((yyvsp[(4) - (5)].list)),makeUnit());
			  }
    break;

  case 237:
/* Line 1787 of yacc.c  */
#line 1485 "miniparser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (8)].tree),makeCommandList((yyvsp[(4) - (8)].list)),(yyvsp[(6) - (8)].tree));
			  }
    break;

  case 238:
/* Line 1787 of yacc.c  */
#line 1489 "miniparser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (5)].tree),makeCommandList((yyvsp[(4) - (5)].list)),makeUnit());
			  }
    break;

  case 239:
/* Line 1787 of yacc.c  */
#line 1493 "miniparser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (7)].tree), makeCommandList(addElement(NULL,makeNop())), (yyvsp[(5) - (7)].tree));
			  }
    break;

  case 240:
/* Line 1787 of yacc.c  */
#line 1497 "miniparser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (4)].tree), makeCommandList(addElement(NULL,makeNop())), makeUnit());
			  }
    break;

  case 241:
/* Line 1787 of yacc.c  */
#line 1501 "miniparser.y"
    {
			    (yyval.tree) = makeMatchElement((yyvsp[(1) - (5)].tree), makeCommandList(addElement(NULL,makeNop())), (yyvsp[(4) - (5)].tree));
			  }
    break;

  case 242:
/* Line 1787 of yacc.c  */
#line 1507 "miniparser.y"
    {
			    (yyval.tree) = makeDecimalConstant((yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 243:
/* Line 1787 of yacc.c  */
#line 1512 "miniparser.y"
    {
			    (yyval.tree) = makeMidpointConstant((yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 244:
/* Line 1787 of yacc.c  */
#line 1517 "miniparser.y"
    {
			    (yyval.tree) = makeDyadicConstant((yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 245:
/* Line 1787 of yacc.c  */
#line 1522 "miniparser.y"
    {
			    (yyval.tree) = makeHexConstant((yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 246:
/* Line 1787 of yacc.c  */
#line 1527 "miniparser.y"
    {
			    (yyval.tree) = makeHexadecimalConstant((yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 247:
/* Line 1787 of yacc.c  */
#line 1532 "miniparser.y"
    {
			    (yyval.tree) = makeBinaryConstant((yyvsp[(1) - (1)].value));
			    safeFree((yyvsp[(1) - (1)].value));
			  }
    break;

  case 248:
/* Line 1787 of yacc.c  */
#line 1537 "miniparser.y"
    {
			    (yyval.tree) = makePi();
			  }
    break;

  case 249:
/* Line 1787 of yacc.c  */
#line 1545 "miniparser.y"
    {
			    (yyval.tree) = makeEmptyList();
			  }
    break;

  case 250:
/* Line 1787 of yacc.c  */
#line 1549 "miniparser.y"
    {
			    (yyval.tree) = makeEmptyList();
			  }
    break;

  case 251:
/* Line 1787 of yacc.c  */
#line 1553 "miniparser.y"
    {
			    (yyval.tree) = makeRevertedList((yyvsp[(3) - (5)].list));
			  }
    break;

  case 252:
/* Line 1787 of yacc.c  */
#line 1557 "miniparser.y"
    {
			    (yyval.tree) = makeRevertedFinalEllipticList((yyvsp[(3) - (6)].list));
			  }
    break;

  case 253:
/* Line 1787 of yacc.c  */
#line 1563 "miniparser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (1)].tree));
			  }
    break;

  case 254:
/* Line 1787 of yacc.c  */
#line 1567 "miniparser.y"
    {
			    (yyval.list) = addElement((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].tree));
			  }
    break;

  case 255:
/* Line 1787 of yacc.c  */
#line 1571 "miniparser.y"
    {
			    (yyval.list) = addElement(addElement((yyvsp[(1) - (5)].list), makeElliptic()), (yyvsp[(5) - (5)].tree));
			  }
    break;

  case 256:
/* Line 1787 of yacc.c  */
#line 1577 "miniparser.y"
    {
			    (yyval.tree) = makeRange((yyvsp[(2) - (5)].tree), (yyvsp[(4) - (5)].tree));
			  }
    break;

  case 257:
/* Line 1787 of yacc.c  */
#line 1581 "miniparser.y"
    {
			    (yyval.tree) = makeRange((yyvsp[(2) - (5)].tree), (yyvsp[(4) - (5)].tree));
			  }
    break;

  case 258:
/* Line 1787 of yacc.c  */
#line 1585 "miniparser.y"
    {
			    (yyval.tree) = makeRange((yyvsp[(2) - (3)].tree), copyThing((yyvsp[(2) - (3)].tree)));
			  }
    break;

  case 259:
/* Line 1787 of yacc.c  */
#line 1591 "miniparser.y"
    {
			    (yyval.tree) = makeDeboundMax((yyvsp[(2) - (3)].tree));
			  }
    break;

  case 260:
/* Line 1787 of yacc.c  */
#line 1595 "miniparser.y"
    {
			    (yyval.tree) = makeDeboundMid((yyvsp[(2) - (3)].tree));
			  }
    break;

  case 261:
/* Line 1787 of yacc.c  */
#line 1599 "miniparser.y"
    {
			    (yyval.tree) = makeDeboundMin((yyvsp[(2) - (3)].tree));
			  }
    break;

  case 262:
/* Line 1787 of yacc.c  */
#line 1603 "miniparser.y"
    {
			    (yyval.tree) = makeDeboundMax((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 263:
/* Line 1787 of yacc.c  */
#line 1607 "miniparser.y"
    {
			    (yyval.tree) = makeDeboundMid((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 264:
/* Line 1787 of yacc.c  */
#line 1611 "miniparser.y"
    {
			    (yyval.tree) = makeDeboundMin((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 265:
/* Line 1787 of yacc.c  */
#line 1617 "miniparser.y"
    {
			    (yyval.tree) = makeDiff((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 266:
/* Line 1787 of yacc.c  */
#line 1621 "miniparser.y"
    {
			    (yyval.tree) = makeBashevaluate(addElement(NULL,(yyvsp[(3) - (4)].tree)));
			  }
    break;

  case 267:
/* Line 1787 of yacc.c  */
#line 1625 "miniparser.y"
    {
			    (yyval.tree) = makeGetSuppressedMessages();
			  }
    break;

  case 268:
/* Line 1787 of yacc.c  */
#line 1629 "miniparser.y"
    {
			    (yyval.tree) = makeBashevaluate(addElement(addElement(NULL,(yyvsp[(5) - (6)].tree)),(yyvsp[(3) - (6)].tree)));
			  }
    break;

  case 269:
/* Line 1787 of yacc.c  */
#line 1633 "miniparser.y"
    {
			    (yyval.tree) = makeDirtysimplify((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 270:
/* Line 1787 of yacc.c  */
#line 1637 "miniparser.y"
    {
			    (yyval.tree) = makeRemez(addElement(addElement((yyvsp[(7) - (8)].list), (yyvsp[(5) - (8)].tree)), (yyvsp[(3) - (8)].tree)));
			  }
    break;

  case 271:
/* Line 1787 of yacc.c  */
#line 1641 "miniparser.y"
    {
			    (yyval.tree) = makeBind((yyvsp[(3) - (8)].tree), (yyvsp[(5) - (8)].value), (yyvsp[(7) - (8)].tree));
			    safeFree((yyvsp[(5) - (8)].value));
			  }
    break;

  case 272:
/* Line 1787 of yacc.c  */
#line 1646 "miniparser.y"
    {
			    (yyval.tree) = makeMin((yyvsp[(3) - (4)].list));
			  }
    break;

  case 273:
/* Line 1787 of yacc.c  */
#line 1650 "miniparser.y"
    {
			    (yyval.tree) = makeMax((yyvsp[(3) - (4)].list));
			  }
    break;

  case 274:
/* Line 1787 of yacc.c  */
#line 1654 "miniparser.y"
    {
			    (yyval.tree) = makeFPminimax(addElement(addElement(addElement((yyvsp[(9) - (10)].list), (yyvsp[(7) - (10)].tree)), (yyvsp[(5) - (10)].tree)), (yyvsp[(3) - (10)].tree)));
			  }
    break;

  case 275:
/* Line 1787 of yacc.c  */
#line 1658 "miniparser.y"
    {
			    (yyval.tree) = makeHorner((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 276:
/* Line 1787 of yacc.c  */
#line 1662 "miniparser.y"
    {
			    (yyval.tree) = makeCanonicalThing((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 277:
/* Line 1787 of yacc.c  */
#line 1666 "miniparser.y"
    {
			    (yyval.tree) = makeExpand((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 278:
/* Line 1787 of yacc.c  */
#line 1670 "miniparser.y"
    {
			    (yyval.tree) = makeSimplifySafe((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 279:
/* Line 1787 of yacc.c  */
#line 1674 "miniparser.y"
    {
			    (yyval.tree) = makeTaylor((yyvsp[(3) - (8)].tree), (yyvsp[(5) - (8)].tree), (yyvsp[(7) - (8)].tree));
			  }
    break;

  case 280:
/* Line 1787 of yacc.c  */
#line 1678 "miniparser.y"
    {
                            (yyval.tree) = makeTaylorform(addElement(addElement((yyvsp[(7) - (8)].list), (yyvsp[(5) - (8)].tree)), (yyvsp[(3) - (8)].tree)));
			  }
    break;

  case 281:
/* Line 1787 of yacc.c  */
#line 1682 "miniparser.y"
    {
                            (yyval.tree) = makeChebyshevform(addElement(addElement(addElement(NULL, (yyvsp[(7) - (8)].tree)), (yyvsp[(5) - (8)].tree)), (yyvsp[(3) - (8)].tree)));
			  }
    break;

  case 282:
/* Line 1787 of yacc.c  */
#line 1686 "miniparser.y"
    {
                            (yyval.tree) = makeAutodiff(addElement(addElement(addElement(NULL, (yyvsp[(7) - (8)].tree)), (yyvsp[(5) - (8)].tree)), (yyvsp[(3) - (8)].tree)));
			  }
    break;

  case 283:
/* Line 1787 of yacc.c  */
#line 1690 "miniparser.y"
    {
			    (yyval.tree) = makeDegree((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 284:
/* Line 1787 of yacc.c  */
#line 1694 "miniparser.y"
    {
			    (yyval.tree) = makeNumerator((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 285:
/* Line 1787 of yacc.c  */
#line 1698 "miniparser.y"
    {
			    (yyval.tree) = makeDenominator((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 286:
/* Line 1787 of yacc.c  */
#line 1702 "miniparser.y"
    {
			    (yyval.tree) = makeSubstitute((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 287:
/* Line 1787 of yacc.c  */
#line 1706 "miniparser.y"
    {
			    (yyval.tree) = makeComposePolynomials((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 288:
/* Line 1787 of yacc.c  */
#line 1710 "miniparser.y"
    {
			    (yyval.tree) = makeCoeff((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 289:
/* Line 1787 of yacc.c  */
#line 1714 "miniparser.y"
    {
			    (yyval.tree) = makeSubpoly((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 290:
/* Line 1787 of yacc.c  */
#line 1718 "miniparser.y"
    {
			    (yyval.tree) = makeRoundcoefficients((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 291:
/* Line 1787 of yacc.c  */
#line 1722 "miniparser.y"
    {
			    (yyval.tree) = makeRationalapprox((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 292:
/* Line 1787 of yacc.c  */
#line 1726 "miniparser.y"
    {
			    (yyval.tree) = makeAccurateInfnorm(addElement(addElement((yyvsp[(7) - (8)].list), (yyvsp[(5) - (8)].tree)), (yyvsp[(3) - (8)].tree)));
			  }
    break;

  case 293:
/* Line 1787 of yacc.c  */
#line 1730 "miniparser.y"
    {
			    (yyval.tree) = makeRoundToFormat((yyvsp[(3) - (8)].tree), (yyvsp[(5) - (8)].tree), (yyvsp[(7) - (8)].tree));
			  }
    break;

  case 294:
/* Line 1787 of yacc.c  */
#line 1734 "miniparser.y"
    {
			    (yyval.tree) = makeEvaluate((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 295:
/* Line 1787 of yacc.c  */
#line 1738 "miniparser.y"
    {
			    (yyval.tree) = makeParse((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 296:
/* Line 1787 of yacc.c  */
#line 1742 "miniparser.y"
    {
			    (yyval.tree) = makeReadXml((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 297:
/* Line 1787 of yacc.c  */
#line 1746 "miniparser.y"
    {
			    (yyval.tree) = makeInfnorm(addElement((yyvsp[(5) - (6)].list), (yyvsp[(3) - (6)].tree)));
			  }
    break;

  case 298:
/* Line 1787 of yacc.c  */
#line 1750 "miniparser.y"
    {
			    (yyval.tree) = makeSupnorm(addElement(addElement(addElement(addElement(addElement(NULL,(yyvsp[(11) - (12)].tree)),(yyvsp[(9) - (12)].tree)),(yyvsp[(7) - (12)].tree)),(yyvsp[(5) - (12)].tree)),(yyvsp[(3) - (12)].tree)));
			  }
    break;

  case 299:
/* Line 1787 of yacc.c  */
#line 1754 "miniparser.y"
    {
			    (yyval.tree) = makeFindZeros((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 300:
/* Line 1787 of yacc.c  */
#line 1758 "miniparser.y"
    {
			    (yyval.tree) = makeFPFindZeros((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 301:
/* Line 1787 of yacc.c  */
#line 1762 "miniparser.y"
    {
			    (yyval.tree) = makeDirtyInfnorm((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 302:
/* Line 1787 of yacc.c  */
#line 1766 "miniparser.y"
    {
			    (yyval.tree) = makeNumberRoots((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 303:
/* Line 1787 of yacc.c  */
#line 1770 "miniparser.y"
    {
			    (yyval.tree) = makeIntegral((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 304:
/* Line 1787 of yacc.c  */
#line 1774 "miniparser.y"
    {
			    (yyval.tree) = makeDirtyIntegral((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 305:
/* Line 1787 of yacc.c  */
#line 1778 "miniparser.y"
    {
			    (yyval.tree) = makeImplementPoly(addElement(addElement(addElement(addElement(addElement((yyvsp[(13) - (14)].list), (yyvsp[(11) - (14)].tree)), (yyvsp[(9) - (14)].tree)), (yyvsp[(7) - (14)].tree)), (yyvsp[(5) - (14)].tree)), (yyvsp[(3) - (14)].tree)));
			  }
    break;

  case 306:
/* Line 1787 of yacc.c  */
#line 1782 "miniparser.y"
    {
			    (yyval.tree) = makeImplementConst((yyvsp[(3) - (4)].list));
			  }
    break;

  case 307:
/* Line 1787 of yacc.c  */
#line 1786 "miniparser.y"
    {
			    (yyval.tree) = makeCheckInfnorm((yyvsp[(3) - (8)].tree), (yyvsp[(5) - (8)].tree), (yyvsp[(7) - (8)].tree));
			  }
    break;

  case 308:
/* Line 1787 of yacc.c  */
#line 1790 "miniparser.y"
    {
			    (yyval.tree) = makeZeroDenominators((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 309:
/* Line 1787 of yacc.c  */
#line 1794 "miniparser.y"
    {
			    (yyval.tree) = makeIsEvaluable((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 310:
/* Line 1787 of yacc.c  */
#line 1798 "miniparser.y"
    {
			    (yyval.tree) = makeSearchGal((yyvsp[(3) - (4)].list));
			  }
    break;

  case 311:
/* Line 1787 of yacc.c  */
#line 1802 "miniparser.y"
    {
			    (yyval.tree) = makeGuessDegree(addElement(addElement((yyvsp[(7) - (8)].list), (yyvsp[(5) - (8)].tree)), (yyvsp[(3) - (8)].tree)));
			  }
    break;

  case 312:
/* Line 1787 of yacc.c  */
#line 1806 "miniparser.y"
    {
			    (yyval.tree) = makeDirtyFindZeros((yyvsp[(3) - (6)].tree), (yyvsp[(5) - (6)].tree));
			  }
    break;

  case 313:
/* Line 1787 of yacc.c  */
#line 1810 "miniparser.y"
    {
			    (yyval.tree) = makeHead((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 314:
/* Line 1787 of yacc.c  */
#line 1814 "miniparser.y"
    {
			    (yyval.tree) = makeRoundCorrectly((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 315:
/* Line 1787 of yacc.c  */
#line 1818 "miniparser.y"
    {
			    (yyval.tree) = makeReadFile((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 316:
/* Line 1787 of yacc.c  */
#line 1822 "miniparser.y"
    {
			    (yyval.tree) = makeRevert((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 317:
/* Line 1787 of yacc.c  */
#line 1826 "miniparser.y"
    {
			    (yyval.tree) = makeSort((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 318:
/* Line 1787 of yacc.c  */
#line 1830 "miniparser.y"
    {
			    (yyval.tree) = makeMantissa((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 319:
/* Line 1787 of yacc.c  */
#line 1834 "miniparser.y"
    {
			    (yyval.tree) = makeExponent((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 320:
/* Line 1787 of yacc.c  */
#line 1838 "miniparser.y"
    {
			    (yyval.tree) = makePrecision((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 321:
/* Line 1787 of yacc.c  */
#line 1842 "miniparser.y"
    {
			    (yyval.tree) = makeTail((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 322:
/* Line 1787 of yacc.c  */
#line 1846 "miniparser.y"
    {
			    (yyval.tree) = makeSqrt((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 323:
/* Line 1787 of yacc.c  */
#line 1850 "miniparser.y"
    {
			    (yyval.tree) = makeExp((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 324:
/* Line 1787 of yacc.c  */
#line 1854 "miniparser.y"
    {
			    (yyval.tree) = makeApply(makeVariable(),addElement(NULL,(yyvsp[(3) - (4)].tree)));
			  }
    break;

  case 325:
/* Line 1787 of yacc.c  */
#line 1858 "miniparser.y"
    {
			    (yyval.tree) = makeProcedureFunction((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 326:
/* Line 1787 of yacc.c  */
#line 1862 "miniparser.y"
    {
			    (yyval.tree) = makeSubstitute(makeProcedureFunction((yyvsp[(3) - (6)].tree)),(yyvsp[(5) - (6)].tree));
			  }
    break;

  case 327:
/* Line 1787 of yacc.c  */
#line 1866 "miniparser.y"
    {
			    (yyval.tree) = makeLog((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 328:
/* Line 1787 of yacc.c  */
#line 1870 "miniparser.y"
    {
			    (yyval.tree) = makeLog2((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 329:
/* Line 1787 of yacc.c  */
#line 1874 "miniparser.y"
    {
			    (yyval.tree) = makeLog10((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 330:
/* Line 1787 of yacc.c  */
#line 1878 "miniparser.y"
    {
			    (yyval.tree) = makeSin((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 331:
/* Line 1787 of yacc.c  */
#line 1882 "miniparser.y"
    {
			    (yyval.tree) = makeCos((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 332:
/* Line 1787 of yacc.c  */
#line 1886 "miniparser.y"
    {
			    (yyval.tree) = makeTan((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 333:
/* Line 1787 of yacc.c  */
#line 1890 "miniparser.y"
    {
			    (yyval.tree) = makeAsin((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 334:
/* Line 1787 of yacc.c  */
#line 1894 "miniparser.y"
    {
			    (yyval.tree) = makeAcos((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 335:
/* Line 1787 of yacc.c  */
#line 1898 "miniparser.y"
    {
			    (yyval.tree) = makeAtan((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 336:
/* Line 1787 of yacc.c  */
#line 1902 "miniparser.y"
    {
			    (yyval.tree) = makeSinh((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 337:
/* Line 1787 of yacc.c  */
#line 1906 "miniparser.y"
    {
			    (yyval.tree) = makeCosh((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 338:
/* Line 1787 of yacc.c  */
#line 1910 "miniparser.y"
    {
			    (yyval.tree) = makeTanh((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 339:
/* Line 1787 of yacc.c  */
#line 1914 "miniparser.y"
    {
			    (yyval.tree) = makeAsinh((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 340:
/* Line 1787 of yacc.c  */
#line 1918 "miniparser.y"
    {
			    (yyval.tree) = makeAcosh((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 341:
/* Line 1787 of yacc.c  */
#line 1922 "miniparser.y"
    {
			    (yyval.tree) = makeAtanh((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 342:
/* Line 1787 of yacc.c  */
#line 1926 "miniparser.y"
    {
			    (yyval.tree) = makeAbs((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 343:
/* Line 1787 of yacc.c  */
#line 1930 "miniparser.y"
    {
			    (yyval.tree) = makeErf((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 344:
/* Line 1787 of yacc.c  */
#line 1934 "miniparser.y"
    {
			    (yyval.tree) = makeErfc((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 345:
/* Line 1787 of yacc.c  */
#line 1938 "miniparser.y"
    {
			    (yyval.tree) = makeLog1p((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 346:
/* Line 1787 of yacc.c  */
#line 1942 "miniparser.y"
    {
			    (yyval.tree) = makeExpm1((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 347:
/* Line 1787 of yacc.c  */
#line 1946 "miniparser.y"
    {
			    (yyval.tree) = makeDouble((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 348:
/* Line 1787 of yacc.c  */
#line 1950 "miniparser.y"
    {
			    (yyval.tree) = makeSingle((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 349:
/* Line 1787 of yacc.c  */
#line 1954 "miniparser.y"
    {
			    (yyval.tree) = makeQuad((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 350:
/* Line 1787 of yacc.c  */
#line 1958 "miniparser.y"
    {
			    (yyval.tree) = makeHalfPrecision((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 351:
/* Line 1787 of yacc.c  */
#line 1962 "miniparser.y"
    {
			    (yyval.tree) = makeDoubledouble((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 352:
/* Line 1787 of yacc.c  */
#line 1966 "miniparser.y"
    {
			    (yyval.tree) = makeTripledouble((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 353:
/* Line 1787 of yacc.c  */
#line 1970 "miniparser.y"
    {
			    (yyval.tree) = makeDoubleextended((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 354:
/* Line 1787 of yacc.c  */
#line 1974 "miniparser.y"
    {
			    (yyval.tree) = makeCeil((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 355:
/* Line 1787 of yacc.c  */
#line 1978 "miniparser.y"
    {
			    (yyval.tree) = makeFloor((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 356:
/* Line 1787 of yacc.c  */
#line 1982 "miniparser.y"
    {
			    (yyval.tree) = makeNearestInt((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 357:
/* Line 1787 of yacc.c  */
#line 1986 "miniparser.y"
    {
			    (yyval.tree) = makeLength((yyvsp[(3) - (4)].tree));
			  }
    break;

  case 358:
/* Line 1787 of yacc.c  */
#line 1992 "miniparser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 359:
/* Line 1787 of yacc.c  */
#line 1996 "miniparser.y"
    {
			    (yyval.other) = NULL;
			  }
    break;

  case 360:
/* Line 1787 of yacc.c  */
#line 2003 "miniparser.y"
    {
			    (yyval.tree) = makePrecDeref();
			  }
    break;

  case 361:
/* Line 1787 of yacc.c  */
#line 2007 "miniparser.y"
    {
			    (yyval.tree) = makePointsDeref();
			  }
    break;

  case 362:
/* Line 1787 of yacc.c  */
#line 2011 "miniparser.y"
    {
			    (yyval.tree) = makeDiamDeref();
			  }
    break;

  case 363:
/* Line 1787 of yacc.c  */
#line 2015 "miniparser.y"
    {
			    (yyval.tree) = makeDisplayDeref();
			  }
    break;

  case 364:
/* Line 1787 of yacc.c  */
#line 2019 "miniparser.y"
    {
			    (yyval.tree) = makeVerbosityDeref();
			  }
    break;

  case 365:
/* Line 1787 of yacc.c  */
#line 2023 "miniparser.y"
    {
			    (yyval.tree) = makeShowMessageNumbersDeref();
			  }
    break;

  case 366:
/* Line 1787 of yacc.c  */
#line 2027 "miniparser.y"
    {
			    (yyval.tree) = makeCanonicalDeref();
			  }
    break;

  case 367:
/* Line 1787 of yacc.c  */
#line 2031 "miniparser.y"
    {
			    (yyval.tree) = makeAutoSimplifyDeref();
			  }
    break;

  case 368:
/* Line 1787 of yacc.c  */
#line 2035 "miniparser.y"
    {
			    (yyval.tree) = makeTaylorRecursDeref();
			  }
    break;

  case 369:
/* Line 1787 of yacc.c  */
#line 2039 "miniparser.y"
    {
			    (yyval.tree) = makeTimingDeref();
			  }
    break;

  case 370:
/* Line 1787 of yacc.c  */
#line 2043 "miniparser.y"
    {
			    (yyval.tree) = makeFullParenDeref();
			  }
    break;

  case 371:
/* Line 1787 of yacc.c  */
#line 2047 "miniparser.y"
    {
			    (yyval.tree) = makeMidpointDeref();
			  }
    break;

  case 372:
/* Line 1787 of yacc.c  */
#line 2051 "miniparser.y"
    {
			    (yyval.tree) = makeDieOnErrorDeref();
			  }
    break;

  case 373:
/* Line 1787 of yacc.c  */
#line 2055 "miniparser.y"
    {
			    (yyval.tree) = makeRationalModeDeref();
			  }
    break;

  case 374:
/* Line 1787 of yacc.c  */
#line 2059 "miniparser.y"
    {
			    (yyval.tree) = makeSuppressWarningsDeref();
			  }
    break;

  case 375:
/* Line 1787 of yacc.c  */
#line 2063 "miniparser.y"
    {
			    (yyval.tree) = makeHopitalRecursDeref();
			  }
    break;

  case 376:
/* Line 1787 of yacc.c  */
#line 2070 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = CONSTANT_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 377:
/* Line 1787 of yacc.c  */
#line 2076 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = FUNCTION_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 378:
/* Line 1787 of yacc.c  */
#line 2082 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = OBJECT_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 379:
/* Line 1787 of yacc.c  */
#line 2088 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = RANGE_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 380:
/* Line 1787 of yacc.c  */
#line 2094 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = INTEGER_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 381:
/* Line 1787 of yacc.c  */
#line 2100 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = STRING_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 382:
/* Line 1787 of yacc.c  */
#line 2106 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = BOOLEAN_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 383:
/* Line 1787 of yacc.c  */
#line 2112 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = CONSTANT_LIST_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 384:
/* Line 1787 of yacc.c  */
#line 2118 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = FUNCTION_LIST_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 385:
/* Line 1787 of yacc.c  */
#line 2124 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = OBJECT_LIST_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 386:
/* Line 1787 of yacc.c  */
#line 2130 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = RANGE_LIST_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 387:
/* Line 1787 of yacc.c  */
#line 2136 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = INTEGER_LIST_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 388:
/* Line 1787 of yacc.c  */
#line 2142 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = STRING_LIST_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 389:
/* Line 1787 of yacc.c  */
#line 2148 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = BOOLEAN_LIST_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 390:
/* Line 1787 of yacc.c  */
#line 2156 "miniparser.y"
    {
			    tempIntPtr = (int *) safeMalloc(sizeof(int));
			    *tempIntPtr = VOID_TYPE;
			    (yyval.integerval) = tempIntPtr;
			  }
    break;

  case 391:
/* Line 1787 of yacc.c  */
#line 2162 "miniparser.y"
    {
			    (yyval.integerval) = (yyvsp[(1) - (1)].integerval);
		          }
    break;

  case 392:
/* Line 1787 of yacc.c  */
#line 2169 "miniparser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (1)].integerval));
			  }
    break;

  case 393:
/* Line 1787 of yacc.c  */
#line 2173 "miniparser.y"
    {
			    (yyval.list) = addElement((yyvsp[(3) - (3)].list), (yyvsp[(1) - (3)].integerval));
			  }
    break;

  case 394:
/* Line 1787 of yacc.c  */
#line 2179 "miniparser.y"
    {
			    (yyval.list) = addElement(NULL, (yyvsp[(1) - (1)].integerval));
			  }
    break;

  case 395:
/* Line 1787 of yacc.c  */
#line 2183 "miniparser.y"
    {
			    (yyval.list) = (yyvsp[(2) - (3)].list);
			  }
    break;


/* Line 1787 of yacc.c  */
#line 7560 "miniparser.c"
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
      yyerror (myScanner, YY_("syntax error"));
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
        yyerror (myScanner, yymsgp);
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
		      yytoken, &yylval, myScanner);
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
		  yystos[yystate], yyvsp, myScanner);
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
  yyerror (myScanner, YY_("memory exhausted"));
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
                  yytoken, &yylval, myScanner);
    }
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp, myScanner);
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


