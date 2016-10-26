sparc-rtems-as -o $1.o $1.s
sparc-rtems-ld -s -Ttext 0x40000000 -o $1 $1.o 
sparc-rtems-objdump -s $1 > $1.dat