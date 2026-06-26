#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

char *p(void) {
  void *unaff_retaddr;
  char buffer[76];
  
  fflush(stdout);
  gets(buffer);
  unaff_retaddr = __builtin_return_address(0);
  if (((long unsigned int)unaff_retaddr & 0xb0000000) == 0xb0000000) {
    printf("(%p)\n", unaff_retaddr);
    _exit(1);
  }
  puts(buffer);
  return (strdup(buffer));
}

int main(void) {
  p();
  return (0);
}
