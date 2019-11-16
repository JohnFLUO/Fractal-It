#ifndef _ColorLSD_
#define _ColorLSD_

#include "../ColorMap.hpp"
#include "../CColor.hpp"
#include "../CColor.cpp"
#include <SFML/Graphics.hpp>
#include <array>
#include <cmath>
#include <cassert>

class ColorLoop : public ColorMap {
public:
    ColorLoop(int max_iters) {
      MAX = max_iters; // memorisation du nombre d'iterations max.
      for (int i=0; i < MAX; ++i) {
          colors[i] = ColorUtils::HSVToRGB((i)%MAX, 230, 255);
      }
      colors[MAX-1] = sf::Color(0, 0, 0);
      colors[MAX] = sf::Color(0, 0, 0);
    }

    virtual ~ColorLoop(){

    }

    virtual sf::Color getColor(int iterations) {
      assert( iterations <= MAX );
      return colors[iterations];
    }
};

#endif // _ColorLSD_
