#Ejercicio 2 Implemente la función factorial en el lenguaje ensamblador RISC V de forma recursiva, respete la convención de llamada presentada en la materia, explique el uso que le daría a cada registro y cómo se asegura que sus valores se preservan antes y después de cada llamada a función.

#Como tengo algo recursivo usaré el stack para preservar los valores de las lamadas y al final poder hacer el calculo con los valores guardados en el stack. Como fibonacci solo necesita el n anterior me basta con reservar en el stack el espacio para ra y el valor anterior.
#Como en RISC-V hay convenciones de llamadas a funciones debo garantizar: si uso algun parametro t o a, debo guardarlo antes de entrar al factorial pues la funcion llamada no me garantiza que no sean modificados. Por otro lado, la funcion llamada debe garantizar guardar el punto de retorno que se envía antes de entrar a la funcion, retornar el stack a su estado inicial y ademas, si va a usar una variable tipo s, debe guardarse el valor porque tendria que retornarse al final como entró a la función.
#Yo voy a ir directamente modificando a0, y como puede funcionar como retorno de una funcion, ire manipulando este valor.

.data  
    n: .word 3
.text 
    lw a0, n 
    li t1, 1
    jal ra, factorial 
    j fin 
    factorial:
        addi sp, sp, -8 #Reservo espacio en el stack. El stack pointer se mueve 8 posiciones hacia abajo
        sw a0, 4(sp) #Guardo el valor de n en el stack para no perderlo.
        sw ra, 0(sp) #Guardo el punto de retorno para ir retornando. 
        beq a0, t1, epilogo #Si el valor es el caso base, entonces retorno a0 = 1 (valor de entrada a la funcion)
        addi a0, a0, -1 #Si el valor no es el caso base, le resto 1
        jal factorial  #Salto al factorial
        lw t0, 4(sp) #Vuelvo al n anterior al caso base, lo tomo del stack (n=2)
        mul a0, a0, t0 #a0 = a0 * t0, en el primer caso t0 es 2, luego 3.
    epilogo:  
        lw ra, 0(sp) #tomo el punto de retorno
        addi sp, sp, 8 #subo el stack a su estado inicial
        ret #vuelvo al RA anterior. en el primer caso vuelve a jal factorial pero con n = 3. Si ya pasó el caso de n = 3 entonces este ret vuelve a fin
    fin: 
        li a7, 10
        ecall
