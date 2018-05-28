; Write a program that takes a number n as input, and prints back to the
;        console all the primes that are larger than 1 but not larger than n.


BITS 32

%include 'training.s'

global main
extern exit

section .text

main:

    mov     eax,    10h

    mov     esi,    eax

iter_c:

    mov     edi,    esi         ; edi - number

    cmp     edi,    2h
    jbe     arg_le_2
    jmp     endif

arg_le_2:

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
    jmp     end

prime:

    mov     eax,    edi
    call    print_eax

end:

    dec     esi
    cmp     esi,    1h
    jne     iter_c

    ; Exit
    push    0
    call    exit

