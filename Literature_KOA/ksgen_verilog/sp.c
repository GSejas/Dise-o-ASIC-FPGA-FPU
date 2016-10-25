#include <stdio.h>
#include <string.h>
#include <stdlib.h>


/******************************************************
 Name   : combine
 Input  : ml, mh how the multiplier was split. ie. lower
          number of bits and higher number of bits.
		  *pi[j] contain the terms which get added to 
		  generate the jth output.
 Output : mp : the number of output bits
 Comment: This function does the last step of the 
 Karatsuba, viz the combination of the partial products.
 the partial products which appear in the output are
 stored in the arrays. There can be a maximum of 5 terms
 to compute each output bit. Therefore 5 array p1 to p5
 ******************************************************/
int combine(int ml, int mh, unsigned int *p1, unsigned int *p2, unsigned int *p3, unsigned int *p4, unsigned int *p5)
{
	int m;
	int mlp, mhp, mp;
	int i,j;
	int total_xor=0, xori;;
	

	m = ml + mh;
	
	/* Get AHL */
	if(ml == mh){
	}else{
	}

	/* Get the final combination */
	mlp = 2 * ml - 1;
	mhp = 2 * mh - 1;
	mp = 2 * m - 1;

	memset(p1, 0xFFFFFFFF, mp*sizeof(unsigned int)); // m2
	memset(p2, 0xFFFFFFFF, mp*sizeof(unsigned int)); // m1
	memset(p3, 0xFFFFFFFF, mp*sizeof(unsigned int)); // m2
	memset(p4, 0xFFFFFFFF, mp*sizeof(unsigned int)); // m3
	memset(p5, 0xFFFFFFFF, mp*sizeof(unsigned int)); // m1
	
	for(i=0; i<mp; ++i){
		if(i < mlp){
			//printf("%d : m2[%d]\n", i, i);
			p1[i] = i;
		}
	}

	for(i=ml,j=0; i<mp; ++i, j++){
		if(j<mhp){
//			printf("%d : m1[%d]\n", i, j);
			p2[i] = j;
		}
	}

	for(i=ml,j=0; i<mp; ++i, j++){
		if(j<mlp){
//			printf("%d : m2[%d]\n", i, j);
			p3[i] = j;
		}
	}

	for(i=ml,j=0; i<mp; ++i, j++){
		if(j<mlp){
//			printf("%d : m3[%d]\n", i, j);
			p4[i] = j;
		}
	}

	for(i=2*ml, j=0; i<mp; ++i, ++j){
		if(j<mhp){
//			printf("%d : m1[%d]\n", i, j);
			p5[i] = j;
		}
	}

	return mp;
}
