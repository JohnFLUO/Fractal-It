#ifndef _Convergence_dp_x86_omp_ATX_
#define _Convergence_dp_x86_omp_ATX_

#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>
//#include "immintrin.h"
#include <immintrin.h>

#define CONV_STEP 4

class Convergence_dp_x86_omp_AVX {
private:
  ColorMap* colors;
  int max_iters;

public:
  Convergence_dp_x86_omp_AVX(ColorMap* _colors, int _max_iters){
    colors    = _colors;
    max_iters = _max_iters;
  }

  ~Convergence_dp_x86_omp_AVX( ){

  }

  unsigned int process(const double real, const double image, unsigned int max_iters)  {
    return -1;
  }


  void showd(string varName, double d){
    std::cout << varName << " : ";
    for (int i = 0 ; i < 4 ; i++) {
      printf("%1.4f ", d);
    }
    printf("\n");
  }

  void show_double_array(string varName, double *d, size_t size){
    std::cout << varName << " : ";
    for (int i = 0 ; i < size ; i++) {
      printf("%1.4f ", d[i]);
    }
    printf("\n");
  }

  void _mm256_showd(string varName, __m256d v){
    __attribute__ ((aligned (32))) double tmp[4] = {0.0f, 0.0f, 0.0f, 0.0f};
    _mm256_storeu_pd(tmp, v);
    std::cout << varName << " : ";
    for (int i = 0 ; i < 4 ; i++) {
      printf("%1.4f ", tmp[i]);
    }
    printf("\n");
  }

  void updateImage(double zoom, double offsetX, double offsetY, int IMAGE_WIDTH, int IMAGE_HEIGHT, sf::Image& image) {
    // consts :
    const __m256 v_4_0f = _mm256_set1_pd(4.0f);
    const __m256 v_2_0f = _mm256_set1_pd(2.0f);

    #pragma omp parallel // on declare une section parallel
    {

      #pragma omp for // on fait du multicoeur
      for (int y = 0 ; y < IMAGE_HEIGHT ; y++) {

        double startImag = offsetY - IMAGE_HEIGHT / 2.0f * zoom + (y * zoom);
        __attribute__ ((aligned (32))) double t_startImag[4] = {startImag, startImag, startImag, startImag};
        __m256d v_startImag = _mm256_loadu_pd(t_startImag);

        double startReal = offsetX - IMAGE_WIDTH / 2.0f * zoom;
        __attribute__ ((aligned (32))) double t_startReal[4] = {startReal, startReal+zoom, startReal+zoom*2, startReal+zoom*3};
        __m256d v_startReal = _mm256_loadu_pd(t_startReal);

        __attribute__ ((aligned (32))) double t_r2_plus_i2[4] = {0.0f, 0.0f, 0.0f, 0.0f};

        for (int x = 0 ; x < IMAGE_WIDTH ; x += CONV_STEP) {
          bool finished[4] = {false, false, false, false};
          int t_value[4] =  {max_iters - 1, max_iters - 1, max_iters - 1, max_iters - 1};

          __m256d v_zReal = v_startReal;
          __m256d v_zImag = v_startImag;

          for (unsigned int counter = 0; counter < max_iters; counter++) {
            __m256d v_r2 = _mm256_mul_pd(v_zReal, v_zReal);
            __m256d v_i2 = _mm256_mul_pd(v_zImag, v_zImag);

            v_zImag = _mm256_add_pd(_mm256_mul_pd(v_2_0f, _mm256_mul_pd(v_zReal, v_zImag)), v_startImag);
            v_zReal = _mm256_add_pd(_mm256_sub_pd(v_r2, v_i2), v_startReal);

            __m256d v_r2_plus_i2 = _mm256_add_pd(v_r2, v_i2);
            _mm256_storeu_pd(t_r2_plus_i2, v_r2_plus_i2);

            /* // debug :
              showd("d", r2_plus_i2);
              _mm256_showd("v", v_r2_plus_i2);
              show_double_array("t", t_tmp, 4);
            */

            if (t_r2_plus_i2[0] > 4.0f && finished[0] == false) {
              t_value[0] = counter;
              finished[0] = true;
            }
            if (t_r2_plus_i2[1] > 4.0f && finished[1] == false) {
              t_value[1] = counter;
              finished[1] = true;
            }
            if (t_r2_plus_i2[2] > 4.0f && finished[2] == false) {
              t_value[2] = counter;
              finished[2] = true;
            }
            if (t_r2_plus_i2[3] > 4.0f && finished[3] == false) {
              t_value[3] = counter;
              finished[3] = true;
            }

            if (finished[0] == true && finished[1] == true && finished[2] == true && finished[3] == true) {
              break;
            }
          }
          //std::cout << "value = " << value << std::endl;
          image.setPixel(x+0, y, colors->getColor(t_value[0]));
          image.setPixel(x+1, y, colors->getColor(t_value[1]));
          image.setPixel(x+2, y, colors->getColor(t_value[2]));
          image.setPixel(x+3, y, colors->getColor(t_value[3]));

          v_startReal = _mm256_add_pd(v_startReal, _mm256_set1_pd(zoom*CONV_STEP));
        }
      }
    }
  }
};

#endif
