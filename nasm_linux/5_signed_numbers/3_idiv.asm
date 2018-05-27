BITS 32

%include	'training.s' 

global main
extern exit 	

; ===============================================
section .text

main:
    ; idiv
    ; 0xf8 / 0x4 = 1111 1000 / 0000 0100 (-/+)
    ; 1111 1000 -> 0000 0111 + 1 = 0000 1000 = 8(10)
    ; 0000 1000 / 0000 0100 = 0000 0010 = 0x2, 8(10)/4(10)=2(10) convert to negative
    ; 1111 1101 + 1 = 1111 1110 = 0xfe

    mov     bl,    4h
    mov     al,    0f8h

    cbw

    idiv    bl

    call    print_eax
    ; ......fe

	push	0
	call	exit