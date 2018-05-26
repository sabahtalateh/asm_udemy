; Basic Assembly
; ==============
; 
; Structured branching
; --------------------
;
; mx
; @@@
; 
; 0.    Assemble and run this program.
; 
; 1.    How many inputs does this program expect?
;
; 2.    Try to give different inputs to this program, and check the results.
;
; 3.    Read the program's code below, and try to understand what does it do. Try
;       to describe it as simply as you can. Find maximum number.
;       
; 4.    Pick some random inputs and verify your predictions about what this
;       program does.
; 
; 5.    Identify the different structured branching constructs inside this
;       code: Identify IF,FOR,WHILE and BREAK.
;

BITS 32

%include	'training.s' 

global main
extern	exit 	

; ===============================================
section .text

main:
    call    read_hex
    mov     esi,eax
    mov     edx,0

looper:
    call    read_hex
    cmp     eax,edx

    jbe     eax_is_smaller
    mov     edx,eax

eax_is_smaller:
    dec     esi
    jnz     looper

    mov     eax,edx
    call    print_eax
    

    ; Exit the process:
	push	0
	call	exit

; eax <- read_hex
; esi <- eax
; edx <- 0
; while (esi > 0) {
;   if (eax > edx) {
;      edx <- eax
;   }
;   esi--
; }
; eax <- edx
; print_eax
