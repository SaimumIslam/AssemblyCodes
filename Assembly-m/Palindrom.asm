INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H  
.DATA
TEMP DB ?
TEMP1 DB ? 
MSG1 DB 'Yep..It is a palindorme. $'
MSG2 DB 'Sorry..It is not a palindrome. $'
.CODE

MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
START:    
    XOR BX,BX 
    MOV CX,CX
    MOV CL,10

INPUT:    
    MOV AH,1
    INT 21H
    CMP AL,13D
    JNE NUMBER
    JMP NEXT

NUMBER:
    SUB AL,30h 
    XOR DX,DX
    MOV DL,AL
    MOV AL,BL
    MUL CL
    ADD AX,DX
    MOV BX,AX
    JMP INPUT  

NEXT:
    PRINTN
    XOR AX,AX
    MOV CL,10
    MOV AX,BX
    XOR CH,CH
    MOV CL,10 
    XOR DL,DL
    
CHECKING:     
    DIV CL
    MOV TEMP,AL
    MOV TEMP1,AH
    MOV AL,DL
    MUL CL
    ADD AL,TEMP1
    MOV DX,AX
    XOR AH,AH                    
    MOV AL,TEMP
    CMP AL,0
    JNE CHECKING
    CMP BX,DX
    JE PRINT 
    JMP PRINT2
   
PRINT:    
    LEA DX,MSG1
    MOV AH,9
    INT 21H  
    JMP EXIT

PRINT2:
    LEA DX,MSG2
    MOV AH,9
    INT 21H 
     
     
EXIT:
    PRINTN
    JMP START
    MAIN ENDP
END MAIN
    
    