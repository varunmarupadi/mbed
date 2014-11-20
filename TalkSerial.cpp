#include "mbed.h"

DigitalOut BlueLed(LED1);
DigitalOut Led2(LED2);
DigitalOut Led3(LED3);
DigitalOut Led4(LED4);
Serial pc(USBTX, USBRX);

void serial_handler() {
  BlueLed = !BlueLed;
  while (pc.readable()) {
    char c = pc.getc();
    if (pc.writeable()) {
      pc.putc(c);
    }
  }
}

int main() {
  BlueLed = 0;
  pc.attach(&serial_handler);
  while(1) {
    pc.printf("Hello Serial World!\r\n");
    Led2 = 1;
    wait(0.1);
    Led2 = 0;
    Led3 = 1;
    wait(0.1);
    Led3 = 0;
    Led4 = 1;
    wait(0.1);
    Led4 = 0;
    Led3 = 1;
    wait(0.1);
    Led3 = 0;
  }
}
