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

public:
  Convergence_dp_x86(ColorMap* _colors, int _max_iters){
    colors    = _colors;
    max_iters = _max_iters;


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

  //--Initialisation
    cudaError_t cudaStatus;
    cudaStatus = cudaSetDevice( 0 );

    if ( cudaStatus != cudaSuccess ) {
      printf( "error: unable to setup cuda device\n");
    }


    //---déclaration et allucation RAM
    unsigned short *host_value = NULL;
    host_value = (unsigned short *)malloc( sizeof( unsigned short ) * IMAGE_WIDTH*IMAGE_HEIGHT );

    unsigned short *device_value = NULL;
    device_value = (unsigned short *)malloc( sizeof( unsigned short ) * IMAGE_WIDTH*IMAGE_HEIGHT );

    //---allocation GPU
    CUDA_MALLOC( (void**)&device_value, IMAGE_WIDTH*IMAGE_HEIGHT * sizeof( unsigned short ) );


    //---Compute on GPU
    int numThreads = 15;
    saxpy(numThreads, zoom, offsetX, offsetY, max_iters,
      IMAGE_WIDTH, IMAGE_HEIGHT, device_value);

    cudaStatus = cudaDeviceSynchronize();
  	if ( cudaStatus != cudaSuccess ) {
  		printf( "error: unable to synchronize threads\n");
  	}

    //---retour des valeurs
    CUDA_MEMCPY( host_value, device_value, IMAGE_HEIGHT * IMAGE_WIDTH* sizeof( unsigned short ), cudaMemcpyDeviceToHost );

    //affichage
    #pragma omp parallel // on declare une section parallel
    {
      #pragma omp for // on fait du multicoeur
      for (int y = 0; y < IMAGE_HEIGHT;  y++) {
        for (int x = 0; x < IMAGE_WIDTH;  x++) {
          image.setPixel(x, y, colors->getColor(host_value[y*IMAGE_WIDTH+x]));
        }
      }
    }
  }
};

#endif
