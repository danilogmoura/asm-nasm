; maiornum.asm

segment .data
    LF          equ 0xA     ; Line Feed
    NULL        equ 0xD     ; Final da String
    SYS_WRITE   equ 0x4     ; Operação de Escrita
    STD_OUT     equ 0x1     ; Saída padrão
    SYS_EXIT    equ 0x1     ; Código de chamada para finalizar
    RET_EXIT    equ 0x0     ; Operação com sucesso
    SYS_CALL    equ 0x80    ; Enviado informação ao SO

section .data
    x           dd      10
    y           dd      50
    x_maior     db      "x maior que y", LF, NULL
    tam_x_maior equ     $-x_maior
    y_maior     db      "y maior que x", LF, NULL
    tam_y_maior equ     $-y_maior

section .text

global _start

_start:
    mov eax, [x]
    mov ebx, [y]
    cmp eax, ebx
    jge maior

    mov ecx, y_maior
    mov edx, tam_y_maior
    jmp final

maior:
    mov ecx, x_maior
    mov edx, tam_x_maior

final:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    int SYS_CALL

saida:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL