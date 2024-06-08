#Funciona para listas pares o impares
#No funciona nunca para el ultimo caso (caso borde).
.data
    array: .word 1, 3, 5, 7
    target: .word 5
    n: .word 4
.text
    la a0, array
    lw a1, target
    lw t0, n #elementos en arr
    li t1, 0 #izq
    addi t2, t0, -1 #der
    li t3, 2 #para dividir y partir la lista al medio
    li a3, 4 #para saltar las posiciones en el array y evaluar en la copia
loop:
    beq t5, a1, fin #si el valor del array es igual al buscado, salgo
    bge t1, t2, fin #si izq es mayor o igual a der salgo
    add t4, t1, t2 # izq + der
    div t4, t4, t3 # (izq + der) / 2
    mv t6, t4 #guardo medio
    mul t5, t4, a3 #muevo offset (para saber cant)
    mv a4, a0 #guardo arr anterior (lo copio)
    add a4, a4, t5 #muevo offset de arr copia
    lw t5, 0(a4) #accedo a la copia del arr, en medio
    blt a1, t5, menor
    mv t1, t4 #izq = medio
    j loop
menor:
    mv t2, t4 #der = medio
    j loop
fin:
    mv a2, t4 #muevo el resultado a a2

        