CFLAGS = -fno-PIC -g
LDFLAGS = -static -no-pie

.DEFAULT_GOAL: all

.PHONY: all clean

all: name

name: name.o
	$(CC) $(LDFLAGS) -o $@ $^

name.o: name.c

clean:
	-rm -f name *.o
	-rm -f *~
