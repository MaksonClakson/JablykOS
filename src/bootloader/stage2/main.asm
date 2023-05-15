; we are writing 16-bit code
bits 16

; place stuff above in the ENTRY SECTION (from linker)
section _ENTRY class=CODE

extern _cstart_
global entry

entry:
    ; clear interrupt flag
    cli
    ; setup stack
    mov ax, ds
    mov ss, ax
    mov sp, 0
    mov bp, sp
    ; set interrupt flag
    sti

    ; expect boot drive in dl, send it as argument to cstart function
    xor dh, dh
    push dx
    call _cstart_

    cli
    hlt
