; Basic Assembly
; ==============
; 
; Subroutines and the stack - Calling conventions
; -----------------------------------------------
; 
; Scalar product
; @@@@@@@@@@@@@@
;    
; 0.    Skim the code. Take a look at the functions and their descriptions.
;       Understand the dependencies between the functions (Which function calls
;       which function), and what is the special purpose of every function.
;
; 1.    Read the main code (Beginning from start), and see how the function
;       scalar_product is being called. Which calling convention is being used?
;
; 2.    Fill in the scalar_product function. This function calculates the scalar
;       product (Sometimes referred to as inner product) between two vectors.
;       See exact formula in the comments below.
;       
;       Note that you may only fill in the scalar_product function. Do not
;       change the rest of the code.
;       
;       Make sure that you deal with arguments and the stack according to the
;       correct calling convention. Think about the following:
;       - Who should clean the stack?
;       - Where should the return value be?
;       - Saving registers to the stack, so that your function will not have
;         side effects.
;
; 3.    Assemble and run the code. Verify the result that you get.
;
;       Just to be sure, check the value of esp before and after
;       the call to scalar_product, to verify that the stack is balanced.
;

BITS 32
global main
extern exit

%include "training.s"

struc VEC
    .x:   resd  1
    .y:   resd  1
endstruc

; ===============================================
section .data
    vec1: ISTRUC VEC
	at VEC.x ,	dd 1
	at VEC.y,	dd 1            
	IEND	
    vec2: ISTRUC VEC
	at VEC.x,	dd 1
	at VEC.y,	dd 1
	IEND

    scalar_result   db  'Scalar product result: ',0
; ===============================================
section .text

main:

    mov     eax, esp
    call    print_eax

    ; Invoke scalar product of vec1 and vec2:
    push    vec1
    push    vec2
    call    scalar_product

    ; Print result to the console:
    mov     esi,scalar_result
    call    print_str
    call    print_eax

    mov     eax, esp
    call    print_eax

    ; Exit the process:
	push	0
	call	exit


; =================================================
; scalar_product(v1,v2)
;
; Input:
;   v1,v2 vectors.
; Output:
;   (v1.x * v2.x) + (v1.y * v2.y)
; Calling Covention:
;   ?
;

; **** Fill in this function ****
scalar_product:

    push    ebx
    push    ecx
    push    edx
    push    esi
    push    edi

    ADDITIONAL_OFFSET equ 14h

    xor     eax, eax

    mov     ebx, [esp + 8h + ADDITIONAL_OFFSET]       ; ebx - address of the first vector
    mov     ecx, [esp + 4h + ADDITIONAL_OFFSET]       ; ecx - address of the second vector

    mov     eax, [ebx + VEC.x]
    mov     esi, [ecx + VEC.x]
    mul     esi
    mov     edi, eax                ; edi <- (v1.x * v2.x)

    ; mov     eax, edi
    ; call    print_eax

    mov     eax, [ebx + VEC.y]
    mov     esi, [ecx + VEC.y]
    mul     esi
    

    add     eax, edi

    call    print_eax

    pop     edi
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx

    ret     8
