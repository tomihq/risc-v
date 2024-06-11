Ejercicio 1) Se cuenta con cuatro datos de un byte cada uno almacenados en el registro s0 y
queremos saber cuántos de esos datos son pares. Escriba un programa de ensamblador RISC V que
realice esta operación y almacene el resultado en el registro a0.

.text
    li s0, 0x37A2F011
    mv t0, s0
    li t1, 0
    li t2, 0xFF
    li t4, 1
    empieza:
            and t3, t0, t2
            andi t3, t3, 1
            beq t3, t4, sigouno
                addi t1, t1, 1
    sigouno:
            srli t0, t0, 8
            and t3, t0, t2
            andi t3, t3, 1
            beq t3, t4, sigodos
                addi t1, t1, 1
    sigodos:
            srli t0, t0, 8
            and t3, t0, t2
            andi t3, t3, 1
            beq t3, t4, sigotres
                addi t1, t1, 1
    sigotres:
            srli t0, t0, 8
            and t3, t0, t2
            andi t3, t3, 1
            beq t3, t4, sigocuatro
                addi t1, t1, 1
    sigocuatro:
            mv a0, t1 #espero 2
                