.MODEL SMALL
.STACK 100H
.DATA
VAR1 DW ?
TEMP DW ?

.CODE

MAIN PROC
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
    MOV AX,1
    MOV CX,BX
    
    TOP:
    MUL CX
    LOOP TOP
    
    
    ;MOV AX,BX
    MOV BX,0000H
    MOV CX,10D
    
    PART:
    DIV CL      ;AX/CL
    
    MOV [0000H+BX],AH
    MOV AH,0
    
    ADD BX,2H
    
    CMP AL,0
    JNE PART  
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
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
    
    