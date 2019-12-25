#ifndef _Convergence_cuda_
#define _Convergence_cuda_

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


class Convergence_CUDA : public Convergence {
private:
  ColorMap* colors;
  int max_iters;

public:

  Convergence_CUDA(){
  }

  Convergence_CUDA(ColorMap* _colors, int _max_iters){
    colors    = _colors;
    max_iters = _max_iters;
  }

  ~Convergence_CUDA( ){

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

  inline bool CUDA_FREE( void * devPtr){
    cudaError_t cudaStatus;
    cudaStatus = cudaFree( devPtr );
    if ( cudaStatus != cudaSuccess ) {
      printf( "error: unable to free buffer\n");
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
    unsigned short *host_value_iteration = (unsigned short *)malloc( sizeof( unsigned short ) * IMAGE_WIDTH*IMAGE_HEIGHT );
    unsigned short *device_value_iteration = (unsigned short *)malloc( sizeof( unsigned short ) * IMAGE_WIDTH*IMAGE_HEIGHT );

    //double *hst_color =

    //---allocation GPU
    CUDA_MALLOC( (void**)&device_value_iteration, IMAGE_WIDTH*IMAGE_HEIGHT * sizeof( unsigned short ) );


    //---Compute on GPU
    int numThreads = 15;
    compute(numThreads, zoom, offsetX, offsetY, max_iters,
      IMAGE_WIDTH, IMAGE_HEIGHT, device_value_iteration);

    cudaStatus = cudaDeviceSynchronize();
  	if ( cudaStatus != cudaSuccess ) {
  		printf( "error: unable to synchronize threads\n");
  	}

    //---retour des valeurs
    CUDA_MEMCPY( host_value_iteration, device_value_iteration, IMAGE_HEIGHT * IMAGE_WIDTH* sizeof( unsigned short ), cudaMemcpyDeviceToHost );

    //affichage
    #pragma omp parallel // on declare une section parallel
    {
      #pragma omp for // on fait du multicoeur
      for (int y = 0; y < IMAGE_HEIGHT;  y++) {
        for (int x = 0; x < IMAGE_WIDTH;  x++) {
/*
          for (int i=0; i <= MAX; ++i) {
              float t = (float)i/(float)max_iters;
              int r   = (int)round( 9.f * (1.0f-t) * t * t * t               * 255.0f);
              int g   = (int)round(15.f * (1.0f-t) * (1.0f-t) * t * t        * 255.0f);
              int b   = (int)round(8.5f * (1.0f-t) * (1.0f-t) * (1.0f-t) * t * 255.0f);
              colors[i] = sf::Color(r, g, b);
            }
*/


          image.setPixel(x, y, colors->getColor(host_value_iteration[y*IMAGE_WIDTH+x]));
        }
      }
    }

  free(host_value_iteration);
  CUDA_FREE(device_value_iteration);

  }
};

#endif
