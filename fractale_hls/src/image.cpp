#include "image.h"


/// x y counter => RGB 4+4+4 bits


void dimage::do_image()
{
  //const int color[3][MAX_IT];

/*
  for (int i=0; i <= MAX_IT; i++) {
	    float t = (float)i/(float)MAX_IT;
	    color[0][i]   = (int)round( 9.f * (1.0f-t) * t * t * t               * 255.0f);
	    color[1][i]   = (int)round(15.f * (1.0f-t) * (1.0f-t) * t * t        * 255.0f);
	    color[2][i]   = (int)round(8.5f * (1.0f-t) * (1.0f-t) * (1.0f-t) * t * 255.0f);
  }
*//*
const int colorR[MAX_IT +1] = { 0, 0, 0, 0, 1, 2, 3, 5, 7, 10, 14, 19, 24, 29,
	36, 43, 51, 59, 68, 78, 88,  98, 109, 120, 131, 143, 154,
	166, 177, 188, 198, 207, 216, 224, 230, 236, 239, 241, 241
	, 239, 235, 227, 217, 204, 187, 167, 142, 114, 81, 43, 0};
const int colorG[MAX_IT +1]  = { 0, 1, 5, 12, 20, 30, 42, 55, 69, 83, 97, 112, 127,
	141, 155, 168, 181, 192, 203, 212, 220, 226, 232, 236, 238,
	239, 238, 236, 232, 226, 220, 212, 203, 192, 181, 168, 155,
	141, 127, 112, 97, 83, 69, 55, 42, 30, 20, 12, 5, 1, 0};
const int colorB[MAX_IT +1]  = { 0, 40, 76, 108, 135, 158, 177, 193, 205, 215, 221,
	226, 228, 228, 226, 223, 218, 211, 204, 196, 187, 177, 167,
	156, 146, 135, 124, 113, 103, 93, 83, 73, 64, 56, 48, 40,
	34, 28, 22, 18, 13, 10, 7, 5, 3, 1, 1, 0, 0, 0, 0};
*/
const sc_uint<12> color[MAX_IT] = { 0, 2, 4, 6, 24, 25, 43,
		60, 76, 93, 109, 382, 382, 398, 670, 685, 957, 973,
		1228, 1244, 1499, 1771, 1770, 2025, 2281, 25532, 2535,
		2791, 3046, 3045, 3285, 3540, 3524, 3779, 3763, 3746,
		3986, 3969, 3953, 3680, 3664, 3392, 3120, 2848, 2576,
		2064, 1792, 1280, 512};




    /*couleur.write(colorR[compteur]);
    couleur.write(colorG[compteur]);
    couleur.write(colorB[compteur]);*/
    couleur.write(color[counter.read()]);

}
