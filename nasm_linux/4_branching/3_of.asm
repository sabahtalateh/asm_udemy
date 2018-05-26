BITS 32

%include 'training.s'

global main
extern exit

section .text
; fe - 7f (-2 - 127)
; 1111 1110 - 0111 1111 = 1111 1110 + 1000 0001
;   1111 1110
;   1000 0001
; 1 0111 1111
; o s
;
; 7f - ff (127 - (-1))
; 0111 1111 - 1111 1111 = 0111 1111 + 0000 0001
;   0111 1111
;   0000 0001
;   1000 0000
;   s
;   o

main:
    mov     eax,    0h

    mov     al,     07fh
    mov     bl,     01h
    
    add     al,    bl
    ; call    print_eax

    jo      one
    jno     two

    ; cmp     eax,    ebx
    ; js      one
;     jns     two

one:

    mov     eax,    3h
    call    print_eax
    jmp     done

two:

    mov     eax,    9h
    call    print_eax
    jmp     done

done:

    ; Exit
    push    0
    call    exit

