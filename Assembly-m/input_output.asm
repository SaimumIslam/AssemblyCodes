 .model small
 .stack 100h 
 .data
 
 cr equ 0dh
 lf equ 0ah
 msg1 db 'Input a number : $'
 msg2 db cr,lf,'The number is :  '
 char db '?  $'
  
 .code
 main proc
        ;initialize data segment
    mov ax,@data
    mov ds,ax
    
    ;showing message
    lea dx,msg1
    mov ah,9
    int 21h
    
    ;taking input
    mov ah,1
    int 21h ; taking input 
    mov char,al ; saving input to bl
    
    ;carriage return and new line 
    
    ;mov ah,2
    ;mov dl,0dh ;carriage return
    ;int 21h
    ;mov dl,0ah ;line feed
    ;int 21h
    
    ;showing output
     lea dx,msg2
    mov ah,9
    int 21h
    
    ;return to dos 
     
     mov ah,4ch
     int 21h
     
     main endp
 end main
 