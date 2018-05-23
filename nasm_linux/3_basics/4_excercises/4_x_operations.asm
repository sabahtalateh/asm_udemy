; Write a program that receives a number x as input, and outputs to the
; console the following values: x+1, x^2 , x^3, one after another.
BITS 32

%include	'training.s' 

global main
extern	exit 	

; ===============================================
section .text

main:
    call    read_hex
    mov     ebx,eax
    mov     ecx,eax
    mov     esi,eax

    inc     eax
    call    print_eax

    mov     eax,ebx
    mul     eax
    call    print_eax

    mov     eax,esi
    mul     esi
    mul     esi
    call    print_eax

    ; Exit the process:
	push	0
	call	exit