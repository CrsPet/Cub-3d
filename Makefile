NAME			= cub3D

SRCS			=	./src/main.c\
					./src/get_next_line/get_next_line.c\
					./src/get_next_line/get_next_line_utils.c\
					./src/draw.c\
					./src/parsing/parsing.c\
					./src/parsing/validation.c\
					./src/parsing/parsing_utils.c\

SRCS_B			=

HEADER			= ./includes/

LIBFT			= libft/libft.a


OBJ				= $(SRCS:.c=.o)

OBJ_B			= $(SRCS_B:.c=.o)

CC				= gcc

RM				= @rm -f

#FLAGS			= -Wall -Wextra -Werror

.PHONY:			all clean fclean re bonus

all:			$(NAME)

$(NAME):		$(OBJ) ./includes/cub3d.h ./includes/parsing.h
				@$(MAKE) all -C ./libft
				@$(MAKE) bonus -C ./libft
				$(CC) $(OBJ) -Lmlx -lmlx -L/usr/lib -Imlx -lXext -lX11 -lm -lz -I${HEADER} ${LIBFT} -o $(NAME)
#mac				$(CC) $(OBJ) -Lmlx -lmlx -framework OpenGL -framework AppKit -I${HEADER} ${LIBFT} -o $(NAME)

%.o:			%.c $(HEADER)
					$(CC) -g $(FLAGS) -I/usr/include -Imlx -O3 -I${HEADER} -c $< -o $@			
#mac				$(CC) -g $(FLAGS) -Imlx -I${HEADER} -c $< -o $@

bonus:
				make OBJ="$(OBJ_B)" all

clean:
				@$(MAKE) clean -C ./libft
				$(RM) $(OBJ) $(OBJ_B)

fclean:			clean
				@$(MAKE) fclean -C ./libft
				$(RM) $(NAME)

re:				fclean $(NAME)