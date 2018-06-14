BITS 32
global main
extern exit

%include "training.s"

section .data
    str1:   db  'Hello World', 0

    str2:   db  "Hello World", 0

    str3:   db  48h,65h,6ch,6ch,6fh,0   ; Hello

    str4:   db  'Hell'
            db  'o world', 0

    str5:   db  'Hello',20h,'world',0

    str6:   db  'Line 1', 0ah
            db  'Line 2',0

section .text

main:

    push    0
    call    exit
