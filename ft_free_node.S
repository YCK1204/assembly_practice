extern free
section .data
	tmp dq 0

section .text
	global ft_free_node

ft_free_node:			; void ft_free_node(t_list* node) {
	mov [rel tmp], rdi	;	tmp = node;
	mov rdi, [rdi]		;	rdi = node->data;
	call free wrt ..plt	;	free(rdi);
	mov rdi, [rel tmp]	;	rdi = tmp;
	call free wrt ..plt	;	free(rdi);
	ret			; }
