; Write a program that finds every double word (4 bytes) that satisfies the
;      following condition: When decomposed into 4 bytes, if we multiply those
;      four bytes, we get the original double word number.
BITS 32

%include 'training.s'

global main
extern exit

section .text


main:

    mov     esi,    0h

repeat:

    mov     eax,    esi
    mov     bx,     ax
    mov     esi,    eax

    ; aabbcc[dd] -> eax:000000[dd]
    mov     eax,    0h
    mov     al,     bl

    ; aabb[cc]dd -> ecx:000000[cc]
    mov     ecx,    0h
    mov     cl,     bh

    ; edx:eax -> eax * ecx - 000000[dd] * 000000[cc]
    mul     ecx

    ; ; temporary put the result in edi
    mov     edi,    eax

    mov     ecx,    10000h
    mov     eax,    esi
    xor     edx,    edx
    div     ecx

    ; put first 2 bytes in bx
    mov     bx,     ax

    ; put temporal result back to eax
    mov     eax,    edi

    ; aa[bb]ccdd -> ecx:000000[bb]
    mov     ecx,    0h
    mov     cl,     bl
    mul     ecx

    ; [aa]bbccdd -> ecx:000000[aa]
    mov     ecx,    0h
    mov     cl,     bh
    mul     ecx

    cmp     eax,    esi
    je      print
    jmp     continue


print:

    call    print_eax
    mov     eax,    esi
    call    print_eax


continue:

    cmp     esi,    0ffffffffh
    je      done
    inc     esi
    jmp     repeat

done:

    push    0
    call    exit
