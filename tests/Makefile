# Usage:
# make	# compile all binary
# make clean  # remove ALL binaries and objects

.PHONY = all clean

CC = gcc	                # compiler to use
CXX = g++

LINKERFLAG = -lm

SRCS := $(wildcard *.cpp)
BINS := $(SRCS:%.cpp=%)

all: ${BINS}

%: %.o
	@echo "Checking.."
	${CC} ${LINKERFLAG} $< -o $@

%.o: %.c
	@echo "Creating object.."
	${CC} -c $<

%.o: %.cpp
	@echo "Creating object.."
	${CXX} -c $<

clean:
	@echo "Cleaning up..."
	rm -rvf *.o ${BINS}