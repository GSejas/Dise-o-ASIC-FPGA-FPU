#    IntTruncMultiplier wInX wInY ratio errorOrder limit maxTimeInMinutes sign

yes | flopoco	-frequency=400 -target=Virtex4 IntTruncMultiplier 40 40 0.9  40 1 2 0
yes | flopoco	-frequency=400 -target=Virtex4 IntTruncMultiplier 80 40 0.95 30 1 2 0
yes | flopoco	-frequency=400 -target=Virtex5 IntTruncMultiplier 80 40 0.95 60 1 2 0
yes | flopoco	-frequency=400 -target=Virtex5 IntTruncMultiplier 80 40 0.95 60 1 2 0

yes | flopoco	-frequency=400 -target=Virtex4 IntTruncMultiplier 40 40 0.9  40 1 2 1 
yes | flopoco	-frequency=400 -target=Virtex4 IntTruncMultiplier 80 40 0.95 30 1 2 1
yes | flopoco	-frequency=400 -target=Virtex5 IntTruncMultiplier 80 40 0.95 60 1 2 1
yes | flopoco	-frequency=400 -target=Virtex5 IntTruncMultiplier 80 40 0.95 60 1 2 1
