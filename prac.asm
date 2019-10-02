.model small
.stack 100h
.data
     num db "Number$"
     big db "Upper Case$"
     small db "Lower Case$"
     spe db "Special Character$"
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    ;input
    mov ah,1
    int 21h
    
    ;new line
    ;mov ah,2
    ;mov dl,0dh
    ;int 21h
    ;mov dl,0ah
    ;int 21h
    
     
    ;97<=al 
    cmp al,97
    jge lower
    
    ;65<=al
    cmp al,65
    jge Upper
    
    ;48<=al
    cmp al,48
    jge number
    
    jmp specialP
    
    number:
    cmp al,58
    jl numberP
    jmp specialP
    
    Upper:
    cmp al,91
    jl upperP
    jmp specialP
    
    lower:
    cmp al,122
    jle lowerP
    jmp specialP
    
    numberP:
    mov ah,9
    lea dx,num
    int 21h
    jmp exit
    
    upperP:
    mov ah,9
    lea dx,big
    int 21h
    jmp exit
    
    lowerP:
    mov ah,9
    lea dx,small
    int 21h
    jmp exit
    
    specialP:
    mov ah,9
    lea dx,spe
    int 21h
    
    exit:       
    mov ah,4ch
    int 21h
    main endp
end main