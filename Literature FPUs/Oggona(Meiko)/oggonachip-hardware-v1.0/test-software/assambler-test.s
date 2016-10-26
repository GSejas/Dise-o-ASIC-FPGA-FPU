        .data
arr:    .skip   20*4                ! allocate an array of 20 words
sum:    .word   0                   ! allocate a word to hold the sum



        .text
start:  set     arr, %r2            ! %r2 is the base address
        mov     %r0, %r3            ! %r3 is the index value
        mov     %r0, %r4            ! %r4 is the running sum
        set     20, %r5             ! %r5 is the number of elems to add



loop:   ld     [%r2+%r3], %r6       ! fetch the next element
        add    %r4, %r6, %r4        ! add it to the running sum
        subcc  %r5, 1, %r5          ! one fewer element
        bne    loop                 ! if %r5 > 0 get next element
        add    %r3, 4, %r3          ! increment the index (DELAY SLOT)



        sethi  %hi(sum), %r1        ! store the result in sum
        st     %r4, [%r1+%lo(sum)]
end:    ta      0
