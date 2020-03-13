MAIN_NAME=cx86asm32
ASFLAGS=-g --32
LDFLAGS=-m elf_i386
MAIN_BUILD_FILES=../build/*.o
MINTX86_O=lib/mintx86asm32.o

LDDYNFLAGS=-L .. -dynamic-linker /lib/ld-linux.so.2 -l$(MAIN_NAME)

main: setup test-string.o link-all

setup:
	mkdir -p build
	cd .. && make

test-string.o:
	as $(ASFLAGS) ./src/test-string.s -o ./build/test-string.o

link-all: 
	ld $(LDFLAGS) $(MAIN_BUILD_FILES) $(MINTX86_O) ./build/test-string.o -o test-string.out

run:
	./test-string.out

# This will likely be unused
dyn-link:
	ld $(LDFLAGS) $(LDDYNFLAGS) ./build/test-string.o

clean:
	rm -rf build/* && rm *.out
