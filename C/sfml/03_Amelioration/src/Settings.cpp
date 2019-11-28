/*


*/
#include "Settings.hpp"

/*************
   Settings
*************/

int Settings::width = 1200;
int Settings::height = 900;

ConvergenceType Settings::convergenceType = DP_OMP_AVX;
ColorMapMode Settings::colorMapMode = SMOOTH_SHIFTED;

void Settings::SetSize(int w, int h) {
  Settings::width = w;
  Settings::height = h;
}

void Settings::SetWidth(int w) {
  Settings::width = w;
}

void Settings::SetHeight(int h) {
  Settings::height = h;
}


void Settings::SetConvergenceType(ConvergenceType ct) {
  Settings::convergenceType = ct;
}

void Settings::SetColorMapMode(ColorMapMode cm) {
  Settings::colorMapMode = cm;
}

ConvergenceType Settings::GetConvergenceType() {
  return Settings::convergenceType;
}
