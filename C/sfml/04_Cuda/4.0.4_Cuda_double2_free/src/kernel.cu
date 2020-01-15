#include "cuda.h"
#include "Color/ColorSmooth/ColorSmooth.hpp"
#include <stdio.h>

#include <vector_types.h>
#include <cmath>
#include <cstdlib>
#include <iomanip>
#include <math_functions.h>

__device__ unsigned short process(double2 startValue, unsigned short max_iters)  {

  double2 startZ = startValue;

  double2 z1;
  z1.x = startZ.x;
  z1.y = startZ.y;

  for (unsigned short counter = 0; counter < max_iters; counter++) {
    double2 z2;
    z2.x = z1.x * z1.x;
    z2.y = z1.y * z1.y;

    z1.y = 2.0f * z1.x * z1.y + startZ.y;
    z1.x = z2.x - z2.y + startZ.x;
    if ( (z2.x + z2.y) > 4.0f) {
      return counter;
    }
  }

  return max_iters - 1;
}

__global__ void kernel_compute(double zoom, double offsetX, double offsetY, unsigned int max_iters,
  int IMAGE_WIDTH, int IMAGE_HEIGHT, unsigned short *device_value) {

	int x = blockIdx.x * blockDim.x + threadIdx.x;
  int y = blockIdx.y * blockDim.y + threadIdx.y;

  double2 z;

  if ( (x<IMAGE_WIDTH) && (y<IMAGE_HEIGHT) ) {
    z.y = offsetY - IMAGE_HEIGHT / 2.0f * zoom + (y * zoom);
    z.x = (offsetX - IMAGE_WIDTH / 2.0f * zoom)+((x)*zoom);
    device_value[y*IMAGE_WIDTH + x] = process(z, max_iters);
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
