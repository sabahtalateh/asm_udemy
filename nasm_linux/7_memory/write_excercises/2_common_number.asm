;Common number.
;
;    Create a program that takes a number n as input, followed by a list of n
;    numbers b_1, b_2, ... b_n. You may assume that 0x0 <= b_i <= 0xff for every
;    1 <= i <= n.
;
;    The program will output the most common number.
;
;    Example:
;
;    Assume that the input was n=7, followed by the list: 1,5,1,3,5,5,2.
;    The program will output 5, because this is the most common number.
;
;    Note that if there is more than one most common number, the program will
;    just print one of the most common numbers.

BITS 32
global main

%include "training.s"

MAX_NUMS equ 100

section .bss
    nums: resb MAX_NUMS
    nums_count: resb MAX_NUMS

section .text

main:

    mov     eax, 7h
    mov     ecx, eax
    cmp     ecx, MAX_NUMS
    jl      skip_set_max
    mov     ecx, MAX_NUMS

skip_set_max:

    xor     edx, edx                            ; edx - different numbers filled

read_number:

    call    read_hex                            
    mov     ebx, eax                            ; ebx - currently typed number 

    mov     esi, edx                            ; esi - index of the same number

try_find_same_number:

    cmp     esi, 0
    jl      insert_new_number

    cmp     ebx, [nums + esi*4]
    je      update_counter_at_esi
    dec     esi
    jmp     try_find_same_number

update_counter_at_esi:

    mov     eax, [nums_count + esi*4]
    inc     eax
    mov     [nums_count + esi*4], eax
    jmp     continue

insert_new_number:

    mov     dword [nums + edx*4], ebx
    mov     dword [nums_count + edx*4], 1

    inc     edx

continue:

    loop    read_number

    ; Find max count
    mov     esi, [nums_count]                   ; esi - first value in count array
    mov     ecx, edx
    mov     edi, 0                              ; edi - max index

    ; Here we have numbers in nums and count of that numbers in nums_count

find_max_iter:

    dec     ecx
    mov     eax, [nums_count + ecx*4]

    cmp     eax, esi
    jl      not_greater
    mov     esi, eax
    mov     edi, ecx

not_greater:
    
    cmp     ecx, 1
    jge     find_max_iter

    mov     eax, [nums + edi*4]
    call    print_eax

    ; Exit the process:
    push	0
    call	exit