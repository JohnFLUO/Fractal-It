#ifndef MANDELBROT_H_
#define MANDELBROT_H_

#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>
#include <iostream>
#include <unistd.h>


#include "Settings.hpp"

#include "Color/ColorMap.hpp"
#include "Convergence/Convergence.hpp"

#include "Color/ColorSmooth/ColorSmooth.hpp"
#include "Color/ColorSmooth/ColorSmoothShifted.hpp"
#include "Color/ColorSmooth/ColorSmoothLoop.hpp"
#include "Color/ColorHSV/ColorHSV.hpp"
#include "Color/ColorHSV/ColorHSVShifted.hpp"
#include "Color/ColorHSV/ColorHSVLoop.hpp"
#include "Color/ColorLSD/ColorLSD.hpp"
#include "Color/ColorTest/ColorTest.hpp"
#include "Color/ColorGreyScale/ColorGreyScale.hpp"

#include "Convergence/double/Convergence_dp_x86.hpp"
#include "Convergence/double/Convergence_dp_x86_omp.hpp"
#include "Convergence/double/Convergence_dp_x86_omp_AVX.hpp"
#include "Convergence/double/Convergence_dp_x86_omp_AVX_plus.hpp"
#include "Convergence/simple/Convergence_sp_x86.hpp"
#include "Convergence/simple/Convergence_sp_x86_omp.hpp"
#include "Convergence/simple/Convergence_sp_x86_omp_AVX.hpp"
#include "Convergence/simple/Convergence_sp_x86_omp_AVX_plus.hpp"
#include "Convergence/fixed/Convergence_fp_x86.hpp"
#include "Convergence/fixed/Convergence_fp_x86_omp.hpp"
#include "Convergence/cuda/Convergence_cuda.hpp"

#include "immintrin.h"

enum t_format    { f_double, f_float, f_int };
enum t_processor { x86, sse, avx, cuda };

class Mandelbrot {
private:
    ColorMap* colors;
    Convergence* c;
    int IMAGE_WIDTH;
    int IMAGE_HEIGHT;
    unsigned int max_iters;

public:
    Mandelbrot(unsigned int iters);

    ~Mandelbrot();

    void freeRessources();

    void allocRessources();

    void setIterations(unsigned short iters);

    void updateImage(double zoom, double offsetX, double offsetY, sf::Image& image);

private:
    int MAX;
    void updateImageSlice(double zoom, double offsetX, double offsetY, sf::Image& image, int minY, int maxY);
    //void updateImage(double zoom, double offsetX, double offsetY, sf::Image& image);
};


#endif
