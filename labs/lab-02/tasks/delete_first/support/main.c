// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>

#include "delete_first.h"

int main(void)
{
	/*
	 * s must be a writable array, not a pointer to a string literal:
	 * delete_first modifies the string in place, and literals live in
	 * read-only memory (writing to them crashes).
	 */
	char s[] = "She sells seashells by the seashore";
	char *pattern = "se";

	(void) s;
	(void) pattern;

	/* Uncomment this line after implementing the delete_first function */

	char *res = delete_first(s, pattern);

	res ? puts(res) : puts("Implement function!");

	return 0;
}
