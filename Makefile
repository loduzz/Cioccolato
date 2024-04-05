##
## EPITECH PROJECT, 2023
## Cioccolato
## File description:
## Makefile
##

CC = gcc
 
BYNARY_NAME = my_program
 
BYNARY_TEST = tests_run
 
CFLAGS = -Wall -Wextra -g3 -Iinclude
 
COVERAGE = --coverage
 
TEST_FLAGS = $(COVERAGE) -lcriterion
 
C_SOURCES = src/main.c
 
TEST_SOURCES = tests/test_main.c
 
OBJECTS = $(C_SOURCES:.c=.o)
TEST_OBJECTS = $(TEST_SOURCES:.c=.o)
 
all: $(BYNARY_NAME)
 
$(BYNARY_NAME): $(OBJECTS)
	@echo "- Building $(BYNARY_NAME) binary"
	@$(CC) -o $@ $^
 
%.o: %.c
	@echo "- $< -> $@"
	@if [ "$(MAKECMDGOALS)" = "$(BYNARY_TEST)" ]; then \
		$(CC) $(CFLAGS) -c -o $@ $< $(COVERAGE); \
	else \
		$(CC) $(CFLAGS) -c -o $@ $<; \
	fi
 
clean:
	@echo "- Cleaning"
	@rm -rf $(OBJECTS) $(TEST_OBJECTS)
 
fclean: clean
	@echo "- Cleaning objects && binary"
	@rm -rf $(BYNARY_NAME) $(BYNARY_TEST)
 
re: fclean all
 
unit_tests:
	$(MAKE) fclean
 
$(BYNARY_TEST): $(OBJECTS) $(TEST_OBJECTS)
	@echo "- Running tests"
	@$(CC) -o $@ $^ $(TEST_FLAGS)
	@./$@
 
.PHONY: all clean fclean re $(BYNARY_TEST)