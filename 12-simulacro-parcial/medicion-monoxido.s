#El truco de este ejercicio, básicamente es: primero usar lh (load half) y no lw. Ahora, load half carga 16 bits, y extiende los otros 16 a la izquierda con el bit mas significativo. El tema esta en que en este ejercicio nos dicen que hay que considerar las cosas SIN SIGNO. Entonces la idea es mover a la izquierda, despues a la derecha y dejar el numero como estaba pero extendido a 32 bits. Luego, tengo que verificar si este numero es mayor al que nos dan, si es mayor entonces sumo. Finalmente, tengo que calcular el largo/2 y si mi contador es mayor a este largo, devuelvo 0 caso contrario 1
.data
    mediciones: .half 0x1100 0x00F0 0xA200 0x1000
    largo: .byte 4
.text
    la t0, mediciones
    lb t1, largo
    li t2, 0
    li t3, 0x00000F00
    li t4, 0
    mv t5, t0
    ciclo:
        beq t4, t1, compararConLargo
        lh t6, 0(t5)
        slli t6, t6, 16
        srli t6, t6, 16
        blt t3, t6, sumo
        j fin
        sumo:
            addi t2, t2, 1
        fin:
            addi t5, t5, 2
            addi t4, t4, 1
            j ciclo
    compararConLargo:
        li a2, 2
        div t1, t1, a2
        blt t1, t2, devolverCero
        li a0, 1
        j finPrograma
     devolverCero:
         li a0, 0
         j finPrograma
     finPrograma:
         li a7, 10
         ecall