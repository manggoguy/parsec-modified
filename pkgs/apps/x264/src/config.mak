prefix=/usr/local
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
libdir=${exec_prefix}/lib
includedir=${prefix}/include
ARCH=X86_64
SYS=LINUX
CC=/home/lzto/txgoto/llvm/build/bin/clang
CFLAGS=-g  -Wall -I. -Ofast -g -fsanitize=thread -DHAVE_MALLOC_H -DHAVE_MMX -DARCH_X86_64 -DSYS_LINUX -DHAVE_PTHREAD -fPIC
ALTIVECFLAGS=
LDFLAGS= -Ofast -g -fsanitize=thread -lm -lpthread -Wl,-Bsymbolic
AS=yasm
ASFLAGS=-f elf -m amd64 -DPIC
EXE=
VIS=no
HAVE_GETOPT_LONG=1
DEVNULL=/dev/null
ECHON=echo -n
CONFIGURE_ARGS= '--enable-pthread' '--extra-cflags=-Ofast -g -fsanitize=thread' '--extra-ldflags=-Ofast -g -fsanitize=thread' '--enable-debug' '--enable-pic'
