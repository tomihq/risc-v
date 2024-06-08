#Me gusta mas esta solucion.
#RECORDAR: Los hexa, el 1 es 16. Yo estuve 3 otras pensando por que 4! me daba 18, pero 18 en hexa es 16 + 8 = 24 en decimal.

.data
    n: .word 4
.text
lw a0, n 
li a1, 1
jal ra, factorial
j fin
factorial:
    addi sp, sp, -8
    sw ra, 0(sp)
    sw a0, 4(sp)
    beq a0, a1, finCiclo
    addi a0, a0, -1
    jal ra, factorial
    
finCiclo:
    lw ra, 0(sp)
    lw t0, 4(sp)
    addi sp, sp, 8
    mul a0, a0, t0
    ret
fin:
    li a7, 10