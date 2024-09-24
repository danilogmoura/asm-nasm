section .text

global Teste1
global Teste2

Teste1:
    cmp edi, esi                ; Compara o valor do registrador EDI com o valor do registrador ESI
    jg  retorna_edi
    jmp retorna_esi

retorna_edi:
    mov eax, edi
    ret

retorna_esi:
    mov eax, esi
    ret

Teste2:
    cmp edi, 0x1
    je retorna_5
    cmp edi, 0x2
    je retorna_6
    cmp edi, 0x3
    je retorna_4
    cmp edi, 0x4
    je retorna_5
    mov eax, 0x0
    ret

retorna_4:
    mov eax, 0x4
    ret

retorna_5:
    mov eax, 0x5
    ret

retorna_6:
    mov eax, 0x6
    ret
