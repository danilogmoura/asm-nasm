# Biblioteca de Funções e Variáveis Comuns

Este diretório contém a biblioteca `bibliotecaE.inc`, que inclui funções e definições comuns para uso nos programas Assembly ao longo dos capítulos. Ela foi criada para evitar a repetição de código e centralizar funções úteis que podem ser reutilizadas em diferentes programas.

## Funcionalidades Incluídas

A biblioteca contém definições de variáveis e funções como:

- **Manipulação de Entrada e Saída**: Funções para facilitar a leitura e escrita de dados no terminal.
- **Definições de Tamanho de Tipos de Dados**: Definições como `resb`, `resw`, `resd`, etc., que ajudam na alocação de diferentes tipos de variáveis em memória.
- **Funções Utilitárias**: Funções para realizar operações comuns, como conversão de valores entre diferentes formatos.

## Uso

Para utilizar a biblioteca, adicione a linha abaixo no início de seu programa Assembly:

```asm
%include 'bibliotecaE.inc'
```

## Conteúdo da Biblioteca `bibliotecaE.inc`

### Definições

- **LF**: Line Feed (quebra de linha)
- **NULL**: Final de string
- **SYS_EXIT**: Código de saída
- **RET_EXIT**: Código de retorno para sucesso
- **STD_IN**: Entrada padrão
- **STD_OUT**: Saída padrão
- **SYS_READ**: Operação de leitura
- **SYS_WRITE**: Operação de escrita
- **SYS_CALL**: Chamada do sistema operacional
- **TAM_BUFFER**: Tamanho do buffer

### Segmento `.bss`

- **BUFFER**: 1 byte reservado

### Funções

- **saidaResultado**: Exibe uma string no terminal
