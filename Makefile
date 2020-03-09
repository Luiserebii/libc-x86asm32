NAME=x86asmstl
ASFLAGS=-g --32
LDFLAGS=-shared -m elf_i386

main: setup string link
	
# Attempt creation of build/ folder if non-existing
setup:
	mkdir -p build

string: 
	as $(ASFLAGS) src/string.s -o build/string.o 

link: 
	ld $(LDFLAGS) build/string.o -o lib$(NAME).so

clean:
	rm -rf build/* lib$(NAME).so 
