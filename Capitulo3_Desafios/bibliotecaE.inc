section .data
    LF              equ 0xA         ; Line Feed (nova linha)
    NULL            equ 0x0         ; Fim da string
    EXIT_SUCCESS    equ 0x0         ; Código de saída para sucesso
    SYS_EXIT        equ 0x1         ; Código de chamada para finalizar o programa

    STDIN           equ 0x0         ; Entrada padrão (System.in)
    STDOUT          equ 0x1         ; Saída padrão (System.out)
    SYS_READ        equ 0x3         ; Chamada de sistema para ler
    SYS_WRITE       equ 0x4         ; Chamada de sistema para escrever
    SYS_INTERRUPT   equ 0x80        ; Interrupção para chamada de sistema

    CHAR_ASTERISK   db  "*", LF     ; Caractere de asterisco seguido de nova linha
    CHAR_SPACE      db  " ", LF     ; Caractere de espaço seguido de nova linha

section .text

; Função para imprimir um espaço seguido de nova linha
printSpace:
    mov eax, SYS_WRITE             ; Código de chamada para escrever
    mov ebx, STDOUT                ; Usar saída padrão
    mov ecx, CHAR_SPACE            ; Endereço da string de espaço
    int SYS_INTERRUPT              ; Realizar a chamada de sistema
    ret                            ; Retornar para o chamador

; Função para imprimir um asterisco seguido de nova linha
printAsterisk:
    mov eax, SYS_WRITE             ; Código de chamada para escrever
    mov ebx, STDOUT                ; Usar saída padrão
    mov ecx, CHAR_ASTERISK         ; Endereço da string de asterisco
    int SYS_INTERRUPT              ; Realizar a chamada de sistema
    ret                            ; Retornar para o chamador
