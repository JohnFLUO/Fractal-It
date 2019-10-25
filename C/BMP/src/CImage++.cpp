/**********************\
       CImage ++
***********************

Author :
--------
Jonathan SAUSSEREAU

Description :
-------------
Extension of CImage.h, implementing :
  - Fail-safe GetPixel method (image bound testing)
  - SetPixel method to set R, G and B for a pixel at (x,y) position
  - Optionnal progress bar for image creation

Changelog :
-----------
  - 2019/04/03 : Initial release implementing SetPixel method
  - 2019/10/21 : Added progress bar and size check
*/

#include "CImage++.h"


/********************
      CImage
********************/

CImage_pp::CImage_pp(int largeur, int hauteur) {
  //cout << "Instanciation des lignes... " << taille << endl;
  taille = hauteur;
  liste = (CLigne**)new CLigne**[taille];
  for (int i=0; i<taille; i++) {
    liste[i] = new CLigne(largeur);
  }
}

CImage_pp::CImage_pp(int largeur, int hauteur, bool displayProgressBar) {
  //cout << "Instanciation des lignes... " << taille << endl;
  ProgressBar pb;
  long progress = 0;
  float progressPercent = 0.0;
  taille = hauteur;
  liste = (CLigne**)new CLigne**[taille];
  for (int i=0; i<taille; i++) {
    liste[i] = new CLigne(largeur);
    if (displayProgressBar){
      progress++;
      progressPercent = mapf(progress, 0.0, (float)(taille), 0.0, 100.0);
      pb.Refresh(progressPercent);
    }
  }
}

void CImage_pp::SetPixel(int x, int y, Color c){
  CImage_pp::SetPixel((int)x, (int)y, c.r, c.g, c.b, c.a);
}

void CImage_pp::SetPixel(int x, int y, Color *c){
  CImage_pp::SetPixel((int)x, (int)y, c->r, c->g, c->b, c->a);
}

void CImage_pp::SetPixel(int x, int y, int r, int g, int b){
  CImage_pp::SetPixel((int)x, (int)y, r, g, b, 255);
}

void CImage_pp::SetPixel(int x, int y, int r, int g, int b, int a){
  if (x >= 0 && y >= 0 && x < WIDTH && y < HEIGHT) {
    CPixel *p = GetPixel(x, y);
    if (a == 0) {

    } else if (a == 255) {
      p->RGB(r, g, b);
    } else {
      int nr, ng, nb;
      nr = ((256-a)*p->Red() + a*r)/256;
      ng = ((256-a)*p->Green() + a*g)/256;
      nb = ((256-a)*p->Blue() + a*b)/256;
      p->RGB(nr, ng, nb);
    }
  }
}

CPixel* CImage_pp::GetPixel(int posX, int posY){
  if (posY >= 0 && posY < size()) {
    CLigne* ligne =  getLigne(posY);
    if (posX >= 0 && posX < ligne->size()) {
      if (ligne == NULL) {
        return NULL;
      }
      return ligne->getPixel(posX);
    }
  }
}

void checkSize(Vector2* size) {
  if (size->x%4 != 0) {
    cout << "Cannot create BMP : image width (" << size->x << ") is not a multiple of 4" << endl;
    exit(-1);
  }
  if (size->y%4 != 0) {
    cout << "Cannot create BMP : image height (" << size->y << ") is not a multiple of 4" << endl;
    exit(-1);
  }
}
