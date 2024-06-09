.data
    n: .word 0x11223344
.text
    lw a0, n
    srli t0, a0, 24 #desplazo contenido 24 bits a la derecha, t0 = #0x00000011
    andi t1, t0, 0x11
    addi a1, t1, x0 #a1 = #0x11
    andi t1, a0, 0x44 #tomo los ultimos 8 bits (no hago desplazamiento, sino directamente AND)
    addi a4, t1, x0 #a4 = #0x44
    srli t0, a0, 8 #desplazo contenido 8 bits a la derecha, 0x00112233 
    andi t1, t0, 0x33  
    addi a3, t1, x0  #a3 = #0x33
    srli t0, a0, 16 #0x00001122
    andi t1, t0, 0x22 #0x22
    addi a2, t1, x0 # a2 = #0x22
