all:
	cc sp.c -c 
	cc general.c -c
	cc ks.c sp.o general.o -lm -o ks

clean:
	rm -rf *.o hdl/* ks 
