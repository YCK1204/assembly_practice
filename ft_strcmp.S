section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax
	xor rcx, rcx
	xor bl, bl

	LOOP:
		mov al, [rdi + rcx]
		mov bl, [rsi + rcx]
		cmp al, bl
		jne DONE
		cmp al, 0
		je DONE
		inc rcx
		jmp LOOP
	DONE:
		sub al, bl
		movsx rax, al
		ret
