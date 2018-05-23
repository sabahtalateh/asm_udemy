; Write a program the receives three numbers and sums those three numbers. Then output the result.
BITS 32

%include	'training.s' 

global main
extern	exit 	

; ===============================================
section .text

main:
    call    read_hex
    mov     ebx,eax
    call    read_hex
    add     ebx,eax
    call    read_hex
    add     eax,ebx

    call    print_eax

    ; Exit the process:
	push	0
	call	exit