MAIN_NAME=x86asmstl
ASFLAGS=-g --32
LDFLAGS=-L .. -dynamic-linker /lib/ld-linux.so.2 -l$(MAIN_NAME) -m elf_i386

main: setup test link

setup:
	mkdir -p build
	cd .. && make

test:
	as $(ASFLAGS) ./src/test.s -o ./build/test.o

link: 
	ld $(LDFLAGS) ./build/test.o

clean:
	rm -rf build/* && rm a.out
