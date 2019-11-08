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
      float x0 = i*PAS - 2.0/ZOOM + DECALAGE_X;
      float y0 = j*PAS - 2.0/ZOOM + DECALAGE_Y;
  		int iteration = 0;
      if ((x0+1)*(x0+1) + y0*y0  < 1/16){
        iteration = MAX_IT;
      } else {
      float p = sqrt( (x0 - 0.25 )*(x0 - 0.25) + (y0 )*(y0) );
        if ( (x0  < p - 2*p*p + 0.25 ) ) {
          iteration  = MAX_IT;
        } else {
        		do {
              float temp = x;
        			x = x*x - y*y + x0;
        			y = 2*temp*y + y0;

        			iteration++;
        		} while ((x*x+y*y < 4) && (iteration < MAX_IT));
        }
      }
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
