#include <stdio.h>

// #include "makeheader.h"

/******************************************************
 Name   : make_general_hdl
 Input  : n bit multiplier
 Output : void
 Comment: Generate verilog code for an n bit general
          karatsuba multiplier
 ******************************************************/
void make_general_hdl(int n)
{
	FILE *fd;
	char buf[20];
	int i,j;

	sprintf(buf, "hdl/ks%d.v", n);
	fd = fopen(buf, "w");
	makeheader(fd, buf, "Karatsuba Multiplier", "general.c");

	// Entity Declaration
	fprintf(fd, "`ifndef __KS_%d_V__\n", n);
	fprintf(fd, "`define __KS_%d_V__\n\n", n);
	fprintf(fd, "module ks%d(a, b, d);\n\n", n);
	fprintf(fd, "input wire [0:%d] a;\n", n-1);
	fprintf(fd, "input wire [0:%d] b;\n", n-1);
	fprintf(fd, "output wire [0:%d] d;\n\n", 2*n-2);
	
	// Wire Declaration
	fprintf(fd, "wire ");
	for(i=0; i<n-1; ++i)
		fprintf(fd, "m%d, ", i);
	fprintf(fd, "m%d;\n", n-1);
	for(i=0; i<n-1; ++i){
		fprintf(fd, "wire ");
		for(j=i+1; j<n-1; ++j){
			fprintf(fd, "m%d_%d, ",i, j);
		}
		fprintf(fd, "m%d_%d;\n", i, n-1);
	}
	
	// assignments
	for(i=0; i<n; ++i)
		fprintf(fd, "assign m%d = a[%d] & b[%d];\n", i,i,i);
	for(i=0; i<n; ++i){
		for(j=i+1; j<n; ++j){
			fprintf(fd, "assign m%d_%d = (a[%d] ^ a[%d]) & (b[%d] ^ b[%d]);\n",i, j, i, j, i, j);
		}
	}
	
	for(i=0; i<n; ++i){
		fprintf(fd, "assign d[%d] = ", i);
		for(j=0; j<i; ++j){
			if(j >= i-j)
				continue;
			fprintf(fd, "m%d_%d ^ ", j, i-j);
		}
		for(j=0; j<i; ++j){
			fprintf(fd, "m%d ^ ", j);
		}
		fprintf(fd, "m%d;\n", i);
	}

	for(i=n; i<2*n-1; ++i){
		fprintf(fd, "assign d[%d] = ", i);
		for(j=i-n+1; j<i; ++j){
			if(j >= i-j)
				break;
			fprintf(fd, "m%d_%d ^ ", j, i-j);
		}
		for(j=i-n+1; j<n-1; ++j){
			fprintf(fd, "m%d ^ ", j);
		}
		fprintf(fd, "m%d;\n", n-1);
	}
	fprintf(fd, "endmodule\n");
	fprintf(fd, "`endif\n");
	close(fd);
}
