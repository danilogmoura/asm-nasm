%include "../Biblioteca/bibliotecaE.inc"

section .data
    msg_titulo      dw  LF, "+--------------+", LF \
                        LF, "| Impar ou Par |", LF \
                        LF, "+--------------+", LF, STR_END
    msg_solicitacao dw  "Digite um número de até 3 dígitos: ", STR_END

    msg_impar       dw  "IMPAR", LF, STR_END
    msg_par         dw  "PAR", LF, STR_END

    msg_limite      dw  "Aceitamos apenas números positivos de até 3 dígitos", LF, STR_END

section .bss
    numero_usuario  resb    4

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

    cmp eax, 0x4
    jg entrada_invalida

    mov byte [numero_usuario + eax - 1], STR_END    ; A instrução abaixo move o valor de STR_END para o byte localizado no endereço [numero_usuario + eax - 1] substituindo o '\n'.
                                                    ; Isso é geralmente usado para marcar o final de uma string ou buffer, onde o índice é calculado dinamicamente.
    call string_to_int

    xor edx, edx                                    ; Zera o registrador EDX, que será usado para armazenar o resto da divisão.
    mov ebx, 0x2                                    ; Move o valor 2 para o registrador EBX. Este valor será usado como divisor.
    div ebx                                         ; Divide o valor em EAX pelo valor em EBX. O quociente é armazenado em EAX e o resto em EDX.

    cmp edx, 0x0                                    ; A instrução abaixo realiza uma operação AND bit a bit entre EDX e EDX.
                                                    ; Isso é usado para testar se o valor em EDX é zero, sem alterar o valor de EDX.
                                                    ; Se EDX for zero, o flag Zero (ZF) será definido.
    jz eh_par

    mov ecx, msg_impar
    call imprimir_string

saida:
    mov eax, SYS_EXIT
    mov ebx, EXIT_SUCCESS
    int INT_80H

eh_par:
    mov ecx, msg_par
    call imprimir_string
    jmp saida

entrada_invalida:
    mov ecx, msg_limite
    call imprimir_string
    jmp saida