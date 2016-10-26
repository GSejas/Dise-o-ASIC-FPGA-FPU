
boot.exe:     file format elf32-sparc

Disassembly of section .text:

00000000 <_hardreset>:
   0:	81 d8 20 00 	flush  %g0
   4:	03 00 00 04 	sethi  %hi(0x1000), %g1
   8:	82 10 60 c0 	or  %g1, 0xc0, %g1	! 10c0 <_endtext+0xe80>
   c:	81 88 40 00 	mov  %g1, %psr
  10:	81 90 00 00 	mov  %g0, %wim
  14:	81 98 00 00 	mov  %g0, %tbr
  18:	81 80 00 00 	mov  %g0, %y
  1c:	01 00 00 00 	nop 
  20:	0f 20 00 00 	sethi  %hi(0x80000000), %g7
  24:	03 00 00 40 	sethi  %hi(0x10000), %g1
  28:	82 10 60 0f 	or  %g1, 0xf, %g1	! 1000f <_endtext+0xfdcf>
  2c:	c2 21 e0 14 	st  %g1, [ %g7 + 0x14 ]
  30:	c2 01 e0 08 	ld  [ %g7 + 8 ], %g1
  34:	82 08 61 00 	and  %g1, 0x100, %g1
  38:	85 28 60 01 	sll  %g1, 1, %g2
  3c:	82 10 40 02 	or  %g1, %g2, %g1
  40:	c2 21 e0 08 	st  %g1, [ %g7 + 8 ]
  44:	c2 01 e0 00 	ld  [ %g7 ], %g1
  48:	82 08 63 ff 	and  %g1, 0x3ff, %g1
  4c:	c2 21 e0 00 	st  %g1, [ %g7 ]
  50:	82 08 63 00 	and  %g1, 0x300, %g1
  54:	c4 01 e0 a0 	ld  [ %g7 + 0xa0 ], %g2
  58:	87 30 a0 04 	srl  %g2, 4, %g3
  5c:	86 08 e0 03 	and  %g3, 3, %g3
  60:	82 10 40 03 	or  %g1, %g3, %g1
  64:	07 03 02 00 	sethi  %hi(0xc080000), %g3
  68:	82 10 c0 01 	or  %g3, %g1, %g1
  6c:	c2 21 e0 00 	st  %g1, [ %g7 ]
  70:	87 28 a0 04 	sll  %g2, 4, %g3
  74:	82 08 e0 70 	and  %g3, 0x70, %g1
  78:	86 08 a0 c0 	and  %g2, 0xc0, %g3
  7c:	87 30 e0 04 	srl  %g3, 4, %g3
  80:	82 10 c0 01 	or  %g3, %g1, %g1
  84:	87 30 e0 02 	srl  %g3, 2, %g3
  88:	82 10 c0 01 	or  %g3, %g1, %g1
  8c:	86 10 28 00 	mov  0x800, %g3
  90:	82 10 c0 01 	or  %g3, %g1, %g1
  94:	80 88 a0 03 	btst  3, %g2
  98:	12 80 00 03 	bne  a4 <__DYNAMIC+0xa4>
  9c:	01 00 00 00 	nop 
  a0:	82 00 62 00 	add  %g1, 0x200, %g1
  a4:	c2 21 e0 04 	st  %g1, [ %g7 + 4 ]
  a8:	86 10 3f ff 	mov  -1, %g3
  ac:	c0 21 e0 0c 	clr  [ %g7 + 0xc ]
  b0:	c0 21 e0 10 	clr  [ %g7 + 0x10 ]
  b4:	c0 21 e0 1c 	clr  [ %g7 + 0x1c ]
  b8:	c0 21 e0 20 	clr  [ %g7 + 0x20 ]
  bc:	c6 21 e0 64 	st  %g3, [ %g7 + 0x64 ]
  c0:	c6 21 e0 60 	st  %g3, [ %g7 + 0x60 ]
  c4:	c0 21 e0 48 	clr  [ %g7 + 0x48 ]
  c8:	c6 21 e0 44 	st  %g3, [ %g7 + 0x44 ]
  cc:	c6 21 e0 40 	st  %g3, [ %g7 + 0x40 ]
  d0:	c0 21 e0 58 	clr  [ %g7 + 0x58 ]
  d4:	c6 21 e0 54 	st  %g3, [ %g7 + 0x54 ]
  d8:	c6 21 e0 50 	st  %g3, [ %g7 + 0x50 ]
  dc:	c6 21 e0 7c 	st  %g3, [ %g7 + 0x7c ]
  e0:	c6 21 e0 78 	st  %g3, [ %g7 + 0x78 ]
  e4:	c0 21 e0 74 	clr  [ %g7 + 0x74 ]
  e8:	c6 21 e0 8c 	st  %g3, [ %g7 + 0x8c ]
  ec:	c6 21 e0 88 	st  %g3, [ %g7 + 0x88 ]
  f0:	c0 21 e0 84 	clr  [ %g7 + 0x84 ]
  f4:	c0 21 e0 1c 	clr  [ %g7 + 0x1c ]
  f8:	c0 21 e0 20 	clr  [ %g7 + 0x20 ]
  fc:	c0 21 e0 a0 	clr  [ %g7 + 0xa0 ]
 100:	c0 21 e0 a8 	clr  [ %g7 + 0xa8 ]
 104:	c0 21 e0 98 	clr  [ %g7 + 0x98 ]
 108:	c0 21 e0 90 	clr  [ %g7 + 0x90 ]
 10c:	c0 21 e0 94 	clr  [ %g7 + 0x94 ]
 110:	c6 21 e0 9c 	st  %g3, [ %g7 + 0x9c ]
 114:	c0 21 e0 b4 	clr  [ %g7 + 0xb4 ]
 118:	c0 21 e0 b0 	clr  [ %g7 + 0xb0 ]
 11c:	c6 21 e0 bc 	st  %g3, [ %g7 + 0xbc ]
 120:	c0 21 e0 b8 	clr  [ %g7 + 0xb8 ]
 124:	c4 01 e0 08 	ld  [ %g7 + 8 ], %g2
 128:	87 30 a0 1e 	srl  %g2, 0x1e, %g3
 12c:	86 88 e0 03 	andcc  %g3, 3, %g3
 130:	02 80 00 03 	be  13c <__DYNAMIC+0x13c>
 134:	01 00 00 00 	nop 
 138:	a1 80 00 00 	mov  %g0, %asr16
 13c:	c4 01 e0 24 	ld  [ %g7 + 0x24 ], %g2
 140:	87 30 a0 14 	srl  %g2, 0x14, %g3
 144:	86 08 e0 1f 	and  %g3, 0x1f, %g3
 148:	88 10 00 00 	mov  %g0, %g4
 14c:	8a 10 00 00 	mov  %g0, %g5
 150:	8c 10 00 00 	mov  %g0, %g6
 154:	a0 10 00 00 	mov  %g0, %l0
 158:	a2 10 00 00 	mov  %g0, %l1
 15c:	a4 10 00 00 	mov  %g0, %l2
 160:	a6 10 00 00 	mov  %g0, %l3
 164:	a8 10 00 00 	mov  %g0, %l4
 168:	aa 10 00 00 	mov  %g0, %l5
 16c:	ac 10 00 00 	mov  %g0, %l6
 170:	ae 10 00 00 	mov  %g0, %l7
 174:	90 10 00 00 	mov  %g0, %o0
 178:	92 10 00 00 	mov  %g0, %o1
 17c:	94 10 00 00 	mov  %g0, %o2
 180:	96 10 00 00 	mov  %g0, %o3
 184:	98 10 00 00 	mov  %g0, %o4
 188:	9a 10 00 00 	mov  %g0, %o5
 18c:	9c 10 00 00 	mov  %g0, %sp
 190:	9e 10 00 00 	mov  %g0, %o7
 194:	86 a0 e0 01 	deccc  %g3
 198:	16 bf ff ef 	bge  154 <__DYNAMIC+0x154>
 19c:	81 e0 00 00 	save 
 1a0:	87 30 a0 04 	srl  %g2, 4, %g3
 1a4:	80 88 e0 03 	btst  3, %g3
 1a8:	02 80 00 15 	be  1fc <__DYNAMIC+0x1fc>
 1ac:	07 00 00 00 	sethi  %hi(0), %g3
 1b0:	86 10 e2 38 	or  %g3, 0x238, %g3	! 238 <fsrinit>
 1b4:	c1 08 c0 00 	ld  [ %g3 ], %fsr
 1b8:	c1 18 00 00 	ldd  [ %g0 ], %f0
 1bc:	c5 18 00 00 	ldd  [ %g0 ], %f2
 1c0:	c9 18 00 00 	ldd  [ %g0 ], %f4
 1c4:	cd 18 00 00 	ldd  [ %g0 ], %f6
 1c8:	d1 18 00 00 	ldd  [ %g0 ], %f8
 1cc:	d5 18 00 00 	ldd  [ %g0 ], %f10
 1d0:	d9 18 00 00 	ldd  [ %g0 ], %f12
 1d4:	dd 18 00 00 	ldd  [ %g0 ], %f14
 1d8:	e1 18 00 00 	ldd  [ %g0 ], %f16
 1dc:	e5 18 00 00 	ldd  [ %g0 ], %f18
 1e0:	e9 18 00 00 	ldd  [ %g0 ], %f20
 1e4:	ed 18 00 00 	ldd  [ %g0 ], %f22
 1e8:	f1 18 00 00 	ldd  [ %g0 ], %f24
 1ec:	f5 18 00 00 	ldd  [ %g0 ], %f26
 1f0:	f9 18 00 00 	ldd  [ %g0 ], %f28
 1f4:	10 80 00 02 	b  1fc <__DYNAMIC+0x1fc>
 1f8:	fd 18 00 00 	ldd  [ %g0 ], %f30
 1fc:	82 10 20 02 	mov  2, %g1
 200:	81 90 40 00 	mov  %g1, %wim
 204:	03 00 00 04 	sethi  %hi(0x1000), %g1
 208:	82 10 60 e0 	or  %g1, 0xe0, %g1	! 10e0 <_endtext+0xea0>
 20c:	81 88 40 00 	mov  %g1, %psr
 210:	01 00 00 00 	nop 
 214:	01 00 00 00 	nop 
 218:	01 00 00 00 	nop 
 21c:	07 10 00 ff 	sethi  %hi(0x4003fc00), %g3
 220:	86 10 e3 f0 	or  %g3, 0x3f0, %g3	! 4003fff0 <_data_start+0x3fff0>
 224:	bc 10 00 03 	mov  %g3, %fp
 228:	9c 20 e0 60 	sub  %g3, 0x60, %sp
 22c:	03 10 00 00 	sethi  %hi(0x40000000), %g1
 230:	81 c0 40 00 	jmp  %g1
 234:	01 00 00 00 	nop 

00000238 <fsrinit>:
 238:	00 00 00 00 	unimp  0
 23c:	01 00 00 00 	nop 
