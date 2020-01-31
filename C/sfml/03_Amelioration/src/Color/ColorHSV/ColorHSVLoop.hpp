#ifndef _ColorHSV_Loop_
#define _ColorHSV_Loop_

#include "../ColorMap.hpp"
#include <SFML/Graphics.hpp>
#include <array>
#include <cmath>
#include <cassert>

class ColorHSVLoop : public ColorMap {
public:
    ColorHSVLoop(int max_iters) {
      MAX = max_iters; // memorisation du nombre d'iterations max.
      for (int i=0; i < MAX; ++i) {
          colors[i] = ColorUtils::HSVToRGB((i)%MAX, 230, 255);
      }
      colors[MAX-1] = sf::Color(0, 0, 0);
      colors[MAX] = sf::Color(0, 0, 0);
    }

    virtual ~ColorHSVLoop(){

    }

    virtual sf::Color getColor(int iterations) {
      assert( iterations <= MAX );
      return colors[iterations];
    }
};

#endif // _ColorHSV_Loop_
