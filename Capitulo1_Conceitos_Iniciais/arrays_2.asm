%include "./bibliotecaE.inc"

section .data
    array: dd 10, 20, 13, 14, 55

section .text

global _start

_start:
    mov eax, [array + 4 * 3]            ; Carrega o valor do quarto elemento do array em EAX, lembrando que 3 é o "índice" e que o array começa no "0"
    call int_to_string                  ; Converte o valor inteiro em EAX para uma string
    call imprimir_string                ; Imprime a string resultante no termial
    mov ecx, NEW_LINE
    call imprimir_string

saida:
    mov eax, SYS_EXIT
    mov ebx, EXIT_SUCCESS
    int INT_80H