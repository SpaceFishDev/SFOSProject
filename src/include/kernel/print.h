#ifndef KERNEL_PRINT
#define KERNEL_PRINT

void putc(char c)
{
	int res;
	__asm__ ("mov $0x0e, %ah\n");
	__asm__ ("mov %0, %%al\n" :: "r" (c) : "al");
	__asm__("int $0x10\n");
}

void puts(char* c)
{
	while(*c){
		putc(*c);
		++c;
	}

}
#endif