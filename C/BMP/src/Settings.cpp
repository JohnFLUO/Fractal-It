/*


*/
#include "Settings.h"


/*************
   Settings
*************/

int Settings::width = 1200;
int Settings::height = 1200;
bool Settings::debug = false;
FractalType Settings::fractalType = MANDELBROT;
ColorMode Settings::colorMode = HUE;
int Settings::maxIt = 100;
float Settings::zoom = 1.6;
double Settings::pas = 0.0005;
double Settings::decalage_y = 0.0;
double Settings::decalage_x = -0.4;

void Settings::SetSize(int w, int h) {
  Settings::width = w;
  Settings::height = h;
}

void Settings::SetFractalType(FractalType ft) {
  Settings::fractalType = ft;
}

void Settings::SetColorMode(ColorMode cm) {
  Settings::colorMode = cm;
}

void Settings::SetMaxIt(int mi) {
  Settings::maxIt = mi;
}

void Settings::SetZoom(float z) {
  Settings::zoom = z;
}

void Settings::SetPas(double p) {
  Settings::pas = p;
}

void Settings::SetDecalage_y(double dy) {
  Settings::decalage_y = dy;
}

void Settings::SetDecalage_x(double dx) {
  Settings::decalage_x = dx;
}
