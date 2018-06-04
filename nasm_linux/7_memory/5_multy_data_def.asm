; Basic Assembly
; ==============

; 4 consecutive bytes with value 12
array_bytes: 
%rep (2*2)
    db  12h
    db  0ffh
%endrep

array_words: 
%rep 5
    dw  5678h
%endrep

array_dwords: 
%rep 6
    dd  0aabbccddh
%endrep


array_qwords: 
%rep 7
    dq  9999666644448888h
%endrep
