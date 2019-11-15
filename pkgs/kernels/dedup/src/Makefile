# Makefile for dedup kernel

PREFIX=${PARSECDIR}/pkgs/kernels/dedup/inst/${PARSECPLAT}

#TARGET=dedupx.bc
TARGET=dedup

#CFLAGS=-O3 -g -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions -DENABLE_PTHREADS -DPARSEC_VERSION=3.0-beta-20130728 -DENABLE_THREADS -pthread -Wall -fno-strict-aliasing -D_XOPEN_SOURCE=600 -DOPENSSL_NO_ASM -DENABLE_GZIP_COMPRESSION

CFLAGS := $(CFLAGS) -Ofast -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions  -DENABLE_PTHREADS -pthread -DOPENSSL_NO_ASM -DENABLE_GZIP_COMPRESSION -g
# -fsanitize=thread

LDFLAGS=-Ofast -g


LIBS += -lz -lm

DEDUP_OBJ = hashtable.o util.o dedup.o rabin.o encoder.o decoder.o mbuffer.o sha.o  queue.o binheap.o tree.o
#DEDUP_OBJ = hashtable.bc util.bc dedup.bc rabin.bc encoder.bc decoder.bc mbuffer.bc sha.bc  queue.bc binheap.bc tree.bc

#CC=clang
#CC=wllvm
#CC=gcc
#CLANG=clang

#CC=/home/lzto/txgoto/llvm/build/bin/clang

all: $(TARGET)

%.bc:%.c
	$(CLANG) -c -emit-llvm $(CFLAGS) $< -o $@

#$(TARGET): $(DEDUP_OBJ)
#	llvm-link $(DEDUP_OBJ) -o dedup_stage1.bc
#	opt -std-compile-opts -std-link-opts -O3 dedup_stage1.bc -o dedupx.bc

.c.o:
	$(CC) -c $(CFLAGS) $< -o $@

$(TARGET): $(DEDUP_OBJ)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $(TARGET) $(DEDUP_OBJ) $(LIBS)

clean:
	rm -f *~ *.o $(TARGET) $(DEDUP_OBJ)

install:
	mkdir -p $(PREFIX)/bin
	cp -f $(TARGET) $(PREFIX)/bin/$(TARGET)



