// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "iterate.h"
#include "array.h"

void print_chars(void)
{
	unsigned char *p = (unsigned char *)v;
	unsigned int i;

	for (i = 0; i < sizeof(v) / sizeof(*p); ++i, ++p)
		printf("%p -> 0x%x\n", p, *p);
	printf("-------------------------------\n");
}

void print_shorts(void)
{
	unsigned short *p = (unsigned short *)v;
	unsigned int i;

	for (i = 0; i < sizeof(v) / sizeof(*p); ++i, ++p)
		printf("%p -> 0x%x\n", p, *p);
	printf("-------------------------------\n");
}

void print_ints(void)
{
	unsigned int *p = (unsigned int *)v;
	unsigned int i;

	for (i = 0; i < sizeof(v) / sizeof(*p); ++i, ++p)
		printf("%p -> 0x%x\n", p, *p);
	printf("-------------------------------\n");
}

void print_long_longs(void)
{
	unsigned long long *p = (unsigned long long *)v;
	unsigned int i;

	for (i = 0; i < sizeof(v) / sizeof(*p); ++i, ++p)
		printf("%p -> %p\n", (void *)p, (void *)*p);
	printf("-------------------------------\n");
}
