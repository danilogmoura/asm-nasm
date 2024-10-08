section .data
    LF              equ     0xA         ; Line Feed (nova linha)
    STR_END         equ     0xD         ; Terminador de String
    SYS_EXIT        equ     0x1         ; Código de sistema para sair
    EXIT_SUCCESS    equ     0x0         ; Código de saída com sucesso
    STDIN           equ     0x0         ; Entrada padrão (stdin)
    STDOUT          equ     0x1         ; Saída padrão (stdout)
    SYS_READ        equ     0x3         ; Código de sistema para leitura
    SYS_WRITE       equ     0x4         ; Código de sistema para escrita
    INT_80H         equ     0x80        ; Interrupção para chamar o kernel
    BUFFER_SIZE     equ     0xA         ; Tamanho do buffer
    NEW_LINE        db      LF, STR_END 

section .bss
    BUFFER          resb    0x4         ; 4 byte reservado para o buffer

section .text

; -----------------------------------------------
; Saída do Resultado no Terminal
; -----------------------------------------------
; Entrada:  valor String em ECX
;   Saída:  valor no terminal
; -----------------------------------------------
imprimir_string:
    call calcular_tamanho_string
    mov eax, SYS_WRITE
    mov ebx, STDOUT
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

.proximo_caractere:
    cmp byte[edx], STR_END
    jz fim_calculo
    inc edx
    jmp .proximo_caractere

fim_calculo:
    sub edx, ecx
    ret

; -----------------------------------------------
; Converter Inteiro para String
; -----------------------------------------------
; Entrada:  valor Inteiro em EAX
;   Saída:  String em EDX
; -----------------------------------------------
int_to_string:
    lea esi, [BUFFER]               ; Carrega o endereço do BUFFER no registrador ESI
    add esi, 0xC                    ; Ajusta ESI para apontar para a posição final da string no buffer (assumindo um buffer de tamanho suficiente)
    mov byte[esi], STR_END          ; Coloca um caractere de nova linha (LF) no final da string
    mov ebx, 0xA                    ; Define o divisor como 10 (para conversão de base decimal)

.proximo_digito:
    xor edx, edx                    ; Limpa o registrador EDX (necessário para a divisão)
    div ebx                         ; Divide EAX por 10, resultado em EAX e resto em EDX
    add dl, "0"                     ; Converte o dígito (resto) para seu equivalente ASCII
    dec esi                         ; Move o ponteiro ESI para a posição anterior no buffer
    mov [esi], dl                   ; Armazena o dígito convertido no buffer
    test eax, eax
    jnz .proximo_digito             ; Se EAX não for zero, continua o loop para processar o próximo dígito
    mov ecx, esi                    ; Copia o ponteiro do início da string (ESI) para ECX
    ret

                                    ; Registrador DL: É o byte menos significativo de EDX. No contexto da conversão de
                                    ; inteiro para string, DL é usado para armazenar o resto da divisão (um dígito) e
                                    ; convertê-lo para seu equivalente ASCII.

; -----------------------------------------------
; Converter String para Inteiro
; -----------------------------------------------
; Entrada:  String em ECX
;   Saída:  valor Inteiro em EAX
; -----------------------------------------------
string_to_int:
    ; xor ebx, ebx                    ; Limpa o registrador EBX (usado para armazenar o valor inteiro)
    mov esi, ecx                    ; Carrega o endereço da String em ESI
    call calcular_tamanho_string    ; Calcula o tamanho da String adiciona no registrado edx
    mov ecx, edx                    ; Atribui ao contator do loop o valor calculado acima

.proxima_string:
    movzx eax, byte[esi]            ; Carrega o byte localizado no endereço apontado por ESI em EAX,
                                    ; zero-extende o valor para 32 bits. Isso significa que os 8 bits
                                    ; menos significativos de EAX conterão o valor do byte, e os 24 bits
                                    ; mais significativos serão preenchidos com zeros.
    
    inc esi                         ; Incremta o ponteiro para ESI
    sub al, '0'                     ; Converte o caractere ASCII numérico para seu valor numérico.
                                    ; Exemplo: Se '1' (ASCII 49) estiver em AL, após a subtração: 49 - 48 (0 Decimal) = 1.
                                    ; O valor ASCII de '0' é 48, então subtrair '0' de qualquer dígito ASCII dá o valor numérico real.
    
    imul ebx, 0xA                  ; Multiplica EBX por 10 (EBX = EBX * 10 = 1 * 30 = 30)
    add ebx, eax
    loop .proxima_string            ; Decrementa ECX e repete o loop se ECX não for zero
    mov eax, ebx
    ret                   