// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "binary_search.h"

int binary_search(int *v, int len, int dest)
{
	int start = 0;
	int end = len - 1;
	int middle;

loop:
	if (start > end)
		goto not_found;

	middle = (start + end) / 2;

	if (v[middle] == dest)
		goto found;

	if (v[middle] < dest)
		goto go_right;

	end = middle - 1;
	goto loop;

go_right:
	start = middle + 1;
	goto loop;

found:
	return middle;

not_found:
	return -1;
}
