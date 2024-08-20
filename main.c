#include <stdio.h>
#include <string.h>

extern size_t ft_strlen(const char *str);  // 어셈블리어 함수 선언
extern char* ft_strcpy(char * dst, const char * src);
extern int ft_strcmp(const char* s1, const char* s2);
extern int ft_write(int fd, const char* buf, int size);

int main() {
    const char *text = "Hello";
    char tmp[30];

    printf("string : %s\n", text);
    printf("--------strlen--------\n");
    printf("strlen : %d\n", strlen(text));
    printf("ft_strlen : %d\n", ft_strlen(text));
    printf("--------strcpy--------\n");
    printf("strcpy : %s\n", strcpy(tmp, text));
    printf("ft_strcpy : %s\n", ft_strcpy(tmp, text));
    printf("--------strcmp--------\n");
    ft_strcpy(tmp, "42");
    printf("string1 : %s, string2 : %s\n", tmp, tmp);
    printf("strcmp : %d\n", strcmp(tmp, tmp));
    printf("ft_strcmp : %d\n", ft_strcmp(tmp, tmp));
    return 0;
}

