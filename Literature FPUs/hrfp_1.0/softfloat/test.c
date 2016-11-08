// Testfile which generates a number of test-cases for the HRFP_16
// adder/multiplier.

#include <stdio.h>
#include <stdlib.h>
#include "softfloat.h"
#include <stdint.h>

#define MAXFILES 100

FILE * outputs[MAXFILES];

int domult = 0;
uint64_t num_tests;
int subnormals = 0;
int quiet = 0;
void dumptest(unsigned int a, unsigned int b)
{
	num_tests++;
	if(quiet) {
		return;
	}
	if ((a & 0x7f800000) == 0) {
		//		subnormals++;
		//	return; // No subnormals!
	}

	if ((b & 0x7f800000) == 0) {
		//	  subnormals++;
		//	return; // No subnormals!
	}
	unsigned int res;
	if (domult) {
		res = float32_mul(a,b);
	}else{
		res = float32_add(a,b);
	}
//	if ((res & 0x7f800000) == 0) {
//		// subnormals++;
//		//		return;
//	}
	printf("%08x %08x %08x\n", a,b,	res);
}


uint32_t getnum(int sign, int exponent, int mantissa)
{
	uint32_t thisnumber;
	thisnumber = sign << 31;
	thisnumber |= exponent << 23;
	thisnumber |= mantissa;
	return thisnumber;
}

uint64_t test_corners_tests;
uint64_t test_corners_limit = 1;
int grmbl;
void test_corners(uint32_t firstnumber, uint32_t othernumber, int dodump)
{
	int exponent, mantissa, sign = 0;
	if(dodump == 2) {
		if(!quiet){
			if(!grmbl){
				grmbl = 1000000;
				fprintf(stderr, "test_corners (iteration %lld of %lld, reached %lld%%)\n", test_corners_tests, test_corners_limit, 100ULL*test_corners_tests/test_corners_limit);
			}
			grmbl--;
		}
		test_corners_tests++;
		dumptest(firstnumber, othernumber);
		return;
	}
	int i;
	for(sign = 0; sign <= 1; sign++){
		for(exponent = 0; exponent <= 255; exponent++){
			test_corners(othernumber, getnum(sign,exponent, 0), dodump + 1);
			test_corners(othernumber, getnum(sign,exponent, 0x7fffff), dodump + 1);
			mantissa = 1;
			while(mantissa < (1 << 23)){
				test_corners(othernumber, getnum(sign, exponent, mantissa), dodump + 1);
				test_corners(othernumber, getnum(sign, exponent, 0x7fffff - mantissa), dodump + 1);
				mantissa = mantissa * 2;
			}
		}
		for(mantissa = 0x7fff00; mantissa <= 0x7fffff; mantissa++){
			test_corners(othernumber, getnum(sign,0,mantissa), dodump + 1);
			test_corners(othernumber, getnum(sign,255,mantissa), dodump + 1);
		}
		for(mantissa = 0x000000; mantissa <= 0x000100; mantissa++){
			test_corners(othernumber, getnum(sign,0,mantissa), dodump + 1);
			test_corners(othernumber, getnum(sign,255,mantissa), dodump + 1);
		}
		for(i=0; i < 100; i = i + 1){
			test_corners(othernumber, (rand() << 5) ^ rand(), dodump + 1);
		}
	}
}

int main(int argc, char **argv)
{
	int k;
	//	float_rounding_mode = float_round_to_zero;
	uint32_t a,b;
	if(argc == 3){
		a = strtoul(argv[1],NULL, 0);
		b = strtoul(argv[2],NULL, 0);
		printf("0x%08x * 0x%08x = 0x%08x\n", a,b,float32_mul(a,b));
		dumptest(a,b);
		return 0;
	}
	if(argc == 2) {
		if(!strcmp("-mult",argv[1])){
			fprintf(stderr,"Enabling multiplier mode\n");
			domult = 1;
		}
	}

	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0x87d280f3, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);
	dumptest(0xbf800000, 0xff7fffff);

	dumptest(0x00000003, 0x3f000000);
	dumptest(0x00000003, 0x3f000000);
	dumptest(0x00000003, 0x3f000000);
	dumptest(0x00000003, 0x3f000000);
	dumptest(0x00000003, 0x3f000000);
	dumptest(0x00000003, 0x3f000000);
	dumptest(0x00000003, 0x3f000000);
	dumptest(0x00000003, 0x3f000000);
	dumptest(0x00000003, 0x3f000000);
	dumptest(0x00000003, 0x3f000000);
	dumptest(0x00000003, 0x3f000000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x801fffff, 0x00200000);
	dumptest(0x801fffff, 0x00200000);
	dumptest(0x801fffff, 0x00200000);
	dumptest(0x801fffff, 0x00200000);
	dumptest(0x801fffff, 0x00200000);
	dumptest(0x801fffff, 0x00200000);
	dumptest(0x801fffff, 0x00200000);
	dumptest(0x801fffff, 0x00200000);
	dumptest(0x801fffff, 0x00200000);
	dumptest(0x801fffff, 0x00200000);
	dumptest(0x801fffff, 0x00200000);
	dumptest(0x801fffff, 0x00200000);
	dumptest(0x801fffff, 0x00200000);
	dumptest(0x801fffff, 0x00200000);
	dumptest(0x01ffffff, 0x82000000);
	dumptest(0x01ffffff, 0x82000000);
	dumptest(0x01ffffff, 0x82000000);
	dumptest(0x01ffffff, 0x82000000);
	dumptest(0x01ffffff, 0x82000000);
	dumptest(0x01ffffff, 0x82000000);
	dumptest(0x01ffffff, 0x82000000);
	dumptest(0x01ffffff, 0x82000000);
	dumptest(0x01ffffff, 0x82000000);
	dumptest(0x01ffffff, 0x82000000);
	dumptest(0x01ffffff, 0x82000000);
	dumptest(0x01ffffff, 0x82000000);
	dumptest(0x00000001, 0x003fffff);
	dumptest(0x00000001, 0x003fffff);
	dumptest(0x00000001, 0x003fffff);
	dumptest(0x00000001, 0x003fffff);
	dumptest(0x00000001, 0x003fffff);
	dumptest(0x00000001, 0x003fffff);
	dumptest(0x00000001, 0x003fffff);
	dumptest(0x00000001, 0x003fffff);
	dumptest(0x00000001, 0x003fffff);
	dumptest(0x00000001, 0x003fffff);
	dumptest(0x00000001, 0x003fffff);
	dumptest(0x00000001, 0x003fffff);

	dumptest(0x007fffff, 0x3f800000);
	dumptest(0x007fffff, 0x3f800000);
	dumptest(0x007fffff, 0x3f800000);
	dumptest(0x007fffff, 0x3f800000);
	dumptest(0x007fffff, 0x3f800000);

	dumptest(0x007fffff, 0x3f7fffff);
	dumptest(0x007fffff, 0x3f7fffff);
	dumptest(0x007fffff, 0x3f7fffff);
	dumptest(0x007fffff, 0x3f7fffff);
	dumptest(0x007fffff, 0x3f7fffff);
	dumptest(0x007fffff, 0x3f7fffff);
	dumptest(0x007fffff, 0x3f7fffff);
	dumptest(0x007fffff, 0x3f7fffff);
	dumptest(0x007fffff, 0x3f7fffff);
	dumptest(0x007fffff, 0x3f7fffff);
	dumptest(0x007fffff, 0x3f7fffff);
	dumptest(0x007fffff, 0x3f7fffff);
	for(k=24; k > 0; k = k - 1) {
	  dumptest(0x3fffffff  -  ((1 << k) - 1), 0x3f800001);
	  dumptest(0x3fffffff  -  ((1 << k) - 1), 0x3f800001);
	  dumptest(0x3fffffff  -  ((1 << k) - 1), 0x3f800001);
	}

	dumptest(0x3f800000, 0x7f7fffff);
	dumptest(0x3f800001, 0x7f7fffff);

	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e87ffff);
	dumptest(0x3e000003, 0x3e87ffff);
	dumptest(0x3e000003, 0x3e87ffff);
	dumptest(0x3e000003, 0x3e87ffff);
	dumptest(0x3e000003, 0x3e87ffff);
	dumptest(0x3e000003, 0x3f07ffff);
	dumptest(0x3e000003, 0x3f07ffff);
	dumptest(0x3e000003, 0x3f07ffff);
	dumptest(0x3e000003, 0x3f07ffff);
	dumptest(0x3e000003, 0x3f87ffff);
	dumptest(0x3e000003, 0x3f87ffff);
	dumptest(0x3e000003, 0x3f87ffff);
	dumptest(0x3e000003, 0x3f87ffff);
	dumptest(0x3e000003, 0x3f87ffff);
	dumptest(0x3e000003, 0x3f87ffff);
	fprintf(stderr, "Running quick corner test for 1.0 * subnormals\n");
	for(k=1; k < 24; k = k + 1) {
	  dumptest((1 << k) - 1, 0x3f800000);
	  dumptest((1 << k) - 1, 0x3f800000);
	  dumptest((1 << k) - 1, 0x3f800000);
	}

	fprintf(stderr, "Running quick corner test for 0.5 * subnormals\n");
	for(k=1; k < 24; k = k + 1) {
	  dumptest((1 << k) - 1, 0x3f000000);
	  dumptest((1 << k) - 1, 0x3f000000);
	  dumptest((1 << k) - 1, 0x3f000000);
	}
	dumptest(0x00000001, 0x3f800000);
	dumptest(0x00000001, 0x3f800000);
	dumptest(0x00000001, 0x3f800000);
	dumptest(0x00000003, 0x3f800000);
	dumptest(0x00000003, 0x3f800000);
	dumptest(0x00000003, 0x3f800000);
	dumptest(0x00000007, 0x3f800000);
	dumptest(0x00000007, 0x3f800000);
	dumptest(0x00000007, 0x3f800000);
	dumptest(0x0000000f, 0x3f800000);
	dumptest(0x0000000f, 0x3f800000);
	dumptest(0x0000000f, 0x3f800000);
	dumptest(0x0000001f, 0x3f800000);
	dumptest(0x0000001f, 0x3f800000);
	dumptest(0x0000001f, 0x3f800000);
	dumptest(0x0000003f, 0x3f800000);
	dumptest(0x0000003f, 0x3f800000);
	dumptest(0x0000003f, 0x3f800000);
	dumptest(0x0000007f, 0x3f800000);
	dumptest(0x0000007f, 0x3f800000);
	dumptest(0x0000007f, 0x3f800000);
	dumptest(0x000000ff, 0x3f800000);
	dumptest(0x000001ff, 0x3f800000);
	dumptest(0x000003ff, 0x3f800000);
	dumptest(0x000007ff, 0x3f800000);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x007fffff, 0x34000002);
	dumptest(0x007fffff, 0x34000003);
	dumptest(0x007fffff, 0x34000004);
	dumptest(0x007fffff, 0x34000005);
	dumptest(0x007fffff, 0x34000006);
	dumptest(0x007fffff, 0x34000007);
	dumptest(0x007fffff, 0x34000008);
	dumptest(0x007fffff, 0x34000009);
	dumptest(0x007fffff, 0x3400000a);
	dumptest(0x007fffff, 0x3400000b);
	dumptest(0x007fffff, 0x3400000c);
	dumptest(0x007fffff, 0x3400000d);
	dumptest(0x007fffff, 0x3400000e);
	dumptest(0x007fffff, 0x3400000f);
	dumptest(0x007fffff, 0x34000010);
	dumptest(0x007fffff, 0x34000020);
	dumptest(0x007fffff, 0x34000040);
	dumptest(0x007fffff, 0x34000080);
	dumptest(0x007fffff, 0x34000101);
	dumptest(0x007fffff, 0x34000102);
	dumptest(0x007fffff, 0x34000103);
	dumptest(0x007fffff, 0x34000104);
	dumptest(0x007fffff, 0x34000105);
	dumptest(0x007fffff, 0x34000106);
	dumptest(0x007fffff, 0x34000107);
	dumptest(0x007fffff, 0x34000010);
	dumptest(0x007fffff, 0x34000010);
	dumptest(0x007fffff, 0x34000010);
	dumptest(0x007fffff, 0x34000010);
	dumptest(0x007fffff, 0x34000010);
	dumptest(0x007fffff, 0x34000010);
	dumptest(0x007fffff, 0x34000002);
	dumptest(0x007fffff, 0x34000002);
	dumptest(0x007fffff, 0x34000002);
	dumptest(0x007fffff, 0x34000002);
	dumptest(0x007fffff, 0x34000002);
	dumptest(0x007fffff, 0x34000002);
	dumptest(0x007fffff, 0x34000002);
	dumptest(0x007fffff, 0x34000002);
	dumptest(0x007fffff, 0x3c000002);
	dumptest(0x007fffff, 0x3b800002);
	dumptest(0x007fffff, 0x3b000002);
	dumptest(0x007fffff, 0x3a800002);
	dumptest(0x007fffff, 0x3a000002);
	dumptest(0x007fffff, 0x39800002);
	dumptest(0x007fffff, 0x39000002);
	dumptest(0x00000fff, 0x38800002);
	dumptest(0x00001fff, 0x38800002);
	dumptest(0x00003fff, 0x38800002);
	dumptest(0x00007fff, 0x38800002);
	dumptest(0x0000ffff, 0x38800002);
	dumptest(0x0001ffff, 0x38800002);
	dumptest(0x0003ffff, 0x38800002);
	dumptest(0x0007ffff, 0x38800002);
	dumptest(0x000fffff, 0x38800002);
	dumptest(0x001fffff, 0x38800002);
	dumptest(0x003fffff, 0x38800002);
	dumptest(0x007fffff, 0x38800002);
	dumptest(0x007fffff, 0x38800002);
	dumptest(0x007fffff, 0x38800002);
	dumptest(0x007fffff, 0x38000002);
	dumptest(0x007fffff, 0x37800002);
	dumptest(0x007fffff, 0x37000002);
	dumptest(0x007fffff, 0x36800002);
	dumptest(0x007fffff, 0x36000002);
	dumptest(0x007fffff, 0x35800002);
	dumptest(0x007fffff, 0x35000002);
	dumptest(0x007fffff, 0x34800002);
	dumptest(0x007fffff, 0x34000002);
	dumptest(0x001fffff, 0x33800005);
	dumptest(0x003fffff, 0x33800005);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x007fffff, 0x33800002);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x00000001, 0x00000001);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3f800000, 0x3f800100);
	dumptest(0x3ff00000, 0x3ff00000);
	dumptest(0x3f000000, 0x3f000000);
	dumptest(0x3e000000, 0x3e000000);
	dumptest(0x3e000003, 0x3e000001);
	dumptest(0x3e000003, 0x3e000003);
	dumptest(0x3e000003, 0x3e000003);
	dumptest(0x3e000003, 0x3e000003);
	dumptest(0x3e000003, 0x3e000003);
	dumptest(0x3e000003, 0x3e000003);
	dumptest(0x3e000003, 0x3e000003);
	dumptest(0x3e000003, 0x3e000003);
	dumptest(0x3e000003, 0x3e000003);
	dumptest(0x3e000003, 0x3e000003);
	dumptest(0x3e000003, 0x3e000003);
	dumptest(0x3e000003, 0x3e000007);
	dumptest(0x3e000003, 0x3e00000f);
	dumptest(0x3e000003, 0x3e00001f);
	dumptest(0x3e000003, 0x3e00003f);
	dumptest(0x3e000003, 0x3e00007f);
	dumptest(0x3e000003, 0x3e0000ff);
	dumptest(0x3e000003, 0x3e0001ff);
	dumptest(0x3e000003, 0x3e0003ff);
	dumptest(0x3e000003, 0x3e0007ff);
	dumptest(0x3e000003, 0x3e000fff);
	dumptest(0x3e000003, 0x3e001fff);
	dumptest(0x3e000003, 0x3e003fff);
	dumptest(0x3e000003, 0x3e007fff);
	dumptest(0x3e000003, 0x3e00ffff);
	dumptest(0x3e000003, 0x3e01ffff);
	dumptest(0x3e000003, 0x3e03ffff);
	dumptest(0x3e000003, 0x3e07ffff);
	dumptest(0x3e000003, 0x3e0fffff);
	dumptest(0x3e000003, 0x3e1fffff);
	dumptest(0x3e000003, 0x3e1fffff);
	dumptest(0x3e000003, 0x3e1fffff);
	dumptest(0x3e000003, 0x3e1fffff);
	dumptest(0x3e000003, 0x3e1fffff);
	dumptest(0x3e000003, 0x3e1fffff);
	dumptest(0x3e000003, 0x3e1fffff);
	dumptest(0x3e000003, 0x3e1fffff);
	dumptest(0x3e000003, 0x3e1fffff);
	dumptest(0x3e000003, 0x3e1fffff);
	dumptest(0x3e000003, 0x3e1fffff);
	dumptest(0x3e000003, 0x3e1fffff);
	dumptest(0x3e000003, 0x3e1fffff);
	dumptest(0x3e000003, 0x3e3fffff);
	dumptest(0x3e000003, 0x3e7fffff);
	dumptest(0x3e000007, 0x3e7fffff);
	dumptest(0x3e00000f, 0x3e7fffff);
	dumptest(0x3e00001f, 0x3e7fffff);
	dumptest(0x3e00003f, 0x3e7fffff);
	dumptest(0x3e00007f, 0x3e7fffff);
	dumptest(0x3e0000ff, 0x3e7fffff);
	dumptest(0x3e0001ff, 0x3e7fffff);
	dumptest(0x3e0003ff, 0x3e7fffff);
	dumptest(0x3e0007ff, 0x3e7fffff);
	dumptest(0x3e000fff, 0x3e7fffff);
	dumptest(0x3e001fff, 0x3e7fffff);
	dumptest(0x3e003fff, 0x3e7fffff);
	dumptest(0x3e007fff, 0x3e7fffff);
	dumptest(0x3e00ffff, 0x3e7fffff);
	dumptest(0x3e01ffff, 0x3e7fffff);
	dumptest(0x3e03ffff, 0x3e7fffff);
	dumptest(0x3e07ffff, 0x3e7fffff);
	dumptest(0x3e0fffff, 0x3e7fffff);
	dumptest(0x3e1fffff, 0x3e7fffff);
	dumptest(0x3e3fffff, 0x3e7fffff);
	dumptest(0x3e7fffff, 0x3e7fffff);

	dumptest(0x3e03ffff, 0x007fffff);
	dumptest(0x3e03ffff, 0x007fffff);
	dumptest(0x3e03ffff, 0x007fffff);
	dumptest(0x3e03ffff, 0x007fffff);
	dumptest(0x3e03ffff, 0x007fffff);
	dumptest(0x3e03ffff, 0x007fffff);
	dumptest(0x3e03ffff, 0x007fffff);
	dumptest(0x3e03ffff, 0x007fffff);
	dumptest(0x3e03ffff, 0x007fffff);
	dumptest(0x3e07ffff, 0x007fffff);
	dumptest(0x3e0fffff, 0x007fffff);
	dumptest(0x3e1fffff, 0x007fffff);
	dumptest(0x3e3fffff, 0x007fffff);
	dumptest(0x3e7fffff, 0x007fffff);
	dumptest(0x3e7fffff, 0x007fffff);
	dumptest(0x3e7fffff, 0x007fffff);
	dumptest(0x3e7fffff, 0x007fffff);
	dumptest(0x3e7fffff, 0x007fffff);
	dumptest(0x3e7fffff, 0x007fffff);
	dumptest(0x3e7fffff, 0x007fffff);
	dumptest(0x3e7fffff, 0x007fffff);
	dumptest(0x3e7fffff, 0x007fffff);
	dumptest(0x3e7fffff, 0x007fffff);
	dumptest(0x3e7fffff, 0x007fffff);
	dumptest(0x3e7fffff, 0x007fffff);
	dumptest(0x3e7fffff, 0x007fffff);
	dumptest(0x3e7fffff, 0x007fffff);

		     
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	dumptest(0x3f800000, 0x3f800000);
	//	return 0;
	dumptest(0x7f3fffff, 0x00000000);
	dumptest(0x7f3fffff, 0x00000000);
	dumptest(0x7f3fffff, 0x00000000);
	dumptest(0x7f3fffff, 0x00000000);
	dumptest(0x7f3fffff, 0x00000000);
	dumptest(0x7f3fffff, 0x00000000);
	dumptest(0x7f3fffff, 0x00000000);
	dumptest(0x7f3fffff, 0x00000000);
	dumptest(0x7f3fffff, 0x00000000);
	dumptest(0x7f3fffff, 0x00000000);
	dumptest(0x7f3fffff, 0x00000000);
	dumptest(0x7f3fffff, 0x00000000);
	dumptest(0x7f3fffff, 0x00000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);
	// +/- zero related corners corners
	dumptest(0x00000000, 0x00000000);
	dumptest(0x80000000, 0x00000000);
	dumptest(0x00000000, 0x80000000);
	dumptest(0x80000000, 0x80000000);

	dumptest(0x00000001, 0x00000001);
	dumptest(0x80000000, 0x00000001);
	dumptest(0x00000001, 0x80000000);
	dumptest(0x80000001, 0x80000001);

	dumptest(0x00000000, 0x00000001);
	dumptest(0x00000001, 0x00000000);
	dumptest(0x00000001, 0x00000001);

	dumptest(0x02000000, 0x02000000);
	dumptest(0x82000000, 0x02000000);
	dumptest(0x02000000, 0x82000000);
	dumptest(0x82000000, 0x82000000);



	// Inf related corner tests
	dumptest(0x7f800000, 0xff800000);
	dumptest(0xff800000, 0x7f800000);
	dumptest(0xff800000, 0xff800000);

	dumptest(0x7f800000, 0x00000000);
	dumptest(0xff800000, 0x00000000);
	dumptest(0x00000000, 0xff800000);
	dumptest(0x00000000, 0x7f800000);

	dumptest(0x7f800000, 0x80000000);
	dumptest(0xff800000, 0x80000000);
	dumptest(0x80000000, 0xff800000);
	dumptest(0x80000000, 0x7f800000);

	// NaN related corner tests
	dumptest(0x7f800000, 0x7f800000);
	dumptest(0x7f800001, 0x7f800000);
	dumptest(0x7f800000, 0x7f800001);
	dumptest(0x7f800001, 0x7f800001);

	dumptest(0xff800000, 0x7f800000);
	dumptest(0xff800001, 0x7f800000);
	dumptest(0xff800000, 0x7f800001);
	dumptest(0xff800001, 0x7f800001);

	dumptest(0x7f800000, 0xff800000);
	dumptest(0x7f800001, 0xff800000);
	dumptest(0x7f800000, 0xff800001);
	dumptest(0x7f800001, 0xff800001);

	dumptest(0xff800000, 0xff800000);
	dumptest(0xff800001, 0xff800000);
	dumptest(0xff800000, 0xff800001);
	dumptest(0xff800001, 0xff800001);

	// Inf related corner tests
	dumptest(0x7f3fffff, 0x7f000000);
	dumptest(0x7f3fffff, 0x7f000000);



	dumptest(0x007fffff, 0x08000000);
	dumptest(0x007fffff, 0x07880000);
	dumptest(0x007fffff, 0x07f7ffff);
	dumptest(0x007fffff, 0x07900000);
	dumptest(0x007fffff, 0x07efffff);
	dumptest(0x007fffff, 0x07a00000);
	dumptest(0x007fffff, 0x07dfffff);
	dumptest(0x007fffff, 0x07c00000);
	dumptest(0x007fffff, 0x07bfffff);
	dumptest(0x007fffff, 0x08000000);
	dumptest(0x007fffff, 0x087fffff);
	dumptest(0x007fffff, 0x08000001);
	dumptest(0x007fffff, 0x087ffffe);
	dumptest(0x007fffff, 0x08000002);
	dumptest(0x007fffff, 0x087ffffd);
	dumptest(0x007fffff, 0x08000004);
	dumptest(0x007fffff, 0x08000004);
	dumptest(0x007fffff, 0x08000004);
	dumptest(0x007fffff, 0x08000004);
	dumptest(0x007fffff, 0x08000004);
	dumptest(0x007fffff, 0x08000004);
	dumptest(0x007fffff, 0x08000004);
	dumptest(0x007fffff, 0x08000004);
	dumptest(0x007fffff, 0x08000004);
	dumptest(0x007fffff, 0x08000004);
	

        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
	//	return 0;


        dumptest(0x01ffffff, 0x8dffdfff);
        dumptest(0x01ffffff, 0x8d804000);
        dumptest(0x01ffffff, 0x8dffbfff);
        dumptest(0x01ffffff, 0x8d808000);
        dumptest(0x01ffffff, 0x8dff7fff);
        dumptest(0x01ffffff, 0x8d810000);
        dumptest(0x01ffffff, 0x8dfeffff);
        dumptest(0x01ffffff, 0x8d820000);
        dumptest(0x01ffffff, 0x8dfdffff);
        dumptest(0x01ffffff, 0x8d840000);
        dumptest(0x01ffffff, 0x8dfbffff);
        dumptest(0x01ffffff, 0x8d880000);
        dumptest(0x01ffffff, 0x8df7ffff);
        dumptest(0x01ffffff, 0x8d900000);
        dumptest(0x01ffffff, 0x8defffff);
        dumptest(0x01ffffff, 0x8da00000);
        dumptest(0x01ffffff, 0x8ddfffff);
        dumptest(0x01ffffff, 0x8dc00000);
        dumptest(0x01ffffff, 0x8dbfffff);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e000000);
        dumptest(0x01ffffff, 0x8e7fffff);
        dumptest(0x01ffffff, 0x8e000001);
        dumptest(0x01ffffff, 0x8e7ffffe);
        dumptest(0x01ffffff, 0x8e000002);
        dumptest(0x01ffffff, 0x8e7ffffd);
        dumptest(0x01ffffff, 0x8e000004);
	//	return 0;


	quiet = 1;



	dumptest(0x007fffff, 0x08000000);
	dumptest(0x007fffff, 0x08000000);
	dumptest(0x007fffff, 0x08000000);
	dumptest(0x007fffff, 0x08000000);
	dumptest(0x007fffff, 0x08000000);
	dumptest(0x007fffff, 0x08000000);
	dumptest(0x007fffff, 0x08000000);
	dumptest(0x007fffff, 0x08000000);
	dumptest(0x007fffff, 0x08000000);
	dumptest(0x007fffff, 0x08000000);







	dumptest(0x01800000,0x8d7fbfff);
	dumptest(0x01800000,0x8d008000);
	dumptest(0x01800000,0x8d7f7fff);
	dumptest(0x01800000,0x8d010000);
	dumptest(0x01800000,0x8d7effff);
	dumptest(0x01800000,0x8d020000);
	dumptest(0x01800000,0x8d7dffff);
	dumptest(0x01800000,0x8d040000);
	dumptest(0x01800000,0x8d7bffff);
	dumptest(0x01800000,0x8d080000);
	dumptest(0x01800000,0x8d77ffff);
	dumptest(0x01800000,0x8d100000);
	dumptest(0x01800000,0x8d6fffff);
	dumptest(0x01800000,0x8d200000);
	dumptest(0x01800000,0x8d5fffff);
	dumptest(0x01800000,0x8d400000);
	dumptest(0x01800000,0x8d3fffff);
	dumptest(0x01800000,0x8d800000);
	dumptest(0x01800000,0x8dffffff);
	dumptest(0x01ffffff,0x8d7fdfff);
	dumptest(0x01ffffff,0x8d004000);
	dumptest(0x01ffffff,0x8d7fbfff);
	dumptest(0x01ffffff,0x8d008000);
	dumptest(0x01ffffff,0x8d7f7fff);
	dumptest(0x01ffffff,0x8d010000);
	dumptest(0x01ffffff,0x8d7effff);
	dumptest(0x01ffffff,0x8d020000);
	dumptest(0x01ffffff,0x8d7dffff);
	dumptest(0x01ffffff,0x8d040000);
	dumptest(0x01ffffff,0x8d7bffff);
	dumptest(0x01ffffff,0x8d080000);
	dumptest(0x01ffffff,0x8d77ffff);
	dumptest(0x01ffffff,0x8d100000);
	dumptest(0x01ffffff,0x8d6fffff);
	dumptest(0x01ffffff,0x8d200000);
	dumptest(0x01ffffff,0x8d5fffff);
	dumptest(0x01ffffff,0x8d400000);
	dumptest(0x01ffffff,0x8d3fffff);
	dumptest(0x01ffffff,0x8d800000);
	dumptest(0x01ffffff,0x8dffffff);
	dumptest(0x01ffffff,0x8d802000);
	dumptest(0x01ffffff,0x8dffdfff);
	dumptest(0x01ffffff,0x8d804000);
	dumptest(0x01ffffff,0x8dffbfff);
	dumptest(0x01ffffff,0x8d808000);
	dumptest(0x01ffffff,0x8dff7fff);
	dumptest(0x01ffffff,0x8d810000);
	dumptest(0x01ffffff,0x8dfeffff);
	dumptest(0x01ffffff,0x8d820000);
	dumptest(0x01ffffff,0x8dfdffff);
	dumptest(0x01ffffff,0x8d840000);
	dumptest(0x01ffffff,0x8dfbffff);
	dumptest(0x01ffffff,0x8d880000);
	dumptest(0x01ffffff,0x8df7ffff);
	dumptest(0x01ffffff,0x8d900000);
	dumptest(0x01ffffff,0x8defffff);
	dumptest(0x01ffffff,0x8da00000);
	dumptest(0x01ffffff,0x8ddfffff);
	dumptest(0x01ffffff,0x8dc00000);
	dumptest(0x01ffffff,0x8dbfffff);
	dumptest(0x01ffffff,0x8e000000);







	dumptest(0x01ffffff,0x8e000000);
	dumptest(0x01ffffff,0x8e000000);
	dumptest(0x01ffffff,0x8e000000);
	dumptest(0x01ffffff,0x8e000000);
	dumptest(0x01ffffff,0x8e000000);
	dumptest(0x01ffffff,0x8e000000);
	dumptest(0x01ffffff,0x8e000000);
	dumptest(0x01ffffff,0x8e000000);
	dumptest(0x01ffffff,0x8e000000);
	dumptest(0x01ffffff,0x8e000000);
	dumptest(0x01ffffff,0x8e000000);
	fprintf(stderr,"Calculating number of corner tests... (this may take a minute or so)\n");
	test_corners(0,0,0);
	test_corners_limit = test_corners_tests;
	test_corners_tests = 0;
	quiet = 0;
	test_corners(0,0,0);

	dumptest(0x007fffff, 0x08000000);

	dumptest(0x7e000000, 0xfe000000);
	dumptest(0x03800000, 0xfe000000);
	dumptest(0x7f7fffff, 0x7f7fffff);
	dumptest(0x7f7fffff, 0x72000001);
	dumptest(0x7f7fffff, 0x72000001);
	dumptest(0x7f7fffff, 0x72000001);
	dumptest(0x7f7fffff, 0x72000001);
	dumptest(0x7f7fffff, 0x72000001);
	dumptest(0x7f7fffff, 0x72000001);
	dumptest(0x7f7fffff, 0x72000001);
	dumptest(0x7f7fffff, 0x72000001);
	dumptest(0x7f7fffff, 0x72000001);
	dumptest(0x7f7fffff, 0x72000001);
	dumptest(0x7f7fffff, 0x72000001);
	dumptest(0x7f7fffff, 0x72000001);
	dumptest(0x7f7fffff, 0x72000001);
	dumptest(0x7f7fffff, 0x72000010);
	dumptest(0x7f7fffff, 0x72000100);
	dumptest(0x7f7fffff, 0x72001000);
	dumptest(0x7f7fffff, 0x72010000);
	dumptest(0x7f7fffff, 0x727fffff);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x7f7fffff, 0x73000000);
	dumptest(0x732f3653, 0x7f800001);
	dumptest(0x732f3653, 0x7f800001);
	dumptest(0x732f3653, 0x7f800001);
	dumptest(0x732f3653, 0x7f800001);
	dumptest(0x732f3653, 0x7f800001);
	dumptest(0x732f3653, 0x7f800001);
	dumptest(0x732f3653, 0x7f800001);
	dumptest(0x732f3653, 0x7f800001);
	dumptest(0x732f3653, 0x7f800001);
	dumptest(0x732f3653, 0x7f800001);

	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
	dumptest(0x732f3653, 0x7f7fffff);
        dumptest( 0x3e000001, 0x3dffffff);
        dumptest( 0x3e000001, 0x3dffffff);
        dumptest( 0x3e000001, 0x3dffffff);
        dumptest( 0x3e000001, 0x3dffffff);
        dumptest( 0x3e000001, 0x3dffffff);
        dumptest( 0x3e000001, 0x3dffffff);
        dumptest( 0x3e000001, 0x3dffffff);
        dumptest( 0x3e000001, 0x3dffffff);
        dumptest( 0x3e000001, 0x3dffffff);
        dumptest( 0x3e000001, 0x3dffffff);
        dumptest( 0x3e000001, 0x3dffffff);
        dumptest( 0x3e000001, 0x3dffffff);
        dumptest( 0x3e000001, 0x3dffffff);
        dumptest( 0x3e000001, 0x3dffffff);
        dumptest( 0x3e000001, 0x3e000000); 
        dumptest( 0x3e000001, 0x3e800000); 
        dumptest( 0x3e34fdf8, 0x3e92357d); 
        dumptest( 0x3e34fdf8, 0x3c000000); 
        dumptest( 0x3e34fdf8, 0x3c000001); 
        dumptest( 0x3e34fdf8, 0x3c000002); 
        dumptest( 0x3e34fdf8, 0x3c000003); 
        dumptest( 0x3e34fdf8, 0x3c000004); 
        dumptest( 0x3e34fdf8, 0x3c000005); 
        dumptest( 0x3e34fdf8, 0x3c000006); 
        dumptest( 0x3e34fdf8, 0x3c000007); 
        dumptest( 0x3e34fdf8, 0x3c000008); 
        dumptest( 0x3e34fdf8, 0x3c000009); 
        dumptest( 0x3e34fdf8, 0x3c00000a); 
        dumptest( 0x3e34fdf8, 0x3c00000b); 
        dumptest( 0x3e34fdf8, 0x3c00000c); 
        dumptest( 0x3e34fdf8, 0x3c00000d); 
        dumptest( 0x3e34fdf8, 0x3c00000e); 
        dumptest( 0x3e34fdf8, 0x3c00000f); 
        dumptest( 0x3e34fdf8, 0x3c000010); 
        dumptest( 0x3e34fdf8, 0x3c000011); 
        dumptest( 0x3e34fdf8, 0x3c000012); 
        dumptest( 0x3e34fdf8, 0x3c000013); 
        dumptest( 0x3e34fdf8, 0x3c000014); 

	unsigned int i;
	// Overflow test
	for(i=0x7F70AFA0; i != 0x80001000; i++){
		if((i % 10000) == 0){
			fprintf(stderr,"broken test...: %d\n", i);
		}
		dumptest(0x732F3653, i); // Randomly chosen constant
	}

	// 3e
        // 3a


	// Test for overflow at rounding time.
	for(i=0; i < 2048; i++){
		dumptest(0x3effbfff, 0x3a000000 + i);
	}

	for(i=0; i < 2048; i++){
		dumptest(0x3dffbfff, 0x39000000 + i);
	}
	for(i=0; i < 2048; i++){
		dumptest(0x3cffbfff, 0x38000000 + i);
	}
	for(i=0; i < 2048; i++){
		dumptest(0x3bffbfff, 0x37000000 + i);
	}
	for(i=0; i < 2048; i++){
		dumptest(0x3affbfff, 0x36000000 + i);
	}


	for(i=0; i < 2048; i++){
		dumptest(0x00000000 + i, 0x000800000 + 0);
	}

	for(i=0; i < 2048; i++){
		dumptest(0x00000000 + i, 0x000000001 + 0);
	}

	for(i=0; i < 2048; i++){
		dumptest(0x00000000 + i, 0x800000001 + 0);
	}

	for(i=0; i < 900000; i++){
		if((i % 10000) == 0){
			fprintf(stderr,"random really small numbers: %d\n", i);
		}
		dumptest((random() + random()) & 0x83ffffff, (random() + random()) & 0x83ffffff);
	}

	for(i=0; i < 300000; i++){
		if((i % 10000) == 0){
			fprintf(stderr,"random really large numbers: %d\n", i);
		}
		dumptest(0x7f000000 + ((random()+random()) & 0x80ffffff), 
			 0x7f000000 + ((random()+random()) & 0x80ffffff));
	}
	// Random tests...
	for(i=0; i < 30000000; i++){
		if((i % 10000) == 0){
			fprintf(stderr,"random numbers: %d\n", i);
		}
		dumptest(random() + random(), random() + random());
	}


	// Exhaustive test, one number.
	for(i=0; i != 0xffffffff; i++){
		if((i % 1000000) == 0){
			fprintf(stderr,"Exhaustive testing of constant + i: %d\n", i);
		}
		dumptest(0x732F3653, i); // Randomly chosen constant
	}

	fprintf(stderr,"Number of tests: %lld\n", num_tests);
	fprintf(stderr,"Number of subnormals ignored: %d\n",subnormals);
	return 0;
}

// 
// int main(int argc, char **argv)
// {
// 
//   test_add(a,b);
//   
//   return 0;
// }
