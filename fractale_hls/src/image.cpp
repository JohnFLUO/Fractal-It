


#include "image.h"


/// x y counter => RGB addr data_write

void do_image()
{
  int color[MAX_IT][3];
  sc_uint<8> compteur;

  for (int i=0; i <= MAX_IT; ++i) {
      float t = (float)i/(float)MAX_IT;
      int r   = (int)round( 9.f * (1.0f-t) * t * t * t               * 255.0f);
      int g   = (int)round(15.f * (1.0f-t) * (1.0f-t) * t * t        * 255.0f);
      int b   = (int)round(8.5f * (1.0f-t) * (1.0f-t) * (1.0f-t) * t * 255.0f);
      color[i][0] = r;
      color[i][1] = g;
      color[i][2] = b;
  }

  while(true){
    compteur = counter.read();

    couleur.write(color[compteur][0]);
    couleur.write(color[compteur][1]);
    couleur.write(color[compteur][2]);

    addr.write(x);
    addr.write(y);
  }
}
