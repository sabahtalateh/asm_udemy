; Write a program that takes a number m as input, and prints back 1 to the
;        console if m is a prime number. Otherwise, it prints 0.


BITS 32

%include 'training.s'

global main
extern exit

section .text

main:

    call    read_hex

    mov     edi,    eax         ; edi - number

    cmp     edi,    2h
    jbe     arg_le_2
    jmp     endif

arg_le_2:

    mov     eax,    0h
    call    print_eax
    jmp     end

endif:

    
    mov     ebx,    0h          ; ebx - number of divisors
    mov     ecx,    edi         ; ecx - current divisor
    dec     ecx

iter:

    mov     eax,    edi
    cdq

    div     ecx

    cmp     edx,    0h
    jne     not_a_divisor
    inc     ebx

not_a_divisor:

    dec     ecx
    cmp     ecx,    1h
    jne     iter

    cmp     ebx,    0h
    je      prime

    mov     eax,    0h
    call    print_eax
    jmp     end

prime:

    mov     eax,    1h
    call    print_eax

end:

    ; Exit
    push    0
    call    exit

