#include<kernel/print.h>
extern void load_memory();
extern char key_press();
int kernel_main(){
	load_memory();
	while(1){
		char key = key_press();
		putc(key);
	}
}

