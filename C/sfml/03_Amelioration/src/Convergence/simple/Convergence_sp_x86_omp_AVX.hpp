#ifndef _Convergence_sp_x86_omp_ATX_
#define _Convergence_sp_x86_omp_ATX_

#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>
//#include "immintrin.h"
#include <immintrin.h>

#define SP_CONV_STEP 8

class Convergence_sp_x86_omp_AVX : public Convergence {

public:

  Convergence_sp_x86_omp_AVX() {
  }

  Convergence_sp_x86_omp_AVX(ColorMap* _colors, int _max_iters) {
    colors    = _colors;
    max_iters = _max_iters;
  }

  ~Convergence_sp_x86_omp_AVX() {

  }

  virtual unsigned int process(const float real, const float image, unsigned int max_iters) {
    return -1;
  }


  void shows(string varName, float d){
    std::cout << varName << " : ";
    for (int i = 0 ; i < 4 ; i++) {
      printf("%1.4f ", d);
    }
    printf("\n");
  }

  void show_float_array(string varName, float *d, size_t size){
    std::cout << varName << " : ";
    for (int i = 0 ; i < size ; i++) {
      printf("%1.4f ", d[i]);
    }
    printf("\n");
  }

  void _mm256_shows(string varName, __m256d v){
    __attribute__ ((aligned (32))) float tmp[8] = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f};
    _mm256_storeu_ps(tmp, v);
    std::cout << varName << " : ";
    for (int i = 0 ; i < 8 ; i++) {
      printf("%1.4f ", tmp[i]);
    }
    printf("\n");
  }

  virtual void updateImage(double d_zoom, double d_offsetX, double d_offsetY, int IMAGE_WIDTH, int IMAGE_HEIGHT, sf::Image& image) {

    float zoom = (float) d_zoom;
    float offsetX = (float) d_offsetX;
    float offsetY = (float) d_offsetY;

    // consts :
    const __m256 v_4_0f = _mm256_set1_ps(4.0f);
    const __m256 v_2_0f = _mm256_set1_ps(2.0f);

    #pragma omp parallel // on declare une section parallel
    {

      #pragma omp for // on fait du multicoeur
      for (int y = 0 ; y < IMAGE_HEIGHT ; y++) {

        float startImag = offsetY - IMAGE_HEIGHT / 2.0f * zoom + (y * zoom);
        __attribute__ ((aligned (32))) float t_startImag[8] = {startImag, startImag, startImag, startImag, startImag, startImag, startImag, startImag};
        __m256d v_startImag = _mm256_loadu_ps(t_startImag);

        float startReal = offsetX - IMAGE_WIDTH / 2.0f * zoom;
        __attribute__ ((aligned (32))) float t_startReal[8] = {startReal, startReal+zoom, startReal+zoom*2, startReal+zoom*3, startReal+zoom*4, startReal+zoom*5, startReal+zoom*5, startReal+zoom*6};
        __m256d v_startReal = _mm256_loadu_ps(t_startReal);

        __attribute__ ((aligned (32))) float t_r2_plus_i2[8] = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f};

        for (int x = 0 ; x < IMAGE_WIDTH ; x += SP_CONV_STEP) {
          bool finished[8] = {false, false, false, false};
          int t_value[8] =  {max_iters - 1, max_iters - 1, max_iters - 1, max_iters - 1, max_iters - 1, max_iters - 1, max_iters - 1, max_iters - 1};

          __m256d v_zReal = v_startReal;
          __m256d v_zImag = v_startImag;

          for (unsigned int counter = 0; counter < max_iters; counter++) {
            __m256d v_r2 = _mm256_mul_ps(v_zReal, v_zReal);
            __m256d v_i2 = _mm256_mul_ps(v_zImag, v_zImag);

            v_zImag = _mm256_add_ps(_mm256_mul_ps(v_2_0f, _mm256_mul_ps(v_zReal, v_zImag)), v_startImag);
            v_zReal = _mm256_add_ps(_mm256_sub_ps(v_r2, v_i2), v_startReal);

            __m256d v_r2_plus_i2 = _mm256_add_ps(v_r2, v_i2);
            _mm256_storeu_ps(t_r2_plus_i2, v_r2_plus_i2);

            /* // debug :
              showd("d", r2_plus_i2);
              _mm256_showd("v", v_r2_plus_i2);
              show_float_array("t", t_tmp, 8);
            */

            for (int i = 0 ; i < SP_CONV_STEP ; i++) {
              if (t_r2_plus_i2[i] > 4.0f && finished[i] == false) {
                t_value[i] = counter;
                finished[i] = true;
              }
            }

            if (finished[0] == true && finished[1] == true && finished[2] == true && finished[3] == true && finished[4] == true && finished[5] == true && finished[6] == true && finished[7] == true) {
              break;
            }
          }
          //std::cout << "value = " << value << std::endl;
          image.setPixel(x+0, y, colors->getColor(t_value[0]));
          image.setPixel(x+1, y, colors->getColor(t_value[1]));
          image.setPixel(x+2, y, colors->getColor(t_value[2]));
          image.setPixel(x+3, y, colors->getColor(t_value[3]));
          image.setPixel(x+4, y, colors->getColor(t_value[4]));
          image.setPixel(x+5, y, colors->getColor(t_value[5]));
          image.setPixel(x+6, y, colors->getColor(t_value[6]));
          image.setPixel(x+7, y, colors->getColor(t_value[7]));

          v_startReal = _mm256_add_ps(v_startReal, _mm256_set1_ps(zoom*SP_CONV_STEP));
        }
      }
    }
  }
};

#endif
