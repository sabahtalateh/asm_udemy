; Basic Assembly
; ==============
; 
; Memory - Structures
; -------------------
;
; Struct Elementary
; @@@@@@@@@@@@@@@@@
; 
; 0.    Read the structures' definitions, and take a look at the code.
;
; 1.    Before running the program: Try to predict all the values that will be
;       printed to the console. Write your predictions as comments.
;
; 2.    Run the program and check your predictions.
;

BITS 32
global main
extern exit

%include "training.s"

STRUC PNT
    .x:   resb 1
    .y:   resb 1
    .size:
ENDSTRUC

STRUC LINE
    .p_start:     resb PNT.size
    .p_end:       resb PNT.size
    .size:
ENDSTRUC

STRUC COLOR
    .red:       resb 1
    .green:     resb 1
    .blue:      resb 1
                resb 1
    .size:
ENDSTRUC

STRUC COLORED_LINE
    .color:   equ COLOR
    .cline:   resb LINE.size
    .size:
ENDSTRUC

STRUC UNI_COLORED_LINE
    .color: resb COLOR.size
    .cline: resb LINE.size
    .size:
ENDSTRUC


STRUC INDEXED_LINE
    .index: resd 1
    .color: resb COLOR.size
    .cline: resb LINE.size
    .size:
ENDSTRUC


section .bss    
    my_u_line:          resb UNI_COLORED_LINE.size
    my_i_line:          resb INDEXED_LINE.size
    

section .text

main:
    
    
    ; UNI_COLORED_LINE structure:
    ; ---------------------------

    ; Compare the following two values:
    mov     eax,UNI_COLORED_LINE + UNI_COLORED_LINE.color + COLOR.red
    call    print_eax

    mov     eax,UNI_COLORED_LINE + UNI_COLORED_LINE.color
    call    print_eax

    ; And also compare the following two values:
    mov     eax,my_u_line + COLOR.red
    call    print_eax

    mov     eax,my_u_line + COLOR
    call    print_eax


    mov     dword [my_u_line + COLOR],11223344h
    ; Predict the following values:
    movzx   eax,byte [my_u_line + COLOR.red]
    call    print_eax
    movzx   eax,byte [my_u_line + COLOR.green]
    call    print_eax
    movzx   eax,byte [my_u_line + COLOR.blue]
    call    print_eax

    ; Print a delimiter.
    call    print_delimiter


    ; INDEXED_LINE structure:
    ; -----------------------

    ; Predict the following values:
    mov     eax,INDEXED_LINE.color + COLOR.red
    call    print_eax

    mov     eax,INDEXED_LINE.size
    call    print_eax

    mov     eax,INDEXED_LINE.cline + LINE.p_start + PNT.y
    call    print_eax


    ; Exit the process:
	push	0
	call	exit