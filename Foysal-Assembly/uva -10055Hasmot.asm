;uva -10055Hasmot
.model small
.stack 100h

.data
     num1 db ? 
.code

main proc
     
    
     check:
    
    ;input first num
    mov ah,1
    int 21h
    mov num1,al
    
    ;input second num
    int 21h
    
    cmp al,num1
    jge less
    
    cmp al,num1
    jl gra
    
     ;num1<num2
    less:
    sub al,num1
    add al,48
    
    mov ah,2
    mov dl,al
    int 21h
    jmp check
    
    ;num1>num2
    gra:
    mov bl,num1
    sub bl,al
    add bl,48
    
    mov ah,2
    mov dl,bl
    int 21h
    jmp check
    
    exit: 
    mov ah,4ch
    int 21h
    main endp
end main