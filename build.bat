nasm src/bootloader.asm -f elf32 -o boot.o
nasm src/extend.asm -f elf32 -o extended.o
i686-elf-gcc -c -nostdlib  -m16 -ffreestanding -O2 src/kernel.c -Isrc/include/ -o kernel.elf
i686-elf-ld -T linker.ld -o kernel.bin -O2 -nostdlib boot.o kernel.elf extended.o

objcopy -O binary kernel.bin kernel.o

qemu kernel.o