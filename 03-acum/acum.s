.data
  array: .word 1, 2, 3, 4
  n: .word 4
.text
    la a0, array #arrayAddress
    lw a1, n #maxima longitud
    li t2, 0 #acum
    li t0, 0 #incrementador
    loop:
        beq t0, a1, fin
        lw t1, 0(a0)
        add t2, t2, t1
        addi t0, t0, 1
        addi a0, a0, 4
        j loop
    fin: 
        add a0, t2, zero
        ecall
    