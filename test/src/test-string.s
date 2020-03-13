.section .data
t_strlen:
	.ascii "strlen() returns correct length\0"
str_1:
	.ascii  "apple\0"
str_2:
	.ascii "banana\0"
str_3:
	.ascii "meme\0"

.section .text
.globl _start

_start:
	pushl $str_1
	call strlen

	pushl $t_strlen
	pushl $5
	pushl %eax
	call test_assert_equal

	pushl $str_2
	call strlen

	pushl $t_strlen
	pushl $6
	pushl %eax
	call test_assert_equal
	
	pushl $str_3
	call strlen

	pushl $t_strlen
	pushl $4
	pushl %eax
	call test_assert_equal

	call test_end
	movl %eax, %ebx
	movl $1, %eax
	int $0x80

