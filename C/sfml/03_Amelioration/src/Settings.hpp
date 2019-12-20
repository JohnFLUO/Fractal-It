/*

*/

#ifndef SETTINGS_H_
#define SETTINGS_H_

#include <stdio.h>
#include <stdlib.h>
#include <string>

enum ConvergenceType{
	SP, SP_OMP, SP_OMP_AVX,
	DP, DP_OMP, DP_OMP_AVX, DP_OMP_AVXPLUS
};

enum ColorMapMode{
	GREYSCALE,
	HSV, HSV_LOOP, HSV_SHIFTED,
	SMOOTH, SMOOTH_LOOP, SMOOTH_SHIFTED,
	LERP_BLUE_RED, LERP_RED_BLUE, LERP_BLUE_PURPLE, LERP_PURPLE_BLUE,
	LSD
};

class Settings {
public:
	static int width;
	static int height;

	static bool autoZoom;
	static int max_iters;
	static double offsetX;
	static double offsetY;
	static double zoom;
	static double finalZoom;
	static double zoomFactor;
	static double zoomStepTime;

	static bool isCentralDotEnable;

	static ConvergenceType convergenceType;
	static ColorMapMode colorMapMode;

	static void SetSize(int w, int h);
	static void SetWidth(int w);
	static void SetHeight(int h);

	static void SetOffsetX(double ox);
	static void SetOffsetY(double oy);
	static void SetZoom(double z);
	static void SetFinalZoom(double z);
	static void SetZoomFactor(double z);
	static void SetZoomStepTime(double z);
	static void SetMaxIter(int mi);
	static void SetAutoZoom(bool az);

	static void SetConvergenceType(ConvergenceType ct);
	static void SetColorMapMode(ColorMapMode cm);

	static ConvergenceType GetConvergenceType();

};

#endif /*SETTINGS_H_*/
