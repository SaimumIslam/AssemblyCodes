;uva 12992
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
printn

loop2:

push ax
cmp al,count
jg end   

;first number in dl     
call scan_num
;algorithm is here
mov al,2
mul dl

dec al
mov cx,ax

;out will given in cx
output:
printn
print "case"
pop ax
push ax
call print_num
print " :"
mov ax,cx
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
