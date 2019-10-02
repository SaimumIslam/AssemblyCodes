.model small
.stack 100h
.code
main proc 
    
    L: MOV CL,5
      
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    
    INT 21H
    MOV BH,AL
    
    
    CMP BL,BH
    JG L1
    
     SUB BH,BL
    ADD BH,48
    MOV DL,BH
    MOV AH,2
    INT 21H
    DEC CL
     JNZ L 
     JMP EXIT
    
    L1:SUB BL,BH
    ADD BL,48
      MOV AH,2
    MOV DL,BL
  
    INT 21H
    DEC CL
    JNZ L 
    JMP EXIT
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    END MAIN
    