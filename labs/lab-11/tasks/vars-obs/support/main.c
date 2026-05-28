// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include "ops.h"

// Function used to validate the result.
extern void check_result(void);

int main(void)
{
	// hidden_value is static in hidden.c, reach it via the exported set().
	set(10);
	// age is an exported global, assign it directly.
	age = 33;

	check_result();

	return 0;
}
