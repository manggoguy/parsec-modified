#!/bin/bash

rm *.exe
rm *.ll 
rm `find .|grep ".o.bc$"`


#:<<COMMENT0
make distclean
make clean

source ~/txgo/sourceme.sh

CXX="wllvm++" \
CC="wllvm" \
CXXFLAGS="-g -O3 -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions  -Wl,--hash-style=both,--as-needed -DPARSEC_VERSION=3.0-beta-20130728" \
CFLAGS="${CXXFLAGS}" \
LDFLAGS="-lpthread -g -O3" \
LIBS="-lstdc++" \
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

#COMMENT0

cp tools/iofuncs/vips ./vips

file vips

/home/lzto/txgo/whole-program-llvm/extract-bc vips

#mv vips.bc vips_stage1.bc

#opt -std-compile-opts -std-link-opts -O3 vips_stage1.bc -o vips.bc

#/opt/spec/tools-root/bin/llvm-dis -o vips.ll vips.bc

tar xf ../inputs/input_simsmall.tar

#build prof bin

./txbin-prof.sh vips.bc

#do profiling

./txbin-pin.sh vips

#build tx

./txbin-tx.sh vips.bc

#build tsan

./txbin-tsan.sh vips.bc

#run!

tar xf ../inputs/input_simlarge.tar
#time ./vips.tsan.exe im_benchmark bigben_2662x5500.v output.v

