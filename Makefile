NAME=cx86asm32
ASFLAGS=-g --32
LDFLAGS=-shared -m elf_i386

main: setup string.o link
	
# Attempt creation of build/ folder if non-existing
setup:
	mkdir -p build

string.o: 
	as $(ASFLAGS) src/string.s -o build/string.o 

link: 
	ld $(LDFLAGS) build/string.o -o build/lib$(NAME).so

clean:
	rm -rf build/* lib$(NAME).so 
