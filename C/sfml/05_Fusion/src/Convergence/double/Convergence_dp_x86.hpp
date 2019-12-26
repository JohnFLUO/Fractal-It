#ifndef _Convergence_dp_x86_
#define _Convergence_dp_x86_

#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>
#include "immintrin.h"

#include "../Convergence.hpp"

class Convergence_dp_x86 : public Convergence {

public:

  Convergence_dp_x86() {
  }

  Convergence_dp_x86(ColorMap* _colors, int _max_iters){
    colors    = _colors;
    max_iters = _max_iters;
  }

  ~Convergence_dp_x86( ){

  }

  virtual unsigned int process(const double startReal, const double startImag, unsigned int max_iters)  {
    return -1;
  }

  virtual void updateImage(double zoom, double offsetX, double offsetY, int IMAGE_WIDTH, int IMAGE_HEIGHT, sf::Image& image) {
    for (int y = 0; y < IMAGE_HEIGHT; y++) {

      double startImag = offsetY - IMAGE_HEIGHT / 2.0f * zoom + (y * zoom);
      double startReal = offsetX - IMAGE_WIDTH / 2.0f * zoom;
      for (int x = 0; x < IMAGE_WIDTH;  x++) {
        int value = max_iters - 1;

        double zReal = startReal;
        double zImag = startImag;

        for (unsigned int counter = 0; counter < max_iters; counter++) {
          double r2 = zReal * zReal;
          double i2 = zImag * zImag;
          zImag = 2.0f * zReal * zImag + startImag;
          zReal = r2 - i2 + startReal;
          if ( (r2 + i2) > 4.0f) {
            value = counter;
            break;
          }
        }
        image.setPixel(x, y, colors->getColor(value));
        startReal += zoom;
      }
    }
  }
};

#endif
