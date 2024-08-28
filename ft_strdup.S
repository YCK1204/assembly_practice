extern malloc
extern ft_strlen
extern ft_strcpy

section .data
	tmp dq 0

section .text
	global ft_strdup

ft_strdup:			; char* ft_strdup(const char* str) {
	xor rax, rax
	xor rcx, rcx
	call ft_strlen		;	len = strlen(str);
	mov [rel tmp], rdi	;	tmp = str;

	inc rax        		;	len++;
	mov rdi, rax		;	size = len;
	call malloc wrt ..plt	;	ret = malloc(size);
	cmp rax, 0	     	;	if (ret == NULL)
	je done			;		return NULL;
	mov rsi, [rel tmp]	;	rsi = tmp;		
	mov rdi, rax		; 	dst = ret;
	call ft_strcpy		; 	ret = strcpy(dst, src);
	done:			;	return ret;
		ret		; }
