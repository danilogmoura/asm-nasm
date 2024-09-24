%include "../Biblioteca/bibliotecaE.inc"

section .data
    msg_titulo      dw  LF, "+--------------+", LF \
                        LF, "| Impar ou Par |", LF \
                        LF, "+--------------+", LF, STR_END
    msg_solicitacao dw  "Digite um número de até 3 dígitos: ", STR_END

section .bss
    numero_usuario  resw    1

section .text

global _start

_start:
    mov ecx, msg_titulo
    call imprimir_string
    mov ecx, msg_solicitacao
    call imprimir_string
    int INT_80H

    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, numero_usuario
    int INT_80H

    lea esi, [numero_usuario]
    call string_to_int

    ; xor edx, edx
    ; mov eax, 57
    mov ebx, 0x2
    div ebx

    mov eax, edx

    call int_to_string
    call imprimir_string
    mov ecx, NEW_LINE
    call imprimir_string

saida:
    mov eax, SYS_EXIT
    mov ebx, EXIT_SUCCESS
    int INT_80H