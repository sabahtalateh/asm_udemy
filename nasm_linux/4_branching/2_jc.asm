BITS 32

%include 'training.s'

global main
extern exit

section .text

main:
    mov     eax,    100h
    mov     ebx,    100h
    sub     eax,    ebx
    jc      a_lt_b
    jnc     b_lte_a

a_lt_b:

    mov     eax,    0h
    call    print_eax
    jmp     done

b_lte_a:

    mov     eax,    1h
    call    print_eax
    jmp     done

done:

    ; Exit
    push    0
    call    exit

