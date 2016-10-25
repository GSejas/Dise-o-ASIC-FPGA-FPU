#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ(2.59)
AC_INIT([sollya], [4.1], [christoph.lauter@ens-lyon.org, sylvain.chevillard@ens-lyon.org, joldes@lass.fr])
AC_CONFIG_HEADER([config.h])
AM_INIT_AUTOMAKE([1.6 no-define dist-zip dist-bzip2])


# Checks for programs.
AC_PROG_YACC
AC_PROG_CC
AC_PROG_CXX
AC_PROG_SED
AM_PROG_CC_C_O
AC_LANG_PUSH([C++])
AC_MSG_CHECKING([whether C++ compiler works])
AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <stdlib.h>]], [[exit(0);]])],
               [AC_MSG_RESULT(yes)],
               [AC_MSG_ERROR(no)])
AC_LANG_POP([C++])
AC_PROG_LEX
if test "$missing_dir" = ""; then
   missing_dir="."
fi
if test "$LEX" != flex; then
  LEX="$SHELL $missing_dir/missing flex"
  AC_SUBST(LEX_OUTPUT_ROOT, lex.yy)
  AC_SUBST(LEXLIB, '')
fi
AC_LIBTOOL_DLOPEN
AC_PROG_LIBTOOL
AC_SUBST(LIBTOOL_DEPS)
AC_CONFIG_MACRO_DIR([m4])

#Enable
ENABLE_LEGACY_MEMORY_MANAGEMENT=no
AC_ARG_ENABLE(legacy-memory-management,
              [[  --enable-legacy-memory-management enables legacy memory management without reference counting [default=no]]],
              [ENABLE_LEGACY_MEMORY_MANAGEMENT=yes],
              [ENABLE_LEGACY_MEMORY_MANAGEMENT=no])

if test "x${ENABLE_LEGACY_MEMORY_MANAGEMENT}y" == "xyesy" ; then
AC_DEFINE([HAVE_ENABLE_LEGACY_MEMORY_MANAGEMENT],[1],[Enabling legacy memory management w/o reference counting])
fi


#Check whether flex and bison support interactive and pure parsers
AC_ARG_ENABLE(strict-lexer-parser-check,
              [[  --enable-strict-lexer-parser-check enables strict compatibility checking for building the lexer and parser files]],
              [STRICTFLEXBISONTESTING="1"],
              [STRICTFLEXBISONTESTING=""])

AC_MSG_CHECKING([flex supports interactive and pure lexers])
if test `echo -e "%{\n%}\n\n%option always-interactive\n%option reentrant\n%option prefix=\"coucou\"\n%option bison-bridge\n%option nounput\n\n%%\n"test" { }\n%%\n" > conftest.l ; $LEX conftest.l > /dev/null 2> /dev/null ; echo $?; rm -f lex.coucou.c` -eq 0
then
  AC_MSG_RESULT(yes)
else
  if test "x$STRICTFLEXBISONTESTING" = "x"
  then
    AC_MSG_RESULT([flex version unable to compile the lexer from the grammar files])
  else
    AC_MSG_ERROR(no)
  fi
fi

AC_MSG_CHECKING([bison supports interactive and pure parsers])
if test `echo -e "%{\n#define YYERROR_VERBOSE 1\n#define YYPARSE_PARAM scanner\n#define YYLEX_PARAM scanner\n%}\n\n%defines\n%pure_parser\n\n%%\nstart: \".\"\n{ }\n;\n\n" > conftest.y ; $YACC conftest.y > /dev/null 2> /dev/null ; echo $?; rm -f y.tab.*` -eq 0
then
  AC_MSG_RESULT(yes)
else
  if test "x$STRICTFLEXBISONTESTING" = "x"; then
    AC_MSG_RESULT([bison version unable to compile the parser from the grammar files])
  else
    AC_MSG_ERROR(no)
  fi
fi

# withs...
SO_LIB_PATH=""
FPLLLVERSIONSTRING=""

AC_ARG_WITH(gmp-include,
            [  --with-gmp-include=DIR  GMP include directory ],
            AM_CPPFLAGS="$AM_CPPFLAGS -I$withval")
AC_ARG_WITH(gmp-lib,
            [  --with-gmp-lib=DIR      GMP lib directory ],
            [
               AM_LDFLAGS="$AM_LDFLAGS -L$withval"
               SO_LIB_PATH="${SO_LIB_PATH:+$SO_LIB_PATH:}$withval"
            ])
AC_ARG_WITH(gmp,
            [  --with-gmp=DIR          GMP install directory ],
            [
               AM_CPPFLAGS="$AM_CPPFLAGS -I$withval/include"
               AM_LDFLAGS="$AM_LDFLAGS -L$withval/lib"
               SO_LIB_PATH="${SO_LIB_PATH:+$SO_LIB_PATH:}$withval/lib"
            ])


AC_ARG_WITH(mpfr-include,
            [  --with-mpfr-include=DIR  MPFR include directory ],
            AM_CPPFLAGS="$AM_CPPFLAGS -I$withval")
AC_ARG_WITH(mpfr-lib,
            [  --with-mpfr-lib=DIR      MPFR lib directory ],
            [
               AM_LDFLAGS="$AM_LDFLAGS -L$withval"
               SO_LIB_PATH="${SO_LIB_PATH:+$SO_LIB_PATH:}$withval"
            ])
AC_ARG_WITH(mpfr,
            [  --with-mpfr=DIR          MPFR install directory ],
            [
               AM_CPPFLAGS="$AM_CPPFLAGS -I$withval/include"
               AM_LDFLAGS="$AM_LDFLAGS -L$withval/lib"
               SO_LIB_PATH="${SO_LIB_PATH:+$SO_LIB_PATH:}$withval/lib"
            ])


AC_ARG_WITH(fplll-include,
            [  --with-fplll-include=DIR  fplll include directory ],
            [  AM_CPPFLAGS="$AM_CPPFLAGS -I$withval"
               FPLLLVERSIONSTRING="$FPLLLVERSIONSTRING--with-fplll-include given as '$withval',"
            ])
AC_ARG_WITH(fplll-lib,
            [  --with-fplll-lib=DIR      fplll lib directory ],
            [
               AM_LDFLAGS="$AM_LDFLAGS -L$withval"
               SO_LIB_PATH="${SO_LIB_PATH:+$SO_LIB_PATH:}$withval"
               FPLLLVERSIONSTRING="$FPLLLVERSIONSTRING--with-fplll-lib given as '$withval',"
            ])
AC_ARG_WITH(fplll,
            [  --with-fplll=DIR          fplll install directory ],
            [
               AM_CPPFLAGS="$AM_CPPFLAGS -I$withval/include"
               AM_LDFLAGS="$AM_LDFLAGS -L$withval/lib"
               SO_LIB_PATH="${SO_LIB_PATH:+$SO_LIB_PATH:}$withval/lib"
               FPLLLVERSIONSTRING="$FPLLLVERSIONSTRING--with-fplll given as '$withval',"
            ])


AC_ARG_WITH(z-include,
            [  --with-z-include=DIR  z include directory ],
            AM_CPPFLAGS="$AM_CPPFLAGS -I$withval")
AC_ARG_WITH(z-lib,
            [  --with-z-lib=DIR      z lib directory ],
            AM_LDFLAGS="$AM_LDFLAGS -L$withval")
AC_ARG_WITH(z,
            [  --with-z=DIR          z install directory ],
            [
               AM_CPPFLAGS="$AM_CPPFLAGS -I$withval/include"
               AM_LDFLAGS="$AM_LDFLAGS -L$withval/lib"
            ])


AC_ARG_WITH(iconv-include,
            [  --with-iconv-include=DIR  iconv include directory ],
            AM_CPPFLAGS="$AM_CPPFLAGS -I$withval")
AC_ARG_WITH(iconv-lib,
            [  --with-iconv-lib=DIR      iconv lib directory ],
            AM_LDFLAGS="$AM_LDFLAGS -L$withval")
AC_ARG_WITH(iconv,
            [  --with-iconv=DIR          iconv install directory ],
            [
              AM_CPPFLAGS="$AM_CPPFLAGS -I$withval/include"
              AM_LDFLAGS="$AM_LDFLAGS -L$withval/lib"
            ])


AC_ARG_WITH(mpfi-include,
            [  --with-mpfi-include=DIR  MPFI include directory ],
            AM_CPPFLAGS="$AM_CPPFLAGS -I$withval")
AC_ARG_WITH(mpfi-lib,
            [  --with-mpfi-lib=DIR      MPFI lib directory ],
            [
               AM_LDFLAGS="$AM_LDFLAGS -L$withval"
               SO_LIB_PATH="${SO_LIB_PATH:+$SO_LIB_PATH:}$withval"
            ])
AC_ARG_WITH(mpfi,
            [  --with-mpfi=DIR          MPFI install directory ],
            [
               AM_CPPFLAGS="$AM_CPPFLAGS -I$withval/include"
               AM_LDFLAGS="$AM_LDFLAGS -L$withval/lib"
               SO_LIB_PATH="${SO_LIB_PATH:+$SO_LIB_PATH:}$withval/lib"
            ])


XML2INCLUDEGIVEN=""
XML2LIBGIVEN=""
AC_ARG_WITH(xml2-include,
            [  --with-xml2-include=DIR  XML2 include directory ],
            [  AM_CPPFLAGS="$AM_CPPFLAGS -I$withval -I$withval/libxml2"
               XML2INCLUDEGIVEN=1
            ])
AC_ARG_WITH(xml2-lib,
            [  --with-xml2-lib=DIR      XML2 lib directory ],
            [
               AM_LDFLAGS="$AM_LDFLAGS -L$withval"
               SO_LIB_PATH="${SO_LIB_PATH:+$SO_LIB_PATH:}$withval"
               XML2LIBGIVEN=1
            ])
AC_ARG_WITH(xml2,
            [  --with-xml2=DIR          XML2 install directory ],
            [
               AM_CPPFLAGS="$AM_CPPFLAGS -I$withval/include -I$withval/include/libxml2"
               AM_LDFLAGS="$AM_LDFLAGS -L$withval/lib"
               SO_LIB_PATH="${SO_LIB_PATH:+$SO_LIB_PATH:}$withval/lib"
               XML2INCLUDEGIVEN=1
               XML2LIBGIVEN=1
            ])


#Add xml2 include and lib
XML2CONFIGGIVEN=""
AC_ARG_WITH(xml2-config,
            [  --with-xml2-config=executable XML2 config tool ],
            [
               XML2CONFIG="$withval"
               XML2CONFIGGIVEN=1
            ])

if test "x$XML2CONFIGGIVEN" = "x"
then
  AC_CHECK_PROG(XML2CONFIG, xml2-config, [xml2-config], [false])
fi

if test "x$XML2INCLUDEGIVEN" = "x"
then
  AM_CPPFLAGS="$AM_CPPFLAGS "`$XML2CONFIG --cflags`
fi

if test "x$XML2LIBGIVEN" = "x"
then
  XML2LIBS=`$XML2CONFIG --libs --static`
  XML2LIBSPURE=`$XML2CONFIG --libs | $SED -e 's/^-l//g;s/[[:blank:]]-l//g;'`
  AC_SEARCH_LIBS([xmlTextReaderIsEmptyElement], [$XML2LIBSPURE], [], [], [$XML2LIBS])
fi


# Save user flags and set flags given by configure for the rest of the tests
USER_CFLAGS="$CFLAGS"
USER_CPPFLAGS="$CPPFLAGS"
USER_LDFLAGS="$LDFLAGS"
CFLAGS="$AM_CFLAGS $USER_CFLAGS"
CPPFLAGS="$AM_CPPFLAGS $USER_CPPFLAGS"
LDFLAGS="$AM_LDFLAGS $USER_LDFLAGS"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$SO_LIB_PATH"

# Checks for libraries.
dlopen_ok="yes"
AC_CHECK_LIB([c], [dlopen], [], [dlopen_ok="no"])
if test "x${dlopen_ok}y" == "xnoy" ; then
  AC_CHECK_LIB([dl], [dlopen], [], AC_MSG_ERROR([libdl unusable]))
fi
AC_CHECK_LIB([gmp], [__gmpz_init], [true], AC_MSG_ERROR([libgmp unusable]))
AC_CHECK_LIB([gmp], [__gmpz_fac_ui], [true], AC_MSG_ERROR([libgmp version too old]))
AC_CHECK_LIB([gmp], [__gmpz_bin_uiui], [true], AC_MSG_ERROR([libgmp version too old]))
AC_CHECK_LIB([gmp], [__gmpz_export], [], AC_MSG_ERROR([libgmp version too old])) # This one adds -lgmp in case of success
AC_CHECK_LIB([mpfr], [mpfr_init], [true], AC_MSG_ERROR([libmpfr unusable]))
AC_CHECK_LIB([mpfr], [mpfr_erfc], [], AC_MSG_ERROR([libmpfr version too old])) # This one adds -lmpfr in case of success
AC_CHECK_LIB([mpfi], [mpfi_init], [], AC_MSG_ERROR([libmpfi unusable]))
AC_CHECK_LIB([z], [gzdopen], [], [])
AC_CHECK_LIB([iconv], [libiconv_open], [], [])
AC_CHECK_LIB([m],[cos])
AC_CHECK_LIB([xml2], [xmlTextReaderIsEmptyElement], [], AC_MSG_ERROR([libxml2 unusable]))

# Check that dynamic libraries are available at runtime
AC_MSG_CHECKING([if libgmp is found at runtime])
AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <gmp.h>]],
                               [[mpz_t a; mpz_init(a); mpz_clear(a); return 0;]])],
	      [AC_MSG_RESULT(yes)],
              [AC_MSG_WARN([libgmp is found at compile time but not at run time. Checking /etc/ld.so.conf and running ldconfig could fix the problem.])])


AC_MSG_CHECKING([if libmpfr is found at runtime])
AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <mpfr.h>]],
                               [[mpfr_t a; mpfr_init2(a, 53); mpfr_clear(a); return 0;]])],
	      [AC_MSG_RESULT(yes)],
              [AC_MSG_WARN([libmpfr is found at compile time but not at run time. Checking /etc/ld.so.conf and running ldconfig could fix the problem.])])


AC_MSG_CHECKING([if libmpfi is found at runtime])
AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <mpfi.h>]],
                               [[mpfi_t a; mpfi_init(a); mpfi_clear(a); return 0;]])],
	      [AC_MSG_RESULT(yes)],
              [AC_MSG_ERROR([libmpfi is found at compile time but not at run time. Checking /etc/ld.so.conf and running ldconfig could fix the problem.])])


AC_MSG_CHECKING([if libxml2 is found at runtime])
AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <libxml/xmlreader.h>]],
                               [[xmlCleanupParser(); return 0;]])],
	      [AC_MSG_RESULT(yes)],
              [AC_MSG_WARN([libxml2 is found at compile time but not at run time. Checking /etc/ld.so.conf and running ldconfig could fix the problem.])])



#Special check for fplll
AC_LANG_PUSH([C++])

FPLLLSPECIALINCLUDE="no"
FPLLLISREALLIB="no"

FPLLL_PROG=`printf "\
  ZZ_mat<mpz_t> *M; Z_NR<mpz_t>  zval; mpz_t mpzval; wrapper *LLLwrapper; int i,j;\n\
  mpz_init(mpzval);\n\
  M = new ZZ_mat<mpz_t>(3, 3);\n\
  for(i=0;i<=2;i++) {\n\
    for(j=0;j<=2;j++) {\n\
      mpz_set_ui(mpzval, (i+1)*(j+2));\n\
      zval.set(mpzval);\n\
      M->Set(i,j,zval);\n\
    }\n\
  }\n\
  LLLwrapper = new wrapper(M);\n\
  LLLwrapper->LLL();\
"`
FPLLL_NORMAL_HEADER=`printf "\
  #include <stdlib.h>\n\
  #include <fplll.h>\n\
  #include <gmp.h>\
"`

FPLLL_SPECIAL_HEADER=`printf "\
  #include <stdlib.h>\n\
  #include <fplll/fplll.h>\n\
  #include <gmp.h>\
"`

AC_MSG_CHECKING([if fplll is a real library to be linked in])
OLD_LIBS="$LIBS"; LIBS="-lfplll $LIBS"
AC_LINK_IFELSE([AC_LANG_PROGRAM([[$FPLLL_NORMAL_HEADER]], [[$FPLLL_PROG]])],
               [
                  FPLLLISREALLIB="yes"
		  AC_MSG_RESULT(yes)
               ],
               [AC_LINK_IFELSE([AC_LANG_PROGRAM([[$FPLLL_SPECIAL_HEADER]], [[$FPLLL_PROG]])],
                               [
                                 FPLLLISREALLIB="yes"
                                 FPLLLSPECIALINCLUDE="yes"
             		         AC_MSG_RESULT(yes)
                               ],
              	               [
                                 LIBS="$OLD_LIBS"
                                 AC_MSG_RESULT(no)
              	               ])
               ])

if test "x${FPLLLISREALLIB}y" == "xnoy"
then
  AC_MSG_CHECKING([for fplll support, fplll being just a header file])
  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$FPLLL_NORMAL_HEADER]], [[$FPLLL_PROG]])],
                 [AC_MSG_RESULT(yes)],
                 [
                   AC_LINK_IFELSE([AC_LANG_PROGRAM([[$FPLLL_SPECIAL_HEADER]], [[$FPLLL_PROG]])],
                                  [
                                    FPLLLSPECIALINCLUDE="yes"
                                    AC_MSG_RESULT(yes)
                                  ],
                                  [AC_MSG_ERROR([fplll unusable])])
                 ])
fi

if test "x${FPLLLISREALLIB}y" == "xyesy"
then
  FPLLLVERSIONSTRING="$FPLLLVERSIONSTRING linkage with -lfplll is compatible. Header file"
else
  FPLLLVERSIONSTRING="$FPLLLVERSIONSTRING linkage with -lfplll is not compatible. Header file"
fi

if test "x${FPLLLSPECIALINCLUDE}y" == "xyesy"
then
  FPLLL_GOOD_HEADER="$FPLLL_SPECIAL_HEADER"
  AC_DEFINE([HAVE_SPECIAL_FPLLL_INCLUDE],[1],[Define for determining a special version of FPLLL])
  FPLLLVERSIONSTRING="$FPLLLVERSIONSTRING in a subdirectory of the include directory (Debian-like)."
else
  FPLLL_GOOD_HEADER="$FPLLL_NORMAL_HEADER"
  AC_DEFINE([HAVE_SPECIAL_FPLLL_INCLUDE],[0],[Define for determining a special version of FPLLL])
  FPLLLVERSIONSTRING="$FPLLLVERSIONSTRING directly in include directory."
fi

AC_DEFINE_UNQUOTED([HAVE_FPLLL_VERSION_STRING],["$FPLLLVERSIONSTRING"],[Define a kind of a version string for FPLLL])
AC_LANG_POP([C++])

# Testing if -lstdc++ works both with the C compiler and the C++ compiler.
# We add it only if it works with both.
ADD_LSTDC="yes"
OLD_LIBS="$LIBS"; LIBS="$LIBS -lstdc++"
AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
                  [],
                  [ADD_LSTDC="no"])
AC_LANG_PUSH([C++])
AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
                  [],
                  [ADD_LSTDC="no"])
AC_LANG_POP([C++])
if test "x${ADD_LSTDC}y" == "xnoy"
then
  LIBS="$OLD_LIBS"
fi

AC_LANG_PUSH([C++])
# Checking that libfplll is found at runtime
AC_MSG_CHECKING([if libfplll is found at runtime])
AC_RUN_IFELSE([AC_LANG_PROGRAM([[ #undef malloc
                                  #undef realloc
                                  $FPLLL_GOOD_HEADER]],
                               [[$FPLLL_PROG]])
              ],
              [AC_MSG_RESULT(yes)],
              [AC_MSG_WARN([libfplll is found at compile time but not at run time. Checking /etc/ld.so.conf and running ldconfig could fix the problem.])])

AC_LANG_POP([C++])



#Check for -Wl,-export-dynamic etc.
CFLAGS="$AM_CFLAGS -fPIC $USER_CFLAGS"
AC_MSG_CHECKING([for -fPIC support])
AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
                  [
                     AC_MSG_RESULT(yes)
                     AM_CFLAGS="$AM_CFLAGS -fPIC"
                  ],
                  [
                     AC_MSG_RESULT(no)
                     CFLAGS="$AM_CFLAGS $USER_CFLAGS"
                  ])


LDFLAGS="$AM_LDFLAGS -Wl,-export-dynamic $USER_LDFLAGS"
AC_MSG_CHECKING([for -export-dynamic support])
AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <stdlib.h>]],
                               [[exit(0);]]
                              )],
              [
                 AC_MSG_RESULT(yes)
                 AM_LDFLAGS="$AM_LDFLAGS -Wl,-export-dynamic"
              ],
              [
                 AC_MSG_RESULT(no)
                 LDFLAGS="$AM_LDFLAGS $USER_LDFLAGS"
              ])


LDFLAGS="$AM_LDFLAGS -Xlinker --allow-multiple-definition $USER_LDFLAGS"
AC_MSG_CHECKING([for -Xlinker --allow-multiple-definition support])
AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <stdlib.h>]],
                               [[exit(0);]]
                              )],
              [
                 AC_MSG_RESULT(yes)
                 AM_LDFLAGS="$AM_LDFLAGS -Xlinker --allow-multiple-definition"
              ],
              [
                 AC_MSG_RESULT(no)
                 LDFLAGS="$AM_LDFLAGS $USER_LDFLAGS"
              ])


AC_MSG_CHECKING([if compiler activates FTZ by default])
AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <stdint.h>]],
                               [[
                                 union {
                                   uint64_t i;
                                   double d;
                                 } xct, yct;
                                 volatile double x, y;
                                 xct.i = 0x1f20000000000000ull;
                                 x = xct.d;
                                 y = x * x;
                                 yct.d = y;
                                 if (yct.i == 0x0000000000000000ull) return 1;]]
                              )],
              [AC_MSG_RESULT(no)],
              [
                 AC_MSG_RESULT(yes)
                 AC_MSG_CHECKING([if compiler supports -fp-model precise flag])
                 CFLAGS="$AM_CFLAGS -fp-model precise $USER_CFLAGS"
                 AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <stdlib.h>]],
                                                [[exit(0);]]
                                               )],
                               [
                                  AC_MSG_RESULT(yes)
                                  AM_CFLAGS="$AM_CFLAGS -fp-model precise"
                               ],
                               [
                                  AC_MSG_RESULT(no)
                                  CFLAGS="$AM_CFLAGS $USER_CFLAGS"
                               ])
              ])


# Checks for header files.
AC_FUNC_ALLOCA
AC_HEADER_STDC
AC_HEADER_SYS_WAIT
AC_CHECK_HEADERS([inttypes.h libintl.h malloc.h stddef.h stdlib.h string.h sys/ioctl.h sys/time.h termios.h unistd.h limits.h wchar.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_HEADER_STDBOOL
AC_TYPE_INT32_T
AC_TYPE_INT64_T
AC_TYPE_SSIZE_T
AC_TYPE_UINT64_T
AC_TYPE_SIZE_T
AC_HEADER_TIME
AC_TYPE_INT16_T
AC_TYPE_INT8_T
AC_TYPE_SIZE_T
AC_HEADER_TIME
AC_TYPE_UINT16_T
AC_TYPE_UINT32_T
AC_TYPE_UINT8_T
AC_C_VOLATILE
AC_C_INLINE
AC_C_CONST
AC_CHECK_TYPES([ptrdiff_t])

# Checks for library functions.
AC_FUNC_ERROR_AT_LINE
AC_FUNC_FORK
AC_PROG_GCC_TRADITIONAL
AC_TYPE_SIGNAL
AC_FUNC_VPRINTF
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_CHECK_FUNCS([gettimeofday memmove memset strchr strerror strrchr strtol backtrace dup2 strstr dladdr])

AC_MSG_CHECKING([if the Dl_info type is usable])
AC_RUN_IFELSE([AC_LANG_PROGRAM([[#define _GNU_SOURCE 1
                                 #define _DARWIN_C_SOURCE 1
                                 #include <dlfcn.h>
			         #include <stdlib.h>]],
                               [[ Dl_info myInfo;
                                  if (dladdr(main, &myInfo) != 0) return 0;
                                  exit(1);]]
                              )],
              [
                 AC_MSG_RESULT(yes)
                 AC_DEFINE([HAVE_DL_INFO_TYPE],[1],[Enabling Dl_info type usage])
              ],
              AC_MSG_RESULT(no))

CPPFLAGS="$USER_CPPFLAGS"
CFLAGS="$USER_CFLAGS"
LDFLAGS="$USER_LDFLAGS"

AC_SUBST(AM_CPPFLAGS)
AC_SUBST(AM_CFLAGS)
AC_SUBST(AM_LDFLAGS)
AC_CONFIG_FILES([Makefile doc/Makefile tests-tool/Makefile tests-lib/Makefile])
AC_OUTPUT
