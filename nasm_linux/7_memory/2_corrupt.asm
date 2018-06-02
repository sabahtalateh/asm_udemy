; Basic Assembly
; ==============
BITS 32
global main

%include "training.s"

%define COUNT (100000/4) + 1

section .data
    keep_nums:
    %rep COUNT
        dd 0
    %endrep

section .text

main:
    
    mov     eax,    keep_nums
    call print_eax

    mov     eax,    main
    call print_eax

    mov     esi,    keep_nums
    add     esi,    10000h
    mov     dword [esi],    3

    ; Exit the process:
    push	0
    call	exit