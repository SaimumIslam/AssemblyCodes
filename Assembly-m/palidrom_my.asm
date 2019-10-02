.model small
.stack 100h
.data
var1 dw '?'
var2 dw '?'
msg1 dw 'not pallindrom $'
msg2 dw 'it is pallindrom $'
.code
main proc
    
    call indec
    push ax
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    
    
    mov ah,4ch
    int 21h
 
main endp

include D:multiple_input.ASM

