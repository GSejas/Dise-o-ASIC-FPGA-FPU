#   FPConstDiv wE wF const
#   FPConstDivExpert wE wF const exp alpha
#   also tests IntConstDiv

flopoco FPConstDiv 11 52 3 
flopoco FPConstDiv 8 23 5
flopoco FPConstDivExpert 8 23 7 -5 -1
flopoco FPConstDivExpert 8 23 7 5 -1
