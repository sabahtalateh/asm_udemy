BITS 32
global main
extern exit

%include "training.s"

section .data
;0x100
    arr: dd 1h, 5h, 9h, 168h, 0aaaaah
;0x114       (0x114 - 0x100) / 0x4h = 5h
    ARR_LEN: equ ($ - arr) / 4
    str: db  'ZOPA'

section .bss
    dest_arr: resd ARR_LEN

section .text

main:

    mov     ecx, ARR_LEN
    mov     esi, arr
    mov     edi, dest_arr

.next_elem:

    lodsd
    inc     eax
    call    print_eax
    stosd

    
    loop    .next_elem

    mov     esi, str
    call    print_str

    push    0
    call    exit
