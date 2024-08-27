section .data
	_begin_list dq 0
	_data_ref dq 0
	_cmp dq 0
	_free_fct dq 0
	_first dq 0
	_second dq 0
	_tmp dq 0

section .text
    global ft_list_remove_if

ft_list_remove_if:						; void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), 
								; 					void (*free_fct)(void *)) {
	cmp rdi, 0						; 	if (begin_list == NULL)
	je done							;		return;
	mov [rel _begin_list], rdi				;	_begin_list = begin_list;
	mov [rel _data_ref], rsi				;	_data_ref = data_ref;
	mov [rel _cmp], rdx					;	_cmp = cmp;
	mov [rel _free_fct], rcx				;	_free_fct = free_fct;
	mov r8, [rdi]						;	r8 = *begin_list;
	mov [rel _first], r8					;	_first = r8;
	mov r8,  [r8 + 8]					;	r8 = _first->next;
	mov [rel _second], r8					;	_second = r8;
								;
	remove_loop:						;	while (true) {
		cmp qword [rel _second], 0			;		if (_second == NULL)
		je loop_break					;			break;
		mov rdi, [rel _second]				;		rdi = _second;
		mov rdi, [rdi]					;		rdi = rdi->data;
		mov rsi, [rel _data_ref]			;		rsi = _data_ref;
		call [rel _cmp]					;		rax = _cmp(rdi, rsi);
		cmp rax, 0					;		if (rax != 0)
		jne not_equal					;			goto not_equal;
		mov rdi, [rel _second]				;		rdi = _second;
		mov rsi, [rdi + 8]				;		rsi = rdi->next;
		mov [rel _second], rsi				;		_second = rsi;
		mov rcx, [rel _first]				;		rcx = _first;
		mov [rcx + 8], rsi				;		rcx->next = rsi;
		mov [rel _first], rcx				;		_first = rcx;
		call [rel _free_fct]				;		_free_fct(rdi);
		jmp remove_loop					;		continue;
								;
		not_equal:					; 	not_equal:
			mov rdi, [rel _second]			;		rdi = _second;
			mov [rel _first], rdi			;		_first = rdi;
			mov rdi, [rdi + 8]			;		rdi = rdi->next;
			mov [rel _second], rdi			;		_second = rdi;
			jmp remove_loop				;	}
	loop_break:						;
		mov rdi, [rel _begin_list]			;	rdi = _begin_list;
		mov rdi, [rdi]					;	rdi = *rdi;
		cmp rdi, 0					;	if (rdi == 0)
		je done						;		return;
		mov [rel _first], rdi				;	_first = rdi;
		mov rdi, [rdi]					;	rdi = rdi->data;
		mov rsi, [rel _data_ref]			;	rsi = _data_ref;
		call [rel _cmp]					;	rax = _cmp(rdi, rsi);
		cmp rax, 0					;	if (rax != 0)
		jne done					;		return;
		mov rcx, [rel _first]				;	rcx = _first;
		mov rcx, [rcx + 8]				;	rcx = rcx->next;
		mov rdi, [rel _begin_list]			;	rdi = _begin_list;
		mov [rdi], rcx					;	*rdi = rcx;
		mov rdi, [rel _first]				;	rdi = _first;
		call [rel _free_fct]				;	_free_fct(rdi);

	done:
		mov rdi, [rel _begin_list]
		mov rsi, [rel _data_ref]
		mov rdx, [rel _cmp]
		mov rcx, [rel _free_fct]
		ret
