.data
  n: .word 3
.text
    lw a0, n
    li a1, 1
    jal ra, factorial
    j fin
    factorial:
        addi sp, sp, -8 #bajo la pila 2 palabras para ir guardando en cada paso recursivo el valor a0 y el ra
        sw ra, 0(sp) #guardo el ra, para que cuando empiece a retornar, vuelva hacia atrás
        sw a0, 4(sp) #guardo el valor del a0, inicialmente guarda 6
        beq a0, a1, finFactorial #si el valor de a0 llegase a ser 1 porque es la ultima llamada recursiva voy a finFactorial para restablecer todo
        addi a0, a0, -1 #si el valor de a0 no es 1, como ya lo guardé en la pila el valor anterior (6), lo resto.
        jal ra, factorial #salto a la proxima llamada recursiva. En la pila ahora va a guardar (5). Esta linea se ejecuta hasta cuando a0 en la pila tenga el valor de (1). 
        lw t0, 4(sp) #cargo el valor del sp que tiene a0, comienza siendo la ultima llamada, donde tiene 1.
        mul a0, a0, t0 #multiplica 1 * 1 la primera vez, luego 1 * 2 = 2, luego 2 * 3, luego 6 (a0) * 4 (t0 cargado por pila) , luego 24 * 5, luego por ultimo 120 * 6=720. Luego que termina vuelve al beq, y como a0 ya es 1, 
                    #va a finFactorial
    finFactorial:
        lw ra, 0(sp)
        addi sp, sp, 8
        ret
    fin: 
        li a7, 10
        ecall

#Ejecucion simbolica
# ra = guarda jal ra, factorial (imaginemos que es 0x00)
# Salta a factorial
# Sube la pila 2 palabras. Guarda en el stack frame de la llamada recursiva (ra = 0x00, a0 = 3). Como a0 NO es 1, disminuye a0 en 1 y vuelve a saltar factorial. Acá se guarda la saltada recursiva, digamos que es 0x04
# Sube la pila 2 palabras. Guarda en el stack frame de la llamada recursiva (ra = 0x04, a0 = 2). Como a0 NO es 1, disminuye a0 en 1, y vuelve a saltar factorial. Acá se guarda la saltada recursiva, digamos que es 0x08
# SUbe la pila 2 palabras. GUarda en el stack frame de la llamada recursiva (ra = 0x08, a0 = 1). Como a0 ES 1, entonces va a finFactorial
# Encadenado se ve algo como (ra = 0x08, a0 = 1) (ra = 0x04, a0 = 2) (ra = 0x00, a0 = 3) donde lo primero que se va a ejecutar es lo ultimo que se cargo.
# Va a finFactorial con (ra = 0x08, a0 = 1). Vuelve a dejar la pila como estaba, y el ret nos devuelve a (ra = 0x08, a0 = 1) y nos toca cargar el valor que hay en la pila de a0 (1) en t0 y hace a0 * t0 (1). 
# Va a finFactorial con (ra = 0x04, a0 = 2). Vuelve a dejar la pila como estaba, y el ret nos devuelve a (ra = 0x04, a0 = 2) y nos toca cargar el valor que hay en la pila de a0 (2) en t0 y hace a0 * t0 (1 * 2) = 2
# Va a finFactorial con (ra = 0x00, a0 = 3). Vuelva a dejar la pila como estaba, y el ret nos devuelve a (ra = 0x00, a0 = 3) y nos toca cargar el valor que hay en la pila de a0 (3) en t0 y hace a0 * t0 = 2 * 3 = 6
# Como ra = 0x00, el ret nos manda a j fin
