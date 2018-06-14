; 0.  Diamond
;
;    Write a program that asks the user for a number n, and then prints a
;    "diamond" of size n, made of ASCII stars.
;
;    Example:
;      For n = 1 the expected result is:
;
;       *
;      ***
;       *
;
;      For n = 2 the expected result is:
;
;        *
;       ***
;      *****
;       ***
;        *
;
;    HINT: You could use tri.asm exercise from the code reading section as a
;    basis for your program.

BITS 32

%include	'training.s' 

global main
extern	exit 	

MAX_SIZE equ 64h

section .data
    star:       db '*'
    empty:      db ' '
    new_line:   db 10, 0
    distance:   db 0

section .bss
    stars_line: times MAX_SIZE resb 1

section .text

main:

    mov     eax, 2h
    mov     edi, eax                ; edi - middle

    ; Diamond width = 2*n + 1
    mov     ecx, 2h
    mul     ecx
    add     eax, 1h                 
    mov     ebx, eax                ; ebx - width of diamond

    mov     ecx, ebx                ; ecx - inner loop counter
    mov     edx, ebx                ; edx - outer loop counter

; draw_line:

draw_line:

    mov     esi, stars_line

appen_star:

    mov     byte [esi], '*'
    add     esi, 1

    loop    appen_star

    mov     byte [esi], 10
    mov     byte [esi+1], 0
    mov     esi, stars_line
    
    call    print_str

    mov     ecx,    ebx
    dec     edx
    jnz     draw_line

    ; Exit the process:
	push	0
	call	exit