#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

extern size_t ft_strlen(const char *str);
extern char* ft_strcpy(char * dst, const char * src);
extern int ft_strcmp(const char* s1, const char* s2);
extern int ft_write(int fd, const char* buf, int size);
extern int ft_read(int fd, const char* buf, int size);
extern char* ft_strdup(const char* str);
extern long ft_pow(long n, long cnt);
extern long ft_atoi_base(const char* str, const char* base);
extern long find_char(const char target, const char* str, long start);

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
    printf("--------write--------\n");
    {
    	const char* str = "Hello World!";
	printf("write : %d\n", write(1, str, ft_strlen(str)));
	printf("ft_write : %d\n", ft_write(1, str, ft_strlen(str)));
    }
    printf("--------read--------\n");
    {
    	char str[10];
	printf("read : %d, %s\n", read(0, str, sizeof(str)), str);
	printf("ft_read : %d, %s\n", ft_read(0, str, sizeof(str)), str);
    }
    printf("--------strdup--------\n");
    {
    	const  char* str = "Hello World!";
	char* cpyStr = ft_strdup(str);
	printf("ft_strdup : %s\n", cpyStr);
	free(cpyStr);
    }
    printf("--------ft_pow--------\n");
    {
    	printf("%ld\n", ft_pow(3, 3));
    	printf("%ld\n", ft_pow(2, 0));
    	printf("%ld\n", ft_pow(2, 4));
    }
    printf("--------ft_atoi_base--------\n");
    {
	const char* str = "110";
	const char* base = "01";
    	printf("str : %s, base : %s\n", str, base);
	int n = ft_atoi_base(str, base);
	printf("ft_atoi_base : %d\n", n);
    }

    return 0;
}

