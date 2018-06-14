;Check intersection.
;    
;    Assume that we have two rectangles R,Q which are parallel to the X and Y
;    axes. We say that R and Q intersect if there is a point which is inside both
;    of them.
;    
;    Example:
;      
;      Intersecting rectangles:        Non intersecting rectangles:
;
;      +---------+                     +-----+
;      | R       |                     | R   |   +------+
;      |     +---+----+                |     |   | Q    |
;      |     |   |  Q |                +-----+   |      |
;      +-----+---+    |                          |      |
;            |        |                          +------+
;            +--------+
;
;    Write a program that takes the coordinates of two rectangles (Just like in
;    the previous exercise), and finds out if the rectangles are intersecting.
;    The program will print 1 if they are intersecting, and 0 otherwise.
;
;    Example:
;      First rectangle:  (1,5) (4,9)
;      Second rectangle: (3,4) (6,10)
;
;      Those two rectangle are intersecting.

BITS 32
global main

%include "training.s"

struc POINT
    .x: resd 1
    .y: resd 1
    .size:
endstruc

struc RECT
    .p1: resb POINT.size
    .p2: resb POINT.size
    .size:
endstruc

section .bss
    rect1: resb RECT.size
    rect2: resb RECT.size

section .text

main:

    mov     dword [rect1 + RECT.p1 + POINT.x], 1
    mov     dword [rect1 + RECT.p1 + POINT.y], 1

    mov     dword [rect1 + RECT.p2 + POINT.x], 3
    mov     dword [rect1 + RECT.p2 + POINT.y], 3


    mov     dword [rect2 + RECT.p1 + POINT.x], 0
    mov     dword [rect2 + RECT.p1 + POINT.y], 0

    mov     dword [rect2 + RECT.p2 + POINT.x], 3
    mov     dword [rect2 + RECT.p2 + POINT.y], 3






end:

    ; Exit the process:
    push	0
    call	exit