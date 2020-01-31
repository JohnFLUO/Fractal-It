#!/usr/bin/make
# Makefile for opencv compilation
CC=clang++

#OPENCV=-I/opt/local/include/ -L/opt/local/lib -lcxcore -lcv -lhighgui

CFLAGS =-Ofast -std=c++11 -march=native -mtune=native -fopenmp

LIBS =-o sfml-mandelbrot -lsfml-graphics -lsfml-window -lsfml-system -fopenmp

all: clean mandelbrot

mandelbrot:
	$(CC) main.cpp -o mandelbrot $(CFLAGS) $(LIBS)

clean:
	rm -rf *o mandelbrot
