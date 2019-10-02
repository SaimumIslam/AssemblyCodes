;12646 - zero or one
include 'emu8086.inc'
.model small
.stack 100h
.data

num1 db ?
num2 db ?
num3 db ?

.code

mov ax,@data
mov ds,ax

xor ax,ax

loop1: 

call   scan           ; get number in dl.
mov    num1, dl         ; copy the number to num1.

call   scan           ; get number in dl.
mov    num2, dl         ; copy the number to num2.

call   scan           ; get number in dl.
mov    num3, dl         ; copy the number to num2.

mov bh,num1   ;bh=n1
cmp bh,num2   ;n1==n2
jne nq
cmp bh,num3
je none

printn "c"
jmp loop1
    
nq: 
cmp bh,num3
jne nql2

printn "b"
jmp loop1
               
nql2:
printn "a"
jmp loop1
    
none:
Printn "*"   

jmp loop1

    exit:
    mov ah,4ch
    int 21h
    
    
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

    
endp
