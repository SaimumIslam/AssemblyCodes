;uva 11936 - The Lazy Lumberjacks
include 'emu8086.inc'

.model small
.stack 100h
.data

  num1 db ?
  num2 db ?
  num3 db ?
 
  count db ?
   
.code
main proc
    
mov ax,@data
mov ds,ax
 
;test case
call scan_num
mov count,dl
xor ah,ah
mov al,1

loop2:

push ax
cmp al,count
jg end   

xor cx,cx
;first number     
call scan_num
mov num1,dl
         
mov cl,dl     ;cl=num1
;second number
call scan_num
mov num2,dl

add cl,dl   ;cl=num1+num2

;second number
call scan_num
mov num3,dl

cmp cl,num3   ;1+2>3
jle invalid
add dl,num2   ;2+3>1
cmp dl,num1
jle invalid
mov dl,num3
add dl,num1   ;1+3>2
cmp dl,num2
jle  invalid

printn "OK"
jmp next
invalid:
printn "Wrong!"
next:
;algorithm is here

pop ax
inc ax
jmp loop2


end:
pop ax
mov ah,4ch
int 21h

main endp
 
define_print_num_uns
define_print_num

;input will be in dl

scan_num proc
    mov dx,0
    input:
    mov ah,1
    int 21h
    cmp al,32;if get space
    je endscan
    cmp al,13 ;if get enter
    je endscanc
    push ax
    mov al,10
    mul dl    ;al=dl*al;acctual(ax=dl*ax)
    mov dl,al
    pop ax
    sub al,48
    add dl,al
    jmp input
    endscanc:
    printn
    endscan:
    ret
scan_num endp

end main               
