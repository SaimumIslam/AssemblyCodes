INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA

VAR1 DW ?
TEMP DW ?
MSG1 DB 'PALINGDROM.$'
MSG2 DB 'NOT.$'
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    AND BX,0        ;BX=0
    AND CX,0        ;CX=0
    MOV CL,10D      ;CL=10
    
    INPUT:
    MOV AH,1
    INT 21H
    AND DX,0
    MOV DL,AL
    
    CMP DL,0DH
    JNE NUMBER_IN
    JMP NUMBER_SAVE
    
    NUMBER_IN:
    SUB DX,30H
    AND AX,0
    MOV AX,BX
    MUL CL
    
    ADD AX,DX
    MOV BX,AX
    JMP INPUT
    
    
    
    NUMBER_SAVE:
    MOV VAR1,BX
    
    
    MOV AX,BX
    XOR BX,BX
    XOR DX,DX
    
    CHECK:    
    DIV CL
    ;MOV TEMP,AL
    MOV DL,AH
    XOR AH,AH
    MOV TEMP,AX
    MOV AX,BX
    MUL CL
    ADD AX,DX
    MOV BX,AX
    MOV AX,TEMP
    CMP AX,0
    JE BREAK
    JMP CHECK 
    
    
    BREAK:
    
    MOV DX,VAR1
    
    CMP BX,DX
    JE PRINT_SAME
    JMP PRINT_DIFF
    
    PRINT_SAME:
    PRINTN

    LEA DX,MSG1
    MOV AH,9
    ;MOV DL,1
    INT 21H
    JMP E
    
    PRINT_DIFF:
    PRINTN
    LEA DX,MSG2
    MOV AH,9
    ;MOV DL,2
    INT 21H
    JMP E
    
    
    E:
    
    MAIN ENDP
END MAIN
    
    