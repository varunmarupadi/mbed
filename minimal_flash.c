#include "mbed.h"

DigitalOut Led1(LED1);

void do_wait(){
  for (unsigned long i = 0; i < (1UL<<20); ++i);
}

int main() {
  const unsigned int mask = 0x40000; // LED1
  unsigned int* reg_set = (unsigned int*)0x2009c038;
  unsigned int* reg_clr = (unsigned int*)0x2009c03c;
  while(1) {
    *reg_set = mask;
    do_wait();
    *reg_clr = mask;
    do_wait();
  }
  return 0;
}
