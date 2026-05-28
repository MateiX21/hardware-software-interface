// SPDX-License-Identifier: BSD-3-Clause

// Interface exposed by shop.o:
//   price is a static variable, only reachable through set_price().
//   qty is an exported (common) variable, set it directly.
//   print_price()/print_quantity() do the actual printing.
extern void set_price(unsigned int value);
extern void print_price(void);
extern void print_quantity(void);
extern unsigned int qty;

int main(void)
{
	set_price(21);
	qty = 42;

	print_price();
	print_quantity();

	return 0;
}
