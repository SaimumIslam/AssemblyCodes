.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL 
    INT 21H
    
    MOV CL,AL
    
    SUB BL,CL    ; BL = BL-CL
    
    ADD BL,48    ; BL = BL+48
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
   EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN