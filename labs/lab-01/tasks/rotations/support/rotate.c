// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "rotate.h"

void rotate_left(unsigned int *number, int bits)
{
	bits &= 31;
	if (bits)
		*number = (*number << bits) | (*number >> (32 - bits));
}

void rotate_right(unsigned int *number, int bits)
{
	bits &= 31;
	if (bits)
		*number = (*number >> bits) | (*number << (32 - bits));
}
