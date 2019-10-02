.model small
.stack 100h
.data

cr equ 0dh
lf equ 0ah
msg1 db 'enter a character : $'
upper db cr,lf,'It is an uppercase letter $'
lower db cr,lf,' It is a lowercase letter $'
digit db cr,lf,'It is a digit $'
special db cr,lf,'It is a special case $'

.code
main proc
    
    ;initialize data segment
    mov ax,@data
    mov ds,ax

    ;printing input message
    lea dx,msg1
    mov ah,9
    int 21h
    
    ;taking input
    mov ah,1
    int 21h
    mov bl,al
    
    ;cheaking characters
    cmp bl,48
    jge digit_2nd
    jmp special_print  
    
 digit_2nd:
      cmp bl,57
      jle digit_print
      jmp up_check
      
digit_print:
   lea dx,digit
   mov ah,9
   int 21h
   jmp exit
   
up_check:
   cmp bl,65
   jge up_check2
   jmp special_print
   
   
up_check2:
     cmp bl,90
     jle up_print 
     jmp low_check
     
up_print:
    lea dx,upper
    mov ah,9
    int 21h
    jmp exit
    
low_check:
    cmp bl,97
    jge low_check2 
    jmp special_print
    
low_check2:
    cmp bl,122
    jle low_print
    jmp special_print
    
low_print:
    lea dx,lower
    mov ah,9
    int 21h
    jmp exit
    
special_print:
    lea dx,special
    mov ah,9
    int 21h
    jmp exit                          
   
   
exit:
mov ah,4ch
int 21h
main endp
end main 