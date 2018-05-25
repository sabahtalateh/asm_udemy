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
; 1.    How many inputs does this program expect? 1
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

; 0 0 0 0 0 0 1 0   +2
; 1 1 1 1 1 1 1 0   -2  neg
; 1 1 1 1 1 1 1 1   -1  inc
; 0 0 0 0 0 0 0 1   +1  neg
; 0 0 0 0 0 0 1 0   +2  inc

main:

    call    read_hex
    neg     eax
    inc     eax
    neg     eax
    inc     eax
    call    print_eax

    ; Exit the process:
	push	0
	call	exit