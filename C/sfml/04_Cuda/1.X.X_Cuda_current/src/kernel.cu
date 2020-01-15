#include "cuda.h"
#include "Color/ColorSmooth/ColorSmooth.hpp"
#include <stdio.h>

#include <vector_types.h>
#include <cmath>
#include <cstdlib>
#include <iomanip>
#include <math_functions.h>


__global__ void kernel_compute(double zoom, double offsetX, double offsetY, unsigned int max_iters,
  int IMAGE_WIDTH, int IMAGE_HEIGHT, unsigned short *device_value) {

	int i = blockIdx.x * blockDim.x + threadIdx.x;
  int j = blockIdx.y * blockDim.y + threadIdx.y;

  double2 z;
  double2 z1;
  double2 z2;

  double device_value_copy;

  if ( (i<IMAGE_WIDTH) && (j<IMAGE_HEIGHT) ) {
    z.y = __fma_rn(j, zoom, __dsub_rn(offsetY, __dmul_rn(__ddiv_rn(IMAGE_HEIGHT, 2.0f), zoom)));
    z.x = __fma_rn(i, zoom, __dsub_rn(offsetX, __dmul_rn(__ddiv_rn(IMAGE_WIDTH,  2.0f), zoom)));

    /*
    z.y = offsetY - IMAGE_HEIGHT / 2.0f * zoom + (j * zoom);
    z.x = (offsetX - IMAGE_WIDTH / 2.0f * zoom)+ (i * zoom);
    */
    z1 = z;

    device_value_copy = __usad(max_iters, 1, 0);
    //device_value[j*IMAGE_WIDTH + i] = max_iters - 1;

    for (unsigned short counter = 0; counter < max_iters; counter++) {
      z2.x = __dmul_rn( z1.x, z1.x);
      z2.y = __dmul_rn( z1.y, z1.y);

      z1.y = __fma_rn(__dmul_rn(2.0f, z1.x), z1.y, z.y);
      z1.x = __dadd_rn(__dsub_rn(z2.x, z2.y), z.x);

/*
      z2.x = z1.x * z1.x;
      z2.y = z1.y * z1.y;

      z1.y = 2.0f * z1.x * z1.y + z.y;
      z1.x = z2.x - z2.y + z.x;
*/
      if ( __dadd_rn(z2.x, z2.y) > 4.0f) {
        device_value_copy = counter;
        //device_value[j*IMAGE_WIDTH + i] = counter;
        break;
      }
    }


    device_value[j*IMAGE_WIDTH + i] = device_value_copy;
	}
}



void compute (int nthreads, double zoom, double offsetX, double offsetY, unsigned int max_iters,
  int IMAGE_WIDTH, int IMAGE_HEIGHT, unsigned short *device_value) {

  int numBlocksX = ( IMAGE_WIDTH + ( nthreads - 1 ) ) / nthreads;
  int numBlocksY = ( IMAGE_HEIGHT + ( nthreads - 1 ) ) / nthreads;

  dim3 DimBlock(nthreads, nthreads, 1);
  dim3 DimGrid(numBlocksX, numBlocksY);

  kernel_compute<<<DimGrid, DimBlock>>>( zoom, offsetX, offsetY, max_iters,
    IMAGE_WIDTH, IMAGE_HEIGHT, device_value);

}
