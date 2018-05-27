; Basic Assembly
; ==============
; 
; Signed Operations
; -----------------
;
; Higher Window
; @@@@@@@@@@@@@@
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
; 5.    How could you implement this program without the cdq instruction? Write
;       your implementation as a new program, and make sure that it has the same
;       results.
;

BITS 32

%include	'training.s' 

global main
extern	exit 	

; ===============================================
section .text

main:

    call    read_hex
    add     eax,0h
    
    jns     edx_is_zero
    mov     eax,1
    call    print_eax
    jmp     end_if
edx_is_zero:
    mov     eax,0
    call    print_eax
end_if:

    ; Exit the process:
	push	0
	call	exit