#ifndef _ColorSmoothShifted_
#define _ColorSmoothShifted_

#include "../ColorMap.hpp"
#include <SFML/Graphics.hpp>
#include <array>
#include <cmath>
#include <cassert>

class ColorSmoothShifted : public ColorMap {
public:
    ColorSmoothShifted(int max_iters){

        MAX = max_iters; // memorisation du nombre d'iterations max.

        for (int i=0; i <= MAX; ++i) {
            float t = (float)i/(float)max_iters;
            int g   = (int)round( 9.f * (1.0f-t) * t * t * t               * 255.0f);
            int r   = (int)round(15.f * (1.0f-t) * (1.0f-t) * t * t        * 255.0f);
            int b   = (int)round(8.5f * (1.0f-t) * (1.0f-t) * (1.0f-t) * t * 255.0f);
            colors[i] = sf::Color(r, g, b);
        }
    }

    virtual ~ColorSmoothShifted(){

    }

    virtual sf::Color getColor(int iterations){
        assert( iterations <= MAX );
        return colors[iterations];
    }
};

#endif // _ColorSmoothShifted_
