onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Amba wrapper}
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/rst
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/clk
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/apbi
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/apbo
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/ahbi
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/ahbo
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/irq
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/r
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/rin
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/ctrlcon
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/dataready
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/dmaoutdata
add wave -noupdate -divider Control
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/stateclk
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/rst
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/clk
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/cu/regs
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/dataready
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/cu/smctrl
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/rst
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/clk
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/cu/r_ctrl
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/cu/dataready
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/result
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/smctrl
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/bufout
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ao_in
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ao_bufin
add wave -noupdate -format Literal -radix decimal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/cu/ao_out
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/r0
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/r1
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/r0
add wave -noupdate -format Literal -radix decimal /tbleon/tb/p0/leon0/mcore0/mdct0/cu/r1
add wave -noupdate -divider Arithmetic
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/irqctrl0/rst
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/irqctrl0/clk
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/irqctrl0/apbi
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/irqctrl0/apbo
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/irqctrl0/irqi
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/irqctrl0/irqo
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/irqctrl0/ir
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/irqctrl0/irin
add wave -noupdate -divider ddm
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/ddm0/rst
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/ddm0/clk
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/ddm0/apbi
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/ddm0/apbo
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/ddm0/ahbi
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/ddm0/ahbo
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/ddm0/ddmi
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/ddm0/ddmo
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/ddm0/irq
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/ddm0/r
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/ddm0/rin
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/ddm0/timerout
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/ddm0/timerin
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {39465 ns}
WaveRestoreZoom {36513 ns} {43853 ns}
configure wave -namecolwidth 132
configure wave -valuecolwidth 270
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
