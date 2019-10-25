/*

*/

#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <math.h>
#include <iostream>
#include <string.h>

using namespace std;

#ifndef MYMATH_H_
#define MYMATH_H_

#define PI 3.14159265358979323846

class Vector2 {
public:
	long x;
	long y;

	Vector2();
	Vector2(long vx, long vy);
	~Vector2();

	friend ostream& operator<<(ostream& os, const Vector2& v);
	friend Vector2& operator*=(Vector2& in, const float f);
  friend Vector2& operator*(Vector2& in, const float f);
};

// double cosd(double a);
// double sind(double a);
float cosd(float a);
float sind(float a);

int sign(int x);
int zigzag(int x);
int randomBetween(int min, int max);
void exitIf(int cond, const char *prefix);
int angleWithHoritontal(Vector2* p1, Vector2* p2);
int map(int val, int inMin, int inMax, int outMin, int outMax);
long mapl(long val, long inMin, long inMax, long outMin, long outMax);
float mapf(long double val, float inMin, float inMax, float outMin, float outMax);
double mapd(long double val, double inMin, double inMax, double outMin, double outMax);
bool isNumber(string str);

#endif /*MYMATH_H_*/
