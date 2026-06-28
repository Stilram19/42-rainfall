#include <string.h>
#include <stdio.h>
#include <stdlib.h>

typedef void(*func)(void);

int n(void) {
  system("/bin/cat /home/user/level7/.pass");
  return (0);
}

int m(void) {
  puts("Nope");
  return (0);
}

int main(int argc, char **argv) {
  char *dest;
  func *puVar1;
  
  dest = malloc(0x40);
  puVar1 = malloc(4);
  *puVar1 = (void *)m;
  strcpy(dest, argv[1]);
  (*(func)*puVar1)();
  return (0);
}
