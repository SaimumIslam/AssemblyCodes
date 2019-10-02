
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

 .model small
 .stack 100h
 .code
 main proc
    mov ah,2
    mov dl,49
    mov cl,9
    display-loop:int 21h 
    
    inc dl
    dec cl
 
    jnz display-loop
    
    mov ah,4ch
    int 21h
    
    main endp
     end main
     




