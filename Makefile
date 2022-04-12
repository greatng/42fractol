NAME			=	fractol
LEAKS			=	-fsanitize=address -fno-omit-frame-pointer
CC			=	gcc
CFLAGS			=	-Wall -Wextra -Werror
RM			=	rm -rf

HEADER_DIR		=	includes/
HEADER			=	fractol
HEADERS			=	$(addprefix $(HEADER_DIR), $(addsuffix .h, $(HEADER)))

SRC_DIR			=	srcs/
SRC			=	frac_plot fractol mandelbrot julia burningship frac_hook1 \
					frac_color frac_scale frac_exit

SRCS 			=	$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRC)))

OBJ_DIR			=	objs/
OBJ			=	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC)))

ARCH			=	arch -x86_64
MLX			=	-Lmlx -lmlx -framework OpenGL -framework Appkit

LIBFT_PATH		=	./libft
LIBFT			=	$(LIBFT_PATH)/libft.a

GREEN = \033[38;5;2m
NORMAL = \033[38;5;255m
RED = \033[38;5;1m
BLUE = \033[38;5;4m


all:				$(NAME)

$(NAME):			$(LIBFT) $(OBJ)
					@echo "$(GREEN)Compiling:$(NORMAL)"
					$(ARCH) $(CC) $(MLX) $(LIBFT) $(OBJ) $< -o $(NAME)

$(OBJ_DIR)%.o:			$(SRC_DIR)%.c $(HEADERS)
					@mkdir -p $(OBJ_DIR)
					@echo "$(GREEN)Compiling:$(NORMAL)"
					$(ARCH) $(CC) -c $< -o $@ 			
					
$(LIBFT):
					@make -C $(LIBFT_PATH) all

leaks:				$(LIBFT) $(OBJ) 
					@echo "$(GREEN)Compiling:$(NORMAL)"
					$(ARCH) $(CC) $(LEAKS) $(MLX) $(LIBFT) $(OBJ) $< -o $(NAME)

clean:
					@make -C $(LIBFT_PATH) clean
					@$(RM) $(NAME)
fclean:				clean
					@make -C $(LIBFT_PATH) fclean
					@$(RM) -rf $(NAME) $(OBJ) $(OBJ_DIR)
					@make pig

re:					fclean all

.PHONY:				all clean fclean re

pig:				
					@echo "                    *                                             .                       \n\
                                                                                          \n\
                       °oO#@@@@@@@@#*   ..°°°°°°.  *@@@@@@@@@#O*.                         \n\
                   O@@@@@@@@@@@@@@@@@  @@@@@@@@@@  @@@@@@@@@@@@@@@@o.                     \n\
                  @@@@@@@@@@@@@@@@@@* O@@@@@@@@@@  @@@@@@@@@@@@@@@@@@@                    \n\
                  o@@@@@@@@@@@@@@@@o *@@@@@@@@@@@o O@@@@@@@@@@@@@@@@@°                    \n\
                   .@@@@@@@@@@@@@@  O@@@@@@@@@@@@@° O@@@@@@@@@@@@@#°                      \n\
                @    .O@@@@@@@@@° .@@@@@@@@@@@@@@@@o  #@@@@@@@@o°  °@@o                   \n\
                  O@@*  .*oo*°  °@@@@@@@@@@@@@@@@@@@@*  .°°°.  .o@@@@@@@*  @              \n\
                °@@@@@@@#oo*oO@@@@@@@@@@@@@@@@@@@@@@@@@@#OO##@@@@@@@@@@@@#                \n\
               o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@               \n\
              °@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@              \n\
           @  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @          \n\
             o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o            \n\
             @@@@@@@@@@@@@@@°  #@@@@@@@@@@@@*  o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  °         \n\
            @@@@@@@@@@@@@@@@O.°@@@@@@@@@@@@@#°*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*           \n\
           #@@@@@@@@@@@@@@@@@@@#OOOOOOOOOOO##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#           \n\
          *@@@@@@@@@@@@@@@@@OOOO##OO###OO##OOOO#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@           \n\
          @@@@@@@@@@@@@@@@@@O##O#o  O#O  *#O###O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@           \n\
          @@@@@@@@@@@@@@@@@@@#OOOOooO##ooOOOOO#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@           \n\
          @@@@@@@@@#@@@@@@@@@@@@##@##OO#####@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@°           \n\
          °@@@@@@###@@@@@@@@@@@@@@°#@@@@#.o@@@@@@@@@@@@@@@@@@###@@@@@@@@@@@@@@            \n\
           o@@@@@@@@@@@@@@@@@@@@@@o°°°°°°o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@             \n\
            °@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#              \n\
              o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*  @            \n\
                .O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*                 \n\
                   .O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@####@@@@#o                    \n\
                        °*#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#°..      °  .o@#°                \n\
                   *  °oO* °@@@@@@@@@@@@@@@@@@@@@@@@@@@. ..  ...    @@@@@@O               \n\
                  .  @@@@@° @@@@@@@@@@@@@@@@@@@@@#°...     O@@@@@@  @@@@@@@@              \n\
                     @@@@O .@@@@@@@@@@@@@@@@@@@@* *@@@@@@@@@@@@@@@o o@@@@@@@#             \n\
                      .°  *@@@@@@@@@@@@@@@@@@@@@* o@@@@@@@@@@@@* #@  @@@@@@@@*            \n\
                        @@@@@@@@@@@@@@@@@@@@@@@@@#  .*O#@@@#O*   oo  @@@@@@@@O            \n\
                     . .@@@@@@@@@@@@@@@@@@@@@@@@@@@@O*°....    ....  #@@@@@@@#            \n\
                       °@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O**°°  #@@@@@@@*            \n\
                       .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@° #@@@@@@*             \n\
                        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @@##o°               \n\
                        O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o                       \n\
                      °  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#                        \n\
                          @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      °                  \n\
					pipex compile completed"