; Basic Assembly
; ==============
; 
; Structured branching
; --------------------
;
; Pasta
; @@@@@
; 
; You are given a piece of spaghetti code, and you are going to understand it
; and then fix it, to be a normal readable piece of code.
; 
; Enjoy your food :)
; 
;
; 0.    Assemble and run this program.
; 
; 1.    How many inputs does this program expect?
;
; 2.    Try to give different inputs to this program, and check the results.
;
; 3.    Read the program's code below, and try to understand what does it do. 
;       Try to describe it as simply as you can.
;       
; 4.    Pick some random inputs and verify your predictions about what this
;       program does.
; 
; 5.    Try to think about a better design for this code:
;       What kinds of loops are you going to use?
;       What kind of branches are you going to use?
;
;       Make the changes to the code. Make sure your new code has no
;       intersecting branches. Also make sure that it is readable, and well
;       commented. Finally, make sure that it has exactly the same output as the
;       original code.
;

BITS 32

%include	'training.s' 

global main
extern	exit 	

; ===============================================
section .text

main:

    call    read_hex
    mov     ecx,eax

    mov     ebx,0

iters:

    add     ebx,ecx
    mov     esi,5d
    mov     eax,ecx
    mov     edx,0
    div     esi
    cmp     edx,0
    
    jnz     skip_sub
    sub     ebx,ecx

skip_sub:

    dec     ecx
    jnz     iters
    
    mov     eax,ebx
    call    print_eax

    ; Exit the process:
	push	0
	call	exit

;ecx <- 3                // ecx=3
;ebx <- 0                // ecx=3, ebx=0
;
;while(ecx != 0) {
;    ebx <- ebx + ecx        // 3=0+3, ecx=3, ebx=3
;    esi <- 5                // ecx=3, ebx=3, esi=5
;    eax <- ecx              // eax=3, ecx=3, ebx=3, esi=5
;    edx <- 0                // eax=3, ebx=3, ecx=3, edx=0, esi=5
;    edx <- edx:eax % esi    // eax=0, ebx=3, ecx=3, edx=3, esi=5
;
;    if (edx:eax % esi == 0) {
;        ebx <- ebx - ecx
;    }
;
;    ecx <- ecx - 1      // eax=0, ebx=3, ecx=2, edx=3, esi=5
;    if (ecx == 0) {
;        break
;    }
;}
;eax <- ebx
;print

