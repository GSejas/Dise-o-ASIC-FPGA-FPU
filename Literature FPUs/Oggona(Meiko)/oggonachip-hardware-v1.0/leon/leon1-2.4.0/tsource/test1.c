/* A simple program to test the Audio MDCT Core module
 *
 * @author Pattara Kiatisevi ott@linux.thai.net
 * 13.03.2002
 * 
 *
 * $Id: test1.c,v 1.1 2002/03/25 17:21:07 lazuara Exp $
 *
 */

#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include "mdct_core.h"

#define ARRAYSIZE 10

volatile struct mdct_core_regs *regs = (struct mdct_core_regs *) MDCT_CORE_START;

int main() {
  unsigned int *in, *out;
  unsigned int i;

  printf("MDCT Core test program started ..\n");
  printf("Initial control register is 0x%08X\n", regs->controlreg);
 

  printf("Allocate memory ...\n");
  in = (unsigned int *) malloc (ARRAYSIZE * sizeof(unsigned int));
  out = (unsigned int *) malloc (ARRAYSIZE * sizeof(unsigned int));

  
  printf("Initializing values of input array...\n");
  for (i = 0 ; i < ARRAYSIZE ; i++) {
    *(in + i) = 0;
    printf("Value at 0x%08X : %d \n", (unsigned int) in + i, i);
  }

  printf("Testing values stored as input array...\n");

  for (i = 0 ; i < ARRAYSIZE ; i++) {
    printf("Value at 0x%08X : %d \n",(unsigned int)in + i, *(in+i));
  }


  printf("Initial value of result array:\n");
 
  for (i = 0 ; i < ARRAYSIZE ; i++) {
    printf("Value at 0x%08X : %d \n",(unsigned int) out + i, *(out+i));
  }


  printf("Write value 0x%08X to start read address register ...\n", (unsigned int) in);
  regs->startreadaddr = (unsigned int) in;
  printf("startreadaddr register is 0x%08X\n", regs->startreadaddr);

  printf("Write value 0x%08X to start write address register ...\n", (unsigned int) out);
  regs->startwriteaddr = (unsigned int) out;
  printf("startwriteaddr is 0x%08X\n", regs->startwriteaddr);

  printf("Write value %d to array size register ...\n", ARRAYSIZE);
  regs->arraysize = ARRAYSIZE;
  printf("array size is 0x%08X\n", regs->arraysize);

  printf("Start the MDCT core .. \n");
  regs->controlreg = 0x1;
  printf("control register is 0x%08X\n", regs->controlreg);

  /* wait until result is there 
  printf("Wait until calculation is finished...\n");
  printf("act_mem_addr is 0x%08X\n", regs->actmemaddr);
  while ( regs->status != 1 ) {
    printf("act_mem_addr is 0x%08X\n", regs->actmemaddr);
    } */

  printf("act_mem_addr is 0x%08X\n", regs->actmemaddr);
  printf("Status register is 0x%08X\n", regs->status);
  printf("Finished ... output values:\n");
 
  for (i = 0 ; i < ARRAYSIZE ; i++) {
    printf("Value at 0x%08X : %d \n",(unsigned int) out + i, *(out+i));
  }


  return(0);
}





