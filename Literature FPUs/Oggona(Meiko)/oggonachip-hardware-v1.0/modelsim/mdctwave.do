onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/rst
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/clk
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/apbi
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/apbo
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/ahbi
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/ahbo
add wave -noupdate -format Logic /tbleon/tb/p0/leon0/mcore0/mdct0/irq
add wave -noupdate -format Literal -expand /tbleon/tb/p0/leon0/mcore0/mdct0/r
add wave -noupdate -format Literal /tbleon/tb/p0/leon0/mcore0/mdct0/rin
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {70863 ns}
WaveRestoreZoom {69208 ns} {71409 ns}
configure wave -namecolwidth 113
configure wave -valuecolwidth 277
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
