; Basic Assembly
; ==============
BITS 32
global main

%include "training.s"

ARR_LEN equ 6

section .data
    src_arr:    db  11h, 22h, 33h, 44h, 55h, 66h
    dst_arr:    times 6 db 0 

section .text

main:

    mov     esi, src_arr
    mov     edi, dst_arr
    mov     ecx, ARR_LEN


copy_byte:
    movsb
    loop    copy_byte

end:

    mov     ecx, ARR_LEN
    mov     esi, dst_arr

print_elem:

    lodsb
    call    print_eax
    loop    print_elem

    ; Exit the process:
    push	0
    call	exit
