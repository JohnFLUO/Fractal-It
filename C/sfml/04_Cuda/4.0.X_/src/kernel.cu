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

  if ( (i<IMAGE_WIDTH) && (j<IMAGE_HEIGHT) ) {
    z.y = offsetY - IMAGE_HEIGHT / 2.0f * zoom + (j * zoom);
    z.x = (offsetX - IMAGE_WIDTH / 2.0f * zoom)+ (i * zoom);

    z1.x = z.x;
    z1.y = z.y;

    device_value[j*IMAGE_WIDTH + i] = max_iters - 1;

    for (unsigned short counter = 0; counter < max_iters; counter++) {
      z2.x = z1.x * z1.x;
      z2.y = z1.y * z1.y;

      z1.y = 2.0f * z1.x * z1.y + z.y;
      z1.x = z2.x - z2.y + z.x;
      if ( (z2.x + z2.y) > 4.0f) {
        device_value[j*IMAGE_WIDTH + i] = counter;
        break;
      }
    }

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
