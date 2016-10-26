! Test program for debug mdct core
	
        .data
arr:    .word	9,8,7,6,5,4,3,4,5,6,7,8       ! allocate an array of 20 words
sum:    .word   0,0,0,0,0,0,0,0,0,0,0,0       ! allocate a word to hold the sum
audio:	.skip   20*4


        .text

start:  set     arr, %r2            ! %r2 is the base address
	set	0x80000204,%r2	    ! %r2 has ddm control register
	set	audio,%r5	    ! %r5 start address for ddm
	st	%r5,[%r2]	    ! write start address
		
	set	0x80000208,%r2	    ! %r2 has ddm control register
	set	audio+80,%r5	    ! %r5 stop address for ddm
	st	%r5,[%r2]	    ! write stop address


	set	0x80000200,%r2	    ! %r2 has ddm control register
	set	1,%r5		    ! %r5 is the control value for ddm
	st	%r5,[%r2]	    ! enables ddm
	
        set     0x80000308, %r3     ! %r3 is mdct read start address register
	set	arr, %r6	    ! %r6 is the starting read address
	st	%r6,[%r3]	    ! start read address is set
	
        set     0x80000304, %r3     ! %r3 is mdct array size
	set	10, %r6		    ! size of the array is 3
	st	%r6,[%r3]	    ! size of array  is now set
	
        set     0x8000030c, %r3     ! %r3 is mdct write start address register
	set	sum, %r6	    ! %r6 is the starting write address
	st	%r6,[%r3]	    ! start write address is set

        set     0x80000300, %r3     ! %r3 is mdct write start address register
	set	1, %r6		    ! %r6 holds the enable value of mdct
	st	%r6,[%r3]	    ! go mdct

	set	0, %r6		    ! %r6 holds the stop value of mdct
	st	%r6,[%r3]	    ! stop mdct

	set	0x80000200,%r2	    ! %r2 has ddm control register
	set	1,%r5		    ! %r5 is the control value for ddm
	st	%r5,[%r2]	    ! enables ddm

		
	set	10,%r5		    ! %r5 repeats the following loop in order
				    ! in order to give more time to mdct
	



loop:   ld     [%r2+%r3], %r6       ! fetch the next element
        add    %r4, %r6, %r4        ! add it to the running sum
        subcc  %r5, 1, %r5          ! one fewer element
        bne    loop                 ! if %r5 > 0 get next element
        add    %r3, 4, %r3          ! increment the index (DELAY SLOT)



        sethi  %hi(sum), %r1        ! store the result in sum
        st     %r4, [%r1+%lo(sum)]
end:    ta      0



