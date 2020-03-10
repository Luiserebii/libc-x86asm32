MAIN_NAME=x86asmstl
ASFLAGS=-g --32
LDFLAGS=-m elf_i386
MAIN_BUILD_FILES=../build/*.o

main: setup test link

setup:
	mkdir -p build
	cd .. && make

test:
	as $(ASFLAGS) ./src/test.s -o ./build/test.o

link: 
	ld $(LDFLAGS) $(MAIN_BUILD_FILES) ./build/test.o

clean:
	rm -rf build/* && rm a.out
