#!/bin/bash


rm `find .|grep ".o.bc$"`

make clean

make distclean

./bootstrap.sh

CROSS_COMPILE="/home/lzto/txgoto/llvm/build/bin/"

CXXFLAGS=" -Ofast -g -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions -static-libgcc -Wl,--hash-style=both,--as-needed -DPARSEC_VERSION=3.0-beta-20130728 -fexceptions -fsanitize=thread" \
CFLAGS="$CXXFLAGS" \
LDFLAGS="-lpthread -fsanitize=thread -Ofast -g" \
LIBS="-lstdc++" \
CXX=${CROSS_COMPILE}clang++ \
CC=${CROSS_COMPILE}clang \
/home/lzto/benchmark/parsec-3.0/pkgs/apps/vips/src/configure \
	--disable-shared \
	--disable-cxx \
	--without-fftw3 \
	--without-magick \
	--without-liboil \
	--without-lcms \
	--without-OpenEXR \
	--without-matio \
	--without-pangoft2 \
	--without-tiff \
	--without-jpeg \
	--without-zip \
	--without-png \
	--without-libexif \
	--without-python \
	--without-x \
	--without-perl \
	--without-v4l \
	--without-cimg \
	--enable-threads \
	--prefix=/home/lzto/benchmark/parsec-3.0/pkgs/apps/vips/inst/amd64-linux.gcc-pthreads


make -j10

cp tools/iofuncs/vips ./vips.gtsan.exe

#time ./vips.tsan.exe im_benchmark bigben_2662x5500.v output.v

