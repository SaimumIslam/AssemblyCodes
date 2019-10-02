org 100h

main proc
    ;input section
    start:
    call scan ;input in dl
    mov bh,dl ;now 1st input in bh
    call scan ;input in dl
    mov ax,0  ;clear Ax
    mov al,dl ;2nd input in al;
                               
    ;algorithm section
    
    
    ;output section
    ;result must be kept in ax
    call print ;output result;
    mov dl,10  ;new line
    int 21h
    mov dl,13  ;carriage return
    int 21h
    
    jmp start ;take input again..make looping
    
    endmain:
    ret
main endp

;integer multidigit
;inputed integer will be dl

scan proc
    mov dx,0
    input:
    mov ah,1
    int 21h
    cmp al,' ';if get space
    je endScan
    cmp al,13 ;if get enter
    je endScan
    push ax
    mov al,10
    mul dl    ;al=dl*al;acctual(ax=dl*ax)
    mov dl,al
    pop ax
    sub al,'0'
    add dl,al
    jmp input
    endScan:
    ret
scan endp

;prints multidigit integer
;the input will be in ax

print proc
    xor cx,cx
    
    ;count the digit in cx
    
    loop1:
    cwd
    mov bx,10
    idiv bx
    push dx
    inc cx
    cmp ax,0
    jg loop1
    
    ;print by single digit
    
    loop2:
    pop dx
    add dx,'0'
    mov ah,2
    int 21h
    loop loop2
    ret
print endp 

    