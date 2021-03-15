CC = gcc
CXX = g++

INCLUDES = -I$(glad_inc)
LIBRARIES = 

glad_inc = glad/include

CFLAGS = -Wall -ggdb -O3 $(INCLUDES)
CXXFLAGS = -Wall -ggdb -O3 $(INCLUDES)
LDFLAGS = -lglfw3 -framework Cocoa -framework OpenGL -framework IOKit -framework CoreVideo

TARGET = main
cpp_files = main.cpp $(wildcard imgui/*.cpp)
objects = $(cpp_files:.cpp=.o) glad.o
headers =

all: main

$(TARGET): $(objects) 
	$(CXX) -o $@ $^ $(LDFLAGS)

glad.o: glad/src/glad.c
	$(CC) $(INCLUDES) -c $< -o $@

.PHONY : clean
clean :
	-rm $(TARGET) $(objects)
