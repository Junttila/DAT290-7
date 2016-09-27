
/*
 *  Startup.
 *  I SimServer kopplar du upp port PE0-7 mot en dipswitch och port PD0-7 mot en Bargraph. 
*/

void startup(void) __attribute__((naked)) __attribute__((section(".start_section")));
void startup (void)
{
__asm volatile(   
    " mov r0, #0xc000\n"        /* set stack */
    " movt r0, #0x2001\n"
    " mov sp, r0\n"
    " bl main\n"                /* call main */   
    ".l1: b .l1\n"              /* never return */
    ) ;    
}

void appInit(void)
{
    *((unsigned int*) 0x40020c00) = 0x00005555;    
}

void main(void)
{
    unsigned char c;
    appInit();
    while(1) {
        c = *((unsigned char*) 0x40021010);
        *((unsigned char*) 0x40020c14) = c;
    }
}
