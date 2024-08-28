%include "ft_list.inc"

extern malloc

section .data
	_begin_list dq 0
	_data dq 0


section .text
    global ft_list_push_front

ft_list_push_front:				; void ft_list_push_front(t_list** begin_list, void* data) {
	cmp rdi, 0				;	if (begin_list == NULL)
	je done					;		return;
	cmp rsi, 0				;	if (data == NULL)
	je done					;		return;
	mov [rel _begin_list], rdi		;	_begin_list = begin_list;
	mov [rel _data], rsi			;	_data = data;
	mov rdi, size_of_t_list			; 	rdi = size_of_t_list (16 bytes)
	call malloc wrt ..plt           	; 	rax = malloc(rdi)
	cmp rax, 0				;	if (rax == NULL)
	je done					;		return;
						;
	mov rdx, [rel _data]			;	rdx = _data;
	mov [rax], rdx				;	rax->data = rdx;
	mov rbx, [rel _begin_list]		;	rbx = _begin_list;
	mov rbx, [rbx]          		; 	rbx = *rbx;
	mov [rax + 8], rbx      		; 	rax->next = rbx;
	mov rdi, [rel _begin_list]		;	rdi = _begin_list;
	mov [rdi], rax          		; 	*rdi = rax
	done:
    		ret

