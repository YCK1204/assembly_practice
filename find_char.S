section .text
	global find_char

find_char:					; int find_char(char target, char* str, long start) {
	mov rcx, rdx				; 	rcx = start;
	xor rax, rax				;

	find_char_loop:				;	while (true) {
		movzx rax, byte [rsi + rcx]	;		rax = str[rcx];
		cmp rax, 0			;		if (rax == '\0')
		je not_found			;			return -1;
		cmp rdi, rax			;		if (target == rax)
		je found			;			return rcx;
		inc rcx				;		rcx++;
		jmp find_char_loop		;	}
						; }
	found:
		mov rax, rcx
		ret
	not_found:
		mov rax, -1
		ret
