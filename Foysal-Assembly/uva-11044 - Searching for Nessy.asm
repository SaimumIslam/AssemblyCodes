;11044 - Searching for Nessy
include 'emu8086.inc'

.model small
.stack 100h
.data

  num1 db ?
  num2 db ?
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

;first number     
call scan_num
mov num1,dl

;second number
call scan_num
mov num2,dl

mov bl,3
xor ah,ah
mov al,num1 ;a;=num1/3
div bl
xor ah,ah
push ax
mov al,num2
div bl     ;al=mum2/3
pop bx     ;bl=num1/3
xor ah,ah
mul bl

;algorithm is here

;out will given in ax
output:
call print_num
printn
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
