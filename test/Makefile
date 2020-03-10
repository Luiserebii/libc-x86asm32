MAIN_NAME=cx86asm32
ASFLAGS=-g --32
LDFLAGS=-m elf_i386
MAIN_BUILD_FILES=../build/*.o

LDDYNFLAGS=-L .. -dynamic-linker /lib/ld-linux.so.2 -l$(MAIN_NAME)

main: setup test link

setup:
	mkdir -p build
	cd .. && make

test:
	as $(ASFLAGS) ./src/test.s -o ./build/test.o

link: 
	ld $(LDFLAGS) $(MAIN_BUILD_FILES) ./build/test.o

dyn-link:
	ld $(LDFLAGS) $(LDDYNFLAGS) ./build/test.o

clean:
	rm -rf build/* && rm a.out
