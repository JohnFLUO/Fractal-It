#ifndef _ColorSmoothLoop_
#define _ColorSmoothLoop_

#include "../ColorMap.hpp"
#include <SFML/Graphics.hpp>
#include <array>
#include <cmath>
#include <cassert>

class ColorSmoothLoop : public ColorMap {
public:
    ColorSmoothLoop(int max_iters){

        MAX = max_iters; // memorisation du nombre d'iterations max.

        for (int i=0; i < MAX; ++i) {
            float t = (float)i/100.0 ;
            int r   = (int)std::round( 9.f * (1.0f-t) * t * t * t               * 255.0f);
            int g   = (int)std::round(15.f * (1.0f-t) * (1.0f-t) * t * t        * 255.0f);
            int b   = (int)std::round(8.5f * (1.0f-t) * (1.0f-t) * (1.0f-t) * t * 255.0f);
            colors[i] = sf::Color(r, g, b);
        }
        colors[MAX-1] = sf::Color(0, 0, 0);
    }

    virtual ~ColorSmoothLoop(){

    }

    virtual sf::Color getColor(int iterations){
        assert( iterations <= MAX );
        return colors[iterations];
    }
};

#endif // _ColorSmoothLoop_
