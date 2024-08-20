section .text
	global ft_strcpy

ft_strcpy:
	xor rax, rax
	xor rcx, rcx
	COPY:
		mov al, [rsi + rcx]
		cmp al, 0
		je DONE
		mov [rdi + rcx], al
		inc rcx
		jmp COPY
	DONE:
		mov byte [rdi + rcx], 0
		mov rax, rdi
		ret
