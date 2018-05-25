;Finding the bit flip of a number.
;   Create a program that takes the number x as input, flips all its bits and
;   returns the result. Use the NEG instruction to do that, together with other
;   instructions that we have learned.
;
;   HINT: Remind yourself how the two's complement negation work, and try to use
;   it to your advantage.
BITS 32

%include 'training.s'

global main
extern exit

section .text


main:
    
    call    read_hex

    neg     eax
    dec     eax

    call    print_eax
    

    push    0
    call    exit
