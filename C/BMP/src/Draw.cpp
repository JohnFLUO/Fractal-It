/**********************\
         Draw
***********************

Author :
--------
Jonathan SAUSSEREAU

Description :
-------------
Fractal plotting for :
  - Mandelbrot set

*/

#include "Draw.h"

/********************
      Fractals
********************/

void drawMandelbrot (CImage_pp *img) {
  ProgressBar pb;
  float progressPercent = 0.0;
  unsigned long progress = 0;
  #pragma omp parallel for
  for (int i = 0; i < WIDTH; i++) {
    #pragma omp parallel for
    for (int j = 0; j < HEIGHT; j++) {
  		float x = 0;
  		float y = 0;
  		int iteration = 0;

  		do {
        float temp = x;
  			x = x*x - y*y + i*PAS - 2.0/ZOOM + DECALAGE_X;
  			y = 2*temp*y + j*PAS - 2.0/ZOOM + DECALAGE_Y;

  			iteration++;
  		} while ((x*x+y*y < 4) && (iteration < MAX_IT));

  		if (iteration == MAX_IT) {
        img->SetPixel(i, j, 0, 0, 0);
  		} else {
        if (Settings::colorMode == HUE) {
          img->SetPixel(i, j, Color::HSVToRGB(255*iteration/MAX_IT, 255, 255));
        } else {
          img->SetPixel(i, j, Color::HSVToRGB(255, 255*iteration/MAX_IT, 255));
    		}
      }
  	}

    progress++;
    progressPercent = mapf(progress, 0.0, (float)(WIDTH), 0.0, 100.0);
    pb.Refresh(progressPercent);
  }
  cout << endl;
}
