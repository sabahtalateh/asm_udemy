; Prime counting
;
;    We want to calculate the amount of prime numbers between 1 and n.
;
;    Recall that a prime number is a positive integer which is only divisible by
;    1 and by itself. The first prime numbers are 2,3,5,7,11,13. (1 is not
;    considered to be prime).
;
;    We break down this task into a few subtasks:
;
;    0.  Write a function that takes a number x as input. It then returns 
;        eax = 1 if the number x is prime, and eax = 0 otherwise.
;
;    1.  Write a function that takes a number n as input, and then calculates the
;        amount of prime numbers between 1 and n. Use the previous function that
;        you have written for this task.
;
;    Finally ask for an input number from the user, and use the last function you
;    have written to calculate the amount of prime numbers between 1 and n.
;
;    Bonus Question: After running your program for some different inputs, Can
;    you formulate a general rough estimation of how many primes are there
;    between 1 and n for some positive integer n?
;

BITS 32
global main
extern exit

%include "training.s"

section .data
    enter_number: db 'Enter the number: ', 0
    amount_of_primes: db 'Amount of primes: ', 0
    new_line: db 10

section .text

main:
    
    mov     esi, enter_number
    call    print_str

    call    read_hex

    ; mov     eax, 10h

    ; call    is_prime
    ; call    print_eax

    mov     ecx, eax

    xor     edx, edx                ; edx - number of primes

iter:

    mov     eax, ecx
    
    call    is_prime
    cmp     eax, 1h
    jne     not_prime
    inc     edx
    mov     eax, ecx
    call    print_eax

not_prime:

    loop    iter

    mov     esi, amount_of_primes
    call    print_str
    mov     eax, edx
    call    print_eax

    push    0
    call    exit

; check if number in eax is prime
; if prime set eax to 1 else to 0
is_prime:

    push    ecx
    push    ebx
    push    edi
    push    edx

    mov     edi, eax        ; edi - original number
    mov     ebx, 1h         ; ebx - is prime

    mov     ecx, eax        ; ecx - current divisor
    cmp     ecx, 2h
    jbe     .not_prime
    dec     ecx

.check_prime:

    mov     eax, edi
    cdq
    div     ecx
    cmp     edx, 0h
    je      .not_prime


    dec     ecx
    cmp     ecx, 1h
    jg      .check_prime


    jmp     .end

.not_prime:

    mov     ebx, 0h

.end:

    mov     eax, ebx

    pop     edx
    pop     edi
    pop     ebx
    pop     ecx

    ret
