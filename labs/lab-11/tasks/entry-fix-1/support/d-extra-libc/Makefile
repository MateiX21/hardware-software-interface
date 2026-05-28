CFLAGS = -fno-PIC -g
LDFLAGS = -no-pie
AS = nasm
ASFLAGS = -f elf64

.DEFAULT_GOAL: all

.PHONY: all clean

all: hello

# Derive the libgcc directory from the installed compiler instead of
# hardcoding a gcc version that may not exist on this machine.
LIBGCC_DIR = $(dir $(shell $(CC) -print-libgcc-file-name))

hello: hello.o start.o
	ld -static -m elf_x86_64 -L$(LIBGCC_DIR) -o $@ $^ /usr/lib/x86_64-linux-gnu/crti.o --start-group -lc -lgcc -lgcc_eh --end-group /usr/lib/x86_64-linux-gnu/crtn.o

hello.o: hello.c

start.o: start.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	-rm -f hello *.o
	-rm -f *~
