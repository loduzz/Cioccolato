##
## EPITECH PROJECT, 2023
## Cioccolato
## File description:
## Makefile
##

CC = gcc -g3
CFLAGS = -I./include/ -W -Wall -Wextra
TEST_SRC_FILES = $(wildcard $(TEST_DIR)/*.c)
TEST_OBJ_FILES = $(TEST_SRC_FILES:$(TEST_DIR)/%.c=$(OBJ_DIR)/test_%.o)
TEST_BIN_FILES = $(TEST_SRC_FILES:$(TEST_DIR)/%.c=$(BIN_DIR)/test_%)
CRITERION_FLAGS = -lcriterion

SRC = src/main.c

OBJ = $(SRC:.c=.o)

NAME = my_program

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

test: $(TEST_BIN_FILES)
	@for test_bin in $^ ; do \
		echo Running $$test_bin ; \
		./$$test_bin ; \
	done

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re