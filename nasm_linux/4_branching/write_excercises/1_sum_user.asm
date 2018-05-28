; Write a program that takes the value m as input. It then receives m
;      consecutive numbers from the user, sums all those numbers and prints back
;      the total sum to the console.

BITS 32

%include 'training.s'

global main
extern exit

section .text

main:

    call    read_hex

    mov     ecx,    eax

    mov     ebx,    0h      ; ebx - accum

iter:

    call    read_hex
    add     ebx,    eax

    dec     ecx
    cmp     ecx,    0h
    je      done
    jmp     iter

done:

    mov     eax,    ebx
    call    print_eax

    ; Exit
    push    0
    call    exit

