.MODEL SMALL
.STACK 100H
.DATA

VAR1 DW ?
VAR2 DW ?

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    XOR BX,BX
    XOR CX,CX
    MOV CL,10
    MOV VAR1,0
    MOV VAR2,0
    
    ;---------------------NUMBER1 INPUT----
    INPUT:
    MOV AH,1
    INT 21H
    XOR DX,DX   ;DX=0
    MOV DL,AL   ;DL=AL
    
    CMP AL,13
    JNE NUMBER
    CMP VAR1,0
    JE FIRST_INPUT
    CMP VAR2,0
    JE SECOND_INPUT
    
    FIRST_INPUT:
    MOV VAR1,BX
    XOR BX,BX
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    JMP INPUT
    
    SECOND_INPUT:
    MOV VAR2,BX
    XOR BX,BX
    JMP MULTI
    
    ;JE MEMORY
    
    NUMBER:
    SUB DL,30H
    XOR AX,AX
    MOV AX,BX
    MUL CL
    
    ADD AX,DX
    MOV BX,AX
    JMP INPUT
    
    MEMORY:
    MOV VAR1,BX
    
    
    MULTI:
    
    MOV BX,VAR1
    MOV CX,VAR2
    MOV AX,1
    
    TOP:
    MUL BX
    LOOP TOP
    
    
    
    ;MOV AX,BX
    MOV BX,0000H
    MOV CX,10
    
    DIGIT:
    
    DIV CL ;AX=AX/CL
    
    MOV [0000H+BX],AH
    MOV AH,0
    
    ADD BX,2H
    CMP AL,0
    JNE DIGIT
    
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    
    PRINT:
    
    SUB BX,2H
    MOV AH,2
    MOV DX,[0000H+BX]
    ADD DX,30H
    INT 21H
    CMP BX,0
    JNE PRINT
    
    MAIN ENDP
END MAIN