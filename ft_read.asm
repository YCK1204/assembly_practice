section .text
	global ft_read
	extern __errno_location

ft_read:
	xor rax, rax
	mov rax, 0
	syscall
        cmp rax, 0
	jne error
	ret
error:
   	neg rax
    	mov rdi, rax
   	call __errno_location wrt ..plt
    	mov [rax], rdi
	mov rax, -1
	ret
