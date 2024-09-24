global Question

section .text

Question:
    mov ebx, edi
    jmp _testar

_testar:
    cmp ebx, 0              ; Compara o valor de EBX com 0
    je _par                 ; Se EBX for igual a 0, salta para o rótulo _par (número é par)
    jl _impar               ; Se EBX for menor que 0, salta para o rótulo _impar (número é ímpar)
    sub ebx, 0x2            ; Subtrai 2 do valor de EBX
    jmp _testar             ; Salta de volta para o rótulo _testar para repetir o processo

_par:
    mov eax, 1
    ret

_impar:
    mov eax, 0
    ret