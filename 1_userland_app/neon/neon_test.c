#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <arm_neon.h>

void add_intarr_normal(int * dst, int * src1, int *src2, int count)
{
    int i;
	for (i = 0; i < count; i++)
	{
		dst[i] = src1[i] + src2[i];
	}
}


void add_intarr_neon(int * dst, int * src1, int *src2, int count)
{
    int i;
	for (i = 0; i < count; i += 4)
	{
		int32x4_t in1, in2, out;
		in1 = vld1q_s32(src1);
		in2 = vld1q_s32(src2);
		out = vaddq_s32(in1, in2);
		vst1q_s32(dst, out);

		src1 += 4;
		src2 += 4;
		dst += 4;
	}
}

#define ARR_COUNT (1024 * 4)
static int arr_src1[ARR_COUNT];
static int arr_src2[ARR_COUNT];
static int arr_dst[ARR_COUNT];

int main(int argc, char **argv)
{
	int32_t i, loop = 1000000;

	if (argc != 2)
	{
		goto help;
	}

	for (i = 0; i < ARR_COUNT; i++) {
		arr_src1[i] = arr_src2[i] = i;
	}

	if (strcmp(argv[1], "off") == 0) {
		for (i = 0; i < loop; i++) {
			add_intarr_normal(arr_dst, arr_src1, arr_src2, ARR_COUNT);
		}
		return 0;
	}
	else if  (strcmp(argv[1], "on") == 0) {
		for (i = 0; i < loop; i++) {
			add_intarr_neon(arr_dst, arr_src1, arr_src2, ARR_COUNT);
		}
		return 0;
	}

help:
	printf("Usage : \n");
	printf("%s <on|off>\n", argv[0]);
	return 0;
}

