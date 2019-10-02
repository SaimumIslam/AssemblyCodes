;out put will give in ax; 
 ;procedure to output multiple character
 
 outdec proc
    push ax
    push bx
    push cx
    push dx
  
; print message    
  
  or ax,ax
  jge end_if
  
  push ax
  mov dl,'-'
  mov ah,2
  int 21h
  pop ax
  neg ax
  
end_if:
xor cx,cx
mov bx,10d

repeat2:
xor dx,dx
div bx
push dx
inc cx

or ax,ax
jne repeat2

;for printing

mov ah,2

print_loop:
pop dx
or dl,30h
int 21h
loop print_loop

;end for

pop ax
pop bx
pop cx
pop dx
ret 
 
 outdec endp
 



