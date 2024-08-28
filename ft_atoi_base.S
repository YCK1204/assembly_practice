extern ft_strlen
extern find_char

section .data
	_str dq 0
	_base dq 0
	_result dq 0
	_length dq 0

section .text
        global ft_atoi_base

                                        ; c : rdi
valid_char:                             ; bool valid_char(char c) {
        cmp rdi, 9                      ;       if (rdi < 9)
        jl not_in_range                 ;               goto not_in_range
        cmp rdi, 13                     ;       if (rdi > 13)
        jg not_in_range                 ;               goto not_in_range
        je valid_char_false             ;               return false;
                                        ;
        not_in_range:                   ; not_in_range:
                cmp rdi, 32             ;       if (rdi == ' ')
                je valid_char_false     ;               return false;
                cmp rdi, 43             ;       if (rdi == '+')
                je valid_char_false     ;               return false;
                cmp rdi, 45             ;       if (rdi == '-')
                je valid_char_false     ;               return false;
                jmp valid_char_true     ;       return true;
                                        ; }
        valid_char_true:
                mov rax, 1
                ret
        valid_char_false:
                mov rax, 0
                ret


                                                ; base : rsi
valid_base:                                     ; bool valid_base(char* base) {
        mov rdi, [rel _base]                    ;       rdi = base;
        call ft_strlen                          ;       rax = ft_strlen(rdi);

        cmp rax, 1                              ;       if (rax <= 1)
        jle valid_base_false                    ;               return false;
        xor rbx, rbx                            ;       rbx = 0;
        xor rdx, rdx                            ;       rdx = 0;
        valid_base_loop:                        ;       while (true) {
		mov rdi, [rel _base]
		mov rdi, [rdi + rbx]
                cmp rdi, 0                      ;               if (rdi == '\0')
                je valid_base_true              ;                       return true;
		call valid_char			;		rax = valid_char(rdi);
		cmp rax, 0			;		if (rax == false)
		je valid_base_false		;			return false;
                mov rdx, rbx                    ;               rdx = rbx;
                call find_char                  ;               rax = find_char(rdi, base, rdx);
                mov rdx, rax                    ;               rdx = rax;
                inc rdx                         ;               rdx++;
                call find_char                  ;               rax = find_char(rdi, base, rdx);
                cmp rax, -1                     ;               if (rax != -1)
                jne valid_base_false            ;                       return false;
                inc rbx                         ;               rbx++;
                jmp valid_base_loop             ;       }
                                                ; }

        valid_base_true:
                mov rax, 1
                ret
        valid_base_false:
                mov rax, 0
                ret


                                                ; str : rdi
                                                ; base : rsi
ft_atoi_base:                                   ; int ft_atoi_base(char* str, char* base) {
	mov [rel _str], rdi
	mov [rel _base], rsi
        call valid_base                         ;       rax = valid_base(base);
        cmp rax, 0                              ;       if (rax == false)
        je atoi_base_done                       ;               return 0;
                                                ;
                                                ;       {
        mov rdi, [rel _base]                    ;               str = base;
        call ft_strlen                          ;               rax = ft_strlen(str);
	mov [rel _length], qword rax
                                                ;
        xor rbx, rbx                            ;               rbx = 0;
        xor rdx, rdx                            ;               rdx = 0;
                                                ;       }

        atoi_base_loop:                         ;       while (true) {
		mov rdi, [rel _str]
		movzx rdi, byte [rdi + rbx]
                cmp rdi, 0                      ;               if (rdi == '\0')
                je atoi_base_done               ;                       break;
                mov rsi, [rel _base]            ;               rsi = base;
                call find_char                  ;               rax = find_char(rdi, rsi, 0);
                cmp rax, -1                     ;               if (rax == -1)
                je atoi_base_done               ;                       break;

		mov r8, [rel _result]
		imul r8, [rel _length]		;		rax *= r15;
		mov [rel _result], r8		;		_result = rax;
                add [rel _result], rax          ; 		r9 += rax;

                inc rbx                         ;		rbx++;
                jmp atoi_base_loop              ;       }

        atoi_base_done:                         ;
                mov rdi, [rel _str]             ;       str = _str;
                mov rsi, [rel _base]            ;       base = _base;
                mov rax, [rel _result]		; 	return _result;
                ret				; }
