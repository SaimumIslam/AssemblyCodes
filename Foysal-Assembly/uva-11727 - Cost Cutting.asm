;11727 - Cost Cutting
include 'emu8086.inc'

.model small
.stack 100h
.data

  num1 db ?
  num2 db ?
  num3 db ?
  count db ?
  sum db ?
  p db ?
   
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

mov sum,dl

;second number
call scan_num
mov num2,dl

add sum,dl
;Third number
call scan_num
mov num3,dl

add sum,dl

mov ah,num1
mov al,num2
call get_big ;ah=n1>n2 ?n1:n2 
mov al,num3
call get_big ;ah=ah>n3?ah:cn3
mov p,ah     ;p=ah largest

mov ah,num1
mov al,num2
call get_small ;al=n1<n2 ? n1:n2
mov ah,num3    ;al=al<n3 ? ah:n3
;al smallest
add al,p
sub sum,al
xor cx ,cx
mov cl,sum



;algorithm is here


;out will given in cx
output:
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

;ah>al?al:ah result in ah
get_big proc
    cmp al,ah
    jl big
    mov ah,al;ah=al
    big:  ;ah=big   
    ret
get_big endp

;ah<al?al:ah result in al
get_small proc
    cmp ah,al
    jg sm
    mov al,ah;ah=al
    sm:  ;al=sm   
    ret
get_small endp

end main               
