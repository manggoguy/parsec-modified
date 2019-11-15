#!/bin/bash

/opt/spec/tools-root/bin/opt bodytrack.tx.bc  -mergefunc -o bodytrack.tx_strip.bc -debug 2>&1 |grep Removed


/opt/spec/tools-root/bin/clang++ \
	-O3 bodytrack.tx_strip.bc \
	-o bodytrack.tx_strip.exe\
	-lm\
	/opt/spec/tools-root/lib/libTxHooks.a \
	/opt/spec/tools-root/lib/libdonot-rt.a \
	-ldl \
	-lpthread \

/opt/spec/tools-root/bin/opt bodytrack.tsan.bc  -mergefunc -o bodytrack.tsan_strip.bc -debug 2>&1 |grep Removed

/opt/spec/tools-root//bin/clang++ \
	-O3 bodytrack.tsan_strip.bc \
	-o bodytrack.tsan_strip.exe \
	-lm \
	/opt/spec/tools-root//lib/libTxHooks.a \
        /opt/spec/tools-root//lib/libtsan_rtl.a \
	/opt/spec/tools-root//lib/libtsan_icp.a \
	/opt/spec/tools-root//lib/libtsan_san.a \
	-ldl -lpthread

