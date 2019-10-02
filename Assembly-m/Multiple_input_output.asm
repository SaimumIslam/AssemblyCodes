.MODEL SMALL
.STACK 100H 
.CODE

MAIN PROC
    
    MOV BH,0
    MOV BL,10d
    
INPUT:
    MOV AH,1
    INT 21H
    CMP AL,13d
    JNE NUMBER  
    JMP EXIT

NUMBER: 
    SUB AL,30h
    MOV CL,AL
    MOV AL,BH
    MUL BL
    ADD AL,CL
    MOV BH,AL
    JMP INPUT     
    
EXIT: 
    MOV AX,0
    MOV AL,BH
    MOV CL,10D       
    
    MOV BX,0000H
    
STORE:
    DIV CL
    MOV [0000H+BX],AH
    ADD BX,2h
    MOV AH,0
    CMP AL,0
    JNE STORE
      
    MOV AH,2
    MOV DL,0Ah
    INT 21H   
    MOV DL,0Dh
    INT 21H
    
PRINT:    
    SUB BX,2h

    MOV DL,[0000h+BX] 
    ADD DL,30h
    INT 21H
    CMP BX,0
    JNE PRINT
    
 
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN             

