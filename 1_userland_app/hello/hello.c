#include <stdint.h>
#include <stdio.h>
#include <math.h>

int main(void)
{
	int32_t i, j, k;

	for (i = 0; i < 1000; i++)
	{
		j = i * 2;
		k  = i * j;
	}

	printf("Hello, Linux %d.\n", k);
	return 0;
}
