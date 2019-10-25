/*

*/

#include <stdio.h>
#include <stdlib.h>
#include <string>

#include "MyMath.h"
#include "StringUtils.h"

using namespace std;

#ifndef CCOLOR_H_
#define CCOLOR_H_

class Color {
public:
	int r;
	int g;
	int b;
	int a;

	Color();
	Color(int grey);
	Color(int grey, int alpha);
	Color(int red, int green, int blue);
	Color(int red, int green, int blue, int alpha);
	Color(string name);
	Color(string name, int alpha);
	~Color();
	void HSV(int h, int s, int b);

	static int HexToDec(string hex);
	static Color* HSVToRGB(int h, int s, int b);
	static Color* HexToRGB(string hex);
	static Color* HexToRGB(unsigned long hexValue);
	static Color* ParseColor(string name);
	static Color* ParseColor(string name, int alpha);

	friend ostream& operator<<(ostream& os, const Color& c);
};

#endif /*CCOLOR_H_*/
