NAME = libasm.a
NASM = nasm
SRCS = $(shell find -type f -name "*.asm")
MAIN = main.c
OBJS = $(SRCS:.asm=.o)
%.o : %.asm
	$(NASM) -f elf64 $^ -o $@
MAIN_OBJ = $(MAIN:.c=.o)
%.o : %.c
	gcc -c $^ -o $@

$(NAME) : $(OBJS) 	
	ar rc $@ $^

main : $(MAIN_OBJ)
	gcc -o libasm $(MAIN_OBJ) -L. $(NAME) -z noexecstack

all : $(NAME) main

clean :
	rm -f $(OBJS)
	rm -f $(MAIN_OBJ)

fclean : clean
	rm -f $(NAME)

re : fclean all

.PHONY: re all clean fclean
