; Basic Assembly
; ==============
; 
; Memory - Structures
; -------------------
;
; Bathrooms
; @@@@@@@@@
; 
; 0.    Assemble and run this program.
;
; 1.    How many inputs does this program require? 
;       Try to give the program some inputs, and check out the results. 
;
; 2.    Read the program's code below, and try to understand what does it do. 
;       Try to describe it as simply as you can. Add comments if needed.
;
; 3.    Try to draw the city's map.
;

BITS 32
global main
extern exit

%include "training.s"

; Coordinate structure:
struc COORD
    .x:     resb 1
    .y:     resb 1
    .size:
endstruc

; Dimensions of the city:
CITY_WIDTH equ 12
CITY_HEIGHT equ 11

; ===============================================
section .data
    ; List of bathroom's coordinates in the city:
    bathrooms:  db    4,3
                db    7,3
                db    3,6
                db    8,6
                db    4,7
                db    7,7
                db    5,8
                db    6,8
    num_bathrooms: equ ($ - bathrooms) / COORD.size
    ; NOTE: $ means the address of the current location.
    ; This is a trick used to calculate the size of some chunk of data.
    ; $ can be used anywhere in the assembly source file. (In the code section
    ; too.)

; ===============================================
section .bss
    user_location:             resb COORD.size
    closest_bathroom_index:    resd 1
    closest_bathroom_dist:     resd 1
    
; ===============================================
section .text

main:

    mov     dword [closest_bathroom_dist], 7fffffffh
    
    ; Read current location from user:
    call    read_hex
    mov     edx,eax
    call    read_hex

    ; First make sure that the location is inside the city.
    ; If not, exit the program.

    cmp     edx,CITY_WIDTH
    jb      dont_exit1
    ; NOTE: We can exit the program whenever we want using the two following
    ; instructions:

    ; Exit the program:
    push    0
    call    exit
dont_exit1:
    
    cmp     eax,CITY_HEIGHT
    jb      dont_exit2
    ; Exit the program
    push    0
    call    exit
dont_exit2:

    ; Keep the user's location in memory.
    mov     byte [user_location + COORD.x],dl
    mov     byte [user_location + COORD.y],al

    mov     esi,bathrooms
    mov     ecx,num_bathrooms

calc_one_dist:
    ; edi will store the square of the distance:
    xor     edi,edi

    ; (user_location.x - bathroom.x)^2
    movzx   eax,byte [user_location + COORD.x]
    movzx   ebx,byte [esi + COORD.x]
    sub     eax,ebx
    imul    eax
    add     edi,eax

    ; (user_location.y - bathroom.y)^2
    movzx   eax,byte [user_location + COORD.y]
    movzx   ebx,byte [esi + COORD.y]
    sub     eax,ebx
    imul    eax
    add     edi,eax

    ; Now edi == distance(user_location,current_bathroom)^2
    cmp     edi,dword [closest_bathroom_dist]
    jge     not_closer

    ; Update the closest distance to be edi:
    mov     dword [closest_bathroom_dist],edi

    ; Update the index of closest bathroom to be (NUM_BATHROOMS - ecx):
    mov     edx,ecx
    sub     edx,num_bathrooms
    neg     edx
    mov     dword [closest_bathroom_index],edx
not_closer:
    add     esi,COORD.size
    loop    calc_one_dist

    ; Print results:
    ; --------------

    ; Print a delimiter:
    call    print_delimiter

    ; Print closest distance (Squared):
    mov     eax, dword [closest_bathroom_dist]
    call    print_eax

    ; Print another delimiter:
    call    print_delimiter

    mov     edi,bathrooms
    mov     esi,dword [closest_bathroom_index]
    lea     esi,[edi + COORD.size * esi]

    ; Print x and y coordinates:
    movzx   eax,byte [esi + COORD.x]
    call    print_eax

    movzx   eax,byte [esi + COORD.y]
    call    print_eax

    ; Exit the program:
	push	0
	call	exit