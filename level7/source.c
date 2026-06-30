#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

char	c[68];

void	m(void) {
	printf("%s - %d\n", c, (int)time(0));
}

int		main(int argc, char **argv) {
	int		*var1;
	int		*var2;

	var1 = malloc(8);
	var1[0] = 1;
	var1[1] = malloc(8);

	var2 = malloc(8);
	var2[0] = 2;
	var2[1] = malloc(8);

	strcpy((char *)var1[1], argv[1]);
	strcpy((char *)var2[1], argv[2]);

	fgets(c, 68, fopen("/home/user/level8/.pass", "r"));

	puts("~~");

	return (0);
}
