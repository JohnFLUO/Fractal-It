#include "cuda.h"
#include "Color/ColorSmooth/ColorSmooth.hpp"
#include <stdio.h>
//#include "Convergence/double/Convergence_dp_x86.hpp"


__device__ unsigned int process(const double startReal, const double startImag, unsigned int max_iters)  {
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


__global__ void kernel_saxpy(double zoom, double offsetX, double offsetY, unsigned int max_iters,
  int IMAGE_WIDTH, int IMAGE_HEIGHT, double *device_value) {
	int y = blockIdx.x * blockDim.x + threadIdx.x;
  double imag;
  double real;

	if ( y < IMAGE_HEIGHT ) {
    imag = offsetY - IMAGE_HEIGHT / 2.0f * zoom + (y * zoom);
    for (int x = 0; x < IMAGE_WIDTH;  x++) {
      real = (offsetX - IMAGE_WIDTH / 2.0f * zoom)+((x)*zoom);
      device_value[y*IMAGE_WIDTH +x] = process(real, imag, max_iters);
    }
	}
}

void saxpy (int nblocks, int nthreads, double zoom, double offsetX, double offsetY, unsigned int max_iters,
  int IMAGE_WIDTH, int IMAGE_HEIGHT, double *device_value) {

  kernel_saxpy<<<nblocks, nthreads>>>( zoom, offsetX, offsetY, max_iters,
    IMAGE_WIDTH, IMAGE_HEIGHT, device_value);
}
