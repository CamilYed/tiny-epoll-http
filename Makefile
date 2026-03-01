CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=c17 -g -fsanitize=address
INCLUDES = -I./include

SRC_DIR = src
OBJ_DIR = obj
TEST_DIR = tests
BIN_DIR = bin

# Pliki źródłowe (na razie tylko parser)
SRCS = $(SRC_DIR)/http_parser.c
OBJS = $(OBJ_DIR)/http_parser.o

.PHONY: all clean test

all: test

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

test: $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) $(TEST_DIR)/test_http_parser.c $(OBJS) -o $(BIN_DIR)/test_runner
	./$(BIN_DIR)/test_runner

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
