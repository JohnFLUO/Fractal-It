#ifndef _ColorLerpBlueRed_
#define _ColorLerpBlueRed_

#include "../ColorMap.hpp"
#include <SFML/Graphics.hpp>
#include <array>
#include <cmath>
#include <cassert>

class ColorLerpBlueRed : public ColorMap {
public:
  ColorLerpBlueRed(int max_iters) {
    MAX = max_iters; // memorisation du nombre d'iterations max.
    sf::Color red(255, 0, 0);
    sf::Color blue(0, 0, 255);
    for (int i=0; i < MAX; ++i) {
      colors[i] = ColorUtils::Lerp(red, blue, float(i)/float(MAX));
      //std::cout << "colors["<<i<<"] = " << (int)colors[i].r << ", " << (int)colors[i].g << ", " << (int)colors[i].b << std::endl;
    }
    colors[MAX-1] = sf::Color(0, 0, 0);
    colors[MAX] = sf::Color(0, 0, 0);
  }

  virtual ~ColorLerpBlueRed(){

  }

  virtual sf::Color getColor(int iterations) {
    assert( iterations <= MAX );
    return colors[iterations];
  }
};

#endif // _ColorLerpBlueRed_
