;uva-12468 Zapping
include 'emu8086.inc'
.model small
.stack 100h
.data

num1 db ?
num2 db ?
count db ?
t db ?


.code

mov ax,@data
mov ds,ax

xor ax,ax

loop1:
mov count,0
mov t,0 

call   scan           ; get number in dl.
mov    num1, dl         ; copy the number to num1.

call   scan           ; get number in dl.
mov    num2, dl         ; copy the number to num2.
cmp num1,0
jg next
cmp dl,0
jl exit

cmp num1,0
jne nextn2
mov num1,100
nextn2:
cmp num2,0
jne next
mov num2,100
next:

mov ah,num1
mov al,num2
call get_big   ;get the large
mov bl,ah
mov ah,num1    ;get the small
call get_small
mov num2,al    ;small num2
mov num1,bl    ;big num1

loop2:
cmp al,bl
je next3
inc count
inc al
jmp loop2:
next3:
mov al,num2
add al,100    ;al=num2+100

loop4:
cmp bl,al
je next4
inc t
inc bl
jmp loop4

next4:

mov ah,count
mov al,t
call get_small


xor ah,ah
output:
call   print_num      ; print number in AX
printn

jmp loop1

exit:
mov ah,4ch
int 21h

ret               ; return to operating system.

define_print_num
define_print_num_uns  ; required for print_num.


;integer multidigit
;inputed integer will be dl

scan proc
    mov dx,0
    input:
    mov ah,1
    int 21h
    cmp al,32;if get space
    je endScan
    cmp al,13 ;if get enter
    je endScanc
    push ax
    mov al,10
    mul dl    ;al=dl*al;acctual(ax=dl*ax)
    mov dl,al
    pop ax
    sub al,48
    add dl,al
    jmp input
    endScanc:
    printn
    endScan:
    ret
scan endp

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


end  