; Basic Assembly
; ==============
; 
; Signed Operations
; -----------------
;
; Magic NEG
; @@@@@@@@@
; 
; 0.    Assemble and run this program.
; 
; 1.    How many inputs does this program expect?
;
; 2.    Try to give different inputs to this program, and check the results.
;
; 3.    Read the program's code below, and try to understand what does it do. Try
;       to describe it as simply as you can.
;       
; 4.    Pick some random inputs and verify your predictions about what this
;       program does.
;

BITS 32

%include	'training.s' 

global main
extern	exit 	

; ===============================================
section .text

main:
    
    call    read_hex    ; 0000 0110 | 0000 0001
    neg     eax         ; 1111 1010 | 1111 1111
    inc     eax         ; 1111 1011 | 0000 0000
    neg     eax         ; 0000 0101 | 0000 0000
    inc     eax         ; 0000 0110 | 0000 0001
    call    print_eax

    ; Exit the process:
	push	0
	call	exit