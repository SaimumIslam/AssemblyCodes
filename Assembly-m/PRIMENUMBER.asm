INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA

VAR1 DW ?
TEMP DW ?
MSG1 DB 'PRIME.$'
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
    
    MOV CX,0
    MOV CL,2
    MOV AX,VAR1
    DIV CL
    XOR CX,CX
    MOV CX,AX
    
    
    TOP:
    MOV AX,VAR1
    DIV CL
    CMP AH,0
    JE PRINT_NOTPRIME
    CMP CL,2
    JE PRINT_PRIME
    LOOP TOP
    
    
    
    
    
    
    PRINT_PRIME:
    PRINTN

    LEA DX,MSG1
    MOV AH,9
    ;MOV DL,1
    INT 21H
    JMP E
    
    PRINT_NOTPRIME:
    PRINTN
    LEA DX,MSG2
    MOV AH,9
    ;MOV DL,2
    INT 21H
    JMP E
    
    
    E:
    
    MAIN ENDP
END MAIN
    
    