/********************
      Settings
********************/

#ifndef SETTINGS_H_
#define SETTINGS_H_

#include <stdio.h>
#include <stdlib.h>
#include <string>

enum ConvergenceType{
	SP, SP_OMP, SP_OMP_AVX, SP_OMP_AVXPLUS, SP_OMP_AVXPLUSPLUS,
	DP, DP_OMP, DP_OMP_AVX, DP_OMP_AVXPLUS, DP_OMP_AVXPLUSPLUS,
	FP, FP_OMP, FP_OMP_SSE2, FP_OMP_AVX2,
	CUDA_D, CUDA_D2, CUDA_D2_WP, CUDA_S
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
	static unsigned int nbSimulations;
	static unsigned int nbCudaThreads;

	static bool isCentralDotEnable;
	static bool closeAfterSimulation;
	static bool logTofile;
	static unsigned int testID;
	static bool firstSimulation;
	static bool lastSimulation;

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
	static void SetNbSimulations(unsigned int nbSimu);
	static void SetNbCudaThreads(unsigned int nbCudaTh);
	static void SetMaxIter(int mi);
	static void SetAutoZoom(bool az);
	static void SetCentralDot(bool cd);
	static void SetCloseAfterSimulation(bool cas);
	static void SetLogToFile(bool ltf);
	static void SetTestID(unsigned int tid);
	static void SetFirstSimulation(bool fs);
	static void SetLastSimulation(bool ls);

	static void SetConvergenceType(ConvergenceType ct);
	static void SetColorMapMode(ColorMapMode cm);

	static ConvergenceType GetConvergenceType();
	static unsigned int GetConvOffset();

};

#endif /*SETTINGS_H_*/
