section .text
    global ft_strlen

ft_strlen:
    xor rax, rax
    xor rcx, rcx

find_null_byte:
    mov al, [rdi + rcx]
    cmp al, 0
    je done
    inc rcx
    jmp find_null_byte

done:
    mov rax, rcx
    ret
