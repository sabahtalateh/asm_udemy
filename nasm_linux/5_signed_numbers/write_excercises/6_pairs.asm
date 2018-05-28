;Write a program that takes the number n as input, and prints back all the
;   pairs (x,y) such that x < y < n.

BITS 32

%include 'training.s'

global main
extern exit

section .text


main:

    call    read_hex
    cmp     eax,    1d
    jbe     exit 

    mov     esi,    eax     ; esi - original number
    mov     eax,    0d      ; eax - first in pair
    mov     ebx,    0d      ; ebx - second in pair

    dec     esi

find_a:

    call    print_delimiter
    mov     ebx,    eax

find_b:

    inc     ebx

    call    print_eax
    call    print_ebx
    
    cmp     ebx,    esi
    jne     find_b

no_more_b:

    inc     eax
    cmp     eax,    esi
    jne     find_a

done:

    push    0
    call    exit

;esi <- n 	// original number
;
;eax <- 0	// first in pair
;ebx <- 0	// second in pair
;
;while(eax < esi) {
;	ebx <- eax + 1
;
;	while (true) {
;       if (eax > ebx) {
;           if (ebx < esi) {
;               print eax, ebx        
;           }
;       }
;       if (ebx == esi) {
;           break
;       }
;		ebx++
;	}
;	eax++
;}
