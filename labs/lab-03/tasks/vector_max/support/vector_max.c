// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "vector_max.h"

int vector_max(int *v, int len)
{
	int max;
	unsigned int i;

	max = v[0];
	i = 1;

loop:
	if ((int)i >= len)
		goto done;

	if (v[i] > max)
		goto update;
	goto next;

update:
	max = v[i];

next:
	++i;
	goto loop;

done:
	return max;
}
