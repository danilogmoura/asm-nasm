; entrada_dados.asm
; Programa para Entrada de Dados

segment .data
    LF          equ 0xA     ; Line Feed
    NULL        equ 0xD     ; Final da String
    SYS_EXIT    equ 0x1     ; Código de chamada para finalizar
    RET_EXIT    equ 0x0     ; Operação com Sucesso
    STD_IN      equ 0x0     ; Entrada padrão
    STD_OUT     equ 0x1     ; Saída padrão
    SYS_READ    equ 0x3     ; Operação de Leirura
    SYS_WRITE   equ 0x4     ; Operação de Escrita
    SYS_CALL    equ 0x80    ; Envia informações ao SO

section .data 
    msg db "Informe seu nome: ", LF, NULL
    tam equ $- msg

section .bss
    nome resb 1

; Seção do programa
section .text

global _start

; Marcador inicial
_start:

    ; Exibe a mensagem inicial
    mov eax, SYS_WRITE  
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, tam
    int SYS_CALL

    ; Lê o nome do usuário
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, nome
    mov edx, 0xA
    int SYS_CALL

saida:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL
