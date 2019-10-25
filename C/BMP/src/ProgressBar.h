/********************
     ProgressBar
********************/

#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <queue>

#include "MyMath.h"
#include "CColor.h"

using namespace std;

#ifndef PROGRESS_BAR_H_
#define PROGRESS_BAR_H_

class ProgressBar {

public:
	ProgressBar();

	void Refresh(int progressPercent);
	void Refresh(float progressPercent);
};

void removeCurrentConsoleLine();
void removeConsoleLines(int numberOfLinesToRemove);

#endif /*PROGRESS_BAR_H_*/
