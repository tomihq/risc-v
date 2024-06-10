.data
    n: .word 3
.text
    lw t0, n
    andi t1, t0, 1 #0 par, 1 impar -> la mascara 1 equivale a 0x00000001 que basicamente el ultimo 1 es 0001 (solo guardo el último bit)
    li t2, 1 
    beq t1, t2, impar #si el and dió 1, entonces es impar, caso contrario par.
        ecall
    impar:
        ecall