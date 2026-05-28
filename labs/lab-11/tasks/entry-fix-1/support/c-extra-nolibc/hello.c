// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

static void hi(void)
{
	puts("Hi!\n");
}

static void bye(void)
{
	puts("Bye!\n");
}

int main(void)
{
	hi();
	bye();

	return 0;
}
