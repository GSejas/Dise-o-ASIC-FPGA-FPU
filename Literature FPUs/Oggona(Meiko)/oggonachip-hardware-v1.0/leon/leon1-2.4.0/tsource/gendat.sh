MAKE=make
CC=sparc-rtems-gcc
CFLAGS= -static -O2  -W -Wall # -mno-ieee-fp -O20  -ffast-math  -fsigned-char # normal version
PROG=test1

all: $(PROG)

test: test.c

test1:test1.c
	sparc-rtems-strip test1
	sparc-rtems-objcopy --remove-section=.comment test1
	sparc-rtems-objdump -s test1 > test1.dat
	sparc-rtems-objdump -d test1 > test1.s
	sparc-rtems-size test1
	

clean:
	-rm -f $(PROG) *.o
