PROG = neon_test
SRCS = neon_test.c


CLEANFILES = $(PROG)


# Add / change option in CFLAGS and LDFLAGS
CFLAGS += -Wall -g
LDFLAGS += 


all: $(PROG)


$(PROG): $(SRCS)
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)


clean:
	rm -f $(CLEANFILES) $(patsubst %.c,%.o, $(SRCS))

install:
	cp $(PROG) /usr/bin




