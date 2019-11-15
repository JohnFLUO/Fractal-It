/*


*/

#include "CColor.hpp"

/*************
    COLOR
*************/


sf::Color ColorUtils::HSVToRGB(int h, int s, int v) { //0 to 255 for the 3
  int r, g, b;
  unsigned char reg, rem, p, q, t;
  if (s == 0) {
      r = v;
      g = v;
      b = v;
  } else {
    reg = h / 43;
    rem = (h - (reg * 43)) * 6;

    p = (v * (255 - s)) >> 8;
    q = (v * (255 - ((s * rem) >> 8))) >> 8;
    t = (v * (255 - ((s * (255 - rem)) >> 8))) >> 8;

    switch (reg) {
    case 0: // 0° <= H < 60°
      r = v; g = t; b = p;
      break;
    case 1: // 60° <= H < 120°
      r = q; g = v; b = p;
      break;
    case 2: // 120° <= H < 180°
      r = p; g = v; b = t;
      break;
    case 3: // 180° <= H < 240°
      r = p; g = q; b = v;
      break;
    case 4: // 240° <= H < 300°
      r = t; g = p; b = v;
      break;
    default: // 300° <= H < 360°
      r = v; g = p; b = q;
      break;
    }
  }
  return sf::Color(r, g, b);
}
