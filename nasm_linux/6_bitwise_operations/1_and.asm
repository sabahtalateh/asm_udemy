BITS 32

%include	'training.s' 

global main
extern exit 	

; ===============================================
section .text

main:
    mov     eax,    0h
    mov     al,     11100001b
    mov     ah,     00100001b
    and     al,     ah
    mov     ah,     0h

    call    print_eax

	push	0
	call	exit