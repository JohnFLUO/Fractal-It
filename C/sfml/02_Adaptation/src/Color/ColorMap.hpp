#ifndef _ColorMap_
#define _ColorMap_

#include <SFML/Graphics.hpp>
#include <array>
#include "CColor.hpp"


class ColorMap {
public:
    ColorMap(){

    }

    virtual ~ColorMap(){

    }

    virtual sf::Color getColor(int iterations){
    	return sf::Color(0, 0, 0);;
    }

protected:
    std::array<sf::Color, 65536> colors;

    int MAX;
};

#endif // _ColorMap_
