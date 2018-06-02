;Write a program that takes a number (of size 4 bytes) x as input, and then
;    counts the amount of "1" bits in even locations inside the number x. We
;    assume that the rightmost bit has location 0, and the leftmost bit has a
;    location of 31.
;
;    Example:
;      
;      if x == {111011011}_2, then we only count the bits with stars under them.
;               * * * * *
;               8 6 4 2 0
;
;      Hence we get the result of 4.

BITS 32

%include	'training.s' 

global main
extern exit 	

; ===============================================
section .text

main:

    call    read_hex                    ; eax - original number
    mov     ecx,    16d                 ; ecx - iterations counter
    mov     ebx,    0                   ; ebx - sum bits

shift_and_count:

    shr     eax,    1
    jnc     shifter_bit_is_zero
    inc     ebx

shifter_bit_is_zero:

    shr     eax,    1
    loop    shift_and_count

    mov     eax,    ebx
    call    print_eax

	push	0
	call	exit