#include "mbed.h"

unsigned long to_gray(unsigned long binary) {
  return (binary << 1) ^ binary;
}

unsigned long to_bin(unsigned long num) {
  unsigned long mask = num;
  while ((mask = mask << 1)) {
    num ^= mask;
  }
  return num;
}

int test(unsigned long limit) {
  for (unsigned long i = 0; i < limit; ++i) {
    if (to_bin(to_gray(i)) != i) return -i;
    printf("%ld(0x%lx):  bin(%ld) = %ld\n", i, i,
	   to_gray(i), to_bin(to_gray(i)));
  }
  return 0;
}

int main() {
  const int limit = 100;
  return test(limit);
}
