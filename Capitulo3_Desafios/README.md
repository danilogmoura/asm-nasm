# Capítulo 3 - União com C++

## Conteúdo da Biblioteca `bibliotecaModificada.inc`

### Definições

| Nome              | Descrição                                    |
|-------------------|----------------------------------------------|
| **LF**            | Line Feed (nova linha)                       |
| **NULL**          | Terminador de String                         |
| **EXIT_SUCCESS**  | Código de saída com sucesso                  |
| **SYS_EXIT**      | Código de sistema para finalizar o programa  |
| **STDIN**         | Entrada padrão (System.in)                   |
| **STDOUT**        | Saída padrão (System.out)                    |
| **SYS_READ**      | Código de sistema para leitura               |
| **SYS_WRITE**     | Código de sistema para escrita               |
| **SYS_INTERRUPT** | Interrupção para chamadas de sistema         |
| **CHAR_ASTERISK** | Caractere de asterisco seguido de nova linha |
| **CHAR_SPACE**    | Caractere de espaço seguido de nova linha    |

### Funções

| Função            | Descrição                                    |
|-------------------|----------------------------------------------|
| **printSpace**     | Exibe um espaço seguido de nova linha no terminal |
| **printAsterisk**  | Exibe um asterisco seguido de nova linha no terminal |

Esta biblioteca fornece duas funções simples para exibir caracteres no terminal: `printSpace`, que imprime um espaço, e `printAsterisk`, que imprime um asterisco. Ambas utilizam chamadas de sistema para saída padrão.
