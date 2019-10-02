;11689 - Soda Surpler
include 'emu8086.inc'

.model small
.stack 100h
.data

  num1 db ?
  num2 db ?
  num3 db ?
  sum db ?
  max db ?
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

mov max,0

push ax
cmp al,count
jg end   

;first number     
call scan_num
mov num1,dl 
mov sum,dl   ;sum=n1

;second number
call scan_num
mov num2,dl
add sum,dl   ;sum=n1+n2


;third number
call scan_num
mov num3,dl


loop3:
xor ah,ah
mov al,sum
div num3
cmp al,0
je output
add max,al

mov sum,ah
add sum,al

jmp loop3

;algorithm is here


;out will given in cx
output:
xor ah,ah
mov al,max
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
