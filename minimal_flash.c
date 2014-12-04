#include "mbed.h"

//DigitalOut Led1(LED1);
Serial pc(USBTX, USBRX);

void do_wait(){
  for (unsigned long i = 0; i < (1UL<<20); ++i);
}

int main() {
  unsigned int* mode_register = (unsigned int*)0x4002c04c;
  *mode_register &= ~(0x3 << 4);
  *mode_register |= (0x2 << 4);
  unsigned int* function_register = (unsigned int*)0x4002c00c; // LED1
  *function_register &= ~(0x3 << 4);
  pc.printf("START!!!!\r\n");
  const unsigned int mask = 0x40000; // LED1
  unsigned int* reg_set = (unsigned int*)0x2009c038;
  unsigned int* reg_clr = (unsigned int*)0x2009c03c;
  unsigned long int count = 0;
  while(1) {
    pc.printf("Iteration %ld\r\n", count);
    *reg_set = mask;
    do_wait();
    *reg_clr = mask;
    do_wait();
    count++;
  }
  return 0;
}
