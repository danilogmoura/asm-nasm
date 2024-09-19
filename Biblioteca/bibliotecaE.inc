segment .data
    LF          equ     0xA     ; Line Feed
    NULL        equ     0xD     ; Final da String
    SYS_EXIT    equ     0x1     ; Código de chamada para finalizar
    RET_EXIT    equ     0x0     ; Operação com sucesso
    STD_IN      equ     0x0     ; Entrada padrão
    STD_OUT     equ     0x1     ; Saída padrão
    SYS_READ    equ     0x3     ; Operação de Leitura   
    SYS_WRITE   equ     0x4     ; Operação de Escrita
    SYS_CALL    equ     0x80    ; Envia informação ao SO
    TAM_BUFFER  equ     0xA     ; Tamanho do buffer

segment .bss
    BUFFER      resb    0x1     ; 4 bytes

segment .text

; -----------------------------------------------
; Saída do Resultado no Terminal
; -----------------------------------------------
; Entrada:  valor String em BUFFER
;   Saída:  valor no terminal
; -----------------------------------------------
saidaResultado:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, BUFFER
    mov edx, TAM_BUFFER
    int SYS_CALL
    ret