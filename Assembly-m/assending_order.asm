.model small
.stack 100h
.data

smallest db ?,'$'
smaller db ?,'$'
small db ?,'$'
count equ 35h 
.code
main proc
    
    ;initialize ds
    mov ax,@data
    mov ds,ax  
    
     mov ch,5
looping:    
    ;taking inputs
    mov ah,1
    int 21h
    mov bl,al ;bl=4  bh=3 cl=5
    int 21h
    mov bh,al
    int 21h
    mov cl,al 
    
    ;carriage return and line feed
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    
    ; compearing inputs
    cmp bl,bh
    jl bl_is_small
    jmp bh_is_small 
    
 bl_is_small:
    cmp bl,cl
    jl bl_is_smallest
    jnl cl_is_smallest
    
 bl_is_smallest:
  mov smallest,bl
  cmp bh,cl
  jl bh_is_smaller
  jnl cl_is_smaller
  
bh_is_smaller:  
  mov smaller,bh
  mov small,cl
  jmp print 
  
cl_is_smaller:
  mov smaller,cl
  mov small,bh 
  jmp print 
    
bh_is_small:
    cmp bh,cl
    jl bh_is_smallest
    jmp cl_is_smallest
    
bh_is_smallest:
    mov smallest,bh
    cmp bl,cl
    jl bl_is_smaller
    jnl cl_is_smaller2
    
bl_is_smaller:     
    mov smaller,bl
    mov small,cl 
    jmp print
    
cl_is_smaller2:
    mov smaller,cl
    mov small,bl 
    jmp print
    
cl_is_smallest:
    mov smallest,cl
    cmp bl,bh
    jl bl_is_smaller2
    jnl bh_is_smaller2
    
bl_is_smaller2:    
    mov smaller,bl
    mov small,bh
    jmp print
    
bh_is_smaller2:
    mov smaller,bh
    mov small,bl
    jmp print
   
   
      ;printing output
print:      
      mov ah,9
      lea dx,smallest
      int 21h
      lea dx,smaller
      int 21h
      lea dx,small
      int 21h
      
         ;carriage return and line feed
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
      dec ch
      jnz looping 
      jmp exit
      
    
    
 exit:
   mov ah,4ch
   int 21h
   main endp
end main 