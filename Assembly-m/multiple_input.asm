;input will save in ax 
;procedure to input multiple charecter
 indec proc
    push bx
    push cx
    push dx
    
 begin:
    ;mov ax,@data
    ;mov ds,ax 
   ;lea dx,msg1
    ;mov ah,9
    ;int 21h
 
 mov ah,2
 mov dl,'?'
 int 21h
 
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
 



