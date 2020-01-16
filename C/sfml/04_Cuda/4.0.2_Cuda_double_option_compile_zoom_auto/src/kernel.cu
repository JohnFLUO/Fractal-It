#include "cuda.h"
#include "Color/ColorSmooth/ColorSmooth.hpp"
#include <stdio.h>


__device__ unsigned short process(const double startReal, const double startImag, unsigned short max_iters)  {
  double zReal = startReal;
  double zImag = startImag;

  for (unsigned short counter = 0; counter < max_iters; counter++) {
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


__global__ void kernel_compute(double zoom, double offsetX, double offsetY, unsigned int max_iters,
  int IMAGE_WIDTH, int IMAGE_HEIGHT, unsigned short *device_value) {

	int x = blockIdx.x * blockDim.x + threadIdx.x;
  int y = blockIdx.y * blockDim.y + threadIdx.y;

  double imag;
  double real;

  if ( (x<IMAGE_WIDTH) && (y<IMAGE_HEIGHT) ) {
    imag = offsetY - IMAGE_HEIGHT / 2.0f * zoom + (y * zoom);
    real = (offsetX - IMAGE_WIDTH / 2.0f * zoom)+((x)*zoom);
    device_value[y*IMAGE_WIDTH +x] = process(real, imag, max_iters);
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
