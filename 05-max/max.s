.data
    arreglo: .word 1,2,3,1,4,1
    largo: .word 6
.text
    la a0, arreglo #Almaceno el puntero al arreglo en a0
    lw s1, largo #Guardo en una variable permanente el valor del largo (6)
    li t2, 0 #Variable incrementadora para el ciclo
    li t3, 0 #Máximo
    loop:
        bge t2, s1, fin #Si i es mayor o igual al largo, salgo
        lw t0, 0(a0) #Cargo la primera palabra del arreglo
        addi t2, t2, 1 #Incremento la variable incrementadora en 1.
        addi a0, a0, 4 #Muevo el arreglo 4 posiciones para el proximo loop.
        bgt t3,t0, loop #Si el maximo guardado es mayor al elemento del array actual, vuelvo a loopear
        mv t3, t0 #Al ser t0 mas grande que t3, lo guardo.
        j loop #Salto al loop de vuelta
    fin:
        li a7, 10 #Almaceno la orden de salir del programa
        ecall #Le devuelvo el control al sistema
        