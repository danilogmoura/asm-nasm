# Nome padrão do arquivo, caso não seja fornecido. Pode ser alterado ao executar o make.
NOME ?= nome_do_arquivo

# Flag de depuração. Se DEBUG=1, compila com símbolos de depuração. Se DEBUG=0, compila sem depuração.
DEBUG ?= 0						# 0 para sem depuração, 1 para com depuração

# Se DEBUG for 1, adiciona flags de depuração; caso contrário, remove símbolos no link.
ifeq ($(DEBUG), 1)
    NASM_FLAGS = -g -F dwarf	# Adiciona símbolos de depuração DWARF ao código Assembly.
    LD_FLAGS =					# Não remove os símbolos no link.
else
    NASM_FLAGS =				# Não adiciona símbolos de depuração.
    LD_FLAGS = -s				# Remove símbolos durante o processo de linkagem.
endif

# Regra principal (default) que será executada quando chamar `make`.
# Dependendo do valor de DEBUG, o clean será chamado no início ou no final.
all: conditional_clean $(NOME).o
	@ld -m elf_i386 $(LD_FLAGS) -o $(NOME) $(NOME).o  # Linka o arquivo objeto, aplicando as flags apropriadas.
	@./$(NOME)                                        # Executa o programa.
	@if [ "$(DEBUG)" -eq "0" ]; then $(MAKE) --no-print-directory clean; fi # Limpa arquivos ao final somente se DEBUG for 0.

# Regra para compilar o arquivo Assembly (.asm) para um objeto (.o).
# Usa o NASM com o formato elf32 para arquitetura de 32 bits.
%.o: %.asm
	@nasm -f elf32 $(NASM_FLAGS) $<		# Compila o arquivo .asm usando as flags apropriadas (com ou sem depuração).

# Regra para limpar os arquivos .o e o executável.
clean:
	@rm -rf $(NOME) *.o                 # Remove arquivos antigos.

# Executa o 'clean' condicionalmente no início apenas se DEBUG for 1.
conditional_clean:
	@if [ "$(DEBUG)" -eq "1" ]; then $(MAKE) --no-print-directory clean; fi
