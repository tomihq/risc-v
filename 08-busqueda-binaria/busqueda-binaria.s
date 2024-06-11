.data
    target: .word 3
    arr: .word 1, 3, 4, 7
    l: .word 4
.text
        la a0, arr #array
        lw a1, target #objetivo
        lw a2, l #largo
        li t0, 0 #izq
        li t1, 1
        sub t1, a2, t4 #der
        li a3, 4 #para ir multiplicando (longitud de la palabra)
    loop: 
        add t2, t0, t1 #(izq + der)
        srli t2, t2, 1 #la respuesta esta aca, es mid. (izq+der)/2
        mul t3, t2, a3 # t3 = indice * longitudAPalabra (a la palabra que tengo que moverme)
        mv a6, a0 #copio el array porque sino al moverme, no puedo volver.
        add a6, a6, t3 #muevo el puntero de mi copia del array, tantas palabras como sea necesario
        lw t4, 0(a6) #leo la primera palabra del array (habiendo movido el puntero)
        beq a1, t4, fin #si el elemento que esta en el array es el que queria, voy a fin
        blt a1, t4, menor #si el elemento que quiero buscar es menor al del array, salto a menor
            addi t0, t2, 1 #ESTE ES EL CASO DEL IF TRUE. Como se que mi elemento es mayor al del array entonces tengo que moverme a la izquierda
            j loop
    menor: 
        addi t1, t2, -1 #CASO DEL IF FALSE = ELSE. como se que mi elemento es menor al del array, entonces tengo que ir achicando el array desde la derecha.
        j loop
    fin: 
        ecall
