section .text
	global ft_pow

ft_pow:				; long ft_pow(long n, long cnt) {
	mov rax, 1		; 	rax = 1;
	xor rcx, rcx		;	rcx = 0;
	ft_pow_loop:		;	while (true) {
		cmp rcx, rsi	;		if (rcx == cnt)
		je done		;			break;
		imul rax, rdi	;		rax *= n;
		inc rcx		;		rcx++;
		jmp ft_pow_loop ;	}
	done:			;	return rax;
		ret		; }
