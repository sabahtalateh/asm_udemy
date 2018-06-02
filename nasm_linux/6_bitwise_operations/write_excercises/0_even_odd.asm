;Write a program that takes a number x as input, and returns:
;   - 0 if x is even.
;   - 1 if x is odd. 

BITS 32

%include	'training.s' 

global main
extern exit 	

; ===============================================
section .text

main:

    call    read_hex

    shr     eax,    1
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