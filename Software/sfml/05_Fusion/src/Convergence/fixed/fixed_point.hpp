#ifndef _FIXED_POINT_HPP_
#define _FIXED_POINT_HPP_

#include <cmath>
#include <array>
#include <bitset>
#include <vector>
#include <cstdint>
#include "immintrin.h"

using namespace std;

 // fractional bit count :
#define FI_32_0 0
#define FI_32_1 1
#define FI_32_2 2
#define FI_32_3 3
#define FI_32_4 4
#define FI_32_5 5
#define FI_32_6 6
#define FI_32_7 7
#define FI_32_8 8
#define FI_32_9 9
#define FI_32_10 10
#define FI_32_11 11
#define FI_32_12 12
#define FI_32_13 13
#define FI_32_14 14
#define FI_32_15 15
#define FI_32_16 16
#define FI_32_17 17
#define FI_32_18 18
#define FI_32_19 19
#define FI_32_20 20
#define FI_32_21 21
#define FI_32_22 22
#define FI_32_23 23
#define FI_32_24 24
#define FI_32_25 25
#define FI_32_26 26
#define FI_32_27 27
#define FI_32_28 28
#define FI_32_29 29
#define FI_32_30 30
#define FI_32_31 31
#define FI_32_32 32

#define MAX_FI_32 (0x7fffffff)

typedef int32_t fi32_t; // classe ? template ?
typedef int64_t fi64_t;

inline fi32_t double_to_fi32(double double_in, unsigned int fractionalBitCount) {
  return (fi32_t)(std::round(double_in * (1 << fractionalBitCount)));
}

inline double fi32_to_double(fi32_t fi32_in, unsigned int fractionalBitCount) {
  return (double)(fi32_in / (double)(1 << fractionalBitCount));
}

inline double fi32_mul(fi32_t fi32_in_a, fi32_t fi32_in_b, unsigned int fractionalBitCount) {
  fi64_t f64_a = (fi64_t)fi32_in_a*(fi64_t)fi32_in_b;
  return (fi32_t)(f64_a >> fractionalBitCount);
}


// debug log :

/*
void print_fi32_bin(fi32_t fixed_val)  {
  std::bitset<32> y(fixed_val);
  std::cout << "0b" << y << '\n';
}

void print_fi32_bin(fi32_t fixed_val, string name)  {
  std::bitset<32> y(fixed_val);
  std::cout << name << " = 0b" << y << '\n';
}

void print_fi32_hex(fi32_t fixed_val)  {
  printf("0x%0.8x \n", fixed_val);
}

void print_fi32_hex(fi32_t fixed_val, string name)  {
  printf("%s = 0x%0.8x \n", name.c_str(), fixed_val);
}
*/

#endif
