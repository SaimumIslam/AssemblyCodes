.model small
.stack 100h
.code
main proc
       
       ;printing loop
       mov cl,9
       mov bl,49 
       
       mov dl,bl
       mov ah,2
       int 21h
     
       inc bl
       dec cl
       cmp cl,0
       jnz looping 
       
looping:
      
       mov ah,2
       mov dl,0dh
       int 21h
       mov dl,0ah
       int 21h 
        mov dl,bl
        int 21h 
        inc bl
        dec cl
        cmp cl,0
        jnz looping
        jmp exit   
       
exit:       
  mov ah,4ch
  int 21h
  main endp
  end main 
      