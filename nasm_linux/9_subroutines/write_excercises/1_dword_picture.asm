;     Dword picture
    
;     Given a dword x, we create a corresponding ASCII picture.
;     We use the following procedure:

;     0.  We look at the binary representation of x, and divide it to pairs of
;         bits. We then order the pairs of bits in a square of size 4 X 4.

;         Example: 
;           For the dword 0xdeadbeef, we get:
;           0xdeadbeef = 11011110101011011011111011101111
;           0xdeadbeef = 11 01 11 10 10 10 11 01 10 11 11 10 11 10 11 11

;           Ordered in a square:
          
;           11 01 11 10
;           10 10 11 01
;           10 11 11 10
;           11 10 11 11 

;     1.  Next we convert every pair of bits into one ASCII symbol, as follows:

;         00 -> *
;         01 -> :
;         10 -> #
;         11 -> @

;         Example:
;           For the dword 0xdeadbeef, we get the following interesting picture:

;           @:@#
;           ##@:
;           #@@#
;           @#@@

;     Write a program that takes a dword x as input, and prints the corresponding
;     picture representation as output.

;     HINT: Organize your program using functions:

;       - Create a function that transforms a number into the ASCII code of the
;         corresponding symbol. {0 -> * , 1 -> : , 2 -> # , 3 -> @}

;       - Create a function that takes as arguments an address of a buffer and a
;         number x. This function will fill the buffer with the resulting ascii
;         picture. Make sure to leave room for the newline character sequences,
;         and for the null terminator.

;       - Finally allocate a buffer on the bss section, read a number from the
;         user and use the previous function to fill in the buffer on the bss
;         section with the ASCII picture. Then print the ASCII picture to the
;         user.

BITS 32
global main
extern exit

%include "training.s"

section .data
    new_line: db 10

section .bss
    user_number: resd 1
    symbol_string: resd 16
    picture: resd 16 + 10 + 1 ; 16 symbols + 4 line breaks + 1 terminator

section .text

main:

    mov     dword [user_number], 0deadbeafh

    mov     esi, user_number
    mov     edi, symbol_string
    call    transform

    mov     esi, symbol_string
    mov     edi, picture
    call    append_newlines_and_terminator

    mov     esi, picture
    call    print_str


    push    0
    call    exit

append_newlines_and_terminator:

    pushad

    mov     ecx, 0h     ; counter in orignal
    mov     edx, 0h     ; counter in result
    mov     ebx, 4h

.iter:

    mov     eax, [esi+ecx]
    mov     [edi+edx], eax

    push    edx

    mov     eax, ecx
    cmp     eax, 0
    je      .not_append_newline
    cdq
    div     ebx
    cmp     edx, 3h


    jne     .not_append_newline
    pop     edx
    inc     edx
    mov     dword [edi+edx], 10
    jmp     .continue


.not_append_newline:

    pop     edx

.continue:

    inc     edx
    inc     ecx
    cmp     ecx, 16h
    jne     .iter

    popad

    ret


transform:

    push    ecx
    push    eax
    push    edx
    push    ebx

    mov     ecx, 0d            ; ecx - shift counter
    mov     ebx, [esi]          ; ebx - number
    

.next_symbol:

    xor     eax, eax            ; eax - current 2 bits

    mov     edx, 10000000000000000000000000000000b
    and     edx, ebx
    cmp     edx, 10000000000000000000000000000000b
    jne     .skip_10
    add     eax, 10b

.skip_10:

    shl     ebx, 1h
    mov     edx, 10000000000000000000000000000000b
    and     edx, ebx
    cmp     edx, 10000000000000000000000000000000b
    jne     .skip_01
    add     eax, 1b

.skip_01:

    shl     ebx, 1h
    
    call    map_number_to_symbol
    mov     [edi+ecx], eax

    inc     ecx
    cmp     ecx, 16d
    jne     .next_symbol
    
    pop     ebx
    pop     edx
    pop     eax
    pop     ecx
    ret


; Return a symbol basing on the number in the eax.
map_number_to_symbol:
    cmp     eax,    0h
    je      .star

    cmp     eax,    1h
    je      .colon

    cmp     eax,    2h
    je      .sharp

    cmp     eax,    3h
    je      .at

.star:
    mov     eax, '*'
    jmp     .end

.colon:
    mov     eax, ':'
    jmp     .end

.sharp:
    mov     eax, '#'
    jmp     .end

.at:
    mov     eax, '@'
    jmp     .end

.end:

    ret



