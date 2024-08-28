section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax
	xor bl, bl

	LOOP:
		mov al, [rdi]
		mov bl, [rsi]
		cmp al, bl
		jne DONE
		cmp byte al, 0
		je DONE
		inc rdi
		inc rsi
		jmp LOOP
	DONE:
		sub al, bl
		movsx rax, al
		ret
