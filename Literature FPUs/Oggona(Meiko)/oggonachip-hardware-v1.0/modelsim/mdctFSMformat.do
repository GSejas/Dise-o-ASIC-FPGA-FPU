onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Amba wrapper}
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/rst
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/clk
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/apbi
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/apbo
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/ahbi
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/ahbo
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/irq
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/r
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/rin
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/ctrlcon
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/dataready
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/dmaoutdata
add wave -noupdate -divider Control
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/rst
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/clk
add wave -noupdate -format Logic -label .ready /tbleon/tb/p0/leon0/mcore0/mdct0/cu/regs.ready
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/cu/regs
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/dataready
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/dataout
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/cu/smctrl
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/in_ctrl
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ports
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ready
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ma0
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ma1
add wave -noupdate -format Literal -radix decimal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ad
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/r0
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/r1
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/r2
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/r3
add wave -noupdate -format Literal -radix hexadecimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/irfaddr
add wave -noupdate -format Literal -radix hexadecimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/orfaddr
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/j
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/tmp
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/xaddr
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/irfaddr
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/orfaddr
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/w0
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/w1
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/loops
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/trig
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/trigint
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/i
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/j
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/stages
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/bitrf
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/split
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ctrl_p/btfgen
add wave -noupdate -divider Arithmetic
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ma_0/rst
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ma_0/clk
add wave -noupdate -format Literal -radix decimal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ma_0/datain
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ma_0/dataout
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ma_1/rst
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ma_1/clk
add wave -noupdate -format Literal -radix decimal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ma_1/datain
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ma_1/dataout
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ad_0/rst
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ad_0/clk
add wave -noupdate -format Literal -radix decimal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ad_0/datain
add wave -noupdate -format Literal -radix decimal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ad_0/dataout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {25888 ns}
WaveRestoreZoom {24741 ns} {27517 ns}
configure wave -namecolwidth 132
configure wave -valuecolwidth 226
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
