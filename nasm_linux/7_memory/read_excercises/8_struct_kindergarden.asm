; Basic Assembly
; ==============
; 
; Memory - Structures
; -------------------
;
; Struct playground
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
    .color:   resb COLOR.size
    .cline:   resb LINE.size
    .size:
ENDSTRUC

section .bss
    my_point: ISTRUC PNT
        resb PNT.size
    IEND
    my_line: ISTRUC LINE
        resb LINE.size
    IEND


    
; ===============================================
section .text

main:

    ; PNT structure:
    ; ------------------
    mov     eax,my_point
    call    print_eax

    mov     eax,my_point + PNT.x
    call    print_eax

    mov     eax,my_point + PNT.y
    call    print_eax

    mov     eax,PNT.size
    call    print_eax

    mov     eax,PNT.x
    call    print_eax

    mov     eax,PNT.y
    call    print_eax

    ; Prove the following: my_point + PNT.y == my_point.y

    call    print_delimiter

    ; LINE structure:
    ; --------------------

    mov     eax,LINE.size
    call    print_eax

    mov     eax,my_line
    call    print_eax

    mov     eax,my_line + LINE.p_end + PNT.x
    call    print_eax

    mov     eax,LINE.p_end + PNT.x
    call    print_eax

    ; Prove the following: my_line + LINE.p_end.x == my_line.p_end.x

    call    print_delimiter

    ; COLORED_LINE structure:
    ; -----------------------

    ; Try to predict the following offsets:
    mov     eax, COLORED_LINE.cline
    call    print_eax

    mov     eax, COLORED_LINE.cline + LINE.p_end
    call    print_eax

    mov     eax, COLORED_LINE.cline + LINE.p_end + PNT.y
    call    print_eax


    ; Exit the process:
	push	0
	call	exit
