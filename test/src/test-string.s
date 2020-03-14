.section .data
t_strlen:
	.ascii "strlen() returns correct length\0"
str_1:
	.ascii "apple\0"
str_2:
	.ascii "banana\0"
str_3:
	.ascii "meme\0"
str_4:
	.ascii "\0"

.section .text
.globl _start

_start:
	call test_strlen

	call test_end
	movl %eax, %ebx
	movl $1, %eax
	int $0x80

.type test_strlen, @function
test_strlen:
	pushl %ebp
	movl %esp, %ebp

	pushl $str_1
	call strlen

	pushl $t_strlen
	pushl $5
	pushl %eax
	call test_assert_equal_uint

	pushl $str_2
	call strlen

	pushl $t_strlen
	pushl $6
	pushl %eax
	call test_assert_equal_uint
	
	pushl $str_3
	call strlen

	pushl $t_strlen
	pushl $4
	pushl %eax
	call test_assert_equal_uint

	pushl $str_4
	call strlen

	pushl $t_strlen
	pushl $0
	pushl %eax

	call test_assert_equal_uint

	movl %ebp, %esp
	popl %ebp
	ret
