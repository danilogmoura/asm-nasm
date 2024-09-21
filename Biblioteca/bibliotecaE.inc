segment .data
    LF              equ     0xA     ; Line Feed (nova linha)
    STR_END         equ     0xD     ; Terminador de String
    SYS_EXIT        equ     0x1     ; Código de sistema para sair
    EXIT_SUCCESS    equ     0x0     ; Código de saída com sucesso
    STDIN           equ     0x0     ; Entrada padrão (stdin)
    STDOUT          equ     0x1     ; Saída padrão (stdout)
    SYS_READ        equ     0x3     ; Código de sistema para leitura
    SYS_WRITE       equ     0x4     ; Código de sistema para escrita
    INT_80H         equ     0x80    ; Interrupção para chamar o kernel
    BUFFER_SIZE     equ     0xA     ; Tamanho do buffer

segment .bss
    BUFFER          resb    0x1     ; 1 byte reservado para o buffer

segment .text

; -----------------------------------------------
; Saída do Resultado no Terminal
; -----------------------------------------------
; Entrada:  valor String em BUFFER
;   Saída:  valor no terminal
; -----------------------------------------------
imprimir_string:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, BUFFER
    mov edx, BUFFER_SIZE
    int INT_80H
    ret

; -----------------------------------------------
; Calcular o tamanho da String
; -----------------------------------------------
; Entrada:  valor String em ECX
;   Saída:  tamanho da String em EDX
; -----------------------------------------------
calcular_tamanho_string:
    mov edx, ecx

proximo_caractere:
    cmp byte[edx], STR_END
    jz fim_calculo
    inc edx
    jmp proximo_caractere

fim_calculo:
    sub edx, ecx
    ret
