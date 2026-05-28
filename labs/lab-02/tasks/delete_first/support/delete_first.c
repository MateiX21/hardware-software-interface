// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "delete_first.h"

char *delete_first(char *s, char *pattern)
{
	char *p, *q, *r;

	if (!*pattern)
		return s;

	for (p = s; *p; ++p) {
		q = p;
		r = pattern;
		while (*r && *q == *r) {
			++q;
			++r;
		}
		if (!*r) {
			while (*q)
				*p++ = *q++;
			*p = '\0';
			break;
		}
	}

	return s;
}
