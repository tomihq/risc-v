.global _start

.section .text

_start:
    # Definimos los números que queremos sumar
    li a0, 5    # Primer número: 5
    li a1, 7    # Segundo número: 7
    
    # Sumamos los números
    add a0, a0, a1
    
    # Llamamos a la función para imprimir el resultado
    li a7, 64       # Cargamos el código de la llamada al sistema para escribir en pantalla
    li a0, 1        # Cargamos el descriptor de archivo (1 para stdout)
    mv a1, a0       # Movemos el resultado a a1, que es el argumento para imprimir
    li a2, 4        # Cargamos la longitud del mensaje (4 bytes)
    ecall           # Realizamos la llamada al sistema para escribir en pantalla
    
    # Salimos del programa
    li a7, 93       # Cargamos el código de la llamada al sistema para salir del programa
    li a0, 0        # Cargamos el código de retorno 0
    ecall           # Realizamos la llamada al sistema
    r
