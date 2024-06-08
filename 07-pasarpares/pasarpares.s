.data
    s: .word 1, 2
    q: .word 4, 5
    l: .word 2
.text
    la a0, s #Esto es algo simbólico, a0 ya debería tener s por enunciado.
    la a1, q #Esto es algo simbólico, a1 ya deberia tener q por enunciado.
    lw a2, l #Esto es algo simbólico, a2 ya deberia tener el largo por enunciado.
    li t0, 0 #Incrementador inicializo en 0
    li a5, 1 #Para hacer las comparaciones de si es impar (no existe un beqi)
    loop:
        bge t0, a2, fin #Si ya no hay mas elementos (el incrementador es el largo) salgo
        lw t1, 0(a1) #Cargo temporalmente el primer elemento de la lista a1 para ver si es par/impar.
        andi t2, t1, 1 #Uso mascara #0x1 para validar si el numero es par o impar (LSB = 1 impar)
        beq t2, a5, impar #Si es impar, entonces salto a impar para que me pise el valor de t1 a guardar
        j loopCiclo #Si es par, salto de una a almacenar ese valor
     impar:
        li t1, 0 #Como es impar, entonces piso el valor almacenado en t1 y lo reemplazo por 0
     loopCiclo: #Si es par, viene acá por el salto, si es impar, viene de pasado luego de poner en 0 a t1.
        sw t1, 0(a0) #Guardo el valor (si es par entonces paso el de a1, si es impar paso el 0)
        addi a0, a0, 4 #Incremento el puntero de a0 en 4.
        addi a1, a1, 4 #Incremento el puntero de a1 en 4.
        addi t0, t0, 1 #Incremento la variable incrementadora en 1.
        j loop #Vuelvo a loopear
    fin:
        la a0, s  #Reestablezco el puntero de a0 en su posicion inicial para ver como se modificó.
        lw a7, 0(a0) #4
        ecall
        lw a7, 4(a0) #0
        ecall