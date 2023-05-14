org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A

start:
	jmp main

; Prints a string  to the screen
; Params:
;   - ds:si points to string
;

puts:
	; save registers we will modify
	push si
	push ax

.loop:
	lodsb			; loads next char into al
	or al, al 		; is next char is null (ZF will be set if result is zero)
	jz .done		; jump if ZF is set

	mov ah, 0x0e
	mov bh, 0
	int 0x10

	jmp .loop

.done:
	pop ax
	pop si
	ret

main:
	mov ax, 0
	mov ds, ax
	mov es, ax

	; setup stack
	mov ss, ax
	mov sp, 0x7C00   ; stack grows downwards from where we are loaded in memory

	mov si, msg_hello
	call puts

	hlt   ; stops CPU from executing


.halt:
	jmp .halt

msg_hello: db 'Hello world22!', ENDL, 0

times 510-($-$$) db 0
dw 0AA55h