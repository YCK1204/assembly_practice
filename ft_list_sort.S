section .text
	global ft_list_sort

ft_list_swap:
	mov rbx, [rdi]
	mov rcx, [rsi]
	mov [rdi], rcx
	mov [rsi], rbx
	ret

ft_list_sort:					; void ft_list_sort(t_list **begin_list, int (*cmp)()) {
	mov r14, rdi				;	r14 = begin_list;
	mov r15, rsi				;	r15 = cmp;
	mov r8, rdi				;	r8 = begin_list;
	cmp r8, 0				;	if (r8 == NULL)
	je done					;		return;
	mov r8, [rdi]				;	r8 = *begin_list;
	sort_main_loop:				;	while (true) {
		cmp r8, 0			;		if (r8 == NULL)
		je done				;			break;
		mov r9, r8			;		r9 = r8->data;
		sort_sub_loop:			;		while (true) {
			mov r9, [r9 + 8]	;			r9 = r9->next;
			cmp r9, 0		;			if (r9 == NULL)
			je sub_loop_break	;				break;
			mov rdi, [r8]		;			rdi = r8->data;
			mov rsi, [r9]		;			rsi = r9->data;
			call r15		;			rax = cmp(rdi, rsi);
			cmp rax, 0		;			if (rax <= 0)
			jle sort_sub_loop	;				continue;
			call ft_list_swap	;			ft_list_swap(rdi->data, rsi->data);
			jmp sort_sub_loop	;		}
		sub_loop_break:			;
			mov r8, [r8 + 8]	;		r8 = r8->next;
			jmp sort_main_loop	;	}
	done:					;	rdi = begin_list
		mov rdi, r14			;	rsi = cmp
		mov rsi, r15			; }
		ret
