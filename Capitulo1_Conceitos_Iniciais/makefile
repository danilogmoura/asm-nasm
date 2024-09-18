NOME ?= nome_do_arquivo

all: $(NOME).o
	@ld -s -o $(NOME) $(NOME).o
	@./$(NOME)
	@rm -rf $(NOME) *.o;

%.o: %.asm
	@nasm -f elf64 $<