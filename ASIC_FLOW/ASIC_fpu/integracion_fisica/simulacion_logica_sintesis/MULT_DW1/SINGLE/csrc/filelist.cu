PIC_LD=ld

ARCHIVE_OBJS=
ARCHIVE_OBJS += _30116_archive_1.so
_30116_archive_1.so : archive.10/_30116_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_30116_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_30116_archive_1.so $@






%.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<
CU_UDP_OBJS = \
objs/udps/U7Vwg.o objs/udps/exIG1.o 

CU_LVL_OBJS = \
SIM_l.o 

MAIN_OBJS = \
amcQwB.o objs/amcQw_d.o 

CU_OBJS = $(MAIN_OBJS) $(ARCHIVE_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

