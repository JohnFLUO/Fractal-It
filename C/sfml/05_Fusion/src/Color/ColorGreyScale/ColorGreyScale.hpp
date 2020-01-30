#ifndef _ColorGreyScale_
#define _ColorGreyScale_

#include "../ColorMap.hpp"
#include <SFML/Graphics.hpp>
#include <array>
#include <cmath>
#include <cassert>

class ColorGreyScale : public ColorMap {
public:
    ColorGreyScale(int max_iters) {

        MAX = max_iters; // memorisation du nombre d'iterations max.

        for (int i=0; i < MAX; ++i) {
            float t = 255.0*(float)i/(float)max_iters;
            colors[i] = sf::Color(t, t, t);
        }
        colors[MAX-1] = sf::Color(0, 0, 0);
    }

    virtual ~ColorGreyScale(){

    }

    virtual sf::Color getColor(int iterations){
        assert( iterations <= MAX );
        return colors[iterations];
    }
};

#endif // _ColorGreyScale_
