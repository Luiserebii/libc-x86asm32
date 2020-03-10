#
# string.s
#

#
# int32_t strlen(char* s)
# 
# Expects a char* and returns the length of the string.
# It is assumed that the string is null-terminated.
#
.globl strlen
.type strlen, @function
strlen:
	pushl %ebp
	movl %esp, %ebp

	# Store char* in %ebx
	movl 8(%ebp), %ebx

	# Reserve %eax for size
	movl $0, %eax
	
strlen_while_char:
	cmpl $0, (%ebx)
	je strlen_while_char_end
	
	# Increment %eax and char*
	incl %eax
	addl $4, %ebx

strlen_while_char_end:	
	
	movl %ebp, %esp
	popl %ebp
	ret
