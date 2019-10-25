/********************
      CImage ++
********************/

#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <queue>

#include "CImage.h"
#include "MyMath.h"
#include "Settings.h"
#include "CColor.h"
#include "ProgressBar.h"

using namespace std;

#ifndef CIMAGE_PP_H_
#define CIMAGE_PP_H_

class CImage_pp : public CImage {
public:
  CImage_pp(int hauteur, int largeur);
  CImage_pp(int hauteur, int largeur, bool displayProgressBar);

  CPixel* GetPixel(int posX, int posY);

  void SetPixel(int x, int y, Color c);
  void SetPixel(int x, int y, Color *c);
  void SetPixel(int x, int y, int r, int g, int b);
  void SetPixel(int x, int y, int r, int g, int b, int a);
};

void checkSize(Vector2* size);

#endif /*CIMAGE_PP_H_*/
