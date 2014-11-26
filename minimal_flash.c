void do_wait(){
  int i;
  for (i = 0; i < (1<<8); ++i) {
    ++i;
    --i;
  }
}

int main() {
  const unsigned int mask = 0x100000;
  unsigned int* reg_set = (unsigned int*)0x2009c038;
  unsigned int* reg_clr = (unsigned int*)0x2009c03c;
  while(1) {
    *reg_set = mask;
    do_wait();
    *reg_clr = mask;
  }
  return 0;
}
