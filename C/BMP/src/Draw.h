/********************
        Draw
********************/

#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <queue>
#include <math.h>

#include "CImage++.h"
#include "MyMath.h"
#include "Settings.h"
#include "CColor.h"
#include "CBitmap.h"
#include "StringUtils.h"
#include "ProgressBar.h"

using namespace std;

#ifndef DRAW_H_
#define DRAW_H_

void drawMandelbrot (CImage_pp *img);

#endif /*DRAW_H_*/
