include emu8086.inc
.model small
.stack 100h
.data

num db 11 dub(48)
 
.code

main proc
    mov ax,@data
    mov ds,ax
    
    
    xor bx,bx
    mov cx,10
    
    for:
        call scan
        mov num[bx],dl
        inc bx
    loop for
    
    printn
    
    xor bx,bx
    mov cx,10
    xor ah,ah
    for2:   
        mov al,num[bx]
        call print_num
        print " "
        inc bx
    loop for2
    
    
    mov ah,4ch
    int 21h
    main endp

DEFINE_PRINT_NUM      ;input will give in ax
DEFINE_PRINT_NUM_UNS  ; required for print_num.


;inpul will get in dl
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
    sub al,'0'
    add dl,al
    jmp input
    endScanc:
    printn
    endScan:
    ret
scan endp

end main
