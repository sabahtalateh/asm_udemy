; Find yourself
;    
;    Write a program that finds the current value of EIP and prints it to the
;    console.
;
;    HINT: Use CALL.
;

BITS 32
global main
extern exit

%include "training.s"

section .text

main:

    call    print_eip

    push    0
    call    exit

print_eip:
    pop     eax
    call    print_eax
    push    eax


    ret
