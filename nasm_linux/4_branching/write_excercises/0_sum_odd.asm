; Write a program that takes the value n as input, and finds the sum of
;      all the odd numbers between 1 and 2n+1, inclusive.

BITS 32

%include 'training.s'

global main
extern exit

section .text

main:

    call    read_hex

    mov     ecx,    2h

    mul     ecx
    add     eax,    1h

    mov     esi,    eax     ; esi - border
    mov     ecx,    0h      ; ecx - counter
    mov     edi,    0h      ; edi - accum

iter:

    mov     ax,     0h
    mov     al,     cl

    mov     dl,    2h

    div     dl

    cmp     ah,     0h
    jz      even
    add     edi,    ecx

even:

    inc     ecx
    cmp     ecx,    esi
    jnz     iter

    mov     eax,    edi
    call    print_eax
    
    ; Exit
    push    0
    call    exit

