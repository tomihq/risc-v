.data
    n: .word 2
.text
    lw a0, n
    li a1, 2
    jal ra, fibo
    j fin
    fibo:
        addi sp, sp, -12
        sw a0, 4(sp)
        sw ra, 0(sp)
        blt a0, a1, epilogo
        addi a0, a0, -1
        jal ra, fibo
        sw a0, 8(sp)
        lw a0, 4(sp)
        addi a0, a0, -2
        jal ra, fibo
        lw t1, 8(sp)
        add a0, a0, t1
    epilogo:
        lw ra, 0(sp)
        addi sp, sp, 12
        ret
    fin:
        li a7, 1
        ecall
        li a7, 10
        ecall