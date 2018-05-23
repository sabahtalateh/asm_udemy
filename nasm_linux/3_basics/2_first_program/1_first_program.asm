BITS 32

%include	'training.s'

global main
extern	exit

section .text

main:
    ; The program begins here:

    call    read_hex
    inc     eax
    call    print_eax

    ; Exit the process:
    push	0
    call	exit