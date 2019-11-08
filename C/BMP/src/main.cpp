/**********************\
    Fractal plotter
***********************

Author :
--------
Jonathan SAUSSEREAU

Description :
-------------
Creates a .BMP image file diplaying the Mandelbrot set.

*/

#include "SDL2/SDL.h"
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <vector>
#include <string>
#include <ctime>
#include <omp.h>

using namespace std;

#include "CBitmap.h"
#include "CImage++.h"
#include "Draw.h"
#include "FileHandler.h"
#include "ProgressBar.h"

#define DEFAULT_WIDTH 1000
#define DEFAULT_HEIGHT 1000

int main(int argc, char * argv[]) {
  omp_set_num_threads(4);

  srand(time(NULL));
  cout << "Execution start (" << __DATE__ << " - " << __TIME__ << ")" << endl;

  // Parse parameters file
  string filename = "mandelbrot_valley_min.txt";
  if (argc > 1) {
    filename = argv[1];
  }
  FileReader fg(filename);
  fg.ParseParams();

  // Compute size using fractal parameters :
  Vector2* size = new Vector2(round(4.0/ZOOM/PAS), round(4.0/ZOOM/PAS));
  checkSize(size); // Check if a BMP can be generated with this size

  // Init canvas :
  cout << endl << "Creating a Bitmap image..." << endl;
  CBitmap* bitmap = new CBitmap();
  CImage_pp* img = new CImage_pp(size->x, size->y, true);
  Settings::SetSize(size->x, size->y);

  // Draw fractal :
  cout << endl << "Computing fractal..." << endl;
  drawMandelbrot(img);

  // Save file :
  cout << "Starting picture saving..." << endl;
  bitmap->SetImage(img);
  bitmap->SaveBMP("output.bmp");
  delete img;
  return 1;
}
