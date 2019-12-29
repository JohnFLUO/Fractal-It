#include "Mandelbrot.hpp"

Mandelbrot::Mandelbrot(unsigned int iters) {
  max_iters    = iters;
  allocRessources( );
}

Mandelbrot::~Mandelbrot(){
  freeRessources( );
}

void Mandelbrot::allocRessources( ){
  if (Settings::colorMapMode == ColorMapMode::GREYSCALE) {
    colors = new ColorGreyScale(max_iters);
  } else if (Settings::colorMapMode == ColorMapMode::HSV) {
    colors = new ColorHSV(max_iters);
  } else if (Settings::colorMapMode == ColorMapMode::HSV_LOOP) {
    colors = new ColorHSVLoop(max_iters);
  } else if (Settings::colorMapMode == ColorMapMode::HSV_SHIFTED) {
    colors = new ColorHSVShifted(max_iters);
  } else if (Settings::colorMapMode == ColorMapMode::SMOOTH) {
    colors = new ColorSmooth(max_iters);
  } else if (Settings::colorMapMode == ColorMapMode::SMOOTH_LOOP) {
    colors = new ColorSmoothLoop(max_iters);
  } else if (Settings::colorMapMode == ColorMapMode::SMOOTH_SHIFTED) {
    colors = new ColorSmoothLoop(max_iters);
  } else if (Settings::colorMapMode == ColorMapMode::LSD) {
    colors = new ColorLSD(max_iters);
  } else {
    colors = new ColorSmooth(max_iters);
  }

  if (Settings::convergenceType == ConvergenceType::DP) {
    c = new Convergence_dp_x86(colors, max_iters);
  } else if (Settings::convergenceType == ConvergenceType::DP_OMP) {
    c = new Convergence_dp_x86_omp(colors, max_iters);
  } else if (Settings::convergenceType == ConvergenceType::DP_OMP_AVX) {
    c = new Convergence_dp_x86_omp_AVX(colors, max_iters);
  } else if (Settings::convergenceType == ConvergenceType::DP_OMP_AVXPLUS) {
    c = new Convergence_dp_x86_omp_AVXplus(colors, max_iters);
  } else if (Settings::convergenceType == ConvergenceType::SP) {
    c = new Convergence_sp_x86(colors, max_iters);
  } else if (Settings::convergenceType == ConvergenceType::SP_OMP) {
    c = new Convergence_sp_x86_omp(colors, max_iters);
  } else if (Settings::convergenceType == ConvergenceType::SP_OMP_AVX) {
    c = new Convergence_sp_x86_omp_AVX(colors, max_iters);
  } else if (Settings::convergenceType == ConvergenceType::SP_OMP_AVXPLUS) {
    c = new Convergence_sp_x86_omp_AVXplus(colors, max_iters);
  } else if (Settings::convergenceType == ConvergenceType::FP) {
    c = new Convergence_fp_x86(colors, max_iters);
  } else if (Settings::convergenceType == ConvergenceType::FP_OMP) {
    c = new Convergence_fp_x86_omp(colors, max_iters);
  } else if (Settings::convergenceType == ConvergenceType::CUDA) {
    c = new Convergence_CUDA(colors, max_iters);
  } else {
    c = new Convergence_dp_x86_omp_AVX(colors, max_iters);
  }
}

void Mandelbrot::freeRessources( ){
  delete c;
  delete colors;
}

void Mandelbrot::setIterations(unsigned short iters){
  printf("(II) Number of decoding iterations = %d\n", iters);
  freeRessources( );
  max_iters = iters;
  allocRessources( );
}

void Mandelbrot::updateImage(double zoom, double offsetX, double offsetY, sf::Image& image) {
  c->updateImage(zoom, offsetX, offsetY, Settings::width, Settings::height, image);

  if (Settings::isCentralDotEnable) {
    sf::Color white(255, 255, 255);
    image.setPixel(Settings::width/2-1, Settings::height/2,   white);
    image.setPixel(Settings::width/2+1, Settings::height/2,   white);
    image.setPixel(Settings::width/2,   Settings::height/2,   white);
    image.setPixel(Settings::width/2,   Settings::height/2-1, white);
    image.setPixel(Settings::width/2,   Settings::height/2+1, white);
  }
}


/*
template <class processor, class render>
void Mandelbrot<processor, render>::updateImageSlice(double zoom, double offsetX, double offsetY, sf::Image& image, int minY, int maxY)
{
    double real = 0 * zoom - Settings::width / 2.0 * zoom + offsetX;
    double imagstart = minY * zoom - Settings::height / 2.0 * zoom + offsetY;
    for (int x = 0; x < Settings::width; x++, real += zoom) {
        double imag = imagstart;
        for (int y = minY; y < maxY; y++, imag += zoom) {
            assert( c != nullptr );
            int value = c->process(real, imag, MAX);
            image.setPixel(x, y, colors.getColor(value));
        }
    }
}
*/
