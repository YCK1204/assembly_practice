section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax

	LOOP:
		mov al, [rdi]
		mov ah, [rsi]
		cmp al, ah
		jl JUMP_LESS
		jg JUMP_GREATER
		cmp al, 0
		je DONE
		inc rdi
		inc rsi
		jmp LOOP
	JUMP_LESS:
		mov rax, -1
	JUMP_GREATER:
		mov rax, 1
	DONE:
		ret
