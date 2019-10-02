include 'emu8086.inc'
.model small
.stack 100h
.data

.code 
main proc 
        xor ax,ax    
        xor cx,cx
        input:
         mov ah,1
         int 21h
         cmp  al,13
         je input_end
         xor ah,ah
         inc cx
         push ax  
         jmp input
         input_end:
         
         printn
          xor dx,dx
         output:
                cmp cx,0
              
                je output_end
                
                pop ax
                mov ah,2
                mov dl,al
                int 21h
                dec cx
                jmp output
            output_end:
     
main endp
end main