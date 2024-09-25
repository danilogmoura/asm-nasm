%include "./bibliotecaE.inc"

section .data
    msg_1: db "Parte 1", LF, STR_END
    msg_2: db "Parte 2", LF, STR_END
    msg_3: db "Parte 3", LF, STR_END
    msg_4: db "Parte 4", LF, STR_END

section .text

global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg_1
    mov edx, 0x24               ; 36 decimal
    int INT_80H

saida:
    mov eax, SYS_EXIT
    mov ebx, EXIT_SUCCESS
    int INT_80H