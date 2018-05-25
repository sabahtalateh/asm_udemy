BITS 32

%include 'training.s'

global main
extern exit

section .text

main:
    mov     ecx,0

my_label:
    inc     ecx
    jmp     my_label

    ; Never reach this place
    call    print_eax
    
    ; Exit
    push    0
    call    exit

