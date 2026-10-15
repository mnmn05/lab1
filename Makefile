CC      = gcc
CFLAGS  = -Wall -Wextra -g -Ilib
LIBDIR  = lib
SRCS    = $(LIBDIR)/add.c $(LIBDIR)/subtract.c $(LIBDIR)/multiply.c $(LIBDIR)/divide.c
OBJS    = $(SRCS:.c=.o)
PICOBJS = $(SRCS:.c=.pic.o)

all: main_static main_shared main_dynamic

$(LIBDIR)/%.o: $(LIBDIR)/%.c $(LIBDIR)/calc.h
	$(CC) $(CFLAGS) -c $< -o $@

$(LIBDIR)/%.pic.o: $(LIBDIR)/%.c $(LIBDIR)/calc.h
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

$(LIBDIR)/libcalc.a: $(OBJS)
	ar rcs $@ $^

$(LIBDIR)/libcalc.so: $(PICOBJS)
	$(CC) -shared -o $@ $^

main_static: main.c $(LIBDIR)/libcalc.a
	$(CC) $(CFLAGS) main.c -L$(LIBDIR) -lcalc -static -o $@

main_shared: main.c $(LIBDIR)/libcalc.so
	$(CC) $(CFLAGS) main.c -L$(LIBDIR) -lcalc -Wl,-rpath,'$$ORIGIN/$(LIBDIR)' -o $@

main_dynamic: dyn_main.c $(LIBDIR)/libcalc.so
	$(CC) $(CFLAGS) dyn_main.c -ldl -o $@

run: all
	@echo "== 정적 =="; ./main_static
	@echo "== 공유 =="; ./main_shared
	@echo "== 동적 =="; ./main_dynamic

clean:
	rm -f $(LIBDIR)/*.o $(LIBDIR)/*.a $(LIBDIR)/*.so main_static main_shared main_dynamic

.PHONY: all run clean
