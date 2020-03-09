#
# string.s
#

#
# int32_t strlen(char* s)
# 
# Expects a char* and returns the length of the string.
# It is assumed that the string is null-terminated.
#
.type strlen, @function
strlen:
	pushl %ebp
	movl %esp, %ebp


	
	movl %ebp, %esp
	popl %ebp
	ret
