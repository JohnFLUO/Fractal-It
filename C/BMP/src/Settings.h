/*

*/

#include <stdio.h>
#include <stdlib.h>
#include <string>

using namespace std;

#ifndef SETTINGS_H_
#define SETTINGS_H_

#define WIDTH Settings::width
#define HEIGHT Settings::height

#define MAX_IT Settings::maxIt
#define PAS Settings::pas
#define ZOOM Settings::zoom
#define DECALAGE_Y Settings::decalage_y
#define DECALAGE_X Settings::decalage_x

enum FractalType{
	MANDELBROT, JULIA
};

enum ColorMode{
	HUE, SATURATION
};

class Settings {
public:
	static int width;
	static int height;

	static bool debug;
	static FractalType fractalType;
	static ColorMode colorMode;
	static int maxIt;
	static float zoom;
	static double pas;
	static double decalage_y;
	static double decalage_x;

	static void SetSize(int w, int h);

	static void SetFractalType(FractalType ft);
	static void SetColorMode(ColorMode cm);
	static void SetMaxIt(int mi);
	static void SetZoom(float z);
	static void SetPas(double p);
	static void SetDecalage_y(double dy);
	static void SetDecalage_x(double dx);
};

#endif /*SETTINGS_H_*/
