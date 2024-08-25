extern ft_strlen
extern ft_pow
extern find_char

section .text
        global ft_atoi_base

                                        ; c : rbx
valid_char:                             ; bool valid_char(char c) {
        cmp rbx, 9                      ;       if (rbx < 9)
        jl not_in_range                 ;               goto not_in_range
        cmp rbx, 13                     ;       if (rbx > 13)
        jg not_in_range                 ;               goto not_in_range
        je valid_char_false             ;               return false;
                                        ;
        not_in_range:                   ; not_in_range:
                cmp rbx, 32             ;       if (rbx == ' ')
                je valid_char_false     ;               return false;
                cmp rbx, 43             ;       if (rbx == '+')
                je valid_char_false     ;               return false;
                cmp rbx, 45             ;       if (rbx == '-')
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
        mov r8, rdi                             ;       r8 = rdi;
        mov rdi, rsi                            ;       rdi = base;
        call ft_strlen                          ;       rax = ft_strlen(rdi);

        cmp rax, 1                              ;       if (rax <= 1)
        jle valid_base_false                    ;               return false;
        xor rbx, rbx                            ;       rbx = 0;
        xor rdx, rdx                            ;       rdx = 0;
        valid_base_loop:                        ;       while (true) {
                movzx rdi, byte [rsi + rbx]     ;               rdi = rsi[rbx];
                cmp rdi, 0                      ;               if (rdi == '\0')
                je valid_base_true              ;                       return true;
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
                mov rdi, r8
                mov rax, 1
                ret
        valid_base_false:
                mov rdi, r8
                mov rax, 0
                ret


                                                ; str : rdi
                                                ; base : rsi
ft_atoi_base:                                   ; int ft_atoi_base(char* str, char* base) {
        call valid_base                         ;       rax = valid_base(base);
        cmp rax, 0                              ;       if (rax == false)
        je atoi_base_done                       ;               return 0;
                                                ;
                                                ;       {
        mov r8, rdi                             ;               r8 = str;
        mov r14, rsi                            ;               r14 = base;
        mov rdi, rsi                            ;               str = base;
        call ft_strlen                          ;               rax = ft_strlen(str);
        mov r15, rax                            ;               base_len = rax;
                                                ;
        xor rbx, rbx                            ;               rbx = 0;
        xor rdx, rdx                            ;               rdx = 0;
        xor r9, r9                              ;               r9 = 0;
                                                ;       }

        atoi_base_loop:                         ;       while (true) {
                movzx rdi, byte [r8 + rbx]      ;               rdi = str[rbx];
                cmp rdi, 0                      ;               if (rdi == '\0')
                je atoi_base_done               ;                       break;
                mov rsi, r14                    ;               rsi = base;
                call find_char                  ;               rax = find_char(rdi, rsi, 0);
                cmp rax, -1                     ;               if (rax == -1)
                je atoi_base_done               ;                       break;
                imul r9, r15                    ; 		r9 *= base_len;
                add r9, rax                     ; 		r9 += rax;
                inc rbx                         ;		rbx++;
                jmp atoi_base_loop              ;       }

        atoi_base_done:                         ;       rax = r9;
                mov rdi, r8                     ;       str = r8;
                mov rsi, r14                    ;       base = r14;
                mov rax, r9			; 	return rax;
                ret				; }
