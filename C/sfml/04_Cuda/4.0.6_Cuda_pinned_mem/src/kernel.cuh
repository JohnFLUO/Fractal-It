#ifndef __KERNEL_CUH__
#define __KERNEL_CUH__



void compute(int nthreads, double zoom, double offsetX, double offsetY, unsigned int max_iters,
  int IMAGE_WIDTH, int IMAGE_HEIGHT, unsigned short *device_value);

#endif
