; Basic Assembly
; ==============
BITS 32
global main

%include "training.s"

section .data
    numbers:
    %rep 5
        dd 0
    %endrep

section .text

main:

    add     byte [numbers+0],  1
    add     byte [numbers+1],  1
    add     byte [numbers+2],  1
    add     byte [numbers+3],  1

    mov     eax,    [numbers]
    call    print_eax_binary
    call    print_eax

    ; Exit the process:
    push	0
    call	exit
