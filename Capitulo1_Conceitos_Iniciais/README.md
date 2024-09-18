

## Registradores de memória 

| 64 bits | 32 bits | Utilização                                          |
|---------|---------|----------------------------------------------------|
| rax     | eax     | Valores que são retornados dos comandos em um registrador |
| rbx     | ebx     | Registrador preservado. Cuidado ao utilizá-lo       |
| rcx     | ecx     | Uso livre como por exemplo contador                |
| rdx     | edx     | Uso livre em alguns comandos                       |
| rsp     | esp     | Ponteiro de uma pilha                              |
| rbp     | ebp     | Registrador preservado. Algumas vezes armazena ponteiros de pilhas |
| rdi     | edi     | Na passagem de argumentos, contém a quantidade desses |
| rsi     | esi     | Na passagem de argumentos, contém os argumentos em si |

** Além desses, existem os registradores de r8 a r15 (de 64 bits) e r8d a r15d (de 32 bits) que são utilizados nas movimentações correntes durante a nossa programação.

## Mais dois valores para decorarmos com o registrador EAX:

| Decimal | Hexadecimal | Utilização                                              |
|---------|-------------|---------------------------------------------------------|
| 1       | 0x1         | Indica o final de operação, corresponde a **System.exit**|
| 3       | 0x3         | Para operações de leitura, corresponde a **read**       |
| 4       | 0x4         | Para operações de saída, corresponde a **write**        |


## Agora o registrador EBX passa a ganhar importância e deve receber valores correspondentes a:

| Decimal | Hexadecimal | Utilização                                                                          |
|---------|-------------|-------------------------------------------------------------------------------------|
| 0       | 0x0         | Indica uma entrada de valor na padrão do Sistema, corresponde a **System.in**       |
| 1       | 0x1         | Indica uma saída de valor na padrão do Sistema, corresponde a **System.out**        |


## Seção .data é aonde declaramos nossas constantes que utilizaremos ao longo do programa

| Sigla | Tipo               | Significado                                 | Bytes  |
|-------|--------------------|---------------------------------------------|--------|
| db    | Define Byte         | alocação de 8 bits                          | 1 byte |
| dw    | Define Word         | alocação de 16 bits                         | 2 bytes|
| dd    | Define Doubleword   | alocação de 32 bits                         | 4 bytes|
| dq    | Define Quadword     | alocação de 64 bits                         | 8 bytes|
| ddq   | Define Double Quad  | alocação de 128 bits - para inteiros        | 10 bytes|
| dt    | Define Ten Bytes    | alocação de 128 bits - para decimais        | 10 bytes|
 
 ## Seção .bss (Block Starting Symbol) e nela colocamos todas as variáveis que serão modificadas pelo programa.

| Sigla   | Tipo         | Significado            |
|---------|--------------|------------------------|
| resb    | byte         | variável de 8 bits      |
| resw    | word         | variável de 16 bits     |
| resd    | double       | variável de 32 bits     |
| resq    | quad         | variável de 64 bits     |
| resdq   | double quad  | variável de 128 bits    |
