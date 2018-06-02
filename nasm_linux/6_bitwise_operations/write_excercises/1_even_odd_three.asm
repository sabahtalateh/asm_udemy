; Write a program that takes three numbers x,y,z as input, and returns:
;  - 0 if (x+y+z) is even.
;  - 1 if (x+y+z) is odd.

BITS 32

%include	'training.s' 

global main
extern exit 	

; ===============================================
section .text

main:
    xor     ebx,    ebx

    call    read_hex
    xor     ebx,    eax

    call    read_hex
    xor     ebx,    eax

    call    read_hex
    xor     ebx,    eax

    shr     ebx,    1
    jc      odd

    mov     eax,    0
    call    print_eax
    jmp     end

odd:
    mov     eax,    1
    call    print_eax

end:

	push	0
	call	exit