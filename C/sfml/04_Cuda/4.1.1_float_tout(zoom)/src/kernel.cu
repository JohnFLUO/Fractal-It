#include "cuda.h"
#include "Color/ColorSmooth/ColorSmooth.hpp"
#include <stdio.h>
//#include "Convergence/double/Convergence_dp_x86.hpp"


__device__ unsigned short process(const float startReal, const float startImag, unsigned short max_iters)  {
  float zReal = startReal;
  float zImag = startImag;

  for (unsigned short counter = 0; counter < max_iters; counter++) {
    float r2 = zReal * zReal;
    float i2 = zImag * zImag;
    zImag = 2.0f * zReal * zImag + startImag;
    zReal = r2 - i2 + startReal;
    if ( (r2 + i2) > 4.0f) {
      return counter;
    }
  }
  return max_iters - 1;
}


__global__ void kernel_compute(float zoom, float offsetX, float offsetY, unsigned int max_iters,
  int IMAGE_WIDTH, int IMAGE_HEIGHT, unsigned short *device_value) {

	int x = blockIdx.x * blockDim.x + threadIdx.x;
  int y = blockIdx.y * blockDim.y + threadIdx.y;

  float imag;
  float real;

  if ( (x<IMAGE_WIDTH) && (y<IMAGE_HEIGHT) ) {
    imag = offsetY - IMAGE_HEIGHT / 2.0f * zoom + (y * zoom);
    real = (offsetX - IMAGE_WIDTH / 2.0f * zoom)+((x)*zoom);
    device_value[y*IMAGE_WIDTH +x] = process(real, imag, max_iters);
	}
}

void compute (int nthreads, float zoom, float offsetX, float offsetY, unsigned int max_iters,
  int IMAGE_WIDTH, int IMAGE_HEIGHT, unsigned short *device_value) {

  int numBlocksX = ( IMAGE_WIDTH + ( nthreads - 1 ) ) / nthreads;
  int numBlocksY = ( IMAGE_HEIGHT + ( nthreads - 1 ) ) / nthreads;

  dim3 DimBlock(nthreads, nthreads, 1);
  dim3 DimGrid(numBlocksX, numBlocksY);

  kernel_compute<<<DimGrid, DimBlock>>>( zoom, offsetX, offsetY, max_iters,
    IMAGE_WIDTH, IMAGE_HEIGHT, device_value);

}
