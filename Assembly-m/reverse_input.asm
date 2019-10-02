.model small
.stack 100h 
.data
msg db 'enter the characters : $'
.code
main proc
    
    ;initialize ds
    mov ax,@data
    mov ds,ax
    
    ;display msg
    lea dx,msg
    mov ah,9
    int 21h
    
    ;display user prompt
    mov ah,2
    mov dl,':'
    int 21h
    
    ;initialize character count
    xor cx,cx
    
    ;read character
    mov ah,1
    int 21h
     
    ;while character is not a carraige return
    
while:
    cmp al,0dh
    je end_while
    push ax
    inc cx
    int 21h
    jmp while
    
end_while:
    mov dl,al
    mov ah,2
    int 21h
    mov dl,0ah
    int 21h
    jcxz exit
    
 ;for pop and print char
 
 top:
    pop dx
    int 21h
    loop top
    
 exit:
    mov ah,4ch
    int 21h
    main endp
end main
