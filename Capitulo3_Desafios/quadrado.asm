%include "./bibliotecaE.inc"

section .bss
    lado resd 0x1           ; Reservando 4 bytes (1 dword) de espaço para a variável 'lado'

section .text

global _start

_start:
    mov dword[lado], 0x4    ; Inicializa a variável 'lado' com o valor 4
    mov edi, dword[lado]    ; Move o valor de 'lado' para o registrador EDI

inicio:
    mov esi, dword[lado]    ; Move o valor de 'lado' para o registrador ESI
    call printLine          ; Chama a função printLine para imprimir uma linha de asteriscos
    sub edi, 0x1            ; Decrementa o valor de EDI em 1
    cmp edi, 0x0            ; Compara o valor de EDI com 0
    je  fim                 ; Se EDI for igual a 0, salta para o rótulo 'fim'
    jmp inicio              ; Caso contrário, salta para o rótulo 'inicio' para repetir o processo

printLine:
    mov edx, 0x1            ; Define o valor de EDX como 1 (número de asteriscos a imprimir)
    call printAsterisk      ; Chama a função printAsterisk para imprimir um asterisco
    sub esi, 0x1            ; Decrementa o valor de ESI em 1
    cmp esi, 0x1            ; Compara o valor de ESI com 1
    jg printLine            ; Se ESI for maior que 1, salta para o rótulo 'printLine' para imprimir outro asterisco
    mov edx, 0x2            ; Define o valor de EDX como 2 (para imprimir um caractere de nova linha)
    call printAsterisk      ; Chama a função printAsterisk para imprimir o caractere de nova linha
    ret                     ; Retorna da função printLine

fim:
    mov eax, SYS_EXIT
    mov ebx, EXIT_SUCCESS
    int SYS_INTERRUPT