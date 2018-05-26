;Write a program that takes the number n as input. Then it prints all the
;   numbers x below n that have exactly 2 different integral divisors (Besides 1
;   and x). 
;   
;   For example: 15 is such a number. It is divisible by 1,3,5,15. (Here 3 and 5
;   are the two different divisiors, besides 1 and 15).
;
;   However, 4 is not such a number. It is divisible by 1,2,4.

BITS 32

%include 'training.s'

global main
extern exit

section .text


main:
    
    call    read_hex
    ; mov     eax,    100d     ; max number
    mov     edi,    eax
    mov     esi,    6d      ; current number, first number that satisfies the conditions

check_next_number:

    mov     ebx,    2d      ; current divisor
    mov     ecx,    0d      ; number of divisors

check_next_divisor:

    mov     eax,    esi
    cdq
    div     ebx
    cmp     edx,    0d
    jne     not_a_divisor

    inc     ecx

not_a_divisor:

    inc     ebx
    cmp     ebx,    esi
    jne     check_next_divisor

    cmp     ecx,    2d
    jne     not_2_divisors
    mov     eax,    esi
    call    print_eax_dec

not_2_divisors:

    inc     esi
    cmp     esi,    edi
    jne     check_next_number

    push    0
    call    exit

;edi	<- read_hex		// max number
;esi	<- 2			// current number
;
;while (esi < edi) {
;	ebx <- 2			// current divisor
;	ecx <- 0			// number of divisors
;	while(ebx != n) {
;		if (n % ebx == 0) {
;			ecx <- ecx + 1
;		}
;       ebx <- ebx + 1
;	}
;   esi <- esi + 1
;}