BITS 32

%include 'training.s'

global main
extern exit

section .text


main:

    call    read_hex

    ; copy right 4 bytes into dx
    mov     dx, ax

    ; get left 4 bytes into ax
    cdq
    mov     ebx, 10000h
    div     ebx

    ; ebx will keep a bit filled with leading zeros
    mov     ebx, 0h
    ; ecx will keep the result
    mov     ecx, 0h

    mov     bl, dl
    add     ecx, ebx
    
    mov     bl, dh
    add     ecx, ebx

    mov     bl, al
    add     ecx, ebx

    mov     bl, ah
    add     ecx, ebx

    mov     eax, ecx

    call    print_eax

    push    0
    call    exit
