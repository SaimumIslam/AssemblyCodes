.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
    MOV AH,1
    INT 21H        ; INPUT
    MOV BL,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H        ; NEW LINE
    MOV DL,0DH
    INT 21H
    
   
    MOV DL,BL      ; OUTPUT
    INT 21H
    
   EXIT:
   MOV AH,4CH
   INT 21H         ;EXIT
   MAIN ENDP
END MAIN