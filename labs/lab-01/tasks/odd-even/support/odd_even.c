// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>

#include "odd_even.h"

void print_binary(int number, int nr_bits)
{
	int i;

	printf("0b");
	for (i = nr_bits - 1; i >= 0; --i)
		printf("%d", (number >> i) & 1);
	printf("\n");
}

void check_parity(int *numbers, int n)
{
	int *p;

	for (p = numbers; p < numbers + n; ++p) {
		if (*p & 1)
			printf("0x%08X\n", *p);
		else
			print_binary(*p, 8);
	}
}
