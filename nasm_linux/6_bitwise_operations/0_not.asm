BITS 32

%include	'training.s' 

global main
extern exit 	

; ===============================================
section .text

main:
    mov     eax,    0000ffffh
    not     eax

    call    print_eax

	push	0
	call	exit