include emu8086.inc
.model small
.stack 100h
.data

;array name must be array to use print_array and scan-array 
array db 10 dub(0)
size dw ?
 
.code

main proc
    mov ax,@data
    mov ds,ax
    
    ;to input array
    call scan_array
    
    ;print array
    call print_array  
    
    mov ah,4ch
    int 21h
    main endp

DEFINE_PRINT_NUM      ;input will give in ax
DEFINE_PRINT_NUM_UNS  ; required for print_num


;print for array         
print_array proc
    xor bx,bx    
    for2:
        cmp bx,size
        jg endprint
        mov ah,2   
        mov dl,array[bx]
        int 21h
        inc bx
    jmp for2
    endprint:
    ret
    
print_array endp

;input for array
scan_array proc
    xor bx,bx    
    for:
        mov ah,1
        int 21h
        mov size,bx
        cmp al,13
        je endscan 
        mov array[bx],al
        inc bx
    jmp for
    endscan: 
    printn
    ret
    
scan_array endp

end main
