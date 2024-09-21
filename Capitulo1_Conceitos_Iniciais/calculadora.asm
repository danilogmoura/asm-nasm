%include "../Biblioteca/bibliotecaE.inc"

section .data
    titulo              db  LF, "+-------------+", LF, \
                                "| Calculadora |", LF, \
                                "+-------------+", STR_END

    valor_1             db  LF, "Valor 1:", STR_END
    valor_2             db  LF, "Valor 2:", STR_END

    opc_adicao          db  LF, "1. Adicionar", STR_END
    opc_subtracao       db  LF, "2. Subtração", STR_END
    opc_divisao         db  LF, "3. Divisão", STR_END
    opc_multiplicacao   db  LF, "4. Multiplicação", STR_END

    msg_opcao           db  LF, LF, "Deseja Realizar? ", STR_END
    msg_erro            db  LF, "Valor da Opção Inválido", STR_END

    proc_adicao         db  LF, "Processo Adicionar", STR_END
    proc_subtracao      db  LF, "Processo Subtração", STR_END
    proc_divisao        db  LF, "Processo Divisão", STR_END
    proc_multiplicacao  db  LF, "Processo Multiplicação", STR_END

    msg_fim             db  LF, "Terminei.", LF, STR_END

section .bss
    opcao       resb    0x1
    numero_1    resb    0x1
    numero_2    resb    0x1

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

saida:
    mov eax, SYS_EXIT
    mov ebx, EXIT_SUCCESS
    int INT_80H
