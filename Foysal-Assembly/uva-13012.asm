;uva-13012
include 'emu8086.inc'
.model small
.stack 100h
.data
num1 db ?
count db ?
.code
mov ax,@data
mov ds,ax
xor ax,ax
loop1: 
mov count,0
call   scan          ; get number in dl.
printn
mov    num1, dl         ; copy the number to num1.
mov cx,5              ;five input
inp:
call   scan           ; get number in dl.
cmp dl,num1
jne next
inc count
next:
;printn
loop inp               
output:
xor ah,ah
mov al,count
printn
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