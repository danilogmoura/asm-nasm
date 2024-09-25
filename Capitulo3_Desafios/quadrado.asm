%include "./bibliotecaE.inc"

section .bss
    lado resd 0x1   ; Reservando 4 bytes (1 dword) de espaço para a variável 'lado'

section .text

global _start

_start:
    mov dword[lado], 0x4
    mov edi, dword[lado]

inicio:
    mov esi, dword[lado]
    call printLine
    sub edi, 0x1
    cmp edi, 0x0
    je  fim
    jmp inicio

printLine:
    mov edx, 0x1
    call printAsterisk
    sub esi, 0x1
    cmp esi, 0x1
    jg printLine
    mov edx, 0x2
    call printAsterisk
    ret

fim:
    mov eax, SYS_EXIT
    mov ebx, EXIT_SUCCESS
    int SYS_INTERRUPT