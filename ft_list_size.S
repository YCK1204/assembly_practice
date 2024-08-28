section .text
	global ft_list_size

ft_list_size:					; int ft_list_size(t_list* begin_list) {
	xor rax, rax
	mov rsi, rdi

	count_loop:
		cmp rdi, 0
		je done
		inc rax
		mov rcx, [rdi + 8]
		mov rdi, rcx
		jmp count_loop
	done:
		mov rdi, rsi
		ret
