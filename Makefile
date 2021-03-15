CC = gcc
CXX = g++

glad_inc = glad/include
ASSIMP_INC = assimp/include

INCLUDES = -I$(glad_inc) -I$(ASSIMP_INC) -I$(ASSIMP_INC)/Compiler
LIBRARIES = 

CFLAGS = -Wall -ggdb -O3 $(INCLUDES)
CXXFLAGS = -Wall -ggdb -std=c++17 $(INCLUDES)
LDFLAGS = -lglfw3 -framework Cocoa -framework OpenGL -framework IOKit -framework CoreVideo

TARGET = main
cpp_files = src/main.cpp $(wildcard imgui/*.cpp)
objects = $(cpp_files:.cpp=.o) glad/glad.o
headers =

all: main

$(TARGET): $(objects) 
	$(CXX) -o build/$@ $^ $(LDFLAGS)

glad/glad.o: glad/src/glad.c
	$(CC) $(INCLUDES) -c $< -o $@

.PHONY : clean
clean :
	-rm $(TARGET) $(objects)
