.data
    target: .word 3
    arr: .word 1, 3, 4, 7
    l: .word 4
.text
    la a0, arr
    lw a1, target
    lw a2, l
    li t0, 0
    li t1, 1
    sub t1, a2, t4
    li a3, 4
    li a4, 0
    loop: 
        add t2, t0, t1
        srli t2, t2, 1 #la respuesta esta aca, es mid
        mul t3, t2, a3 
        mv a6, a0
        add a6, a6, t3
        lw t4, 0(a6)
        beq a1, t4, fin
        blt a1, t4, menor
        addi t0, t2, 1
        j loop
    menor: 
        addi t1, t2, -1
        j loop
    fin: 
        ecall
