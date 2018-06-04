; Basic Assembly
; ==============
; 
; Signed Operations
; -----------------
;
; Two Pack
; @@@@@@@@
; 
; 0.    Assemble and run this program.
; 
; 1.    How many inputs does this program expect?
;
; 2.    Try to give different inputs to this program, and check the results.
;       Specifically, try the following inputs: 
;       12345, 0101, 0202, 0203, 01ff.
;
; 3.    Read the program's code below, and try to understand what does it do. Try
;       to describe it as simply as you can.
;       
; 4.    Pick some random inputs and verify your predictions about what this
;       program does.
;
; 5.    Describe what happens for input ff01 against what happens for input
;       01ff.
;

BITS 32

%include	'training.s' 

global main
extern	exit 	

; ===============================================
section .text

main:

    call    read_hex            ; ff01
    cmp     eax,0ffffh
    ja      exit_program

    movsx   esi,al              ; esi=01
    movzx   eax,ah              ; eax=ff

    imul    esi                 ; edx:eax=01*ff=ff
    call    print_eax

exit_program:
    ; Exit the process:
	push	0
	call	exit