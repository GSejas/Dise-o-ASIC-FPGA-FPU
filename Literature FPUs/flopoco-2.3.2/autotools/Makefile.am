# Makefile for flopoco

SUBDIRS = src
ACLOCAL_AMFLAGS = -I m4

if BUILD_FLOPOCO_EXEC
bin_PROGRAMS = flopoco
flopoco_SOURCES = src/main.cpp
flopoco_CPPFLAGS = $(SOLLYA_INCLUDE)
flopoco_LDADD = $(LIBS) src/libflopoco.la $(SOLLYA_LDFLAGS) 
endif
