.data
vetor: .word 1, 2, 3, 4
##### START MODIFIQUE AQUI START #####
#
# Este espaço é para você definir as suas constantes e vetores auxiliares.
# Defina as constantes e vetores auxiliares aqui.
tam: .word 4
#
##### END MODIFIQUE AQUI END #####
.text
jal x1, contador
addi x14, x0, 2 # utilizado para correção
beq x14, x10, FIM # Verifica # de pares
beq x14, x11, FIM # Verifica # de ímpares

##### START MODIFIQUE AQUI START #####

contador: 
mv s2, x1 # salva o valor de x1 em s2
addi x10, x0, 0 # Inicializa contador de pares
addi x11, x0, 0 # Inicializa contador de ímpares
addi x12, x0, 0 # Inicializa contador de índice
addi x13, x0, 0 # Inicializa contador de tamanho
addi x14, x0, 0 # Inicializa contador de auxiliar

# carrega o endereço base do vetor em t2
la t2, vetor
# carrega o endereço do tamanho do vetor em t3
lw t3, tam
# carrega o valor do tamanho do vetor
lw x1, 0(x1)
    
    loop:
    lw x14, 0(t2) # carrega o valor do vetor atual em x14
    addi t2, t2, 4 # incrementa o endereço do vetor
    andi x14, x14, 1 # verifica se o valor é par
    beqz x14, par # se for par, pula para o label par
    addi x11, x11, 1 # se não for par, incrementa o contador de ímpares
    j continua # pula para o label continua

    par:
    addi x10, x10, 1 # incrementa o contador de pares

    continua:
    addi x12, x12, 1 # incrementa o contador de índice
    addi x13, x13, 1 # incrementa o contador de tamanho
    bne x12, t3, loop # verifica se o contador de índice é igual ao contador de tamanho, se for, pula para o label loop
    mv x1, s2 # restaura o valor de x1 a partir de s2
    jr x1 # retorna para o endereço de retorno

##### END MODIFIQUE AQUI END #####
FIM: addi x0, x0, 1
