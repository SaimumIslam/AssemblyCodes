;UVA 12149 - Feynman
include 'emu8086.inc'
.model small
.stack 100h
.data

num1 db ?
d dw ?

.code

mov ax,@data
mov ds,ax

xor ax,ax

loop1: 

call   scan           ; get number in dl.
mov    num1, dl         ; copy the number to num1.

mov  d,6

cmp dl,0     ;if (num1<0)
jl exit

add dl,1        ;dl=n+1
xor ax,ax
mov al,dl       ;al=n+1
xor ah,ah
mul num1          ;ax=al*num1
push ax           ;ax=n*n+1
mov al,num1
mov bl,2
mul bl          ;ax=2*num1
add ax,1        ;ax=ax+1
pop bx          ;bx=n*n+1
mul bx          ;Dxax=ax*bx
div d           ;ax=dxax/d(6)


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

end  