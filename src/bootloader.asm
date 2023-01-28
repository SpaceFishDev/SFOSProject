[bits 16]
global load_memory
global key_press
[extern kernel_main]
mov [BOOT_DISK], dl
mov sp, [0x7c00]
mov bp, sp

call kernel_main



PROGRAM_SPACE equ 0x7e00

key_press:
	mov ah, 0x00
	int 0x16
	mov [eax], al
ret

load_memory:
	mov ah, 0x08
	mov bx, PROGRAM_SPACE
	mov al, 4
	mov dl, [BOOT_DISK]

	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02

	int 0x13
	jc $
ret

BOOT_DISK:
	db 0

