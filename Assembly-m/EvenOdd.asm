.MODEL SMALL
.STACK 100H
.DATA 
 MSG DB 'ENTER A NUMBER : $'  
 MSG1 DB 'ENTER THE TEST CASE : $'
 QUIT DB 'PRESS ANY KEY TO EXIT OR CONTINUE.... $'
 EVEN DB 'EVEN NUMBER. $'
 ODD DB 'ODD NUMBER. $'
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX   
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H  
    
    MOV AH,1
    INT 21H
    MOV CL,AL  
    SUB CL,48
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
   
    
START:
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV AH,1       ;MAIN
    INT 21H
 
    MOV DL,AL      ;MAIN
    MOV BL,2
    DIV BL
    
    CMP AH,0            ;MAIN
    JNE ODD_NUMBER:     ;MAIN
    MOV AH,2            
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
     LEA DX,EVEN
     MOV AH,9           ;main
     INT 21H  
     JMP EXIT

ODD_NUMBER: 
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    LEA DX,ODD          ;main
    MOV AH,9
    INT 21H
    JMP EXIT
    
EXIT:
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    DEC CL
    CMP CL,0 
    JE STOP
    JMP START  
    
STOP:
    LEA DX,QUIT
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
        
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN