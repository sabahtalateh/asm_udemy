; Write a program that receives two numbers a,b and calculates their average.
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
    add     eax,ebx
    mov     edx,0h
    mov     ecx,2h
    div     ecx

    call    print_eax

    ; Exit the process:
	push	0
	call	exit