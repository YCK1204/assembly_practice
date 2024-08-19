section .text
	global ft_strcpy

ft_strcpy:
	xor rax, rax
	copy:
		mov al, [rsi]
		cmp al, 0
		je done
		mov ah, [rsi]
		mov [rdi], ah
		inc rdi
		inc rsi
		jmp copy
	done:
		mov ah, 0
		mov [rdi], ah
		ret	
