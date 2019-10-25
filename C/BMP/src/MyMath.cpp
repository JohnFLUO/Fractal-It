/*


*/

#include "MyMath.h"

/********************
       MyMath
********************/

// double cosd(double a) {
//   return cos(a*PI/180.0);
// }
//
// double sind(double a) {
//   return sin(a*PI/180.0);
// }

float cosd(float a) {
  return cos(a*PI/180.0);
}

float sind(float a) {
  return sin(a*PI/180.0);
}

int sign(int x) {
  return x/abs(x);
}

int zigzag(int x) {
  return (int)(ceil(x/2.0) *pow(-1, x));
}

int randomBetween(int min, int max) {
  return rand() % (max - min) + min;
}

int map(int val, int inMin, int inMax, int outMin, int outMax) {
  return (val - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
}

long mapl(long val, long inMin, long inMax, long outMin, long outMax) {
  return (val - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
}

float mapf(long double val, float inMin, float inMax, float outMin, float outMax) {
  return (val - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
}

double mapd(long double val, double inMin, double inMax, double outMin, double outMax) {
  return (val - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
}

void exitIf(int cond, const char *prefix) {
  if (!cond) return;
  perror(prefix);
  exit(EXIT_FAILURE);
}


/********************
       Vector
********************/

Vector2::Vector2() {
  x = 0;
  y = 0;
}

Vector2::Vector2(long vx, long vy) {
  x = vx;
  y = vy;
}

Vector2::~Vector2() {

}

ostream& operator<<(ostream& os, const Vector2& v) {
  //os << "x=" << v.x << ", y=" << v.y;
  os << v.x << "," << v.y;
  return os;
}

Vector2& operator*=(Vector2& in, const float f) {
  in.x*=f;
  in.y*=f;
  return in;
}

Vector2& operator*(Vector2& in, const float f) {
  in.x*=f;
  in.y*=f;
  return in;
}

// int Magnitude() {
//   return sqrt(this->x*this->x + this->y*this->y);
// }
//
// static int Magnitude(Vector2 v1) {
//   return sqrt(v1.x*v1.x + v1.y+v1.y);
// }
//
// int Angle() {
//   return atan(y/x)
// }
//
// int Angle(Vector2 v) {
//   return tan(y/x)+atan(v.y/v.x);
// }
//
int angleWithHoritontal(Vector2* p1, Vector2* p2) {
  return atan((p2->y-p1->y)/(p2->x-p1->x));
}
//
// static int Angle(Vector2 v) {
//   return atan(v.y/v.x);
// }

bool isNumber(string str) {
    char* p;
    strtol(str.c_str(), &p, 10);
    return *p == 0;
}
