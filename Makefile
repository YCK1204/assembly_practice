NAME = libasm.a
NASM = nasm
SRCS = $(shell find -type f -name "*.S")
MAIN = main.c
OBJS = $(SRCS:.S=.o)
%.o : %.S
	$(NASM) -f elf64 -F dwarf $^ -o $@
MAIN_OBJ = $(MAIN:.c=.o)
%.o : %.c
	gcc -c $^ -o $@
PROGRAM = libasm

$(NAME) : $(OBJS) 	
	ar rc $@ $^

main : $(MAIN_OBJ)
	gcc  -o $(PROGRAM) $(MAIN_OBJ) -L. $(NAME) -z noexecstack

all : $(NAME) main

clean :
	rm -f $(OBJS)
	rm -f $(MAIN_OBJ)
	rm -f $(PROGRAM)

fclean : clean
	rm -f $(NAME)

re : fclean all

.PHONY: re all clean fclean
