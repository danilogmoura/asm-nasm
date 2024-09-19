; maiornum_desafio.asm
; Programa que recebe a entrada de dois valores do usuário e imprime o maior ou se sao iguais

segment .data
    LF          equ     0xA     ; Line Feed
    NULL        equ     0xD     ; Final da String

    STD_IN      equ     0x0     ; Entrada padrão
    STD_OUT     equ     0x1     ; Saída padrão

    SYS_READ    equ     0x3     ; Operação de leitura
    SYS_WRITE   equ     0x4     ; Operação de escrita

    SYS_EXIT    equ     0x1     ; Código de chamada para finalizar
    SYS_RET     equ     0x0     ; Operação de sucesso

    SYS_CALL    equ     0x80    ; Envia informação ao SO


section .data
    msg_entrada_x       db      "Valor de x: ", LF, NULL
    tam_msg_entrada_x   equ     $ - msg_entrada_x

    msg_entrada_y       db      "Valor de y: ", LF, NULL
    tam_msg_entrada_Y   equ     $ - msg_entrada_y

    msg_x_maior         db      "x maior que y", LF, NULL
    tam_msg_x_maior     equ     $ - msg_x_maior

    msg_y_maior         db      "y maior que x", LF, NULL
    tam_msg_y_maior     equ     $ - msg_y_maior

    msg_iguais          db      "Os valores são iguais", LF, NULL
    tam_mgs_iguais      equ     $ - msg_iguais

section .bss
    x   resd    1
    y   resd    2

section .text

global _start

_start:
    ; 
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg_entrada_x
    mov edx, tam_msg_entrada_x
    int SYS_CALL

    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, x
    mov edx, 4
    int SYS_CALL
    
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg_entrada_y
    mov edx, tam_msg_entrada_Y
    int SYS_CALL

    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, y
    mov edx, 4
    int SYS_CALL

    mov eax, [x]
    mov ebx, [y]
    cmp eax, ebx
    je equals
    jg greater

    mov ecx, msg_y_maior
    mov edx, tam_msg_y_maior
    jmp final

equals:
    mov ecx, msg_iguais
    mov edx, tam_mgs_iguais
    jmp final

greater:
    mov ecx, msg_x_maior
    mov edx, tam_msg_x_maior

final:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    int SYS_CALL

end:
    mov eax, SYS_EXIT
    mov ebx, SYS_RET
    int SYS_CALL