; Basic Assembly
; ==============
; 
; Subroutines and the stack - CALL and RET
; ----------------------------------------
;
; Vec Sum
; @@@@@@@
;    
; 0.    Assemble and run this program.
;
; 1.    Try to give the program different inputs, and observe the output.
;
; 2.    Skim the code. Take a look at the functions and their descriptions.
;       Understand the dependencies between the functions (Which function calls
;       which function), and what is the special purpose of every function.
;
; 3.    Read the program's code below, and try to understand what does it do. 
;       Try to describe it as simply as you can. Add comments if needed.
;
;       Fill in the descriptions for the functions in this code.
;
; 4.    Explain the program's output.
;
; 5.    Question for thought: How can you check that this program works right,
;       without verifying the full calculation yourself?
;       
;       HINT: How could you acheive it by a small change to the program?
;

BITS 32
global main
extern exit

%include "training.s"

struc VEC
    .x:     resd 1
    .y:     resd 1
    .size:
endstruc

; ===============================================
section .data 

    vec_list:    
        istruc VEC
            at VEC.x, dd 1
            at VEC.y, dd 1
        iend
        istruc VEC
            at VEC.x, dd 8
            at VEC.y, dd 4
        iend
    LIST_LEN: equ ($ - vec_list) / VEC.size

    sum_vec: istruc VEC
        at VEC.x, dd 0
        at VEC.y, dd 0
    iend

; ===============================================
section .text

main:

    mov     edi,sum_vec
    mov     esi,vec_list
    xor     ecx,ecx

.next_vec:
    call    add_vecs
    add     esi,8
    inc     ecx
    cmp     ecx,LIST_LEN
    jnz     .next_vec

    mov     esi,sum_vec
    call    print_vec

    ; Exit the process:
	push	0
	call	exit

; ===============================================
; Input: ?
; Operation: ?
; Output: ?
;
add_vecs:
    push    eax ; Save eax to the stack.

    mov     eax,dword [esi + VEC.x]
    add     dword [edi + VEC.x],eax

    mov     eax,dword [esi + VEC.y]
    add     dword [edi + VEC.y],eax

    pop     eax ; Restore eax from the stack.
    ret

; ; ===============================================
; ; Input: ?
; ; Operation: ?
; ; Output: ?
; ;
print_vec:
    push    eax     ; Keep eax to stack.
    mov     eax,dword [esi + VEC.x]
    call    print_eax
    mov     eax,dword [esi + VEC.y]
    call    print_eax
    pop     eax     ; Restore eax.
    ret
