#ifndef _ColorHSVShifted_
#define _ColorHSVShifted_

#include "../ColorMap.hpp"
#include <SFML/Graphics.hpp>
#include <array>
#include <cmath>
#include <cassert>

class ColorHSVShifted : public ColorMap {
public:
    ColorHSVShifted(int max_iters) {
      MAX = max_iters; // memorisation du nombre d'iterations max.
      for (int i=0; i < MAX; ++i) {
          colors[i] = ColorUtils::HSVToRGB(255*(MAX-ITER)/MAX, 255, 255);
      }
      colors[MAX-1] = sf::Color(0, 0, 0);
      colors[MAX] = sf::Color(0, 0, 0);
    }

    virtual ~ColorHSVShifted(){

    }

    virtual sf::Color getColor(int iterations) {
      assert( iterations <= MAX );
      return colors[iterations];
    }
};

#endif // _ColorHSVShifted_
