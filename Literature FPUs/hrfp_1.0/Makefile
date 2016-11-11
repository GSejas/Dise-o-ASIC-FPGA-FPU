MULTDEFS=-gPIPELINESTAGES=6 -gISMULT=1
ADDDEFS=-gPIPELINESTAGES=5 -gISMULT=0
BATCH?=-c
XILINX=/sw/xilinx/ise_13.2i/ISE_DS/ISE

# For the FPGEN testsuite from IBM (the .fptest-files needs to be downloaded separately from IBM)
TEST=cat fpgen_testsuite/*.fptest | python fpgen_testsuite/test.py | grep ADD: | cut -d ' ' -f 2-
MULTTEST=cat fpgen_testsuite/*.fptest | python fpgen_testsuite/test.py | grep MUL: | cut -d ' ' -f 2-

# For my (much slower) testsuite, enable this instead: (might trigger
# a few conditions that the FPGEN test-suite doesn't cover as it is more exhaustive):
#TEST=SoftFloat-2b/softfloat/bits64/386-Win32-GCC/a.out
#MULTTEST=$(TEST) -mult


help:
	@echo 
	@echo Testbench related targets
	@echo '  'make addpipe:  Check that the adder is working correctly
	@echo '  'make multpipe:  Check that the multiplier is working correctly
	@echo '  'make installsoftfloat: Download, unpack and install the softfloat based testbench
	@echo
	@echo '  Note that you need to modify the Makefile depending on whether '
	@echo '  you want to use the FPGEN based testsuite from IBM or the SoftFloat'
	@echo '  based testsuite included in this distribution'
	@echo
	@echo Synthesis/PAR related:
	@echo '   'make synthwrapk7: Synthesize the adder for speed in a Kintex-7
	@echo '   'make synthk7: Synthesize the adder for area in a Kintex-7 '(Please ensure that you enable the ugly IDDR hack in adder.v if you want feasible area results (or fix the timing constraints, whichever you find easiest...))'
	@echo '   'make synthmultwrapk7: Synthesize the multiplier for speed in a kintex-7
	@echo '   'make synthmultk7: Synthesize the multiplier for area in a kintex-7 '(Please ensure that you enable the ugly IDDR hack in mult.v if you want feasible area results (or fix the timing constraints, whichever you find easiest...))'
	@echo '   'make mult27test: Run testbench for restricted integer 27x27 bit multiplier used in the HRFP_16 multiplier
	@echo
	@echo '   'Xilinx tools are expected to be in $(XILINX)
	@echo '   'If this is not correct, change the XILINX variable in the Makefile


installsoftfloat:
	echo  'FIXME: This is really ugly and shold be made to work a bit better...'
	rm -rf SoftFloat-2b
	rm -rf SoftFloat-2b.zip
	wget http://www.jhauser.us/arithmetic/SoftFloat-2b.zip
	unzip SoftFloat-2b.zip
	@echo 
	@echo 'Installing the test vector generator in the soft float directory (this is the ugly part)'
	@echo 
	cp softfloat/test.c SoftFloat-2b/softfloat/bits64/386-Win32-GCC/
	cp softfloat/Makefile SoftFloat-2b/softfloat/bits64/386-Win32-GCC/
	@echo TODO: Verify functionality with latest version of SoftFloat

all: input.txt
	iverilog tb.v adder.v hrfp_compare.v hrfp_swap.v hrfp_align.v hrfp_add.v hrfp_normalize.v hrfp_round.v -o tb
	./tb

work: 
	vlib work

# Old stuff, not used anymore. input.txt is a pipe nowadays.
input.txt: SoftFloat-2b/softfloat/bits64/386-Win32-GCC/test.c
	make -C SoftFloat-2b/softfloat/bits64/386-Win32-GCC test
	rm -f input.txt
	$(TEST)  > input.txt

# Old stuff, not used any more
allvsim: input.txt work
	vlog tb.v adder.v hrfp_compare.v  hrfp_swap.v hrfp_align.v hrfp_add.v hrfp_normalize.v hrfp_round.v
	vsim $(BATCH) tb -do 'run -all;quit -f'


addpipe: work
	make -C SoftFloat-2b/softfloat/bits64/386-Win32-GCC test
	rm -f input.txt
	mkfifo input.txt
	$(TEST) > input.txt &
	vlog -O5 $(XILINX)/verilog/src/unisims/LUT*.v
	vlog -O5 $(XILINX)/verilog/src/unisims/CARRY*.v
	vlog -O5 -cover bcst tb.v adder.v hrfp_compare.v  hrfp_swap.v hrfp_align.v hrfp_add.v hrfp_xilinx_normalize.v hrfp_round.v mult.v
	rm -rf covrep
	vsim -coverage $(BATCH) $(ADDDEFS) -c tb -do 'run -all;coverage report -html -htmldir covrep;quit -f'

# Not sure if this work any more...
addpipe_icarus: work
	make -C SoftFloat-2b/softfloat/bits64/386-Win32-GCC test
	rm -f input.txt
	mkfifo input.txt
	$(TEST) > input.txt &
	iverilog -DICARUS $(XILINX)/verilog/src/unisims/LUT*.v tb.v adder.v hrfp_compare.v  hrfp_swap.v hrfp_align.v hrfp_add.v hrfp_xilinx_normalize.v hrfp_round.v mult.v
	./a.out

addpipe_debug: work
	make -C SoftFloat-2b/softfloat/bits64/386-Win32-GCC test
	rm -f input.txt
	mkfifo input.txt
	$(TEST) > input.txt &
	vlog -O5 $(XILINX)/verilog/src/unisims/CARRY*.v
	vlog -O5 $(XILINX)/verilog/src/unisims/LUT*.v
	vlog +define+DEBUG -O5 tb.v adder.v hrfp_compare.v  hrfp_swap.v hrfp_align.v hrfp_add.v hrfp_xilinx_normalize.v hrfp_round.v 
	vsim $(BATCH) $(ADDDEFS) -c tb -do 'run -all;quit -f'



multpipe: work
	make -C SoftFloat-2b/softfloat/bits64/386-Win32-GCC test
	rm -f input.txt
	mkfifo input.txt
	$(MULTTEST)  > input.txt &
	vlog -O5 $(XILINX)/verilog/src/unisims/LUT*.v $(XILINX)/verilog/src/unisims/FD*.v 
	vlog -O5 $(XILINX)/verilog/src/unisims/DSP48A1.v $(XILINX)/verilog/src/glbl.v
	vlog -cover  bcst  +acc -O5 tb.v mult.v hrfp_mult_createroundvectors.v hrfp_mult_rounding.v mult_35x35.v hrfp_mult_detect_round_overflow.v  mult_27x27.v hrfp_mult_round_final.v hrfp_mult_normalize.v 
	vsim $(BATCH) -coverage $(MULTDEFS) tb glbl -do 'run -all;coverage report -html -htmldir covrep;quit -f'

multpipe_icarus: work
	make -C SoftFloat-2b/softfloat/bits64/386-Win32-GCC test
	rm -f input.txt
	mkfifo input.txt
	$(MULTTEST)  > input.txt &
	iverilog -DICARUS 	 $(XILINX)/verilog/src/unisims/LUT*.v  $(XILINX)/verilog/src/unisims/DSP48A1.v $(XILINX)/verilog/src/glbl.v tb.v mult.v hrfp_mult_createroundvectors.v hrfp_mult_rounding.v mult_35x35.v hrfp_mult_detect_round_overflow.v hrfp_mult_normalize.v
	./a.out

multpipe_debug: work
	make -C SoftFloat-2b/softfloat/bits64/386-Win32-GCC test
	rm -f input.txt
	mkfifo input.txt
	$(MULTTEST)  > input.txt &
	vlog -O5 $(XILINX)/verilog/src/unisims/LUT*.v
	vlog +define+DEBUG -cover bcst -O5 +acc tb.v mult.v hrfp_mult_createroundvectors.v hrfp_mult_rounding.v hrfp_mult_detect_round_overflow.v hrfp_mult_normalize.v
	vsim $(BATCH) -coverage $(MULTDEFS) tb glbl -do 'log -r *; run -all;coverage report -html -htmldir covrep'



synthwrap:
	bash xil_synt_test.sh adder_wrapper.v adder.v hrfp_compare.v  hrfp_swap.v hrfp_align.v hrfp_add.v hrfp_xilinx_normalize.v hrfp_round.v test.ucf

synthwrapk7:
	PART=xc7k70t-1-fbg676  bash xil_synt_test.sh adder_wrapper.v adder.v hrfp_compare.v  hrfp_swap.v hrfp_align.v hrfp_add.v hrfp_xilinx_normalize.v hrfp_round.v testv7.ucf

synth:
	bash xil_synt_test.sh  adder.v hrfp_compare.v  hrfp_swap.v hrfp_align.v hrfp_add.v hrfp_xilinx_normalize.v hrfp_round.v test.ucf

synthk7:
#	PART=xc7k70t-1-fbg484 bash xil_synt_test.sh  adder.v hrfp_compare.v  hrfp_swap.v hrfp_align.v hrfp_add.v hrfp_xilinx_normalize.v hrfp_round.v test.ucf
	PART=xc7k70t-1-fbg484 bash xil_synt_test.sh  adder.v hrfp_compare.v  hrfp_swap.v hrfp_align.v hrfp_add.v hrfp_xilinx_normalize.v hrfp_round.v


area_k7:
	rm -rf testsynthdir*
	for i in hrfp_compare.v hrfp_swap.v hrfp_align.v hrfp_add.v hrfp_xilinx_normalize.v hrfp_round.v;do PART=xc7k70t-1-fbg484 bash xil_synt_test.sh $$i;mv testsynthdir testsynthdir-$$i;done
	grep 'Slice LUTs' testsynthdir-*/*.mrp

areamult_k7:
	rm -rf testsynthdir*
	for i in hrfp_mult_createroundvectors.v hrfp_mult_rounding.v mult_27x27.v hrfp_mult_detect_round_overflow.v hrfp_mult_round_final.v hrfp_mult_normalize.v;do PART=xc7k70t-1-fbg484 bash xil_synt_test.sh $$i;mv testsynthdir testsynthdir-$$i;done
	grep 'Slice LUTs' testsynthdir-*/*.mrp




synthmultwrap:
	bash xil_synt_test.sh mult_wrapper.v mult.v test.ucf  hrfp_mult_createroundvectors.v hrfp_mult_rounding.v mult_35x35.v hrfp_mult_detect_round_overflow.v hrfp_mult_normalize.v

synthmult:
	bash xil_synt_test.sh mult.v test.ucf  hrfp_mult_createroundvectors.v hrfp_mult_rounding.v mult_35x35.v hrfp_mult_detect_round_overflow.v hrfp_mult_round_final.v hrfp_mult_normalize.v

synthmultwrapk7:
	PART=xc7k70t-1-fbg484 bash xil_synt_test.sh mult_wrapper.v mult.v testv7.ucf  hrfp_mult_createroundvectors.v hrfp_mult_rounding.v mult_35x35.v hrfp_mult_detect_round_overflow.v mult_27x27.v hrfp_mult_round_final.v hrfp_mult_normalize.v

synthmultk7:
	PART=xc7k70t-1-fbg484 bash xil_synt_test.sh  mult.v test.ucf  hrfp_mult_createroundvectors.v hrfp_mult_rounding.v mult_27x27.v hrfp_mult_detect_round_overflow.v hrfp_mult_round_final.v hrfp_mult_normalize.v


multtest:
	vlog +acc tb_mult_35x35.v mult_35x35.v
	vlog -O5 $(XILINX)/verilog/src/unisims/DSP48A1.v $(XILINX)/verilog/src/glbl.v
	vsim -c tb_mult_35x35 glbl -do 'run -a;quit -f'



mult27test:
	vlog +acc tb_mult_27x27.v mult_27x27.v
	vlog -O5 $(XILINX)/verilog/src/unisims/DSP48E1.v $(XILINX)/verilog/src/glbl.v
	vsim -c tb_mult_27x27 glbl -do 'run -a;quit -f'

clean:
	@echo
	@echo 'FIXME: Implement this target :('
	@echo
	@false

