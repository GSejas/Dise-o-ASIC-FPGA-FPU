! Test program for debug mdct core
	
        .data
arr:    .word	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255
	.word   7,6,5,4,3,2,1,0   
sum:	.word   7,6,5,4,3,2,1,0

        .text

start:  set     arr, %r2            ! %r2 is the base address
	set	0x80000200,%r2	    ! %r2 has ddm control register
	set	1,%r5		    ! %r5 is the control value for ddm
	st	%r5,[%r2]	    ! enables ddm
		
        set     0x80000304, %r3     ! %r3 is mdct array size
	set	32, %r6		    ! size of the array is 256
	st	%r6,[%r3]	    ! size of array  is now set

        set     0x80000308, %r3     ! %r3 is mdct read start address register
	set	arr, %r6	    ! %r6 is the starting read address
	st	%r6,[%r3]	    ! start read address is set

		
        set     0x8000030c, %r3     ! %r3 is mdct write start address register
	set	sum, %r6	    ! %r6 is the starting write address
	st	%r6,[%r3]	    ! start write address is set

        set     0x80000300, %r3     ! %r3 is mdct write start address register
	set	1, %r6		    ! %r6 holds the enable value of mdct
	st	%r6,[%r3]	    ! go mdct

	set	0, %r6		    ! %r6 holds the stop value of mdct
	st	%r6,[%r3]	    ! stop mdct


		
	set	425,%r5		    ! %r5 repeats the following loop in order
				    ! in order to give more time to mdct
	



loop:   ld     [%r2+%r3], %r6       ! fetch the next element
        add    %r4, %r6, %r4        ! add it to the running sum
	subcc  %r5, 1, %r5          ! one fewer element
        bne    loop                 ! if %r5 > 0 get next element
        add    %r3, 4, %r3          ! increment the index (DELAY SLOT)



        sethi  %hi(sum), %r1        ! store the result in sum
        st     %r4, [%r1+%lo(sum)]
end:    ta      0



