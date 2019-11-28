/*

*/

#ifndef SETTINGS_H_
#define SETTINGS_H_

#include <stdio.h>
#include <stdlib.h>
#include <string>

enum ConvergenceType{
	SP, SP_OMP, SP_OMP_AVX,
	DP, DP_OMP, DP_OMP_AVX
};

enum ColorMapMode{
	GREYSCALE,
	HSV, HSV_LOOP, HSV_SHIFTED,
	SMOOTH, SMOOTH_LOOP, SMOOTH_SHIFTED,
	LSD
};

class Settings {
public:
	static int width;
	static int height;

	static ConvergenceType convergenceType;
	static ColorMapMode colorMapMode;

	static void SetSize(int w, int h);
	static void SetWidth(int w);
	static void SetHeight(int h);

	static void SetConvergenceType(ConvergenceType ct);
	static void SetColorMapMode(ColorMapMode cm);

	static ConvergenceType GetConvergenceType();

};

#endif /*SETTINGS_H_*/
