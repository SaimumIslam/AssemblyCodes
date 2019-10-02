.MODEL SMALL
.STACK 100H
.DATA
FIRST DB ?
SECOND DB ? 
.CODE


MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV BH,0
    MOV BL,10d
    MOV FIRST,0 
    MOV SECOND,0
    
INPUT:
    MOV AH,1
    INT 21H
    CMP AL,13d
    JNE NUMBER
    CMP FIRST,0
    JE FIRST_INPUT
    CMP SECOND,0
    JE SECOND_INPUT 
   
    
FIRST_INPUT: 
    MOV FIRST,BH
    MOV BH,0
    
    MOV AH,2
    MOV DL,0Ah
    INT 21H   
    MOV DL,0Dh
    INT 21H
    
    JMP INPUT
       
    
      
SECOND_INPUT:
    MOV SECOND,BH
    MOV BH,0
    JMP MINUS
 
    
NUMBER: 
    SUB AL,30h
    MOV CL,AL
    MOV AL,BH
    MUL BL
    ADD AL,CL
    MOV BH,AL
    JMP INPUT     

MINUS:
    MOV BL,FIRST
    MOV BH,SECOND
    SUB BL,BH
    
EXIT: 
    MOV AX,0
    MOV AL,BL
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

