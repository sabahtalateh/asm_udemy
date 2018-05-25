BITS 32

%include 'training.s'

global main
extern exit

section .text

main:
    mov     ecx,0

my_label:
    mov     eax,1
    call    print_eax
    jmp     skipl

    mov     eax,2
    call    print_eax

skipl:
    mov     eax,3
    call    print_eax
    
    ; Exit
    push    0
    call    exit

