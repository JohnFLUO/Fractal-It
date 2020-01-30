#ifndef MANDELBROT_H_
#define MANDELBROT_H_

#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>
#include <iostream>
#include <unistd.h>

#include "Color/ColorSmooth/ColorSmooth.hpp"
#include "Convergence/double/Convergence_cuda.hpp"
#include "immintrin.h"

enum t_format    { f_double, f_float, f_int };
enum t_processor { x86, sse, avx, cuda };

template <
    class processor,
    class render
>
class Mandelbrot {
private:
    render* colors;
    processor* c;
    int IMAGE_WIDTH;
    int IMAGE_HEIGHT;
    unsigned int max_iters;

public:
    Mandelbrot(int _IMAGE_WIDTH, int _IMAGE_HEIGHT, unsigned int iters);

    ~Mandelbrot();

    void freeRessources( );

    void allocRessources( );

    void setIterations(unsigned short iters);

    void updateImage(double zoom, double offsetX, double offsetY, sf::Image& image);

private:
    int MAX;
    void updateImageSlice(double zoom, double offsetX, double offsetY, sf::Image& image, int minY, int maxY);
    //void updateImage(double zoom, double offsetX, double offsetY, sf::Image& image);
};


#endif
