#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>

#include "../Color/ColorMap.hpp"

#ifndef CONVERGENCE_H_
#define CONVERGENCE_H_

class Convergence {

protected:
  ColorMap* colors;
  int max_iters;

public:

  Convergence() {}

  Convergence(ColorMap* _colors, int _max_iters) {}

  virtual ~Convergence() {}

  virtual int process(double startReal, double startImag, int max_iters) {return -1;}

  virtual void updateImage(double zoom, double offsetX, double offsetY, int IMAGE_WIDTH, int IMAGE_HEIGHT, sf::Image& image) {}

};

#endif
