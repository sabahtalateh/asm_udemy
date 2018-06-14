BITS 32

extern exit
global main

%include "training.s"

section .data
    hello: db 'Hello from deep', 10, 0

section .text

main:
    call    func1

    push    0
    call    exit

func1:
    call    func2
    ret

func2:
    call    func3
    ret

func3:
    call    func4
    ret

func4:
    mov     esi, hello
    call    print_str
    ret
