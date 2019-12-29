#ifndef _Convergence_fp_x86_omp_
#define _Convergence_fp_x86_omp_

#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>
#include "immintrin.h"

#include "../Convergence.hpp"
#include "fixed_point.hpp"

/*
void disp_real(string name, double float_val, fi32_t fixed_val)  {
  std::cout << name << " : ";
  printf("float =%1.9lf, fixed = %1.9lf\n", float_val, fi32_to_double(fixed_val, FI_32_28));
  //std::cout << name <<  "float = " << float_val << ", fixed = " << fi32_to_double(fixed_val, FI_32_28) << std::endl;
}
*/

class Convergence_fp_x86_omp : public Convergence {

public:

  Convergence_fp_x86_omp() {
  }

  Convergence_fp_x86_omp(ColorMap* _colors, int _max_iters){
    colors    = _colors;
    max_iters = _max_iters;
  }

  ~Convergence_fp_x86_omp() {
  }

  void disp_cmp_real(double float_val, fi32_t fixed_val, unsigned int fractionalBitCount)  {
    std::cout << "float = " << float_val << ", fixed = " << fi32_to_double(fixed_val, fractionalBitCount) << std::endl;
  }

  virtual unsigned int process(const double startReal, const double startImag, unsigned int max_iters)  {
    return -1;
  }

  virtual void updateImage(double d_zoom, double d_offsetX, double d_offsetY, int IMAGE_WIDTH, int IMAGE_HEIGHT, sf::Image& image) {
    #pragma omp parallel // on declare une section parallel
    {
      #pragma omp for // on fait du multicoeur
      for (int y = 0; y < IMAGE_HEIGHT; y++) {

        fi32_t offsetX = double_to_fi32(d_offsetX, FI_32_19);
        fi32_t offsetY = double_to_fi32(d_offsetY, FI_32_19);

        fi32_t zoom = double_to_fi32(d_zoom, FI_32_19);

        //fi32_t startImag = ((offsetY << FI_32_28) - (((IMAGE_HEIGHT >> 2) * zoom)) + (y * zoom)) << 1;
        double d_startImag = d_offsetY  -  IMAGE_HEIGHT / 2.0f * d_zoom  +  y * d_zoom;
        fi32_t startImag = offsetY  -  IMAGE_HEIGHT/2 * zoom  +  y * zoom;
        //cout << "startImag (float) = " << d_startImag << ", startImag (fixed) = " << fi32_to_double(startImag, FI_32_28) << std::endl;

        double d_startReal = d_offsetX - IMAGE_WIDTH / 2.0f * d_zoom;
        fi32_t startReal = offsetX  -  IMAGE_WIDTH/2 * zoom;
        //cout << "startReal (float) = " << d_startReal << ", startReal (fixed) = " << fi32_to_double(startReal, FI_32_28) << std::endl;
        //sleep(1);

        for (int x = 0; x < IMAGE_WIDTH;  x++) {
          int value = max_iters - 1;

          double d_zReal = d_startReal;
          fi32_t zReal = startReal;
          double d_zImag = d_startImag;
          fi32_t zImag = startImag;

          for (unsigned int counter = 0; counter < max_iters; counter++) {
            double d_r2 = d_zReal * d_zReal;
            fi64_t r2_64 = ((fi64_t)(zReal)*(fi64_t)(zReal));
            fi32_t r2 = ((r2_64 >> FI_32_19) < MAX_FI_32) ? (fi32_t)(r2_64 >> FI_32_19) : MAX_FI_32;
            //disp_cmp_real(d_r2, r2, FI_32_19);
            //usleep(100000);

            double d_i2 = d_zImag * d_zImag;
            fi64_t i2_64 = ((fi64_t)(zImag)*(fi64_t)(zImag));
            fi32_t i2 = ((i2_64 >> FI_32_19) < MAX_FI_32) ? (fi32_t)(i2_64 >> FI_32_19) : MAX_FI_32;
            //disp_cmp_real(d_i2, i2, FI_32_19);

            d_zImag = 2.0f * d_zReal * d_zImag + d_startImag;
            fi64_t z_real_z_imag_64 = (fi64_t)zReal*(fi64_t)zImag;
            fi32_t z_real_z_imag = (fi32_t)(z_real_z_imag_64 >> FI_32_19);
            zImag = (2 * z_real_z_imag  + startImag);
            //disp_cmp_real(d_zImag, zImag, FI_32_19);
            d_zReal = d_r2 - d_i2 + d_startReal;
            zReal = (r2  -  i2  +  startReal);
            //disp_cmp_real(d_zReal, zReal, FI_32_19);
            if ( (r2 + i2) > (4 << FI_32_19)) {
            //if ( (d_r2 + d_i2) > 4) {
              value = counter;
              break;
            }
          }
          image.setPixel(x, y, colors->getColor(value));
          d_startReal += d_zoom;
          startReal = startReal + zoom;
        }
      }
    }
  }
};

#endif
