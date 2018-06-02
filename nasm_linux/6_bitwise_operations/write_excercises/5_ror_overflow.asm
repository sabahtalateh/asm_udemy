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
    mov     eax,    0
    mov		ax,	    10101b		; eax - number
	call	print_eax_binary
    ror     ax,    19d
	call	print_eax_binary

	push	0
	call	exit