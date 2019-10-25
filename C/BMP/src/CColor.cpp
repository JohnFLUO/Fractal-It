/*


*/

#include "CColor.h"

/*************
    COLOR
*************/

Color::Color() {
  r = 255;
  g = 255;
  b = 255;
  a = 255;
}

Color::Color(int grey) {
  r = grey;
  g = grey;
  b = grey;
  a = 255;
}

Color::Color(int grey, int alpha) {
  r = grey;
  g = grey;
  b = grey;
  a = alpha;
}

Color::Color(int red, int green, int blue) {
  r = red;
  g = green;
  b = blue;
  a = 255;
}

Color::Color(int red, int green, int blue, int alpha) {
  r = red;
  g = green;
  b = blue;
  a = alpha;
}

Color::Color(string name) {
  Color::ParseColor(name, 255);
}

Color::Color(string name, int alpha) {
  Color::ParseColor(name, alpha);
}

Color::~Color() {

}

Color* Color::ParseColor(string name) {
  return Color::ParseColor(name, 255);
}

Color* Color::ParseColor(string name, int alpha) {
  Color* c = new Color();
  stringToUppercase(&name);
  if (name == "ALICEBLUE") {
    *c = *Color::HexToRGB("F0F8FF");
  } else if (name == "AZURE") {
    *c = *Color::HexToRGB("F0FFFF");
  } else if (name == "BLANCHEDALMOND") {
    *c = *Color::HexToRGB("FFEBCD");
  } else if (name == "BURLYWOOD") {
    *c = *Color::HexToRGB("DEB887");
  } else if (name == "CORAL") {
    *c = *Color::HexToRGB("FF7F50");
  } else if (name == "CYAN") {
    *c = *Color::HexToRGB("00FFFF");
  } else if (name == "DARKGRAY") {
    *c = *Color::HexToRGB("A9A9A9");
  } else if (name == "DARKMAGENTA") {
    *c = *Color::HexToRGB("8B008B");
  } else if (name == "DARKRED") {
    *c = *Color::HexToRGB("8B0000");
  } else if (name == "DARKSLATEGRAY") {
    *c = *Color::HexToRGB("2F4F4F");
  } else if (name == "DEEPPINK") {
    *c = *Color::HexToRGB("FF1493");
  } else if (name == "DODGERBLUE") {
    *c = *Color::HexToRGB("1E90FF");
  } else if (name == "FUCHSIA") {
    *c = *Color::HexToRGB("FF00FF");
  } else if (name == "GOLDENROD") {
    *c = *Color::HexToRGB("FF00FF");
  } else if (name == "GREY") {
    *c = *Color::HexToRGB("FF00FF");
  } else if (name == "INDIGO") {
    *c = *Color::HexToRGB("4B0082");
  } else if (name == "LAVENDERBLUSH") {
    *c = *Color::HexToRGB("FFF0F5");
  } else if (name == "LIGHTCORAL") {
    *c = *Color::HexToRGB("FFF0F5");
  } else if (name == "LIGHTGREEN") {
    *c = *Color::HexToRGB("90EE90");
  } else if (name == "LIGHTSEAGREEN") {
    *c = *Color::HexToRGB("90EE90");
  } else if (name == "LIGHTSTEELBLUE") {
    *c = *Color::HexToRGB("B0C4DE");
  } else if (name == "LINEN") {
    *c = *Color::HexToRGB("B0C4DE");
  } else if (name == "MEDIUMBLUE") {
    *c = *Color::HexToRGB("0000CD");
  } else if (name == "MEDIUMSLATEBLUE") {
    *c = *Color::HexToRGB("7B68EE");
  } else if (name == "MIDNIGHTBLUE") {
    *c = *Color::HexToRGB("7B68EE");
  } else if (name == "NAVAJOWHITE") {
    *c = *Color::HexToRGB("FFDEAD");
  } else if (name == "OLIVEDRAB") {
    *c = *Color::HexToRGB("FFDEAD");
  } else if (name == "PALEGOLDENROD") {
    *c = *Color::HexToRGB("EEE8AA");
  } else if (name == "PAPAYAWHIP") {
    *c = *Color::HexToRGB("FFEFD5");
  } else if (name == "PLUM") {
    *c = *Color::HexToRGB("DDA0DD");
  } else if (name == "ROSYBROWN") {
    *c = *Color::HexToRGB("BC8F8F");
  } else if (name == "SANDYBROWN") {
    *c = *Color::HexToRGB("F4A460");
  } else if (name == "SILVER") {
    *c = *Color::HexToRGB("C0C0C0");
  } else if (name == "SLATEGREY") {
    *c = *Color::HexToRGB("708090");
  } else if (name == "TAN") {
    *c = *Color::HexToRGB("708090");
  } else if (name == "TURQUOISE") {
    *c = *Color::HexToRGB("40E0D0");
  } else if (name == "WHITESMOKE") {
    *c = *Color::HexToRGB("F5F5F5");
  } else if (name == "ANTIQUEWHITE") {
    *c = *Color::HexToRGB("FAEBD7");
  } else if (name == "BEIGE") {
    *c = *Color::HexToRGB("F5F5DC");
  } else if (name == "BLUE") {
    *c = *Color::HexToRGB("0000FF");
  } else if (name == "CADETBLUE") {
    *c = *Color::HexToRGB("5F9EA0");
  } else if (name == "CORNFLOWERBLUE") {
    *c = *Color::HexToRGB("6495ED");
  } else if (name == "DARKBLUE") {
    *c = *Color::HexToRGB("00008B");
  } else if (name == "DARKGREEN") {
    *c = *Color::HexToRGB("006400");
  } else if (name == "DARKOLIVEGREEN") {
    *c = *Color::HexToRGB("556B2F");
  } else if (name == "DARKSALMON") {
    *c = *Color::HexToRGB("E9967A");
  } else if (name == "DARKSLATEGREY") {
    *c = *Color::HexToRGB("2F4F4F");
  } else if (name == "DEEPSKYBLUE") {
    *c = *Color::HexToRGB("00BFFF");
  } else if (name == "FIREBRICK") {
    *c = *Color::HexToRGB("B22222");
  } else if (name == "GAINSBORO") {
    *c = *Color::HexToRGB("DCDCDC");
  } else if (name == "GRAY") {
    *c = *Color::HexToRGB("808080");
  } else if (name == "HONEYDEW    ") {
    *c = *Color::HexToRGB("F0FFF0");
  } else if (name == "IVORY") {
    *c = *Color::HexToRGB("FFFFF0");
  } else if (name == "LAWNGREEN") {
    *c = *Color::HexToRGB("7CFC00");
  } else if (name == "LIGHTCYAN") {
    *c = *Color::HexToRGB("E0FFFF");
  } else if (name == "LIGHTGREY") {
    *c = *Color::HexToRGB("D3D3D3");
  } else if (name == "LIGHTSKYBLUE") {
    *c = *Color::HexToRGB("87CEFA");
  } else if (name == "LIGHTYELLOW") {
    *c = *Color::HexToRGB("FFFFE0");
  } else if (name == "MAGENTA" || name == "FUCHSIA") {
    *c = *Color::HexToRGB("FF00FF");
  } else if (name == "MEDIUMORCHID") {
    *c = *Color::HexToRGB("BA55D3");
  } else if (name == "MEDIUMSPRINGGREEN") {
    *c = *Color::HexToRGB("00FA9A");
  } else if (name == "MINTCREAM") {
    *c = *Color::HexToRGB("F5FFFA");
  } else if (name == "NAVY") {
    *c = *Color::HexToRGB("000080");
  } else if (name == "ORANGE") {
    *c = *Color::HexToRGB("FFA500");
  } else if (name == "PALEGREEN") {
    *c = *Color::HexToRGB("98FB98");
  } else if (name == "PEACHPUFF") {
    *c = *Color::HexToRGB("FFDAB9");
  } else if (name == "POWDERBLUE") {
    *c = *Color::HexToRGB("B0E0E6");
  } else if (name == "ROYALBLUE") {
    *c = *Color::HexToRGB("4169E1");
  } else if (name == "SEAGREEN") {
    *c = *Color::HexToRGB("2E8B57");
  } else if (name == "SKYBLUE") {
    *c = *Color::HexToRGB("87CEEB");
  } else if (name == "SNOW") {
    *c = *Color::HexToRGB("FFFAFA");
  } else if (name == "TEAL") {
    *c = *Color::HexToRGB("008080");
  } else if (name == "VIOLET") {
    *c = *Color::HexToRGB("EE82EE");
  } else if (name == "YELLOW") {
    *c = *Color::HexToRGB("FFFF00");
  } else if (name == "AQUA") {
    *c = *Color::HexToRGB("00FFFF");
  } else if (name == "BISQUE") {
    *c = *Color::HexToRGB("FFE4C4");
  } else if (name == "BLUEVIOLET") {
    *c = *Color::HexToRGB("8A2BE2");
  } else if (name == "CHARTREUSE") {
    *c = *Color::HexToRGB("7FFF00");
  } else if (name == "CORNSILK") {
    *c = *Color::HexToRGB("FFF8DC");
  } else if (name == "DARKCYAN") {
    *c = *Color::HexToRGB("008B8B");
  } else if (name == "DARKGREY") {
    *c = *Color::HexToRGB("A9A9A9");
  } else if (name == "DARKORANGE") {
    *c = *Color::HexToRGB("FF8C00");
  } else if (name == "DARKSEAGREEN") {
    *c = *Color::HexToRGB("8FBC8F");
  } else if (name == "DARKTURQUOISE") {
    *c = *Color::HexToRGB("00CED1");
  } else if (name == "DIMGRAY") {
    *c = *Color::HexToRGB("696969");
  } else if (name == "FLORALWHITE") {
    *c = *Color::HexToRGB("FFFAF0");
  } else if (name == "GHOSTWHITE") {
    *c = *Color::HexToRGB("F8F8FF");
  } else if (name == "GREEN") {
    *c = *Color::HexToRGB("008000");
  } else if (name == "HOTPINK") {
    *c = *Color::HexToRGB("FF69B4");
  } else if (name == "KHAKI") {
    *c = *Color::HexToRGB("F0E68C");
  } else if (name == "LEMONCHIFFON") {
    *c = *Color::HexToRGB("FFFACD");
  } else if (name == "LIGHTGOLDENRODYELLOW") {
    *c = *Color::HexToRGB("FAFAD2");
  } else if (name == "LIGHTPINK") {
    *c = *Color::HexToRGB("FFB6C1");
  } else if (name == "LIGHTSLATEGRAY") {
    *c = *Color::HexToRGB("778899");
  } else if (name == "LIME") {
    *c = *Color::HexToRGB("00FF00");
  } else if (name == "MAROON") {
    *c = *Color::HexToRGB("800000");
  } else if (name == "MEDIUMPURPLE") {
    *c = *Color::HexToRGB("9370DB");
  } else if (name == "MEDIUMTURQUOISE") {
    *c = *Color::HexToRGB("48D1CC");
  } else if (name == "MISTYROSE") {
    *c = *Color::HexToRGB("FFE4E1");
  } else if (name == "OLDLACE") {
    *c = *Color::HexToRGB("FDF5E6");
  } else if (name == "ORANGERED") {
    *c = *Color::HexToRGB("FF4500");
  } else if (name == "PALETURQUOISE") {
    *c = *Color::HexToRGB("AFEEEE");
  } else if (name == "PERU") {
    *c = *Color::HexToRGB("CD853F");
  } else if (name == "PURPLE") {
    *c = *Color::HexToRGB("800080");
  } else if (name == "SADDLEBROWN") {
    *c = *Color::HexToRGB("8B4513");
  } else if (name == "SEASHELL") {
    *c = *Color::HexToRGB("FFF5EE");
  } else if (name == "SLATEBLUE") {
    *c = *Color::HexToRGB("6A5ACD");
  } else if (name == "SPRINGGREEN") {
    *c = *Color::HexToRGB("00FF7F");
  } else if (name == "THISTLE") {
    *c = *Color::HexToRGB("D8BFD8");
  } else if (name == "WHEAT") {
    *c = *Color::HexToRGB("F5DEB3");
  } else if (name == "YELLOWGREEN") {
    *c = *Color::HexToRGB("9ACD32");
  } else if (name == "AQUAMARINE") {
    *c = *Color::HexToRGB("7FFFD4");
  } else if (name == "BLACK") {
    *c = *Color::HexToRGB("000000");
  } else if (name == "BROWN") {
    *c = *Color::HexToRGB("A52A2A");
  } else if (name == "CHOCOLATE") {
    *c = *Color::HexToRGB("D2691E");
  } else if (name == "CRIMSON") {
    *c = *Color::HexToRGB("D2691E");
  } else if (name == "DARKGOLDENROD") {
    *c = *Color::HexToRGB("B8860B");
  } else if (name == "DARKKHAKI") {
    *c = *Color::HexToRGB("BDB76B");
  } else if (name == "DARKORCHID") {
    *c = *Color::HexToRGB("9932CC");
  } else if (name == "DARKSLATEBLUE") {
    *c = *Color::HexToRGB("483D8B");
  } else if (name == "DARKVIOLET") {
    *c = *Color::HexToRGB("9400D3");
  } else if (name == "DIMGREY") {
    *c = *Color::HexToRGB("696969");
  } else if (name == "FORESTGREEN") {
    *c = *Color::HexToRGB("228B22");
  } else if (name == "GOLD") {
    *c = *Color::HexToRGB("FFD700");
  } else if (name == "GREENYELLOW") {
    *c = *Color::HexToRGB("ADFF2F");
  } else if (name == "INDIANRED") {
    *c = *Color::HexToRGB("CD5C5C");
  } else if (name == "LAVENDER") {
    *c = *Color::HexToRGB("E6E6FA");
  } else if (name == "LIGHTBLUE") {
    *c = *Color::HexToRGB("ADD8E6");
  } else if (name == "LIGHTGRAY") {
    *c = *Color::HexToRGB("D3D3D3");
  } else if (name == "LIGHTSALMON") {
    *c = *Color::HexToRGB("FFA07A");
  } else if (name == "LIGHTSLATEGREY") {
    *c = *Color::HexToRGB("778899");
  } else if (name == "LIMEGREEN") {
    *c = *Color::HexToRGB("32CD32");
  } else if (name == "MEDIUMAQUAMARINE") {
    *c = *Color::HexToRGB("66CDAA");
  } else if (name == "MEDIUMSEAGREEN") {
    *c = *Color::HexToRGB("3CB371");
  } else if (name == "MEDIUMVIOLETRED") {
    *c = *Color::HexToRGB("C71585");
  } else if (name == "MOCCASIN") {
    *c = *Color::HexToRGB("FFE4B5");
  } else if (name == "OLIVE") {
    *c = *Color::HexToRGB("808000");
  } else if (name == "ORCHID") {
    *c = *Color::HexToRGB("DA70D6");
  } else if (name == "PALEVIOLETRED") {
    *c = *Color::HexToRGB("DB7093");
  } else if (name == "PINK") {
    *c = *Color::HexToRGB("FFC0CB");
  } else if (name == "RED") {
    *c = *Color::HexToRGB("FF0000");
  } else if (name == "SALMON") {
    *c = *Color::HexToRGB("FA8072");
  } else if (name == "SIENNA") {
    *c = *Color::HexToRGB("A0522D");
  } else if (name == "SLATEGRAY") {
    *c = *Color::HexToRGB("708090");
  } else if (name == "STEELBLUE") {
    *c = *Color::HexToRGB("4682B4");
  } else if (name == "TOMATO") {
    *c = *Color::HexToRGB("FF6347");
  } else if (name == "WHITE") {
    *c = *Color::HexToRGB("FFFFFF");
  } else {
    return NULL;
  }
  c->a = alpha;
  return c;
}

void Color::HSV(int h, int s, int v) {
  Color* rgb = HSVToRGB(h, s, v);
  r = rgb->r;
  g = rgb->g;
  b = rgb->b;
}

Color* Color::HSVToRGB(int h, int s, int v) { //0 to 255 for the 3
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
  return new Color(r, g, b);
}

int Color::HexToDec (string hex) {
	int hexLength = hex.length();
	double dec = 0;

	for (int i = 0; i < hexLength; ++i) {
		char b = hex[i];

		if (b >= 48 && b <= 57) {
			b -= 48;
		} else if (b >= 65 && b <= 70) {
			b -= 55;
    }

		dec += b * pow(16, ((hexLength - i) - 1));
	}

	return (int) dec;
}

Color* Color::HexToRGB(string hex) {
	if (hex[0] == '#') {
    hex = hex.erase(0, 1); // Remove # before value
  }
  if (hex.length() >= 6) {
  	int r = (int) (HexToDec(hex.substr(0, 2)));
  	int g = (int) (HexToDec(hex.substr(2, 2)));
    int b = (int) (HexToDec(hex.substr(4, 6)));
    if (hex.length() == 8) {
      int a = (int) (HexToDec(hex.substr(4, 6)));
      return new Color(r, g, b, a);
    }
    return new Color(r, g, b);
  }
  return new Color();
}

Color* Color::HexToRGB(unsigned long hex) {
  int r = ((hex >> 16) & 0xFF) / 255.0;
  int g = ((hex >> 8)  & 0xFF) / 255.0;
  int b = ((hex)       & 0xFF) / 255.0;
  return new Color(r, g, b);
}

ostream& operator<<(ostream& os, const Color& c) {
  os << c.r << "," << c.g << "," << c.b;
  return os;
}
