// file = 0; split type = patterns; threshold = 100000; total count = 0.
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

scalar dummyScalar;
scalar fScalarIsForced=0;
scalar fScalarIsReleased=0;
scalar fScalarHasChanged=0;
scalar fForceFromNonRoot=0;
scalar fNettypeIsForced=0;
scalar fNettypeIsReleased=0;
void  hsG_0 (struct dummyq_struct * I1062, EBLK  * I1063, U  I635);
void  hsG_0 (struct dummyq_struct * I1062, EBLK  * I1063, U  I635)
{
    U  I1292;
    U  I1293;
    U  I1294;
    struct futq * I1295;
    I1292 = ((U )vcs_clocks) + I635;
    I1294 = I1292 & ((1 << fHashTableSize) - 1);
    I1063->I682 = (EBLK  *)(-1);
    I1063->I686 = I1292;
    if (I1292 < (U )vcs_clocks) {
        I1293 = ((U  *)&vcs_clocks)[1];
        sched_millenium(I1062, I1063, I1293 + 1, I1292);
    }
    else if ((peblkFutQ1Head != ((void *)0)) && (I635 == 1)) {
        I1063->I687 = (struct eblk *)peblkFutQ1Tail;
        peblkFutQ1Tail->I682 = I1063;
        peblkFutQ1Tail = I1063;
    }
    else if ((I1295 = I1062->I1022[I1294].I699)) {
        I1063->I687 = (struct eblk *)I1295->I698;
        I1295->I698->I682 = (RP )I1063;
        I1295->I698 = (RmaEblk  *)I1063;
    }
    else {
        sched_hsopt(I1062, I1063, I1292);
    }
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
