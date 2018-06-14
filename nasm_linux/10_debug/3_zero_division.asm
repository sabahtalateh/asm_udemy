BITS 32

extern exit
global main

%include "training.s"


section .text

main:
    mov     eax, 1
    mov     ebx, 0
    cdq
    div     ebx

    push    0
    call    exit
