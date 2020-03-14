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
	cmpb $0, (%ebx)
	je strlen_while_char_end
	
	# Increment %eax and char*
	incl %eax
	incl %ebx
	
	jmp strlen_while_char

strlen_while_char_end:	
	
	movl %ebp, %esp
	popl %ebp
	ret

#
# void strcat(char* dest, const char* src)
#
.globl strcat
.type strcat, @function
strcat:
	pushl %ebp
	movl %esp, %ebp

	# Load dest and src into registers
	movl 8(%ebp), %eax
	movl 12(%ebp), %ecx
	
	# Roll dest up to the null terminator (\0)
	# while(*dest) { ++dest; }
strcat_while_char_src:
	cmpb $0, (%eax)
	je strcat_while_char_src_end

	incl %eax
	jmp strcat_while_char_src

strcat_while_char_src_end:

	# while(*dest++ = *src++)
	#    ;

strcat_while_set:
	movb (%ecx), %dl
	movb %dl, (%eax)
	incl %eax
	incl %ecx

	cmpb $0, %dl
	jne strcat_while_set

	popl %ebp
	ret
#
# void strcpy(char* dest, const char* src)
#
.globl strcpy
.type strcpy, @function
strcpy:
	pushl %ebp
	movl %esp, %ebp

	# while(*dest++ = *src++)
	#    ;

	# Load dest and src into registers
	movl 8(%ebp), %eax
	movl 12(%ebp), %ecx

strcpy_while_set:
	movb (%ecx), %dl
	movb %dl, (%eax)
	incl %eax
	incl %edx

	cmpb $0, %dl
	jne strcpy_while_set

	popl %ebp
	ret
