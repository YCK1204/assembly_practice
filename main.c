#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

typedef struct s_list { void *data; struct s_list *next; } t_list;

extern size_t ft_strlen(const char *str);
extern char* ft_strcpy(char * dst, const char * src);
extern int ft_strcmp(const char* s1, const char* s2);
extern int ft_write(int fd, const char* buf, int size);
extern int ft_read(int fd, const char* buf, int size);
extern char* ft_strdup(const char* str);
extern long ft_pow(long n, long cnt);
extern long ft_atoi_base(const char* str, const char* base);
extern long find_char(const char target, const char* str, long start);
extern void ft_list_push_front(t_list **begin_list, void *data);
extern int ft_list_size(t_list *begin_list);
extern void ft_list_sort(t_list **begin_list, int (*cmp)());
extern void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
extern void ft_free_node(void* node);

void leaks() { system("leaks libasm"); }

int main() {
    atexit(leaks);
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
    printf("--------ft_list--------\n");
    {
    	t_list* lst = NULL;

	ft_list_push_front(&lst, ft_strdup("3"));
	ft_list_push_front(&lst, ft_strdup("1"));
	ft_list_push_front(&lst, ft_strdup("5"));
	ft_list_push_front(&lst, ft_strdup("3"));
	ft_list_push_front(&lst, ft_strdup("3"));
	ft_list_push_front(&lst, ft_strdup("3"));
	ft_list_push_front(&lst, ft_strdup("8"));
	ft_list_push_front(&lst, ft_strdup("7"));
	ft_list_push_front(&lst, ft_strdup("3"));
	ft_list_push_front(&lst, ft_strdup("9"));
	ft_list_push_front(&lst, ft_strdup("3"));
	if (lst == NULL)
		printf("NULL\n");

	printf("size : %d\n", ft_list_size(lst));

	printf("---------------before sort----------------\n");
	t_list* tmp = lst;
	while (tmp != NULL) 
	{
		printf("%s\n", tmp->data);
		tmp = tmp->next;
	}

	ft_list_sort(&lst, ft_strcmp);
	printf("---------------after sort----------------\n");
	tmp = lst;
	while (tmp != NULL) 
	{
		printf("%s\n", tmp->data);
		tmp = tmp->next;
	}
	printf("---------------remove node---------------\n");
	printf("remove node %d\n", 3);
	ft_list_remove_if(&lst, "3", ft_strcmp, ft_free_node);
	tmp = lst;
	while (tmp != NULL) 
	{
		printf("%s\n", tmp->data);
		tmp = tmp->next;
	}

    }
    
    return 0;
}

