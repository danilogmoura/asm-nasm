section .text

global GetValorASM

GetValorASM:
    mov eax, edi        ; Em convenções de chamada de funções em sistemas x86-64, o registrador EDI é usado para passar o primeiro argumento inteiro para uma função.
                        ; Quando uma função escrita em Assembly é chamada a partir de C++, o valor do primeiro argumento é passado no registrador EDI.
                        ; Neste contexto, EDI contém o valor de entrada que a função GetValorASM irá processar.
    mov eax, edi
    add eax, 1
    ret