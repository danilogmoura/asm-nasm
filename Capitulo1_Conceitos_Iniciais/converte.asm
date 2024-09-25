%include "./bibliotecaE.inc"

section .data
    valor   db  "105", STR_END  	; Variável do tipo Double Word (ou seja um caracter)

section .text

global _start

_start:
    call converter_valor
    call mostrar_valor
    mov eax, SYS_EXIT
    mov ebx, EXIT_SUCCESS
    int INT_80H

converter_valor:
    lea ecx, [valor]                ; LEA calcula e armazena endereços em registradores, sendo mais seguro que MOV para endereços.
    call string_to_int
    add eax, 0x2
    ret

mostrar_valor:
    call int_to_string
    call imprimir_string
    mov ecx, NEW_LINE
    call imprimir_string
    ret