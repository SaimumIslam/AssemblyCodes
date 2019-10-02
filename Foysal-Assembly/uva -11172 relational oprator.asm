;uva -11172 relational oprator 
.model small
.stack 100h

.data
     num1 db ? 
.code

main proc
     
    //input data for test case
    mov ah,1
    int 21h
    mov bl,al
    
    
    check:
    
    //print new line
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    //compare test case gratter than zero
    cmp bl,48
    jg loop1
    jmp exit:
    
    loop1:
    
    //input first num
    mov ah,1
    int 21h
    mov num1,al
    
    //input second num
    int 21h
    
    //decrease the test case
    dec bl
    
    cmp al,num1
    jg less
    
    cmp al,num1
    jl gra
    
    cmp al,num1
    je eq
    
     //num1<num2
    less:
    mov ah,2
    mov dl,60
    int 21h
    jmp check
    
    //num1>num2
    gra:
    mov ah,2
    mov dl,62
    int 21h
    jmp check
    
    //num1=num2
    eq:
    mov ah,2
    mov dl,61
    int 21h
    jmp check
    
    exit: 
    mov ah,4ch
    int 21h
    main endp
end main