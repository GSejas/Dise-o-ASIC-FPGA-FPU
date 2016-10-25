/* File Name : simple.c
 * Program to generate verilog code for a recursive karatsuba algorithm 
 * Three architectures are supported : 
 *  1 : Simple Karatsuba Multiplier
 *  2 : Binary Karatsuba Multiplier
 *  3 : Hybrid Karatsuba Multiplier 
 */
 
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "makeheader.h"

int combine(int ml, int mh, unsigned int *p1, unsigned int *p2, unsigned int *p3, unsigned int *p4, unsigned int *p5);
void make_general_hdl(int);

int multipliers[100];
int len;

/******************************************************
 Name   : add_to_array
 Input  : n is the multiplication we are doing now 
 Output : void
 Comment: Save the multiplication we are doing now.
          This we would use later to build the ISE
		  scripts.
 ******************************************************/
void add_to_array(int n)
{
	int i;
	for(i=0; i<len; ++i){
		if (multipliers[i] == n)
			return;
	}
	multipliers[len] = n;
	len++;
}

/******************************************************
 Name   : make_hdl
 Input  : n is the multiplication we are doing now, 
          it is split into 2 l bits (lower) and h bits
		  (higher)
 Output : void
 Comment: Generate the Verilog for an n bit multiplier 
 ******************************************************/
void make_hdl(int n, int l, int h)
{
	FILE *fd;
	char buf[20];
	unsigned int *p1, *p2, *p3, *p4, *p5;
	int first;
	int mp;
	int i;

	sprintf(buf, "hdl/ks%d.v", n);
	fd = fopen(buf, "w");
	makeheader(fd, buf, "Karatsuba Multiplier", "ks.c");

	fprintf(fd, "`ifndef __KS_%d_V__\n", n);
	fprintf(fd, "`define __KS_%d_V__\n", n);

	if(l!=1) fprintf(fd, "`include \"ks%d.v\"\n", l);
	if(l!=h && h!=1) fprintf(fd, "`include \"ks%d.v\"\n", h);

	fprintf(fd, "module ks%d(a, b, d);\n\n", n);
	fprintf(fd, "input wire [%d:0] a;\n", n-1);
	fprintf(fd, "input wire [%d:0] b;\n", n-1);
	fprintf(fd, "output wire [%d:0] d;\n\n", 2*n-2);

	fprintf(fd, "wire [%d:0] m1;\n", 2*h-2);
	fprintf(fd, "wire [%d:0] m2;\n", 2*l-2);
	fprintf(fd, "wire [%d:0] m3;\n", 2*l-2);
	fprintf(fd, "wire [%d:0] ahl;\n", l-1);
	fprintf(fd, "wire [%d:0] bhl;\n\n", l-1);

	fprintf(fd, "ks%d ksm1(a[%d:0], b[%d:0], m2);\n", l, n-h-1, n-h-1);
	fprintf(fd, "ks%d ksm2(a[%d:%d], b[%d:%d], m1);\n", h, n-1, n-h, n-1, n-h);
	fprintf(fd, "assign ahl[%d:0] = a[%d:%d] ^ a[%d:0];\n", h-1, n-1, n-h, h-1);
	if(l==h+1)     
		fprintf(fd, "assign ahl[%d] = a[%d];\n", l-1, l-1);
	else if(l>h+1) 
		fprintf(fd, "assign ahl[%d:%d] = a[%d:%d];\n", l-1, h, l-1, h);
	fprintf(fd, "assign bhl[%d:0] = b[%d:%d] ^ b[%d:0];\n", h-1, n-1, n-h, h-1);
	if(l==h+1)     
		fprintf(fd, "assign bhl[%d] = b[%d];\n", l-1, l-1);
	else if(l>h+1) 
		fprintf(fd, "assign bhl[%d:%d] = b[%d:%d];\n", l-1, h, l-1, h);
	fprintf(fd, "ks%d ksm3(ahl, bhl, m3);\n\n", l);

	mp = 2*n-1;
	p1 = (unsigned int *) malloc(mp*sizeof(unsigned int));
	p2 = (unsigned int *) malloc(mp*sizeof(unsigned int));
	p3 = (unsigned int *) malloc(mp*sizeof(unsigned int));
	p4 = (unsigned int *) malloc(mp*sizeof(unsigned int));
	p5 = (unsigned int *) malloc(mp*sizeof(unsigned int));

	combine(l, h, p1, p2, p3, p4, p5);
	for(i=0; i<mp; ++i){
		first=1;
		fprintf(fd, "assign  d[%02d] = ", i);
		if(p1[i]!= 0xFFFFFFFF){
			fprintf(fd, "m2[%02d] ^ ", p1[i]);
		}
		if(p2[i]!= 0xFFFFFFFF)
		{	
			fprintf(fd, "m1[%02d] ^ ", p2[i]);
		}
		if(p3[i]!= 0xFFFFFFFF){
			fprintf(fd, "m2[%02d] ^ ", p3[i]);
		}
		if(p4[i]!= 0xFFFFFFFF){
			fprintf(fd, "m3[%02d] ^ ", p4[i]);
		}
		if(p5[i]!= 0xFFFFFFFF){
			fprintf(fd, "m1[%02d] ^ ", p5[i]);
		}
		fseek(fd, -3, SEEK_CUR);
		fprintf(fd, ";   \n");
	}
	free(p1);
	free(p2);
	free(p3);
	free(p4);
	free(p5);
	fprintf(fd, "endmodule\n");	
	fprintf(fd, "`endif\n");

	close(fd);
}

/******************************************************
 Name   : binary_ks
 Input  : n an integer
 Output : void
 Comment: Generate the n bit binary karatsuba multiplier 
 ******************************************************/
void binary_ks(int n)
{
	double l;
	double h;

	if(n < 2)
		return;
	l = pow(2.0, floor(log(n)/log(2.0))); //Se calcula el log2(n) para la primera parte
	if(l == n)
		l = l/2;
	h= n - l; //n - log2(n) para la parte mayor.
	add_to_array(n);
	make_hdl(n, l, h);

	binary_ks(l);
	binary_ks(h);
}

/******************************************************
 Name   : copy_hdl
 Input  : n an integer
 Output : void
 Comment: Copy a verilog code from the directory store
          to the directory hdl. Mainly used when n 
		  is 2 or 3.
 ******************************************************/
void copy_hdl(int n)
{
	FILE *fdw, *fdr;
	char bufw[20], bufr[20];
	char c;
	sprintf(bufw, "hdl/ks%d.v", n);
	sprintf(bufr, "store/ks%d.v", n);
	fdw = fopen(bufw, "w");
	fdr = fopen(bufr, "r");
	while((c=fgetc(fdr)) != EOF) fputc(c, fdw);
	close(fdw);
	close(fdr);
	return;
}

/******************************************************
 Name   : simple_ks
 Input  : n bit multiplier
 Output : void
 Comment: Generate Simple Karatsuba verilog code for 
          an n bit multiplier
 ******************************************************/
void simple_ks(int n)
{
	int l;
	int h;

	if(n < 2)
		return;
	else if(n == 2 || n==3){
		/* Take the HDL from a file */
		copy_hdl(n);		
		add_to_array(n);
		return;
	}

	h = floor(n/2.0);
	l= ceil(n/2.0);
	add_to_array(n);
	make_hdl(n, l, h);

	simple_ks(l);
	simple_ks(h);
}

/******************************************************
 Name   : hybrid_ks
 Input  : n bit multiplier
 Output : void
 Comment: Generate the hybrid Karatsuba VHDL code for n bit 
 multiplier. If n is less than 29 then the general karatsuba 
 algorithm is used. For n greater than 29 the simple karatsuba 
 algorithm is used. ( __DEFUNCT__  )
 ******************************************************/
void hybrid_ks(int n)
{
	static first=0;
	double l,h;

	if(n < 29){
		add_to_array(n);
		make_general_hdl(n);
		return;
	}

	if(first==0){
		l = pow(2.0, floor(log(n)/log(2.0)));
		if(l == n) l = l/2;
		h = n - l;
		add_to_array(n);
		make_hdl(n, l, h);
		first=1;
		hybrid_ks(l);
		hybrid_ks(h);
	}else{
		h = floor(n/2.0);
		l = ceil(n/2.0);
		add_to_array(n);
		make_hdl(n,l,h);
		hybrid_ks(l);
		hybrid_ks(h);
	}
	
}

/******************************************************
 Name   : hybrid1_hdl
 Input  : n is the multiplier length
 Output : void
 Comment: Generate code for hybrid multiplier
 ******************************************************/
void hybrid1_ks(int n)
{
	double l,h;

	if(n<29){
		add_to_array(n);
		make_general_hdl(n);
		return;
	}

	h = floor(n/2.0);
	l = ceil(n/2.0);
	add_to_array(n);
	make_hdl(n,l,h);
	hybrid1_ks(l);
	hybrid1_ks(h);

}

/* 
   The main function : scanfs the bit size of the
   multiplier. It also reads the type of algorithm
   to be used.
*/
int main(int argc, char **argv)
{
	int n;
	int i;
	FILE *fd;
	char buf[20];
	int arch;

	printf("Generation of an n bit recursive Karatsuba multiplier\n");
	printf("******************************************************\n");
	if (argc == 1){
		printf("Enter the value of n : ");
		scanf("%d", &n);
		printf("\nSelect the Algorithm to be used\n");
		printf("\t 1. Simple Karatsuba Multiplier\n");
		printf("\t 2. Binary Karatsuba Multiplier\n");
		printf("\t 3. Hybrid Karatsuba Multiplier\n");
		printf("Enter Choice : ");
		scanf("%d", &arch);
	} else{
		n = atoi(argv[1]);
		arch = atoi(argv[2]);
		printf("Multiplier : %d Architecture : %d\n", n, arch);
	}
	
	switch(arch){
	case 1:
		simple_ks(n);
		break;
	case 2:
		binary_ks(n);
		break;
	case 3:
		hybrid1_ks(n);
		break;
	}

	sprintf(buf, "hdl/itoh.prj");
	fd = fopen(buf, "a");
	for(i=0; i<len; ++i){
		printf("%d ", multipliers[i]);
		fprintf(fd, "verilog work ks%d.v\n", multipliers[i]);
	}
	printf("\n");
	close(fd);
}
