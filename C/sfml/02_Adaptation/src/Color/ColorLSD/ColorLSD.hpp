#ifndef _ColorLoop_
#define _ColorLoop_

#include "../ColorMap.hpp"
#include "../CColor.hpp"
#include "../CColor.cpp"
#include <SFML/Graphics.hpp>
#include <array>
#include <cmath>
#include <cassert>

class ColorLSD : public ColorMap {
public:
    ColorLSD(int max_iters) {
      MAX = max_iters; // memorisation du nombre d'iterations max.
      for (int i=0; i < MAX; ++i) {
          colors[i] = ColorUtils::HSVToRGB((255*ITER)%MAX, 255, 255);
      }
      colors[MAX-1] = sf::Color(0, 0, 0);
      colors[MAX] = sf::Color(0, 0, 0);
    }

    virtual ~ColorLSD(){

    }

    virtual sf::Color getColor(int iterations) {
      assert( iterations <= MAX );
      return colors[iterations];
    }
};

#endif // _ColorLoop_
