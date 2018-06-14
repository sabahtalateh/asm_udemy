;Area competition.
;
;    For every rectangle R which is parallel to the X and Y axes, we can
;    represent R using two points.
;
;    Example:
;  
;      A------------B
;      |     R      |
;      |            |
;      D------------C
;
;      We could represent the rectangle in the drawing using the points A(x,y)
;      and C(x,y) for example. Basically, we need 4 numbers to represent this
;      kind of rectangle: 2 coordinates for A, and 2 coordinates for C.
;
;      I remind you that the area of a rectangle is computed as the
;      multiplication of its height by its width.
;
;
;    Write a program that takes the coordinates of two rectangles (2 points or 4
;    dwords for each rectangle), and then finds out which rectangle has the
;    larger area.
;
;    The program then outputs 0 if the first rectangle had the largest area, or 1
;    if the second rectangle had the largest area. 
;
;    In addition, the program prints the area of the rectangle that won the area
;    competition.

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

    mov     eax, [rect1 + RECT.p1 + POINT.x]
    mov     ebx, [rect1 + RECT.p2 + POINT.x]
    sub     eax, ebx
    jns     positive0
    neg     eax

positive0:

    mov     ebx, [rect1 + RECT.p1 + POINT.y]
    mov     ecx, [rect1 + RECT.p2 + POINT.y]
    sub     ebx, ecx
    jns     positive1
    neg     ebx

positive1:

    mul     ebx
    mov     edi, eax


    mov     eax, [rect2 + RECT.p1 + POINT.x]
    mov     ebx, [rect2 + RECT.p2 + POINT.x]
    sub     eax, ebx
    jns     positive2
    neg     eax

positive2:

    mov     ebx, [rect2 + RECT.p1 + POINT.y]
    mov     ecx, [rect2 + RECT.p2 + POINT.y]
    sub     ebx, ecx
    jns     positive3
    neg     ebx

positive3:

    mul     ebx
    mov     esi, eax

    cmp     edi, esi
    jge     first_is_larger
    jmp     second_is_larger

first_is_larger:

    mov     eax, 0
    call    print_eax
    mov     eax, edi
    call    print_eax
    jmp     end

second_is_larger:

    mov     eax, 
    call    print_eax
    mov     eax, esi
    call    print_eax

end:

    ; Exit the process:
    push	0
    call	exit