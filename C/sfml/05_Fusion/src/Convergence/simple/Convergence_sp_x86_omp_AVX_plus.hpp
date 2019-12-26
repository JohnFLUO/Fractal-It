#ifndef _Convergence_sp_x86_omp_ATXplus_
#define _Convergence_sp_x86_omp_ATXplus_

#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>
#include <immintrin.h>
#include <unistd.h>

#define SPP_CONV_STEP 16

class Convergence_sp_x86_omp_AVXplus : public Convergence {

public:

  Convergence_sp_x86_omp_AVXplus() {
  }

  Convergence_sp_x86_omp_AVXplus(ColorMap* _colors, int _max_iters) {
    colors    = _colors;
    max_iters = _max_iters;
  }

  ~Convergence_sp_x86_omp_AVXplus() {
  }

  virtual unsigned int process(const double real, const double image, unsigned int max_iters) {
    return -1;
  }


  void showd(string varName, double d) {
    std::cout << varName << " : ";
    for (int i = 0 ; i < 4 ; i++) {
      printf("%1.4f ", d);
    }
    printf("\n");
  }

  void show_double_array(string varName, double *d, size_t size) {
    std::cout << varName << " : ";
    for (int i = 0 ; i < size ; i++) {
      printf("%1.4f ", d[i]);
    }
    printf("\n");
  }

  void _mm256_shows(string varName, __m256 v){
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
        __attribute__ ((aligned (32))) float t_startReal_1[8] = {startReal       , startReal+zoom  , startReal+zoom*2 , startReal+zoom*3 , startReal+zoom*4 , startReal+zoom*5 , startReal+zoom*6 , startReal+zoom*7 };
        __m256 v_startReal_1 = _mm256_loadu_ps(t_startReal_1);
        __attribute__ ((aligned (32))) float t_startReal_2[8] = {startReal+zoom*8, startReal+zoom*9, startReal+zoom*10, startReal+zoom*11, startReal+zoom*12, startReal+zoom*13, startReal+zoom*14, startReal+zoom*15};
        __m256 v_startReal_2 = _mm256_loadu_ps(t_startReal_2);

        __attribute__ ((aligned (32))) float t_r2_plus_i2[8] = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f};

        for (int x = 0 ; x < IMAGE_WIDTH ; x += SPP_CONV_STEP) {
          float t_value_1[8] =  {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f};
          float t_value_2[8] =  {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f};
          __m256 v_value_1 = _mm256_setzero_ps();
          __m256 v_value_2 = _mm256_setzero_ps();
          __m256 v_zReal_1 = v_startReal_1;
          __m256 v_zReal_2 = v_startReal_2;
          __m256 v_zImag_1 = v_startImag;
          __m256 v_zImag_2 = v_startImag;

          for (unsigned int counter = 0; counter < max_iters; counter++) {
            __m256 v_r2_1 = _mm256_mul_ps(v_zReal_1, v_zReal_1);
            __m256 v_i2_1 = _mm256_mul_ps(v_zImag_1, v_zImag_1);
            __m256 v_r2_2 = _mm256_mul_ps(v_zReal_2, v_zReal_2);
            __m256 v_i2_2 = _mm256_mul_ps(v_zImag_2, v_zImag_2);

            v_zImag_1 = _mm256_add_ps(_mm256_mul_ps(v_2_0f, _mm256_mul_ps(v_zReal_1, v_zImag_1)), v_startImag);
            v_zImag_2 = _mm256_add_ps(_mm256_mul_ps(v_2_0f, _mm256_mul_ps(v_zReal_2, v_zImag_2)), v_startImag);
            v_zReal_1 = _mm256_add_ps(_mm256_sub_ps(v_r2_1, v_i2_1), v_startReal_1);
            v_zReal_2 = _mm256_add_ps(_mm256_sub_ps(v_r2_2, v_i2_2), v_startReal_2);

            __m256 v_r2_plus_i2_1 = _mm256_add_ps(v_r2_1, v_i2_1);
            __m256 v_r2_plus_i2_2 = _mm256_add_ps(v_r2_2, v_i2_2);

            __m256 v_cmp_res_1 = _mm256_cmp_ps(v_r2_plus_i2_1, v_4_0f, _CMP_LT_OS);
            __m256 v_cmp_res_2 = _mm256_cmp_ps(v_r2_plus_i2_2, v_4_0f, _CMP_LT_OS);
            v_value_1 = _mm256_blendv_ps(v_value_1, _mm256_add_ps(v_value_1, v_1_0f), v_cmp_res_1);
            v_value_2 = _mm256_blendv_ps(v_value_2, _mm256_add_ps(v_value_2, v_1_0f), v_cmp_res_2);

            short res_1 = _mm256_movemask_ps(v_cmp_res_1);
            short res_2 = _mm256_movemask_ps(v_cmp_res_2);
            if (res_1 == 0 && res_2 == 0) { // si r2+i2 > 4 pour tous les élements
              break;
            }
          }

          _mm256_storeu_ps(t_value_1, v_value_1);
          _mm256_storeu_ps(t_value_2, v_value_2);
          image.setPixel(x+0,  y, colors->getColor((int)round(t_value_1[0])));
          image.setPixel(x+1,  y, colors->getColor((int)round(t_value_1[1])));
          image.setPixel(x+2,  y, colors->getColor((int)round(t_value_1[2])));
          image.setPixel(x+3,  y, colors->getColor((int)round(t_value_1[3])));
          image.setPixel(x+4,  y, colors->getColor((int)round(t_value_1[4])));
          image.setPixel(x+5,  y, colors->getColor((int)round(t_value_1[5])));
          image.setPixel(x+6,  y, colors->getColor((int)round(t_value_1[6])));
          image.setPixel(x+7,  y, colors->getColor((int)round(t_value_1[7])));
          image.setPixel(x+8,  y, colors->getColor((int)round(t_value_2[0])));
          image.setPixel(x+9,  y, colors->getColor((int)round(t_value_2[1])));
          image.setPixel(x+10, y, colors->getColor((int)round(t_value_2[2])));
          image.setPixel(x+11, y, colors->getColor((int)round(t_value_2[3])));
          image.setPixel(x+12, y, colors->getColor((int)round(t_value_2[4])));
          image.setPixel(x+13, y, colors->getColor((int)round(t_value_2[5])));
          image.setPixel(x+14, y, colors->getColor((int)round(t_value_2[6])));
          image.setPixel(x+15, y, colors->getColor((int)round(t_value_2[7])));
          v_startReal_1 = _mm256_add_ps(v_startReal_1, _mm256_set1_ps(zoom*SPP_CONV_STEP));
          v_startReal_2 = _mm256_add_ps(v_startReal_2, _mm256_set1_ps(zoom*SPP_CONV_STEP));
        }
      }
    }
  }
};

#endif
