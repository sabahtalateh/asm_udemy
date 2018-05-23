; Write a program that receives two numbers a,b as input, and outputs the
; remainder of dividing a by b.
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
    mov     ecx,eax
    mov     edx,0h
    mov     eax,ebx
    div     ecx
    mov     eax,edx
    call    print_eax

    ; Exit the process:
	push	0
	call	exit