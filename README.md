# Estudo de Assembly x86_64

Este repositório contém anotações, exemplos de código e experimentos realizados durante meu estudo do livro **Assembly na Prática** de Fernando Anselmo. Este projeto é voltado para o aprendizado da linguagem Assembly na arquitetura x86_64, utilizando o NASM como compilador.

## Sobre o Livro

O livro **Assembly na Prática** oferece uma abordagem prática para o ensino da linguagem Assembly, com foco no uso do NASM para a criação de programas em sistemas operacionais baseados em Linux (Ubuntu). Ao longo do livro, diversos exemplos e desafios são apresentados, desde o tradicional "Hello World" até programas mais avançados que interagem com C++.

### Links Importantes

- **Autor**: [Fernando Anselmo no GitHub](https://github.com/fernandoans)
- **Livro**: [Assembly na Prática (GitHub)](https://github.com/fernandoans/publicacoes/tree/master/LivroAsm)
- **Playlist no YouTube**: [Assembly na Prática](https://www.youtube.com/playlist?list=PLxTkH01AauxRm0LFLlOA9RR5O6hBLqBtC)

## Estrutura do Repositório

- **Capítulo 1: Conceitos Introdutórios**
  - Programas básicos de Assembly, incluindo o clássico "Hello World", entrada de dados, comparação de valores, e conversão de tipos.
  
- **Capítulo 2: União com C++**
  - Exemplos de integração entre Assembly e C++, aproveitando o melhor de ambas as linguagens para criar programas mais eficientes.
  
- **Capítulo 3: Quebra-Cabeças**
  - Programas desafiadores que envolvem lógica de programação, como o desenho de formas geométricas (quadrados, pirâmides, xadrez) usando Assembly.

- **Capítulo 4: Lidar com Arquivos**
  - Programas que ensinam a manipular arquivos (leitura, gravação, adição e busca de informações) usando Assembly.

- **Capítulo 5: Registradores de 64 Bits**
  - Introdução aos registradores de 64 bits e seu uso em programas mais complexos, como manipulação de pilhas e operações com arquivos.

## Ferramentas Utilizadas

- **NASM**: The Netwide Assembler, um compilador popular para Assembly.
- **Ubuntu**: Sistema operacional utilizado no desenvolvimento e testes dos programas.
- **Visual Studio Code**: Editor de texto utilizado para escrever o código Assembly.
  
## Compilação e Execução dos Programas

Para compilar e executar os programas deste repositório, siga os passos abaixo:

1. Instale o NASM no seu sistema:

   ```bash
   sudo apt install nasm
   ```

2. Compile o código Assembly:

   ```bash
   nasm -f elf64 nome_do_programa.asm
   ```

3. Linke o arquivo objeto para gerar o executável:

   ```bash
   ld -s -o nome_do_executavel nome_do_programa.o
   ```

4. Execute o programa:

   ```bash
   ./nome_do_executavel
   ```
