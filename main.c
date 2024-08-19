#include <stdio.h>

extern size_t ft_strlen(const char *str);  // 어셈블리어 함수 선언
extern char* ft_strcpy(char * dst, const char * src);

int main() {
    const char *text = "Hello, World!!!!!!!!!!!!!";
    size_t length = ft_strlen(text);
    char tmp[30];
    ft_strcpy(tmp, text);
    printf("Length of the string is: %zu\n", length);
    printf("%s\n", tmp);
    length = ft_strlen(tmp);
    printf("Length of the string is: %zu\n", length);
    return 0;
}

