#Nota: La idea es hacerlo con ciclos pero se podria usar la suma de gauss.
.data 
    n: .word 1
.text
    lw s1, n #valor
    li t0, 1 #incrementador
    li t1, 0 #acum 
    loop:
        bgt t0, s1, fin # incrementador > valor
        add t1, t1, t0 # acum = acum + incrementador
        addi t0, t0, 1 # incrementador = incrementador + 1 
        j loop
    fin:
        li a7, 10
        ecall
    
#Primera vez
# loop: 1 > 1? No, entonces acum = 1, incrementador = 2
# loop: 2 > 1? Sí, entonces salgo.  

#Utilizando Gauss n(n+1) / 2
.data 
    n: .word 1
.text
    lw s1, n #n
    li t1, 2 #para dividir 
    addi t2, s1, 1 # el n+1
    mul s1, s1, t2 # n = n(n+1)
    div s1, s1, t1 # n/2
    