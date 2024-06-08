.data 
 s: .word 2
 q: .word 3
 # 2 + 2 + 2 = 6
.text 
    lw a0, s
    lw a1, q 
    li t0, 1 #incrementadora
    li t1, 0 #acum 
    loop:
      bgt t0, a1, fin
      add t1, t1, a0 
      addi t0, t0, 1
      j loop 
    fin:
     mv a0, t1

# 1 > 3? no, entonces acum = 0 + 2, acum = 2, incrementadora = 2
# 2 > 3? no, entonces acum = 2 + 2, acum = 4, incrementadora = 3
# 3 > 3? no, entonces acum = 4 + 2, acum = 6, incrementadora = 4 
# 4 > 3? si, entonces fin, muevo a a0, el valor de t1.