; Basic Assembly
; ==============
BITS 32
global main

%include "training.s"

section .data
    array:
    %rep 10
        dd 12345678h
    %endrep

section .bss
    num1:   resd 1
    arr8:   resd 8

section .text

main:

    ; Exit the process:
    push	0
    call	exit
