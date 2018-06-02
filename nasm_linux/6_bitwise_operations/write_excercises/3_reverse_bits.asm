;Bit reverse:
;
;    Write a program that takes a number (of size 4 bytes) x as input, and then
;    reverses all the bits of x, and outputs the result. By reversing all bits we
;    mean that the bit with original location i will move to location 31-i.
;
;    Small example (for the 8 bit case):
;
;      if x == {01001111}_2, then the output is {11110010}_2.
;
;      In this example we reversed only 8 bits. Your program will be able to
;      reverse 32 bits.

BITS 32

%include	'training.s' 

global main
extern exit 	

; ===============================================
section .text

main:

    call    read_hex
    call    print_eax_binary
    mov     ecx,    32d
    mov     ebx,    0

reverse_next_bit:

    mov     edx,    eax
    and     edx,    1
    shl     ebx,    1
    or      ebx,    edx
    shr     eax,    1

    loop    reverse_next_bit

    mov     eax,    ebx
    call    print_eax_binary

	push	0
	call	exit