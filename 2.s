.data
vetor: .word 200, 190, 340, 100 # exemplo
##### START MODIFIQUE AQUI START #####
#
# Este espaço é para você definir as suas constantes e vetores auxiliares.
contador: .word 0 # contador de salários acima do limiar
#
##### END MODIFIQUE AQUI END #####
.text
jal ra, main
# Ao final do reajuste (aplica_reajuste) você deve retornar o programa para a
# próxima instrução abaixo, que consiste na correção/verificação.
##### START INSTRUÇÃO DE CORREÇÃO/VERIFICAÇÃO #####
# utilizado para correção (considerando um limiar de 200 para o vetor de
# exemplo após a aplicação do reajuste.
addi a4, x0, 3 # configurando a quantidade de salários acima do limiar de 200.
beq a4, t0, FIM # Verifica a quantidade de salários acima do limiar.
##### END INSTRUÇÃO DE CORREÇÃO/VERIFICAÇÃO #####
main:
##### START MODIFIQUE AQUI START #####
    la a0, vetor # endereço do vetor
    addi a1, x0, 4 # tamanho do vetor
    addi a2, x0, 200 # limiar desejado
    lw t0, contador # valor do contador

loop:
    beqz a1, fim # verifica se o vetor acabou
    addi sp, sp, -4 # reserva espaço na pilha
    sw ra, 0(sp) # salva o endereço de retorno na pilha
    jal ra, aplica_reajuste # chama a função aplica_reajuste
    lw ra, 0(sp) # recupera o endereço de retorno da pilha
    addi sp, sp, 4 # libera espaço na pilha
    addi a0, a0, 4 # incrementa o endereço do vetor
    addi a1, a1, -1 # decrementa o tamanho do vetor
    j loop # volta para o loop

    fim: 
    # retorna a execução antes da chamada do main, no endereço salvo na pilha
    lw ra, 0(sp) # recupera o endereço de retorno da pilha
    addi ra, ra, 4 # incrementa o endereço de retorno
    addi sp, sp, 4 # libera espaço na pilha
    jr ra # retorna para o endereço salvo em ra

##### END MODIFIQUE AQUI END #####
# dica, você deve salvar o endereço da primeira chamada (em stack (sp)) para
# depois recuperá-lo.
aplica_reajuste:
##### START MODIFIQUE AQUI START #####

    lw a5, 0(a0) # carrega o valor do vetor
    # carrega o valor do vetor em outra variável para não perder o valor
    add a4, a5, x0
    # divide o a5 por 2
    srai a5, a5, 1
    # soma o valor do vetor com o valor do a5
    add a5, a5, a4
    sw a5, 0(a0) # salva o valor do vetor
    blt a5, a2, ret_reajuste # verifica se o valor do vetor é menor que o limiar
    addi t0, t0, 1 # incrementa o contador

ret_reajuste:
    ret # retorna para o loop

##### END MODIFIQUE AQUI END #####
FIM: addi x0, x0, 1
