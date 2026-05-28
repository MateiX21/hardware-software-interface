// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "find_max.h"

void *find_max(void *arr, int n, size_t element_size,
				int (*compare)(const void *, const void *))
{
	void *max_elem = arr;
	int i;

	for (i = 1; i < n; ++i) {
		void *cur = (char *)arr + i * element_size;

		if (compare(cur, max_elem))
			max_elem = cur;
	}

	return max_elem;
}

int compare(const void *a, const void *b)
{
	return *(const int *)a > *(const int *)b;
}
