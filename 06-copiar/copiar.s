.data
    s: .word 1, 2
    q: .word 5, 6
    l: .word 2
.text
    la a0, s
    la a1, q
    lw a2, l
    li t0, 0
    loop:
        bge t0, a2, fin
        lw t1, 0(a1)
        sw t1, 0(a0)
        addi t0, t0, 1
        addi a0, a0, 4
        addi a1, a1, 4
        j loop
    fin:
        li a7, 10
        ecall