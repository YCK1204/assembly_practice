section .text
	global ft_write

ft_write:
	xor rax, rax
	mov rax, 1 ; num of syscall write
       	syscall
	ret
