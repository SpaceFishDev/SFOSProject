	.file	"kernel.c"
	.code16gcc
/APP
	.section boot_end,"a"
/NO_APP
	.text
	.align 16
	.globl	putc
	.type	putc, @function
putc:
.LFB0:
	.cfi_startproc
	movl	4(%esp), %edx
/APP
/  4 "src/include/kernel/print.h" 1
	mov $0x0e, %ah

/  0 "" 2
/  5 "src/include/kernel/print.h" 1
	mov %dl, %al

/  0 "" 2
/  6 "src/include/kernel/print.h" 1
	int $0x10

/  0 "" 2
/NO_APP
	ret
	.cfi_endproc
.LFE0:
	.size	putc, .-putc
	.align 16
	.globl	puts
	.type	puts, @function
puts:
.LFB1:
	.cfi_startproc
	movl	4(%esp), %ecx
	movzbl	(%ecx), %edx
	testb	%dl, %dl
	je	.L3
	.align 16
.L5:
/APP
/  4 "src/include/kernel/print.h" 1
	mov $0x0e, %ah

/  0 "" 2
/  5 "src/include/kernel/print.h" 1
	mov %dl, %al

/  0 "" 2
/  6 "src/include/kernel/print.h" 1
	int $0x10

/  0 "" 2
/NO_APP
	addl	$1, %ecx
	movzbl	(%ecx), %edx
	testb	%dl, %dl
	jne	.L5
.L3:
	rep ret
	.cfi_endproc
.LFE1:
	.size	puts, .-puts
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"hello, world!"
	.text
	.align 16
	.globl	kernel_main
	.type	kernel_main, @function
kernel_main:
.LFB2:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	call	load_memory
	movl	$.LC0, %ecx
	movl	$104, %edx
	.align 16
.L11:
/APP
/  4 "src/include/kernel/print.h" 1
	mov $0x0e, %ah

/  0 "" 2
/  5 "src/include/kernel/print.h" 1
	mov %dl, %al

/  0 "" 2
/  6 "src/include/kernel/print.h" 1
	int $0x10

/  0 "" 2
/NO_APP
	addl	$1, %ecx
	movzbl	(%ecx), %edx
	testb	%dl, %dl
	jne	.L11
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE2:
	.size	kernel_main, .-kernel_main
	.ident	"GCC: (GNU) 7.1.0"
