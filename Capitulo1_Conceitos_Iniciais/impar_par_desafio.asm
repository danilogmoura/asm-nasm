%include "./bibliotecaE.inc"

section .data
    msg_impar   dw      "impar", LF, STR_END
    msg_par     dw      "par", LF, STR_END

section .text

global _start

_start:
    xor edx, edx
    mov eax, 0x3
    mov ebx, 0x2
    div ebx

    test edx, edx
    jz numero_par

    mov ecx, msg_impar

imprimir:   
    call imprimir_string
    int INT_80H

saida:
    mov eax, SYS_EXIT
    mov ebx, EXIT_SUCCESS
    int INT_80H

numero_par:
    mov ecx, msg_par
    jmp imprimir