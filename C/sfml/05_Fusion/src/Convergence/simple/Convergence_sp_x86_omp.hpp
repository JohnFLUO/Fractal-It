#ifndef _Convergence_sp_x86_omp_
#define _Convergence_sp_x86_omp_

#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>
#include "immintrin.h"

class Convergence_sp_x86_omp : public Convergence {

public:

  Convergence_sp_x86_omp() {
  }

  Convergence_sp_x86_omp(ColorMap* _colors, int _max_iters){
    colors    = _colors;
    max_iters = _max_iters;
  }

  ~Convergence_sp_x86_omp( ){

  }

  virtual unsigned int process(const float startReal, const float startImag, unsigned int max_iters)  {
    float zReal = startReal;
    double zImag = startImag;

    for (unsigned int counter = 0; counter < max_iters; counter++) {
      float r2 = zReal * zReal;
      float i2 = zImag * zImag;
      zImag = 2.0f * zReal * zImag + startImag;
      zReal = r2 - i2 + startReal;
      if ( (r2 + i2) > 4.0f) {
        return counter;
      }
    }
    return max_iters - 1;
  }

  virtual void updateImage(double zoom, double offsetX, double offsetY, int IMAGE_WIDTH, int IMAGE_HEIGHT, sf::Image& image) {
    float f_zoom = (float) zoom;
    float f_offsetX = (float) offsetX;
    float f_offsetY = (float) offsetY;

    #pragma omp parallel // on declare une section parallel
    {

      #pragma omp for // on fait du multicoeur
      for (int y = 0; y < IMAGE_HEIGHT; y++) {

        float imag = f_offsetY - IMAGE_HEIGHT / 2.0f * f_zoom + (y * f_zoom);
        float real = f_offsetX - IMAGE_WIDTH / 2.0f * f_zoom;
        for (int x = 0; x < IMAGE_WIDTH;  x++) {
          int value = process(real, imag, max_iters);
          image.setPixel(x, y, colors->getColor(value));
          real += f_zoom;
        }
      }
    }
  }
};

#endif
