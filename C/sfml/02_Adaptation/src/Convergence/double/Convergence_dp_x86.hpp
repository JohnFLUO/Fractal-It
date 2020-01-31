#ifndef _Convergence_dp_x86_
#define _Convergence_dp_x86_

#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>
#include "immintrin.h"

class Convergence_dp_x86 {
private:
  ColorMap* colors;
  int max_iters;

public:
  Convergence_dp_x86(ColorMap* _colors, int _max_iters){
    colors    = _colors;
    max_iters = _max_iters;
  }

  ~Convergence_dp_x86( ){

  }

  unsigned int process(const double startReal, const double startImag, unsigned int max_iters)  {
    double zReal = startReal;
    double zImag = startImag;

    for (unsigned int counter = 0; counter < max_iters; counter++) {
      double r2 = zReal * zReal;
      double i2 = zImag * zImag;
      zImag = 2.0f * zReal * zImag + startImag;
      zReal = r2 - i2 + startReal;
      if ( (r2 + i2) > 4.0f) {
        return counter;
      }
    }
    return max_iters - 1;
  }

  void updateImage(double zoom, double offsetX, double offsetY, int IMAGE_WIDTH, int IMAGE_HEIGHT, sf::Image& image) {
    for (int y = 0; y < IMAGE_HEIGHT; y++) {

      double imag = offsetY - IMAGE_HEIGHT / 2.0f * zoom + (y * zoom);
      double real = offsetX - IMAGE_WIDTH / 2.0f * zoom;
      for (int x = 0; x < IMAGE_WIDTH;  x++) {
        int value = process(real, imag, max_iters);
        image.setPixel(x, y, colors->getColor(value));
        real += zoom;
      }

    }
  }
};

#endif
