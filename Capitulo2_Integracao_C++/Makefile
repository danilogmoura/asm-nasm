# Nome padrão do arquivo, caso não seja fornecido. Pode ser alterado ao executar o make.
NOME ?= nome_do_arquivo

# Flag de depuração. Se DEBUG=1, compila com símbolos de depuração. Se DEBUG=0, compila sem depuração.
DEBUG ?= 0						# 0 para sem depuração, 1 para com depuração

# Se DEBUG for 1, adiciona flags de depuração; caso contrário, remove símbolos no link.
ifeq ($(DEBUG), 1)
    NASM_FLAGS = -g -F dwarf	# Adiciona símbolos de depuração DWARF ao código Assembly.
    GPP_FLAGS = -g				# Adiciona símbolos de depuração ao código C++.
else
    NASM_FLAGS =				# Não adiciona símbolos de depuração.
    GPP_FLAGS = -O2				# Otimizações no código C++.
endif

# Regra principal (default) que será executada quando chamar `make`.
# Dependendo do valor de DEBUG, o clean será chamado no início ou no final.
all: conditional_clean $(NOME)
	@if [ "$(DEBUG)" -eq "0" ]; then ./$(NOME); fi  							# Executa o programa automaticamente se DEBUG for 0
	@if [ "$(DEBUG)" -eq "0" ]; then $(MAKE) --no-print-directory clean; fi		# Limpa arquivos ao final se DEBUG for 0

# Regra para compilar o código C++ e o Assembly, e então linkar.
# Adicionar a flag -z noexecstack ao linker no Makefile resolve o warning e garante que o executável final não tenha uma pilha executável
$(NOME): $(NOME).o $(NOME)_asm.o
	@g++ $(GPP_FLAGS) -m64 -z noexecstack -o $(NOME) $(NOME).o $(NOME)_asm.o	# Linka os arquivos objeto

# Regra para compilar o arquivo C++.
$(NOME).o: $(NOME).cpp
	@g++ $(GPP_FLAGS) -m64 -c $(NOME).cpp -o $(NOME).o			# Compila o código C++ para objeto

# Regra para compilar o arquivo Assembly.
$(NOME)_asm.o: $(NOME).asm
	@nasm -f elf64 $(NASM_FLAGS) $(NOME).asm -o $(NOME)_asm.o	# Compila o código Assembly para objeto

# Regra para limpar os arquivos .o e o executável.
clean:
	@rm -rf $(NOME) *.o $(NOME)_asm.o							# Remove arquivos antigos.

# Executa o 'clean' condicionalmente no início apenas se DEBUG for 1.
conditional_clean:
	@if [ "$(DEBUG)" -eq "1" ]; then $(MAKE) --no-print-directory clean; fi
