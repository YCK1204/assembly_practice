%include "ft_list.inc"

extern malloc


section .text
    global ft_list_push_front

ft_list_push_front:				; void ft_list_push_front(t_list** begin_list, void* data) {
	mov rbx, rdi				; 	rbx = rdi
	mov r15, rsi
	mov rdi, size_of_t_list		; 	rdi = size_of_t_list (16 bytes)
	call malloc wrt ..plt           	; 	rax = malloc(16)
	cmp rax, 0				;	if (rax == NULL)
	je done					;		return;

	mov [rax], r15          		; 	rax->data = data
	mov rdx, [rbx]          		; 	rdx = *begin_list
	mov [rax + 8], rdx      		; 	rax->next = rdx
	mov rdi, rbx
	mov [rdi], rax          		; 	*begin_list = rax
	done:
    		ret

