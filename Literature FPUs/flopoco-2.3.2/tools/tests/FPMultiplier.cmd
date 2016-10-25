#         FPMultiplier wE wF_in wF_out

flopoco FPMultiplier 8 23 23
flopoco FPMultiplier 8 23 52
flopoco FPMultiplier 11 52 23

flopoco -target=StratixII FPMultiplier 8 23 23
flopoco -target=StratixII FPMultiplier 8 23 52
flopoco -target=StratixII FPMultiplier 11 52 23
