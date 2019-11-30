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
    const __m256 v_1_0f = _mm256_set1_ps(1.0f);

    #pragma omp parallel // on declare une section parallel
    {

      #pragma omp for // on fait du multicoeur
      for (int y = 0 ; y < IMAGE_HEIGHT ; y++) {

        float startImag = offsetY - IMAGE_HEIGHT / 2.0f * zoom + (y * zoom);
        __attribute__ ((aligned (32))) float t_startImag[8] = {startImag, startImag, startImag, startImag, startImag, startImag, startImag, startImag};
        __m256 v_startImag = _mm256_loadu_ps(t_startImag);

        float startReal = offsetX - IMAGE_WIDTH / 2.0f * zoom;
        __attribute__ ((aligned (32))) float t_startReal[8] = {startReal, startReal+zoom, startReal+zoom*2, startReal+zoom*3, startReal+zoom*4, startReal+zoom*5, startReal+zoom*5, startReal+zoom*6};
        __m256 v_startReal = _mm256_loadu_ps(t_startReal);


        for (int x = 0 ; x < IMAGE_WIDTH ; x += SP_CONV_STEP) {
          float t_value[8] =  {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f};
          __m256 v_value = _mm256_setzero_pd();
          __m256 v_zReal = v_startReal;
          __m256 v_zImag = v_startImag;

          for (unsigned int counter = 0; counter < max_iters; counter++) {
            __m256 v_r2 = _mm256_mul_ps(v_zReal, v_zReal);
            __m256 v_i2 = _mm256_mul_ps(v_zImag, v_zImag);

            v_zImag = _mm256_add_ps(_mm256_mul_ps(v_2_0f, _mm256_mul_ps(v_zReal, v_zImag)), v_startImag);
            v_zReal = _mm256_add_ps(_mm256_sub_ps(v_r2, v_i2), v_startReal);

            __m256 v_r2_plus_i2 = _mm256_add_ps(v_r2, v_i2);
            __m256 v_cmp_res = _mm256_cmp_ps(v_r2_plus_i2, v_4_0f, _CMP_LT_OS);
            v_value = _mm256_blendv_ps(v_value, _mm256_add_ps(v_value, v_1_0f), v_cmp_res); // si r2+i2 < 4 value++

            short res = _mm256_movemask_ps(v_cmp_res);
            if (res == 0) { // si r2+i2 > 4 pour tous les élements
              break;
            }
          }

          _mm256_storeu_ps(t_value, v_value);
          image.setPixel(x+0, y, colors->getColor((int)round(t_value[0])));
          image.setPixel(x+1, y, colors->getColor((int)round(t_value[1])));
          image.setPixel(x+2, y, colors->getColor((int)round(t_value[2])));
          image.setPixel(x+3, y, colors->getColor((int)round(t_value[3])));
          image.setPixel(x+4, y, colors->getColor((int)round(t_value[4])));
          image.setPixel(x+5, y, colors->getColor((int)round(t_value[5])));
          image.setPixel(x+6, y, colors->getColor((int)round(t_value[6])));
          image.setPixel(x+7, y, colors->getColor((int)round(t_value[7])));

          v_startReal = _mm256_add_ps(v_startReal, _mm256_set1_ps(zoom*SP_CONV_STEP));
        }
      }
    }
  }
};

#endif
