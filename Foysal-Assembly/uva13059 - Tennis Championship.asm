;13059 - Tennis Championship
include 'emu8086.inc'
.model small
.stack 100h
.data
num1 db ?
.code
mov ax,@data
mov ds,ax
loop1: 
call   scan           ; get number in dl.
mov    num1, dl         ; copy the number to num1.
dec dl
xor ah,ah
mov al,dl
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