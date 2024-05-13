
.global _start

_start: 
    li      a0, 1           # Carga el primer número (1) en a0
    li      a1, 2           # Carga el segundo número (2) en a1
    add     a0, a0, a1      # Suma los dos números

    lw      a1, 4(sp)       # Recupera el registro de retorno de la pila
    lw      ra, 0(sp)       # Restaura el registro de retorno
    addi    sp, sp, 8       # Libera el espacio reservado en la pila
    jr      ra              # Retorna a la dirección de retorno

# Fin del programa
