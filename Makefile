CC = gcc
CFLAGS = -c -Wall
SRC = src

main: server.o client.o string.o
	$(CC) -o server.out server.o
	$(CC) -o client.out client.o string.o
server.o: $(SRC)/server.c
	$(CC) $(CFLAGS) -pthread $(SRC)/server.c
string.o: $(SRC)/string.c
	$(CC) $(CFLAGS) $(SRC)/string.c
client.o: $(SRC)/client.c
	$(CC) $(CFLAGS) -pthread $(SRC)/client.c

.PHONY: clean
clean:
	rm *.o *.out