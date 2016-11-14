PIC_LD=ld

ARCHIVE_OBJS=
ARCHIVE_OBJS += _14815_archive_1.so
_14815_archive_1.so : archive.1/_14815_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_14815_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_14815_archive_1.so $@






%.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<
CU_UDP_OBJS = \
objs/udps/D2wHf.o objs/udps/U7Vwg.o objs/udps/uYEPC.o objs/udps/vCfas.o objs/udps/CjLsY.o  \
objs/udps/IEZrF.o objs/udps/i2VqJ.o objs/udps/AubIW.o objs/udps/sk4QJ.o objs/udps/exIG1.o  \
objs/udps/gSqMj.o objs/udps/Cpxa2.o 

CU_LVL_OBJS = \
SIM_l.o 

MAIN_OBJS = \
amcQwB.o objs/amcQw_d.o 

CU_OBJS = $(MAIN_OBJS) $(ARCHIVE_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

