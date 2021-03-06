# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hege <hege@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/26 15:35:27 by vtran             #+#    #+#              #
#    Updated: 2020/10/26 17:30:55 by hege             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libftprintf.a
FLAGS   =   -Wall -Werror -Wextra
SDIR    =   srcs/
ODIR    =   objs/

CFILES	=	ft_printf.c \
			ft_ftoa.c \
			utils.c \
			handle_c_s_p.c \
			colors.c \
			handle_nbr.c \
			padding_c_s_p.c \
			parse.c \
			padding_nbr.c \
			helpers.c \

SRCS =		$(addprefix $(SDIR)/,$(CFILES))
OBJS =		$(addprefix $(ODIR)/,$(CFILES:.c=.o))

all: $(NAME)

$(NAME): $(OBJS)
		@make -C libft
		@cp libft/libft.a ./$(NAME)
		@ar rc $(NAME) $(OBJS)
		@ranlib $(NAME)

$(ODIR)/%.o: $(SDIR)/%.c
		@mkdir -p objs
		@$(CC) $(FLAGS) -I includes/ -I libft/includes/ -o $@ -c $<

main:	all
		gcc -I includes/ -I libft/includes/ -o main main.c -L. -lftprintf

clean:
		@/bin/rm -rf $(OBJS)
		@/bin/rm -rf $(ODIR)
		@make clean -C libft

fclean: clean
		@/bin/rm -f $(NAME)
		@make fclean -C libft

re: fclean all

.PHONY: all clean flcean re
