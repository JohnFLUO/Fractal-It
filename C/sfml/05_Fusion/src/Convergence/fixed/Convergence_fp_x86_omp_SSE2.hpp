#ifndef _Convergence_fp_x86_omp_SSE2_
#define _Convergence_fp_x86_omp_SSE2_

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
  printf("float =%1.9lf, fixed = %1.9lf\n", float_val, fi32_to_double(fixed_val, FI_32_25));
  //std::cout << name <<  "float = " << float_val << ", fixed = " << fi32_to_double(fixed_val, FI_32_25) << std::endl;
}
*/

class Convergence_fp_x86_omp_SSE2 : public Convergence {

public:

  Convergence_fp_x86_omp_SSE2() {
  }

  Convergence_fp_x86_omp_SSE2(ColorMap* _colors, int _max_iters){
    colors    = _colors;
    max_iters = _max_iters;
  }

  ~Convergence_fp_x86_omp_SSE2() {
  }

  void disp_cmp_real(double float_val, fi32_t fixed_val, unsigned int fractionalBitCount)  {
    std::cout << "float = " << float_val << ", fixed = " << fi32_to_double(fixed_val, fractionalBitCount) << std::endl;
  }

  virtual unsigned int process(const double startReal, const double startImag, unsigned int max_iters)  {
    return -1;
  }

  virtual void updateImage(double d_zoom, double d_offsetX, double d_offsetY, int IMAGE_WIDTH, int IMAGE_HEIGHT, sf::Image& image) {

    const __m128i v_4_0f = _mm_set1_epi32(4.0f);
    const __m128i v_2_0f = _mm_set1_epi32(2.0f);
    const __m128i v_1_0f = _mm_set1_epi32(1.0f);

    #pragma omp parallel // on declare une section parallel
    {
      #pragma omp for // on fait du multicoeur
      for (int y = 0; y < IMAGE_HEIGHT; y++) {
        fi32_t offsetX = double_to_fi32(d_offsetX, FI_32_25);
        fi32_t offsetY = double_to_fi32(d_offsetY, FI_32_25);

        fi32_t zoom = double_to_fi32(d_zoom, FI_32_25);

        fi32_t startImag = offsetY  -  IMAGE_HEIGHT/2 * zoom  +  y * zoom;
        __m128i v_startImag = _mm_set1_epi32(startImag);

        fi32_t startReal = offsetX  -  IMAGE_WIDTH/2 * zoom;
        __m128i v_startReal = _mm_set_epi32(startReal, startReal+zoom, startReal+zoom*2, startReal+zoom*3);

        for (int x = 0; x < IMAGE_WIDTH;  x++) {
          int value = max_iters - 1;

          fi32_t zReal = startReal;
          __m128i v_zReal = v_startReal;
          fi32_t zImag = startImag;
          __m128i v_zImag = v_startImag;

          for (unsigned int counter = 0; counter < max_iters; counter++) {
            fi64_t r2_64 = ((fi64_t)(zReal)*(fi64_t)(zReal)); //comment faire le calcul sur 64 bits ???
            fi32_t r2 = ((r2_64 >> FI_32_25) < MAX_FI_32) ? (fi32_t)(r2_64 >> FI_32_25) : MAX_FI_32;

            fi64_t i2_64 = ((fi64_t)(zImag)*(fi64_t)(zImag));
            fi32_t i2 = ((i2_64 >> FI_32_25) < MAX_FI_32) ? (fi32_t)(i2_64 >> FI_32_25) : MAX_FI_32;

            fi64_t z_real_z_imag_64 = (fi64_t)zReal*(fi64_t)zImag;
            fi32_t z_real_z_imag = (fi32_t)(z_real_z_imag_64 >> FI_32_25);
            zImag = (2 * z_real_z_imag  + startImag);

            zReal = (r2  -  i2  +  startReal);

            if ( (r2 + i2) > (4 << FI_32_25)) {
              value = counter;
              break;
            }
          }
          image.setPixel(x, y, colors->getColor(value));
          startReal = startReal + zoom;
        }
      }
    }
  }
};

#endif
