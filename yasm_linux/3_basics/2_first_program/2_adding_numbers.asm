BITS 32

%include	'training.s'

global main
extern	exit

section .text

main:
    call    read_hex
    mov     edx, eax
    call    read_hex
    add     eax, edx
    call    print_eax

    ; Exit the process:
	push	0
	call	exit