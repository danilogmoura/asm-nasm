%include "../Biblioteca/bibliotecaE.inc"

section .data
    titulo              db      LF, "+-------------+", LF, \
                                    "| Calculadora |", LF, \
                                    "+-------------+", STR_END

    msg_valor_1         db      "Valor 1: ", STR_END
    msg_valor_2         db      "Valor 2: ", STR_END

    opc_adicao          db      LF, "1. Adição", STR_END
    opc_subtracao       db      LF, "2. Subtração", STR_END
    opc_divisao         db      LF, "3. Divisão", STR_END
    opc_multiplicacao   db      LF, "4. Multiplicação", STR_END

    msg_opcao           db      LF, LF, "Qual oepração deseja realizar? ", STR_END
    msg_erro            db      LF, "Valor da Opção Inválido", STR_END

    proc_adicao         db      LF, "Processo de Adição", STR_END
    proc_subtracao      db      LF, "Processo de Subtração", STR_END
    proc_divisao        db      LF, "Processo de Divisão", STR_END
    proc_multiplicacao  db      LF, "Processo de Multiplicação", STR_END

    msg_fim             db      LF, "Terminei.", LF, STR_END

section .bss
    opcao               resb    0x1
    valor_1             resb    0x1
    valor_2             resb    0x1

section .text

global _start
_start:
    mov ecx, titulo
    call imprimir_string

    mov ecx, opc_adicao
    call imprimir_string
    
    mov ecx, opc_subtracao
    call imprimir_string
    
    mov ecx, opc_divisao
    call imprimir_string
    
    mov ecx, opc_multiplicacao
    call imprimir_string

    mov ecx, msg_opcao
    call imprimir_string

    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, opcao                  ; ECX agora contém o endereço da variável `opcao`
    mov edx, 0x2                    ; Reserva 2 bytes para armazenar a opção e o '\n'
    int INT_80H

    mov ah, [opcao]
    sub ah, "0"

    cmp ah, 0x4
    jg mensagem_erro
    cmp ah, 0x1
    jl mensagem_erro

    mov ecx, msg_valor_1
    call imprimir_string
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, valor_1
    mov edx, 0x3
    int INT_80H

    mov ecx, msg_valor_2
    call imprimir_string
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, valor_2
    mov edx, 0x3
    int INT_80H

    mov ah, [opcao]
    sub ah, "0"

    cmp ah, 0x1
    je adicao
    
    cmp ah, 0x2
    je subtracao

    cmp ah, 0x3
    je divisao

    cmp ah,0x4
    je multiplicacao

saida:
    mov ecx, msg_fim
    call imprimir_string

    mov eax, SYS_EXIT
    mov ebx, EXIT_SUCCESS
    int INT_80H

mensagem_erro:
    mov ecx, msg_erro
    call imprimir_string
    jmp saida

adicao:
    mov ecx, proc_adicao
    call imprimir_string
    jmp saida

subtracao:
    mov ecx, proc_subtracao
    call imprimir_string
    jmp saida

divisao:
    mov ecx, proc_divisao
    call imprimir_string
    jmp saida

multiplicacao:
    mov ecx, proc_multiplicacao
    call imprimir_string
    jmp saida
