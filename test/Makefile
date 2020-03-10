MAIN_NAME=x86asmstl
CFLAGS=-g3 -Wall -Wextra -ffreestanding -m32
LDFLAGS=-L .. -dynamic-linker /lib/ld-linux.so.2 -l$(MAIN_NAME) -m elf_i386
TEST_OBJ=test.o

main: setup build_main test link


setup:
	mkdir -p build

build_main:
	cd .. && make

test:
	$(CC) $(CFLAGS) ./src/* ./lib/*.c -o test.o

link: 
	ld $(LDFLAGS) $(TEST_OBJ)

out: 
	tail -n +1 tmp/*
