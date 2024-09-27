# Integrantes: Luiza Figueiredo, Livia Barbosa
# Tema: Cálculo da soma dos termos de uma Progressão Aritmética (PA)

.data
A1: .word 2         # Define A1 como 2, o primeiro termo da PA
AN: .word 10         # Define AN como 3, o nézimo termo da PA
N: .word 5         # Define N como  5, o número de termos da PA
msg:.asciiz "A soma dos termos dessa PA é: "

.text
.globl main
main:
    lw $t0, A1 # Carrega o valor de 'A1' no registrador $t0
    lw $t1, AN # Carrega o valor de 'AN' no registrador $t1
    lw $t2, N # Carrega o valor de 'N' no registrador $t2
    
    add $t3, $t0, $t1    # soma = A1 + AN ($t3 = $t0 + $t1)
    mul $t4, $t2, $t3    # multiplicação = N(A1 + AN) ($t4 = $t2 * $t1)

    sra $t5, $t4, 1      # Sn = (N *(A1 + 1))/2 ($t5 = $t4 / 2)
    
    # Imprime a msg 
    la $a0, msg
    li $v0, 4
    syscall 
    
    # Imprime o resultado
    move $a0, $t5
    li $v0, 1
    syscall
end:
    # Print the result
    move $v0, $t5        # Move o resultado (soma dos n termos da PA) para o registrador $v0 

    li $v0, 10           # Carrega o código de encerramento (10) no registrador $v0 
    syscall              # Executa a syscall para encerrar o programa