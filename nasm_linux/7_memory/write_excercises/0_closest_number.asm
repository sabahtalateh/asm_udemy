;Find closest number.
;    
;    Add the following into the data section:
;
;    nums  dd  23h,75h,111h,0abch,443h,1000h,5h,2213h,433a34h,0deadbeafh
;
;    This is an array of numbers. 
;    
;    Write a program that receives a number x as input, and finds the dword
;    inside the array nums, which is the closest to x. (We define the distance
;    between two numbers to be the absolute value of the difference: |a-b|).
;
;    Example:
;
;    For the input of 100h, the result will be 111h, because 111h is closer to
;    100h than any other number in the nums array. (|100h - 111h| = 11h).

BITS 32
global main

%include "training.s"

section .data
    nums:  dd  23h,75h,111h,0abch,443h,1000h,5h,2213h,433a34h,0deadbeafh
    nums_end:

section .text

main:

    call    read_hex
    mov     edi, eax                            ; edi - original number
    mov     ecx, ((nums_end - nums) / 4) - 1    ; ecx - number of iterations
    mov     ebx, edi

    sub     ebx, [nums]
    cmp     ebx, 0
    jge     skip_neg
    neg     ebx

skip_neg:

    mov     edx, ebx                            ; edx - current minimum distance
    mov     esi, 0                              ; esi - index of current minimum distance

    ; mov     eax, ebx
    ; call    print_eax

iter:

    mov     ebx, [nums + ecx*4]
    sub     ebx, edi
    cmp     ebx, 0
    jge     positive
    neg     ebx

positive:

    cmp     edx, ebx
    jle     skip
    mov     edx, ebx
    mov     esi, ecx

skip:

    dec     ecx
    cmp     ecx, 1h
    jge     iter

    mov     eax, [nums + esi*4]
    call    print_eax

    ; Exit the process:
    push	0
    call	exit