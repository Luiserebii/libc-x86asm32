MAIN_NAME=x86asmstl
CFLAGS=-g3 -Wall -Wextra -ffreestanding
LDFLAGS=-L .. -dynamic-linker /lib/ld-linux.so.2 -l$(MAIN_NAME)
TEST_OBJ=test.o

build_main:
	cd .. && make

test:
	$(CC) $(CLAGS) ./src/* ./lib/*.c -o test.o

link: 
	ld $(LDFLAGS) $(TEST_OBJ)

out: 
	tail -n +1 tmp/*
