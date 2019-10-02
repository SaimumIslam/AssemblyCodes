;12577 - hajj-e-akbar
include 'emu8086.inc'
.model small
.stack 100h
.data
.code 
main proc
    loop1:
    mov ah, 1
    int 21h
    mov dl, al
    loop2:
    int 21h
    cmp al, 13  ;al==enter
    jne loop2
    cmp dl,42  ;dl==*
    je exit 
    cmp dl,68 ;dl==h
    je output
    printn "hajj-e-asghar"
    jmp loop1
    output:
    printn "hajj-e-akbar"
    jmp loop1
   exit:
   mov ah,4ch
   int 21h
main endp