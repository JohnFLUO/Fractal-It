/*


*/
#include "Settings.hpp"

/*************
   Settings
*************/

int Settings::width = 1280;
int Settings::height = 800;

int Settings::max_iters = 256;
bool Settings::autoZoom = false;
double Settings::offsetX = -0.7;
double Settings::offsetY = 0.0;
double Settings::zoom = 0.004;
double Settings::finalZoom = 0.004;
double Settings::zoomFactor = 0.01;
double Settings::zoomStepTime = 0.01;
unsigned int Settings::nbSimulations = 1;

bool Settings::isCentralDotEnable = false;

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

void Settings::SetOffsetX(double ox) {
  Settings::offsetX = ox;
}

void Settings::SetOffsetY(double oy) {
  Settings::offsetY = oy;
}

void Settings::SetZoom(double z) {
  Settings::zoom = z;
}

void Settings::SetFinalZoom(double z) {
  Settings::finalZoom = z;
}

void Settings::SetZoomFactor(double zf) {
  Settings::zoomFactor = zf;
}

void Settings::SetZoomStepTime(double zts) {
  Settings::zoomStepTime = zts;
}

void Settings::SetAutoZoom(bool az) {
  Settings::autoZoom = az;
}

void Settings::SetNbSimulations(unsigned int nbSimu) {
  Settings::nbSimulations = nbSimu;
}

void Settings::SetCentralDot(bool cd) {
  Settings::isCentralDotEnable = cd;
}

void Settings::SetMaxIter(int mi) {
  Settings::max_iters = mi;
}

ConvergenceType Settings::GetConvergenceType() {
  return Settings::convergenceType;
}
