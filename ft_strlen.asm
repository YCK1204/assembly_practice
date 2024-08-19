section .text
    global ft_strlen

ft_strlen:
    xor rax, rax      ; rax를 0으로 초기화
    xor rcx, rcx      ; rcx를 0으로 초기화 (문자 개수를 카운트할 변수)

find_null_byte:
    mov al, [rdi]     ; rdi가 가리키는 위치의 문자를 al에 로드
    cmp al, 0         ; al의 값이 0(널 문자)인지 비교
    je done           ; 널 문자가 발견되면 done 레이블로 점프
    inc rdi           ; rdi를 증가시켜 다음 문자를 가리키도록 함
    inc rcx           ; rcx를 증가시켜 카운트를 증가시킴
    jmp find_null_byte; 루프를 계속함

done:
    mov rax, rcx      ; rcx 값을 rax에 복사하여 반환 값으로 설정
    ret

