// stdint -- объявляем uint16_t и другие типы 
#include "stdint.h"
// stdio -- объявляем функция для вывода строки на экран (через NASM)
#include "stdio.h"

void _cdecl cstart_(uint16_t bootDrive)
{
    puts("Hello world from C!\r\n");
    for (;;);
}
