# Makefile for flopoco/src/FPExpressions

ACLOCAL_AMFLAGS = -I ../../m4

BUILT_SOURCES = FlopocoScanner.h ExpressionScanner.cpp ExpressionParser.cpp ExpressionParser.h
CLEANFILES = $(BUILT_SOURCES) lex.yy.c *.output

noinst_LTLIBRARIES = libFPExpressions.la

noinst_HEADERS = ExpressionParserData.h

libFPExpressions_la_SOURCES = ExpressionParserData.cpp ExpressionScanner.cpp ExpressionParser.cpp

ExpressionParser.cpp: $(top_srcdir)/src/FPExpressions/ExpressionParser.y ExpressionScanner.cpp
	${YACC} -y -d --defines=$(top_builddir)/src/FPExpressions/ExpressionParser.h --output=$(top_builddir)/src/FPExpressions/ExpressionParser.cpp --name-prefix=FlopocoExpression $(top_srcdir)/src/FPExpressions/ExpressionParser.y

ExpressionScanner.cpp:$(top_srcdir)/src/FPExpressions/ExpressionScanner.l
	${LEX} --prefix=FlopocoExpression --header-file=$(top_builddir)/src/FPExpressions/FlopocoScanner.h -o $(top_builddir)/src/FPExpressions/ExpressionScanner.cpp  $(top_srcdir)/src/FPExpressions/ExpressionScanner.l

FlopocoScanner.h:ExpressionScanner.cpp ExpressionParser.cpp
ExpressionParser.h:ExpressionParser.cpp


