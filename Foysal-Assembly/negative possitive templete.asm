.model small
.stack 100h
.data

.code
main proc
    
   loop1:  
   call indec
   push ax
   
   call newline   
   
   ;output number 
   pop ax
   call outdec
   call newline
   jmp loop1
    
    mov ah,4ch
    int 21h
    main endp

 ;procedure to print newline 
 newline proc
    push ax
    push dx
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h  
    
    pop ax
    pop dx
   ret
   newline endp
 
 
;procedure to input multiple charecter
 indec proc
    push bx
    push cx
    push dx
    
 begin:
 
 xor bx,bx;bx holds total
 xor cx,cx;cx holds sign
 
  ;read char
 mov ah,1
 int 21h
 
 ;cmp negative or positive
 cmp al,'-'
 je minus
 cmp al,'+'
 je plus
 jmp repeat
 
 minus:
 mov cx,1
 
 plus: 
 int 21h
 
 repeat:
 cmp al,'0'
 jnge not_digit
 cmp al,'9'
 jnle not_digit
 
 and ax,000fh
 push ax
 
 ;total=total*10+digit
 mov ax,10
 mul bx
 pop bx
 add bx,ax
 
 ;read character
 mov ah,1
 int 21h
 cmp al,0dh ;carraige return ?
 jne repeat  ;no
 
 mov ax,bx
 
 or cx,cx ;negative number ?
 je exit  ;no ,exit 
 
 neg ax
 
 exit:
 pop bx
 pop cx
 pop dx
 ret
 
 ;if illegal character enter
 not_digit:
 mov ah,2
 mov dl,0dh
 int 21h
 mov dl,0ah
 int 21h
 jmp begin
 
 indec endp
 
 
 
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
 
 end main