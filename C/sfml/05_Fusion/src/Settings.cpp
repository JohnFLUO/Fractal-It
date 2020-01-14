/********************
      Settings
********************/

#include "Settings.hpp"


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
bool Settings::closeAfterSimulation = false;
bool Settings::logTofile = false;
unsigned int Settings::testID = 0;
bool Settings::firstSimulation = false;
bool Settings::lastSimulation = false;

ConvergenceType Settings::convergenceType = DP_OMP_AVXPLUS;
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

void Settings::SetCloseAfterSimulation(bool cas) {
  Settings::closeAfterSimulation = cas;
}

void Settings::SetLogToFile(bool ltf) {
  Settings::logTofile = ltf;
}

void Settings::SetTestID(unsigned int tid) {
  Settings::testID = tid;
}

void Settings::SetFirstSimulation(bool fs) {
  Settings::firstSimulation = fs;
}

void Settings::SetLastSimulation(bool ls) {
  Settings::lastSimulation = ls;
}

unsigned int Settings::GetConvOffset() {
  if (Settings::convergenceType == ConvergenceType::DP) {
    return 0;
  } else if (Settings::convergenceType == ConvergenceType::DP_OMP) {
    return 1;
  } else if (Settings::convergenceType == ConvergenceType::DP_OMP_AVX) {
    return 2;
  } else if (Settings::convergenceType == ConvergenceType::DP_OMP_AVXPLUS) {
    return 3;
  } else if (Settings::convergenceType == ConvergenceType::DP_OMP_AVXPLUSPLUS) {
    return 4;
  } else if (Settings::convergenceType == ConvergenceType::SP) {
    return 5;
  } else if (Settings::convergenceType == ConvergenceType::SP_OMP) {
    return 6;
  } else if (Settings::convergenceType == ConvergenceType::SP_OMP_AVX) {
    return 7;
  } else if (Settings::convergenceType == ConvergenceType::SP_OMP_AVXPLUS) {
    return 8;
  //} else if (Settings::convergenceType == ConvergenceType::SP_OMP_AVXPLUSPLUS) {
    return 9;
  } else if (Settings::convergenceType == ConvergenceType::FP) {
    return 10;
  } else if (Settings::convergenceType == ConvergenceType::FP_OMP) {
    return 11;
  } else if (Settings::convergenceType == ConvergenceType::FP_OMP_SSE2) {
    return 12;
  } else if (Settings::convergenceType == ConvergenceType::CUDA) {
    return 14;
  } else {
    return -1;
  }
}
