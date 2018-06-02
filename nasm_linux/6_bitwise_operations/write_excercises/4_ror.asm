;Rotation using shifts.
;
;    Implement the ror instruction using the shift instructions. You may use any
;    bitwise instruction for this task, except for the rotation instructions
;    (ror,rol).


BITS 32

%include	'training.s' 

global main
extern exit 	

; ===============================================
section .text

main:

    mov		eax,	10101b		; eax - number
	call	print_eax_binary
	mov		ecx,	1			; ecx - number of rotations

rotate_last_bit:

	shr		eax,	1
	jnc		last_bit_is_not_set
	xor		eax,	10000000000000000000000000000000b

last_bit_is_not_set:

	loop	rotate_last_bit

	call	print_eax_binary

	push	0
	call	exit