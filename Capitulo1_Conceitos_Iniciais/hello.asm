; hello.asm
; programa para mostrar uma mensagem Hellow World!

; Seção de variáveis
section .data
    msg db 'Hello World!', 0xA  ; Mensagem a mostrar
    tam equ $- msg              ; Quantidade de caracteres da mensagem

; Seção do Programa
section .text

global _start

; Marcador inicial
_start:
    mov eax, 0x4                ; Informa que se trata de uma saída
    mov ebx, 0x1                ; Indica que deve ser realizada no terminal
    mov ecx, msg                ; Conteúdo da saída
    mov edx, tam                ; Quantidade de caracteres
    int 0x80                    ; Envia a informação ao Sistema Operacional

saida:
    mov eax, 0x1                ; Informa que terminamos as ações
    mov ebx, 0x0                ; Informa o estado final do programa - 0 sem erro
    int 0x80                    ; Envia a informação ao Sistema Operacional