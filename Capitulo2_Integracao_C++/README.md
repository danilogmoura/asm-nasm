# Capítulo 2 - União com C++

| **Registrador** | **Descrição**                                                                                              | **Função principal**                                         | **Bits**  |
|-----------------|------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|-----------|
| **RAX**         | Registrador acumulador, usado para operações aritméticas e de retorno de funções                             | Acumulador / retorno de chamada de função                    | 64        |
| **EAX**         | Versão de 32 bits do registrador RAX                                                                        | Acumulador de 32 bits                                        | 32        |
| **RBX**         | Registrador de base, pode ser usado para armazenamento temporário                                           | Base / armazenamento temporário                             | 64        |
| **EBX**         | Versão de 32 bits do registrador RBX                                                                        | Base de 32 bits                                              | 32        |
| **RCX**         | Registrador contador, usado em loops e operações de string                                                  | Contador / parâmetro para funções (primeiro argumento)       | 64        |
| **ECX**         | Versão de 32 bits do registrador RCX                                                                        | Contador de 32 bits                                          | 32        |
| **RDX**         | Registrador de dados, usado em operações de I/O e em chamadas de função                                     | Dados / parâmetro para funções (segundo argumento)           | 64        |
| **EDX**         | Versão de 32 bits do registrador RDX                                                                        | Dados de 32 bits                                             | 32        |
| **RSI**         | Registrador de origem para operações de string e também usado para passagem de parâmetros                    | Fonte de strings / parâmetro para funções (terceiro argumento)| 64        |
| **ESI**         | Versão de 32 bits do registrador RSI                                                                        | Fonte de strings de 32 bits                                  | 32        |
| **RDI**         | Registrador de destino para operações de string e também usado para passagem de parâmetros                   | Destino de strings / parâmetro para funções (quarto argumento)| 64        |
| **EDI**         | Versão de 32 bits do registrador RDI                                                                        | Destino de strings de 32 bits                                | 32        |
| **RSP**         | Registrador de ponteiro da pilha, aponta para o topo da pilha                                               | Ponteiro da pilha                                            | 64        |
| **ESP**         | Versão de 32 bits do registrador RSP                                                                        | Ponteiro da pilha de 32 bits                                 | 32        |
| **RBP**         | Registrador de base da pilha, usado para armazenar a base de quadros de pilha                               | Base da pilha                                                | 64        |
| **EBP**         | Versão de 32 bits do registrador RBP                                                                        | Base da pilha de 32 bits                                     | 32        |
| **RIP**         | Registrador de ponteiro de instrução, aponta para a próxima instrução a ser executada                       | Ponteiro de instrução                                        | 64        |
| **EIP**         | Versão de 32 bits do registrador RIP                                                                        | Ponteiro de instrução de 32 bits                             | 32        |
| **R8**          | Registrador adicional, usado para passar o quinto argumento para funções                                    | Quinto argumento de função                                   | 64        |
| **R9**          | Registrador adicional, usado para passar o sexto argumento para funções                                     | Sexto argumento de função                                    | 64        |
| **R10-R15**     | Registradores de uso geral adicionais, frequentemente usados em operações temporárias e de propósito geral  | Uso geral                                                    | 64        |

### Principais funções dos registradores

- **RSI/ESI**: Geralmente usado como fonte em operações de string ou como o terceiro argumento para funções.
- **RDI/EDI**: Usado como destino em operações de string ou como o quarto argumento para funções.
- **RAX/EAX**: Usado como acumulador em operações aritméticas e também para retorno de funções.
- **RCX/ECX**: Usado como contador de loops ou o primeiro argumento de funções.
