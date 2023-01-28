SECTIONS
{    
    . = 0x7C00;    
    .text : AT(0x7C00)
    {
        .- = 0x7E00;
        _text = .;
        *(.text);
        _text_end = .;

    }
    .data :
    {
        _data = .;
        *(.bss);
        *(.bss*);
        *(.data);
        *(.rodata*);
        *(COMMON)
        _data_end = .;
    }    
    .sig : AT(0x7DFE)    
    {        
        SHORT(0xaa55);
    } 
    . = 0x7E00;
    .boot_end : { *(.boot_end) }
    /DISCARD/ :
    {
        *(.note*);
        *(.iplt*);
        *(.igot*);
        *(.rel*);
        *(.comment);
        /* add any unwanted sections spewed out by your version of gcc and flags here */    
    }
    
}