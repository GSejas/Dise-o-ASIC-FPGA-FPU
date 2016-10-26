
CC=sparc-rtems-gcc
CFLAGS=-O2 -g
LDFLAGS=-g -N -nostdlib  -T ./linkleon -e _hardreset locore1.o 
LIBS=-L/opt/rtems/sparc-rtems/lib  -L/usr/local/leon/sparc-rtems/lib \
	-lgcc -lm

all: tests
tests: locore1.o leon_test.exe simfiles

simfiles: ram.dat rom.dat
ram.dat: leon_test.exe
	sparc-rtems-objcopy --remove-section=.comment leon_test.exe
	sparc-rtems-objdump -s leon_test.exe > ram.dat
	sparc-rtems-objdump -d leon_test.exe > ram.s
	sparc-rtems-size leon_test.exe

rom.dat: boot.exe
	sparc-rtems-objdump -s boot.exe > rom.dat
	sparc-rtems-objdump -d boot.exe > rom.s
	sparc-rtems-size boot.exe

boot.exe: boot.o
	sparc-rtems-gcc -N -nostdlib -nostdinclude -T linkboot \
	-e _hardreset boot.o -o boot.exe

divtest.o: divtest.c test.h leon.h
	sparc-rtems-gcc -O2 -mv8 -c divtest.c

multest.o: multest.c test.h leon.h
	sparc-rtems-gcc -O2 -mv8 -c multest.c

leon_test.exe : regtest.o irqctrl.o uart.o leon_test.o timers.o cache.o misc.o \
	memtest.o ioport.o fpu.o ramtest.o extra.o divTest1.o divTest2.o \
	divtest.o divTest.o divTest3.o multest.o
	$(CC) $(LDFLAGS) regtest.o irqctrl.o uart.o leon_test.o timers.o cache.o misc.o \
	memtest.o ioport.o fpu.o ramtest.o \
	divtest.o multest.o \
	$(LIBS) -o leon_test.exe
	cp leon_test.exe lt
	sparc-rtems-strip leon_test.exe

clean:
	-rm lt *.exe *.o *.s

# DO NOT DELETE

uart.o: leon.h test.h
leon_test.o: leon.h test.h locore1.o
cache_test.o: leon.h test.h
timer_test.o: leon.h test.h
regtest.o: leon.h test.h
dma.o: leon.h test.h
misc.o: leon.h
memtest.o: leon.h test.h
ioport.o: leon.h test.h
fpu.o: leon.h test.h
ramtest.o: leon.h test.h
extra.o: leon.h test.h
divTest1.o: leon.h test.h
divTest2.o: leon.h test.h
divTest3.o: leon.h test.h
divTest.o: leon.h test.h
