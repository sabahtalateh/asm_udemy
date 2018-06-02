; Basic Assembly
; ==============
BITS 32
global main

%include "training.s"

%define COUNT 5

section .data
    keep_nums:
    %rep COUNT
        dd 0
    %endrep

section .text

main:
    
    mov     eax,    keep_nums
    call    print_eax

    mov     eax,    main
    call    print_eax

    ; Exit the process:
    push	0
    call	exit