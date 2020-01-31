#ifndef _Convergence_dp_x86_omp_AVX_
#define _Convergence_dp_x86_omp_AVX_

#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>
#include <immintrin.h>
#include <unistd.h>

#define CONV_STEP 4

class Convergence_dp_x86_omp_AVX : public Convergence {

public:

  Convergence_dp_x86_omp_AVX() {
  }

  Convergence_dp_x86_omp_AVX(ColorMap* _colors, int _max_iters) {
    colors    = _colors;
    max_iters = _max_iters;
  }

  ~Convergence_dp_x86_omp_AVX() {

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

  void _mm256_showd(string varName, __m256d v) {
    __attribute__ ((aligned (32))) double tmp[4] = {0.0f, 0.0f, 0.0f, 0.0f};
    _mm256_storeu_pd(tmp, v);
    std::cout << varName << " : ";
    for (int i = 0 ; i < 4 ; i++) {
      printf("%1.4f ", tmp[i]);
    }
    printf("\n");
  }

  virtual void updateImage(double zoom, double offsetX, double offsetY, int IMAGE_WIDTH, int IMAGE_HEIGHT, sf::Image& image) {
    // consts :
    const __m256d v_4_0f = _mm256_set1_pd(4.0f);
    const __m256d v_2_0f = _mm256_set1_pd(2.0f);
    const __m256d v_1_0f = _mm256_set1_pd(1.0f);

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
          double t_value[4] =  {0.0f, 0.0f, 0.0f, 0.0f};
          __m256d v_value = _mm256_setzero_pd();
          __m256d v_zReal = v_startReal;
          __m256d v_zImag = v_startImag;

          for (unsigned int counter = 0; counter < max_iters; counter++) {
            __m256d v_r2 = _mm256_mul_pd(v_zReal, v_zReal);
            __m256d v_i2 = _mm256_mul_pd(v_zImag, v_zImag);

            v_zImag = _mm256_add_pd(_mm256_mul_pd(v_2_0f, _mm256_mul_pd(v_zReal, v_zImag)), v_startImag);
            v_zReal = _mm256_add_pd(_mm256_sub_pd(v_r2, v_i2), v_startReal);

            __m256d v_r2_plus_i2 = _mm256_add_pd(v_r2, v_i2);

            __m256d v_cmp_res = _mm256_cmp_pd(v_r2_plus_i2, v_4_0f, _CMP_LT_OS);
            v_value = _mm256_blendv_pd(v_value, _mm256_add_pd(v_value, v_1_0f), v_cmp_res); // si r2+i2 < 4 value++

            short res = _mm256_movemask_pd(v_cmp_res);
            if (res == 0) { // si r2+i2 > 4 pour tous les élements
              break;
            }
          }

          _mm256_storeu_pd(t_value, v_value);
          image.setPixel(x+0, y, colors->getColor((int)round(t_value[0])));
          image.setPixel(x+1, y, colors->getColor((int)round(t_value[1])));
          image.setPixel(x+2, y, colors->getColor((int)round(t_value[2])));
          image.setPixel(x+3, y, colors->getColor((int)round(t_value[3])));

          v_startReal = _mm256_add_pd(v_startReal, _mm256_set1_pd(zoom*CONV_STEP));
        }
      }
    }
  }
};

#endif
