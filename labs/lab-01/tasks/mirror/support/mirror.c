// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "mirror.h"

void mirror(char *s)
{
	char *end, tmp;

	end = s;
	while (*end)
		++end;
	--end;

	while (s < end) {
		tmp = *s;
		*s = *end;
		*end = tmp;
		++s;
		--end;
	}
}
