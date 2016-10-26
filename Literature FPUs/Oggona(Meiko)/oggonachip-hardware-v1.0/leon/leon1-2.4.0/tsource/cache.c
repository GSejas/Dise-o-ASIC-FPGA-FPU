#include "leon.h"
#include "test.h" 

#define CCTRL_IFP (1<<15)
#define CCTRL_DFP (1<<14)



asm("
	.align 64
	.global _line1, _line2, _line3
	.global line1, line2, line3
_line1:
line1:
	nop; nop; nop; nop; nop; nop; retl; nop;
_line2:
line2:
	nop; nop; nop; nop; nop; nop; retl; nop;
_line3:
line3:
	nop; nop; nop; nop; nop; nop; retl; nop;
");

flush()
{
	asm(" flush");
}

chkitags(i,j,k,l)
int i,j,k,l;
{
	asm("

1:
	lda	[%o0] 0xc, %o2
	subcc	%o0, %o1, %o0
	bge	1b
	or	%o2, %o3, %o3
	mov	%o3, %o0

	");
}

chkdtags(i,j,k,l)
int i,j,k,l;
{
	asm("

1:
	lda	[%o0] 0xe, %o2
	subcc	%o0, %o1, %o0
	bge	1b
	or	%o2, %o3, %o3
	mov	%o3, %o0

	");
}

getitag(addr) int addr; { asm(" lda	[%o0] 0xc, %o0 "); }
setitag(addr,data) int *addr,data; { asm(" sta	%o1, [%o0] 0xc "); }

getidata(addr) int addr; { asm(" lda	[%o0] 0xd, %o0 "); }
setidata(addr,data) int *addr,data; { asm(" sta	%o1, [%o0] 0xd "); }

getdtag(addr) int addr; { asm(" lda	[%o0] 0xe, %o0 "); }
setdtag(addr,data) int addr,data; { asm(" sta	%o1, [%o0] 0xe "); }

getddata(addr) int *addr; { asm(" lda	[%o0] 0xf, %o0 "); }
setddata(addr,data) int *addr,data; { asm(" sta	%o1, [%o0] 0xf "); }

setudata(addr,data) int *addr,data; { asm(" sta	%o1, [%o0] 0x0 "); }
getudata(addr) int addr; { asm(" lda	[%o0] 0x0, %o0 "); }

flushi(addr,data) int *addr,data; { asm(" sta	%g0, [%g0] 0x5 "); }
flushd(addr,data) int *addr,data; { asm(" sta	%g0, [%g0] 0x6 "); }

extern line1();
extern line2();
extern line3();

#define ITAGMASK ((1<<ILINESZ)-1)
#define DTAGMASK ((1<<DLINESZ)-1)

cache_test()
{
	volatile double mrl[8192 + 8]; /* enough for 64 K caches */
	volatile int mrx[16];
	volatile double *ll = (double *) mrx;
        volatile struct lregs *lr = (struct lregs *) PREGS;
	volatile int *msg = (volatile int *) IOAREA;
	extern volatile char irqtbl[];
	volatile int *mr = (int *) mrl;
	volatile unsigned char *mrc = (char *) mrl;
	volatile unsigned short *mrh = (short *) mrl;
	int i; 
	int ITAGS, DTAGS;
	int ILINESZ, DLINESZ;
	int ITAG_BITS, ILINEBITS, DTAG_BITS, DLINEBITS;
	int IVALMSK, leonconf, DTAGAMSK;

	report(CACHE_TEST);
	lr->cachectrl &= ~0x0f;
	while(lr->cachectrl & (CCTRL_IFP | CCTRL_DFP)) {} 
	flush();
	while(lr->cachectrl & (CCTRL_IFP | CCTRL_DFP)) {} 
	lr->cachectrl |= 0x0f;

	leonconf = lr->leonconf;
	ILINEBITS = (leonconf >> 15) & 3;
	DLINEBITS = (leonconf >> 10) & 3;
	ITAG_BITS = ((leonconf >> 17) & 7) + 8 - ILINEBITS;
	DTAG_BITS = ((leonconf >> 12) & 7) + 8 - DLINEBITS;
	ITAGS = (1 << ITAG_BITS);
	ILINESZ = (1 << ILINEBITS);
	DTAGS = (1 << DTAG_BITS);
	DLINESZ = (1 << DLINEBITS);
//	IVALMSK = (0x03 << ((((int)line2)>>2)&(ILINESZ-1)));
	IVALMSK = (1 << ILINESZ)-1;
	DTAGAMSK = 0x7fffffff - (1 << (DTAG_BITS + DLINEBITS +2)) + 1;

	/**** INSTRUCTION CACHE TESTS ****/

	/* check that tag is not valid */
	if ((getitag(line2) & IVALMSK) != 0) fail(1);
	line1();
	line2();
	line3();
	/* check that all valid bits are set */
	if ((getitag((int *) line2) & IVALMSK) != IVALMSK) fail(2);

	if ((lr->cachectrl >> CPP_CONF_BIT) & CPP_CONF_MASK) { 
	  lr->cachectrl &= ~0x3fc0;
	/* idata parity test */
	  lr->cachectrl |= CPTE_MASK;
	  setidata((int *)line2,0);
	  line2();
	  if (((lr->cachectrl >> IDE_BIT) & 3) != 1) fail(3);
	  
	/* itag parity test */
	  setitag((int *)line2,
	  	getitag((int *)line2) & ~(3<<8));
	  lr->cachectrl &= ~CPTE_MASK;
	  setidata((int *)line2,0);
	  line2();
	  if (((lr->cachectrl >> ITE_BIT) & 3) != 1) fail(4);
	}

	/**** DATA CACHE TESTS ****/

	setdtag(((int) mr) &  ~DTAGAMSK, 0); /* clear tag */
	mr[0] = 5; mr[1] = 1; mr[2] = 2; mr[3] = 3;
	
	/* check that write does not allocate line */
	if (((getdtag(&mr[0]) & DTAGMASK) != 0) || (getudata(&mr[0]) != 5))
		fail(5);

	/* check that line was allocated by getudata */
	if ((getdtag(&mr[0]) & DTAGMASK) == 0) fail(6);

	/* check that data is in cache */
	if (getddata(&mr[0]) != 5) fail(7);
	*ll = mrl[0];
	if ((mrx[0] != 5) || (mrx[1] != 1)) fail(8);
	if (getddata(&mr[1]) != 1) fail(9);

	if ((lr->cachectrl >> CPP_CONF_BIT) & CPP_CONF_MASK) {
	  lr->cachectrl &= ~CE_CLEAR;
	/* ddata parity test */
	  setddata(&mrx[0],0);
	  lr->cachectrl |= CPTE_MASK;
	  setddata((int *)mrx,mrx[0]);
	  if (mrx[0] != 5) fail(10);
	  if (((lr->cachectrl >> DDE_BIT) & 3) != 1) fail(11);
	/* dtag parity test */
	  lr->cachectrl &= ~CPTE_MASK;
	  setddata(&mrx[0],0);
	  lr->cachectrl |= CPTE_MASK;
	  while (!(lr->cachectrl & CPTE_MASK)) {}; /* avoid race condition */
	  setdtag((int *)mrx,(1 << DLINESZ)-1);
	  lr->cachectrl &= ~CPTE_MASK;
	  while (lr->cachectrl & CPTE_MASK) {}; /* avoid race condition */
	  if (mrx[0] != 5) fail(12);
	  if (getddata(&mr[0]) != 5) fail(13);
	  if (((lr->cachectrl >> DTE_BIT) & 3) != 1) fail(14);
	  if ((getdtag(mrx) & DTAGMASK) != (1 <<((((int) mrx)>>2)&(DLINESZ-1)))) 
		fail(15);
	}

	/* check that tag is properly replaced */
	mr[0] = 5; mr[1] = 1; mr[2] = 2; mr[3] = 3;
	mr[DTAGS*DLINESZ] = 6;
	/* check that tag is not evicted on write miss */
	if ((getdtag(mrx) & DTAGAMSK) != (((int) mrx)&DTAGAMSK))
		fail(16);
	/* check that write update memory ok */
	if (mr[DTAGS*DLINESZ] != 6) fail(17);
	/* check that tag has been replaced */
	if ((getdtag(mr) & DTAGAMSK) != (((int) &mr[DTAGS*DLINESZ])&DTAGAMSK))
		fail(18);
	/* check that valid bits have been reset */
	if ((getdtag(mr) & DTAGMASK) != (1 <<((((int) mr)>>2)&(DLINESZ-1)))) 
		fail(19);

	/* check partial word access */

	mr[8] = 0x01234567;
	mr[9] = 0x89abcdef;
	if (mrc[32] != 0x01) fail(26);
	if (mrc[33] != 0x23) fail(27);
	if (mrc[34] != 0x45) fail(28);
	if (mrc[35] != 0x67) fail(29);
	if (mrc[36] != 0x89) fail(30);
	if (mrc[37] != 0xab) fail(31);
	if (mrc[38] != 0xcd) fail(32);
	if (mrc[39] != 0xef) fail(33);
	if (mrh[16] != 0x0123) fail(34);
	if (mrh[17] != 0x4567) fail(35);
	if (mrh[18] != 0x89ab) fail(36);
	if (mrh[19] != 0xcdef) fail(37);
	mrc[32] = 0x30; if (mr[8] != 0x30234567) fail(39);
	mrc[33] = 0x31; if (mr[8] != 0x30314567) fail(40);
	mrc[34] = 0x32; if (mr[8] != 0x30313267) fail(41);
	mrc[35] = 0x33; if (mr[8] != 0x30313233) fail(42);
	mrc[36] = 0x34; if (mr[9] != 0x34abcdef) fail(43);
	mrc[37] = 0x35; if (mr[9] != 0x3435cdef) fail(44);
	mrc[38] = 0x36; if (mr[9] != 0x343536ef) fail(45);
	mrc[39] = 0x37; if (mr[9] != 0x34353637) fail(46);
	mrh[16] = 0x4041; if (mr[8] != 0x40413233) fail(47);
	mrh[17] = 0x4243; if (mr[8] != 0x40414243) fail(48);
	mrh[18] = 0x4445; if (mr[9] != 0x44453637) fail(49);
	mrh[19] = 0x4647; if (mr[9] != 0x44454647) fail(50);


	/* check flush operation */
	/* check that flush clears valid bits */
	/*
	lr->cachectrl &= ~0x0f; 
	flushi();
	while(lr->cachectrl & CCTRL_IFP ) {} 
	
	if (chkitags(ITAG_MAX_ADDRESS,(1<<(ILINEBITS + 2)),0,0) & ((1<<ILINESZ)-1))
		fail(51);

	for (i

	lr->cachectrl |= 0x03; 
	flushd();
	while(lr->cachectrl & CCTRL_DFP) {}

	if (chkdtags(DTAG_MAX_ADDRESS,(1<<(DLINEBITS + 2)),0,0) & ((1<<DLINESZ)-1)) 
		fail(52);
	*/
	
	flush();
	lr->cachectrl |= 0x0f;        /* enable icache $ dcache */


/* to be tested: diag access during flush, diag byte/halfword access,
   write error, cache freeze operation */

}

