BITS 32

%include	'training.s' 

global main
extern exit 	

; ===============================================
section .text

main:

endles:
    mov     eax,    -8h
    cdq

    call    print_edx

	push	0
	call	exit