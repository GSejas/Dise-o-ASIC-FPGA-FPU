dnl Process this file with autoconf to produce a configure script.

AC_INIT([FloPoCo], [svn-trunk], [BUG_REPORT_ADDRESS])
AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])

dnl Check for programs.
AC_PROG_CXX
AC_PROG_CC
AC_PROG_CPP
AC_PROG_INSTALL
AC_PROG_LIBTOOL
AM_PROG_LEX
AC_PROG_YACC

# we need bison instead of yacc
YACC_TRIMMED=`echo ${YACC}| sed 's/-y//;s/ //'`
if test ${YACC_TRIMMED} != bison; then
  AC_MSG_ERROR(bison is required)
fi
#and flex instead of lex
if test "$LEX" != flex; then
    AC_MSG_ERROR(flex is required)
fi

dnl Sets C++ as main language
AC_LANG([C++])

dnl Enable and Disable values
enableval="yes"
disableval="no"

dnl Disable executable compilation
AC_ARG_ENABLE(	[exec],
		[AS_HELP_STRING([--disable-exec], [disable executable generation, building FloPoCo as a dynamic library only])],
		[EXEC=$disableval],
		[EXEC=$enableval])
AM_CONDITIONAL(BUILD_FLOPOCO_EXEC, test "x$EXEC" = xyes)

AC_ARG_WITH(sollya-dir,
    [  --with-sollya-dir=DIR  where the root sources of SOLLYA are installed ],
    [
       ac_sollya_dir="$withval"
    ])
AC_ARG_WITH(sollya-obj-dir,
    [  --with-sollya-obj-dir=DIR  where the root of SOLLYA are installed ],
    [
       ac_sollya_obj_dir="$withval"
    ])

dnl check for the sollya library
if test "x$ac_sollya_dir" != x && test "x$ac_sollya_obj_dir" != x; then
   AC_DEFINE(HAVE_SOLLYA, 1, "Found Sollya")
   AC_DEFINE(HAVE_HOTBM, 1, "HOTBM available")
   AC_DEFINE(HAVE_LNS, 1, "LNS available")
   SOLLYA_INCLUDE="-I $ac_sollya_dir"
   SOLLYA_LDFLAGS="-L$ac_sollya_obj_dir -lsollya"
   AC_SUBST(SOLLYA_INCLUDE)
   AC_SUBST(SOLLYA_LDFLAGS)
   ac_build_sollya=yes
AC_CONFIG_FILES([src/FPExpressions/Makefile])
AC_CONFIG_FILES([src/LNS/Makefile])
else
   ac_build_sollya=no
fi
AM_CONDITIONAL(BUILD_SOLLYA_FILES, test "x$ac_build_sollya" = xyes)

dnl Detect whether target OS is Windows
AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <windows.h>]], [[HANDLE h; DWORD d;]])], [OS_WIN32="yes"], [OS_WIN32="no"])
AM_CONDITIONAL(no_WIN32, test "x$OS_WIN32" = xno)

dnl Check for libraries.
AC_CHECK_LIB([gmpxx], [main], [], [AC_MSG_ERROR(libgmpxx is missing.)])
AC_CHECK_LIB([gmp], [main], [], [AC_MSG_ERROR(libgmp is missing.)])
AC_CHECK_LIB([mpfr], [main], [], [AC_MSG_ERROR(libmpfr is missing.)])

dnl Check for headers.
AC_CHECK_HEADER([gmpxx.h], [], [AC_MSG_ERROR(gmpxx.h is missing.)])
AC_CHECK_HEADER([gmp.h], [], [AC_MSG_ERROR(gmp.h is missing.)])
AC_CHECK_HEADER([mpfr.h], [], [AC_MSG_ERROR(mpfr.h is missing.)])

dnl Generate output
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([src/Makefile Makefile])
AC_OUTPUT
