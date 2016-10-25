#testing LeadingZeroCounting

flopoco -target=Virtex4 -frequency=400 LZOC 55
flopoco -target=Virtex4 -frequency=400 LZOCShifter 79 45
flopoco -target=Virtex5 -frequency=500 LZCShifter 34 45
flopoco -target=Virtex5 -frequency=500 LOCShifter 12 8
flopoco -target=Virtex5 -frequency=500 LZOCShifterSticky 79 45
flopoco -target=Virtex4 -frequency=400 LZCShifterSticky 24 18
flopoco -target=Virtex4 -frequency=400 LOCShifterSticky 22 56
