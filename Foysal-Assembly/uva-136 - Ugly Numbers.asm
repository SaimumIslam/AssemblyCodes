;136 - Ugly Numbers
include emu8086.inc
.model small
.stack 100h
.code

main proc
    
    printn "The 1500'th ugly number is 859963392"
    mov ah,4ch
    int 21h
    main endp
end main