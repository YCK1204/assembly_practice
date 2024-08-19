#include <stdio.h>

extern size_t ft_strlen(const char *str);  // 어셈블리어 함수 선언
extern char* ft_strcpy(char * dst, const char * src);
extern int ft_strcmp(const char* s1, const char* s2);

int main() {
    const char *text = "Hello, World!!!!!!!!!!!!!";
    size_t length = ft_strlen(text);
    char tmp[30];
    ft_strcpy(tmp, text);
    printf("Length of the string is: %zu\n", length);
    printf("%s\n", tmp);
    length = ft_strlen(tmp);
    printf("Length of the string is: %zu\n", length);
    printf("%d!!\n", ft_strcmp(tmp, text));
    return 0;
}

