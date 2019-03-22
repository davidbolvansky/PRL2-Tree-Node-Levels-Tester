#include <stdio.h>
#include <string.h>
#include <math.h>

typedef unsigned char byte_t;

int main(int argc, char **argv) {
  byte_t *nodes = (byte_t *)argv[1];
  size_t nodes_count = strlen(argv[1]);
  for (size_t i = 0; i < nodes_count; ++i) {
      int level = floor(log2(i + 1));
      printf((i < nodes_count - 1) ? "%c:%d," : "%c:%d\n", nodes[i], level);
  }
  return 0;
}