; Write a program that takes three numbers as input: x,y,z. Then it prints 1
;    to the console if x < y < z. It prints 0 otherwise.

BITS 32

%include 'training.s'

global main
extern exit

section .text

main:

    mov     eax,    1h
    mov     ebx,    2h
    mov     ecx,    6h

    cmp     eax,    ebx
    jb      a_lt_b
    jmp     print_zero

a_lt_b:

    cmp     ebx,    ecx
    jb      b_lt_c
    jmp     print_zero

b_lt_c:

    mov     eax,    1h
    call    print_eax
    jmp     end

print_zero:

    mov     eax,    0h
    call    print_eax

end:

    ; Exit
    push    0
    call    exit

