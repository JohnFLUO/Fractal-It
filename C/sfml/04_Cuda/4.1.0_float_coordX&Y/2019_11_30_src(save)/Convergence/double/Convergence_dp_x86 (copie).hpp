#ifndef _Convergence_dp_x86_
#define _Convergence_dp_x86_

#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>
#include "immintrin.h"

#include "GL/glew.h"
#include <omp.h>
#include "cuda.h"
#include "cuda_runtime.h"

#include "../../kernel.cuh"


class Convergence_dp_x86 {
private:
  ColorMap* colors;
  int max_iters;

  int numThreads;
  int numBlocks;
  cudaError_t cudaStatus;
  //creation pointer pour CPU et GPU
  double *value = NULL;
  double *device_value = NULL;

public:
  Convergence_dp_x86(ColorMap* _colors, int _max_iters, int IMAGE_WIDTH, int IMAGE_HEIGHT){
    colors    = _colors;
    max_iters = _max_iters;

    cudaStatus = cudaSetDevice( 0 );

    value = (double *)malloc( sizeof( double ) * IMAGE_HEIGHT*IMAGE_WIDTH );

    if ( cudaStatus != cudaSuccess ) {
      printf( "error: unable to setup cuda device\n");
    }

    //buffer allocation : reservation mememoire des pointers GPU en memoire GPU
    CUDA_MALLOC( (void**)&device_value, IMAGE_WIDTH*IMAGE_HEIGHT * sizeof( double ) );

    int numThreads = 640;
    int numBlocks = ( IMAGE_HEIGHT + ( numThreads - 1 ) ) / numThreads;


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


  //CUDA________________________________________________________
  inline bool CUDA_MALLOC( void ** devPtr, size_t size ) {
    cudaError_t cudaStatus;
    cudaStatus = cudaMalloc( devPtr, size );
    if ( cudaStatus != cudaSuccess ) {
      printf( "error: unable to allocate buffer\n");
      return false;
    }
    return true;
  }

  inline bool CUDA_MEMCPY( void * dst, const void * src, size_t count, enum cudaMemcpyKind kind ) {
    cudaError_t cudaStatus;
    cudaStatus = cudaMemcpy( dst, src, count, kind );
    if ( cudaStatus != cudaSuccess ) {
      printf( "error: unable to copy buffer\n");
      return false;
    }
    return true;
  }






  void updateImage(double zoom, double offsetX, double offsetY, int IMAGE_WIDTH, int IMAGE_HEIGHT, sf::Image& image)
  {

    //creation pointer pour CPU
    double *value = (double *)malloc( sizeof( double ) * IMAGE_HEIGHT*IMAGE_WIDTH );

    //creation pointer pour GPU
    double *device_value = NULL;

    saxpy(numBlocks, 640, zoom, offsetX, offsetY, max_iters,
      IMAGE_WIDTH, IMAGE_HEIGHT,
      colors, image,
      device_value);

    cudaStatus = cudaDeviceSynchronize();
  	if ( cudaStatus != cudaSuccess ) {
  		printf( "error: unable to synchronize threads\n");
  	}
    CUDA_MEMCPY(value, device_value, IMAGE_WIDTH * IMAGE_HEIGHT * sizeof( double ), cudaMemcpyDeviceToHost );

    //affichage
    int i_value = 0;
    for (int y = 0; y < IMAGE_HEIGHT;  y++) {
      for (int x = 0; x < IMAGE_WIDTH;  x++) {
        image.setPixel(x, y, colors->getColor(value[i_value]));
        i_value++;
      }
  	}





/*
    #pragma omp parallel // on declare une section parallel
    {

      #pragma omp for // on fait du multicoeur
      for (int y = 0; y < IMAGE_HEIGHT; y++) {

        double imag = offsetY - IMAGE_HEIGHT / 2.0f * zoom + (y * zoom);
        double real = offsetX - IMAGE_WIDTH / 2.0f * zoom;
        for (int x = 0; x < IMAGE_WIDTH;  x++) {
          int value = process(real, imag, max_iters);
          image.setPixel(x, y, colors->getColor(value));
          real += zoom;
        }

      }
    }*/



  }
};

#endif
