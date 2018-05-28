; The Fibonacci series is the series of numbers where every number is the sum
;    of the two previous numbers. It begins with the numbers: 1,1,2,3,5,8,...
;    Write a program that takes as input the number n, and prints back the n-th
;    element of the fibonacci series.


BITS 32

%include 'training.s'

global main
extern exit

section .text

main:

    call    read_hex
    mov     edi,    eax         ; edi - max

    mov     eax,    1h
    mov     ebx,    1h

    cmp     edi,    2h
    jbe     end

iter:
    add     eax,    ebx
    mov     ecx,    eax
    mov     eax,    ebx
    mov     ebx,    ecx
    
    ; call    print_ebx_dec

    dec     edi
    cmp     edi,    2h
    jne     iter



end:
    call    print_ebx_dec

    ; Exit
    push    0
    call    exit

