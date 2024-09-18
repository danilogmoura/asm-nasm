; entrada_dados_desafio.asm
; Programa que recebe a entrada de dados e imprime na saída principal

segment .data
    LF          equ 0xA     ; Line Feed
    NULL        equ 0xD     ; Final da String
    SYS_WRITE   equ 0x4     ; Operação de Escrita
    SYS_READ    equ 0x3     ; Operação de Leitura
    STD_IN      equ 0x0     ; Entrada padrão
    STD_OUT     equ 0X1     ; Saída padrão

    SYS_EXIT    equ 0x1     ; Código de chamada para finalizar
    SYS_RET     equ 0x0     ; Operação com sucesso     
    SYS_CALL    equ 0x80    ; Envia informações ao SO

section .data
    msg_entrada     db "Informe seu nome: ", LF, NULL
    tam_msg_entrada equ $- msg_entrada

    msg_saida       db "Seu nome é: ", LF,  NULL
    tam_msg_saida   equ $- msg_saida

section .bss
    nome    resb 1

section .text

global _start

_start:
    ; Exibe a mensagem de entrada
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg_entrada
    mov edx, tam_msg_entrada
    int SYS_CALL

    ; Lê o nome do usuário
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, nome
    mov edx, 0xA
    int SYS_CALL

    ; Exibe a mensagem de saída
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg_saida
    mov edx, tam_msg_saida
    int SYS_CALL

    ; Existe o nome
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, nome
    mov edx, 0xA
    int SYS_CALL

saida:
    mov eax, SYS_EXIT
    mov ebx, SYS_RET
    int SYS_CALL