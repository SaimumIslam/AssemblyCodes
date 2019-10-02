include emu8086.inc
.model small
.stack 100h
.data

;array name must be array to use print_array and scan-array 
array db 11 dub(48)
num db ?
 
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov cx,3 ;declear the number of input
    ;to input array
    call scan_array
    
    mov cx,3
    call sort_array
    
   
     
    mov cx,3  ;to the index u want to print
    ;print array
    call print_array  
    
    mov ah,4ch
    int 21h
    main endp

DEFINE_PRINT_NUM      ;input will give in ax
DEFINE_PRINT_NUM_UNS  ; required for print_num


;inpul will get in dl
scan proc
    xor dx,dx
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
;print for array         
print_array proc
    xor bx,bx
    xor ah,ah
    for2:   
        mov al,array[bx]
        call print_num
        print " "
        inc bx
    loop for2
    ret
    
print_array endp

;input for array
scan_array proc
    xor bx,bx
    
    for:
        call scan ;input in dl
        mov array[bx],dl
        inc bx
    loop for 
    printn
    ret
    
scan_array endp

sort_array proc
    xor bx,bx
    mov ax,cx
    for3:
        push cx ;cx=0
        mov cx,ax
        dec cx
        xor si,si
        push ax
        for4:
            xor  dl,dl
            mov si,bx
            inc si
            mov al,array[bx]
            mov dl,array[si]
            cmp al,array[si]
            jle next
            mov array[bx],dl
            mov array[si],al
            
            next:
            ;inc si
        loop for4
        inc bx
        pop ax
        pop cx
    loop  for3
    ret
sort_array endp

end main
