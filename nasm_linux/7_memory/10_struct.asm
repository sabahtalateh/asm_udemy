; Basic Assembly
; ==============
BITS 32
global main

%include "training.s"

STRUC Point 
    .x: RESD 1 
    .y: RESD 1
    .size:
ENDSTRUC

STRUC Line
    .p1: RESB Point.size
    .p2: RESB Point.size
    .size:
ENDSTRUC

section .bss
    p1: RESB Point.size

section .data 
    p2: ISTRUC Point
    AT Point.x, DD 3
    AT Point.y, DD 4

    p3: ISTRUC Point
    AT Point.x, DD 10
    AT Point.y, DD 10

    l1: ISTRUC Line
    AT Line.p1, DD 5, 6
    AT Line.p2, DD 7, 8
IEND

section .text

main:

    mov     dword [p1 + Point.x],  1
    mov     dword [p1 + Point.y],  2
    
    mov     eax, [p1 + Point.x]
    call    print_eax

    mov     eax, [p1 + Point.y]
    call    print_eax

    mov     eax, [p2 + Point.x]
    call    print_eax

    mov     eax, [p2 + Point.y]
    call    print_eax

    mov     eax, [p2 + 4]
    call    print_eax

    mov     eax, [l1 + Line.p1 + Point.x]
    call    print_eax

    ; Exit the process:
    push	0
    call	exit
