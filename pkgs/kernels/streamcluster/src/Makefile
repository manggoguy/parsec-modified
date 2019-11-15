# Makefile for streamcluster

PREFIX=${PARSECDIR}/pkgs/kernels/streamcluster/inst/${PARSECPLAT}

TARGET=streamcluster
OBJS=streamcluster.o

#CXXFLAGS := $(CXXFLAGS) -fPIE -O3 -g -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions
CXXFLAGS := $(CXXFLAGS) -Ofast -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions -g
LDFLAGS := ${LDFLAGS} -lpthread -Ofast -g

ifdef version
  ifeq "$(version)" "pthreads"
    CXXFLAGS :=	$(CXXFLAGS) -DENABLE_THREADS -pthread
    OBJS += parsec_barrier.o
  endif
  ifeq "$(version)" "tbb"
    CXXFLAGS := $(CXXFLAGS) -DTBB_VERSION
  endif
endif

#CXX=wllvm++
#CXX=clang++

all: $(OBJS)
#	llvm-link streamcluster.bc parsec_barrier.bc -o temp.bc
#	opt -std-compile-opts -std-link-opts -O3 temp.bc -o streamcluster.bc
	$(CXX) $(LDFLAGS) $(OBJS) $(LIBS) -o $(TARGET)
#	$(CXX) $(LDFLAGS) streamcluster.bc -o $(TARGET)

%.o : %.cpp
	$(CXX) $(CXXFLAGS) -c $<

clean:
	rm -f *.o $(TARGET)

install:
	mkdir -p $(PREFIX)/bin
	cp -f $(TARGET) $(PREFIX)/bin/$(TARGET)

