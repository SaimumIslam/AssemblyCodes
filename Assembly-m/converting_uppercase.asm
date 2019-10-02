.model small
.stack 100h
.data

cr equ 0dh
lf equ 0ah
msg1 db 'Enter a lowercase letter : $'
msg2 db cr,lf,'The uppercase letter is : '
char db ?,'$'
.code
main proc 
    
    ;initialize data segment
    mov ax,@data
    mov ds,ax 
    
    ;showing msg
    lea dx,msg1
    mov ah,9
    int 21h
    
    ;taking input
    mov ah,1
    int 21h
    mov bl,al 
    
    ;uppercasing
    sub bl,32
    mov char,bl ;saving bl to char 
    
    ;output
    lea dx,msg2
    mov ah,9
    int 21h
    
    ;dos exit
    mov ah,4ch
    int 21h
    
    main endp
end main
    