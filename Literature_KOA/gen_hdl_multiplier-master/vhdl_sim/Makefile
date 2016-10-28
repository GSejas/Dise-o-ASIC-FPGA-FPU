
GHDL = ghdl

TESTS = smul_4_4 smul_7_8 smul_8_8 smul_10_11 smul_4_12 smul_18_18 smul_19_24

tb: tb.o smul_lib.o $(patsubst %,%.o,$(TESTS))
	$(GHDL) -e tb

tb.o: tb.vhdl smul_lib.o $(patsubst %,%.o,$(TESTS))

smul_%.o: smul_%.vhdl smul_lib.o

%.o: %.vhdl
	$(GHDL) -a $<

smul_lib.vhdl: ../genmul.py
	python ../genmul.py --lang=vhdl --lib > smul_lib.vhdl

$(patsubst %,%.vhdl,$(TESTS)): ../genmul.py
	python ../genmul.py --lang=vhdl --nolib 4 4 0   > smul_4_4.vhdl
	python ../genmul.py --lang=vhdl --nolib 7 8 0   > smul_7_8.vhdl
	python ../genmul.py --lang=vhdl --nolib 8 8 0   > smul_8_8.vhdl
	python ../genmul.py --lang=vhdl --nolib 10 11 0 > smul_10_11.vhdl
	python ../genmul.py --lang=vhdl --nolib 4 12 1  > smul_4_12.vhdl
	python ../genmul.py --lang=vhdl --nolib 18 18 2 > smul_18_18.vhdl
	python ../genmul.py --lang=vhdl --nolib 19 24 1 > smul_19_24.vhdl

.PHONY: clean
clean:
	$(GHDL) --clean
	$(RM) -- work-obj93.cf

