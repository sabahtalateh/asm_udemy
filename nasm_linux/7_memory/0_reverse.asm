; Basic Assembly
; ==============
BITS 32
global main

%include "training.s"

section .data
    keep_nums:
    %rep 5
        dd 0
    %endrep

section .text

main:
    mov     ecx,    4

read_one_number:

    call    read_hex
    ; mov     eax,    ecx

    ; edi <- keep_nums + ecx*4, dword - 4 bytes
    ; edi - address of memory where to put numbers
    mov     edi,            ecx
    shl     edi,            2
    add     edi,            keep_nums

    mov     dword [edi],    eax
    loop    read_one_number

    mov     ecx,    1

print_one_number:

    ; edi <- keep_nums + ecx*4, dword - 4 bytes
    mov     edi,            ecx
    shl     edi,            2
    add     edi,            keep_nums

    mov     eax,            dword [edi]
    call    print_eax

    inc     ecx
    cmp     ecx,    5
    jne     print_one_number

    ; Exit the process:
    push	0
    call	exit