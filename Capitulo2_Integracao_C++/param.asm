global PassarParam

section .text

PassarParam:
    mov eax, edi
    add eax, esi
    add eax, edx
    ret