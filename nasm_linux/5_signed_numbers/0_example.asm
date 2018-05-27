BITS 32

%include	'training.s' 

global main
extern exit 	

; ===============================================
section .text

main:
    mov     bl,     82h
    movsx   eax,    bl

    call    print_eax

	push	0
	call	exit