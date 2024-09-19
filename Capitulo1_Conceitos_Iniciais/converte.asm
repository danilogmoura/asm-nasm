%include "../Biblioteca/bibliotecaE.inc"

section .data
    valor   dw  '105', LF   ; Variável do tipo Double Word (ou seja um caracter)

section .text

global _start

_start:
    call converter_valor
    call mostrar_valor
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL

converter_valor:
    lea esi, [valor]        ; LEA calcula e armazena endereços em registradores, sendo mais seguro que MOV para endereços.
    mov ecx, 0x3            ; Define o contador de loop para 3
    call string_to_int
    add eax, 0x2
    ret

mostrar_valor:
    call int_to_string
    call saidaResultado
    ret

string_to_int:
    xor ebx, ebx            ; Zera o registrador EBX de forma eficiente

.proximo_digito:
    movzx eax, byte[esi]    ; Carrega o próximo byte da string em eax
    inc esi                 ; incrementa o ponteiro da string
    sub al, '0'             ; Converte o caractere ASCII numérico para seu valor numérico.
                            ; Exemplo: Se '1' (ASCII 49) estiver em AL, após a subtração: 49 - 48 (0 Decimal) = 1.
                            ; O valor ASCII de '0' é 48, então subtrair '0' de qualquer dígito ASCII dá o valor numérico real.

    imul ebx, 0xA
    add ebx, eax
    loop .proximo_digito    ; Decrementa ecx e repete o loop se não for zero
    mov eax, ebx            ; Move o resultado final para eax
    ret

int_to_string:
    lea esi, [BUFFER]       ; Carrega o endereço inicial do buffer em `esi`
    add esi, 0x9            ; Move `esi` para 9 bytes à frente do início ex: se endereço é 0x1000 ele vai para 0x1009
    mov byte[esi], LF       ; Coloca um caractere de nova linha no final do buffer
    mov ebx, 0xA            ; Define o divisor como 10 para conversão decimal

.proximo_digito:
    xor edx, edx            ; Zera `edx` para a divisão
    div ebx                 ; Divide `eax` por 10
    add dl, '0'             ; Converte o valor em `dl` para caractere ASCII
    dec esi                 ; Move `esi` uma posição para trás ex: se antes 0x1009 vai para 0x1008
    mov [esi], dl           ; Coloca o dígito convertido no buffer
    test eax, eax           ; Testa se `eax` é 0
    jnz .proximo_digito     ; Continua se ainda houver dígitos para converter
    ret