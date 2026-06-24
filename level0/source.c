#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char **argv) {
  int num;
  char *args[2];
  uid_t uid;
  gid_t gid;
 
  num = atoi(*(argv + 1));
  if (num == 0x1a7) {
    args[0] = strdup("/bin/sh");
    args[1] = NULL;
    gid = getegid();
    uid = geteuid();
    setresgid(gid, gid, gid);
    setresuid(uid, uid, uid);
    execv("/bin/sh", args);
  } else {
    fwrite("No !\n", 1, 5, stderr);
  }
  return 0;
}
