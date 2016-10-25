/* A Bison parser, made by GNU Bison 2.7.12-4996.  */

/* Bison interface for Yacc-like parsers in C
   
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

#ifndef YY_INTERNYY_INTERNPARSER_H_INCLUDED
# define YY_INTERNYY_INTERNPARSER_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int internyydebug;
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
/* Line 2053 of yacc.c  */
#line 111 "internparser.y"

  doubleNode *dblnode;
  struct entryStruct *association;
  char *value;
  node *tree;
  chain *list;
  int *integerval;
  int count;
  void *other;


/* Line 2053 of yacc.c  */
#line 533 "internparser.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int internyyparse (void *YYPARSE_PARAM);
#else
int internyyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int internyyparse (void *myScanner);
#else
int internyyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_INTERNYY_INTERNPARSER_H_INCLUDED  */
