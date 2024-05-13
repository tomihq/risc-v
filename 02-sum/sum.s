.global _start

_start: 
    li      a0, 1           
    li      a1, 2           
    add     a0, a0, a1      

    lw      a1, 4(sp)       
    lw      ra, 0(sp)       
    addi    sp, sp, 8      
    jr      ra             

