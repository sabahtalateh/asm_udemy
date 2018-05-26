;Write a program that takes the number n as input, and prints back all the
;  triples (a,b,c), such that a^2 + b^2 = c^2. 
; 
;   These are all the pythagorean triples not larger than n.

BITS 32

%include 'training.s'

global main
extern exit

section .text


main:

    mov     eax,    100d
    mov     esi,    eax     ; esi - max
    mov     edi,    1d      ; edi - a
    mov     ebx,    1d      ; ebx - b
    mov     ecx,    1d      ; ecx - c

find_a:

    mov     ebx,    edi

find_b:

    mov     ecx,    ebx

find_c:

    ; check a^2 + b^2 == c^2
    mov     eax,    edi
    mul     eax                 ; a^2
    push    eax                 ; [a^2
    mov     eax,    ebx
    mul     ebx                 ; b^2
    push    eax                 ; [b^2, a^2
    pop     eax
    pop     edx
    add     eax,    edx
    push    eax                 ; [a^2+b^2
    mov     eax,    ecx
    mul     ecx
    pop     edx
    cmp     eax,    edx

    jne     not_a_triple

    mov     eax,    edi
    call    print_eax_dec
    mov     eax,    ebx
    call    print_eax_dec
    mov     eax,    ecx
    call    print_eax_dec
    call    print_delimiter

not_a_triple:

    inc     ecx
    cmp     ecx,    esi
    jne     find_c
    
    inc     ebx
    cmp     ebx,    esi
    jne     find_b

    inc     edi
    cmp     edi,    esi
    jne     find_a

done:

    push    0
    call    exit
