/*

*/

#ifndef COLOR_UTILS_H_
#define COLOR_UTILS_H_

#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <SFML/Graphics.hpp>

using namespace std;


class ColorUtils {
public:
	static sf::Color HSVToRGB(int h, int s, int v);
};

#endif /*COLOR_UTILS_H_*/
