.section .data
meme:
	.ascii "OwO\0"

.section .text
.globl _start

_start:
	pushl $meme
	call strlen

	movl %eax, %ebx
	movl $1, %eax
	int $0x80

