include emu8086.inc
.model small
.stack 100h
.data
array db 100 dup(0) 
array1 db 100 dup(0)
array2 db 100 dup(0)
size1 dw ?
size2 dw ?
size dw ?
ms dw ?
 
.code

main proc
    mov ax,@data
    mov ds,ax
    
    ;to input first number
    call scan_array1
    ;to input second number
    call scan_array2
     
    call addition
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
    forp:
        cmp bx,size
        je endprint
        mov ah,2   
        mov dl,array[bx]
        add dl,48
        int 21h
        inc bx
    jmp forp
    endprint:
    ret
    
print_array endp

;input for array
scan_array1 proc
    xor bx,bx
    mov ah,1    
    for1:
        int 21h
        mov size1,bx
        cmp al,13
        je endscan1
        sub al,48 
        mov array1[bx],al
        inc bx
    jmp for1
    endscan1: 
    printn
    ret
    
scan_array1 endp

scan_array2 proc
    xor bx,bx
    mov ah,1    
    for2:
        int 21h
        mov size2,bx
        cmp al,13
        je endscan2
        sub al,48 
        mov array2[bx],al
        inc bx
    jmp for2
    endscan2: 
    printn
    ret
    
scan_array2 endp

addition proc
    mov ax,size1
    mov size,ax
    cmp ax,size2
    jg next1
    ;if ax(size1) < size2
    mov ax,size2    
    mov size,ax
    next1:
    mov bx,size ;big size in bx
    inc size;increament size
    dec size1
    dec size2
    mov si,size1
    mov di,size2 
    xor cx,cx
    loop1:
    xor ah,ah
    cmp bx,0          ;if size <0
    jl endsum
    mov al,array1[si]
    add al,array2[di]
    add al,cl
    xor cl,cl
    cmp al,9
    jle nex
    sub al,9
    dec al
    mov cl,1 
    nex:
    mov array[bx],al
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;comple;;;;;;;;
    
    dec bx
    dec si
    dec di     
    jmp loop1
    endsum:    
    printn
    ret
addition endp
end main
