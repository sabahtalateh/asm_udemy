;Strange sum.
;
;    Write a program that gets a number n as input, and then receives a list of n
;    numbers: a_1, a_2, ..., a_n.
;
;    The program then outputs the value n*a_1 + (n-1)*a_2 + ... + 1*a_n.
;    Here * means multiplication.
;
;    Example:
;
;    Assume that the input received was n=3, together with the following list of
;    numbers:  3,5,2.
;    Hence the result will be 3*3 + 2*5 + 1*2 = 9 + 10 + 2 = 21 = 0x15
;
;    
;    Question for thought: Could you write this program without using memory?

BITS 32
global main

%include "training.s"

section .text

main:
    call    read_hex         
    mov     ecx, eax        ; ecx - counter
    xor     edi, edi        ; edi - sum


iter:
    call    read_hex
    mul     ecx

    add     edi, eax

    loop    iter

    mov     eax, edi
    call    print_eax

skip:

    ; Exit the process:
    push	0
    call	exit