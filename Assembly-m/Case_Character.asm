.MODEL SMALL
.STACK 100H
.DATA 
MSG6 DB 'INTER THE TEST CASE : $'
MSG1 DB 'ENTER A CHARACTER : $'
MSG2 DB 'THIS IS A DIGIT! $'  
MSG3 DB 'THIS IS A UPPERCASE CHARACTER! $'
MSG4 DB 'THIS IS A LOWERCASE CHARACTER! $'
MSG5 DB 'THIS IS A SPECIAL CHARCTER! $' 
MSG7 DB 'PRESS ANY KEY TO EXIT OR CONTINUE..... $'
.CODE

MAIN PROC
    MOV AX,@DATA      ; inisialization of data segment
    MOV DS,AX
                      
    LEA DX,MSG6
    MOV AH,9          ; displaying the msg6 variable
    INT 21H
    
    MOV AH,1
    INT 21H           ; input the test case number
    MOV BL,AL         ; BL = AL
    SUB BL,48         ; BL = BL - 48
    
    MOV AH,2
    MOV DL,0AH
    INT 21H           ; new line
    MOV DL,0DH
    INT 21H
    
START:
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    
DIGIT_LOWER_BOUND:    
    CMP CL,48
    JGE DIGIT_UPPER_BOUND  
    JMP SPECIAL

UPPER_CASE_LOWER_BOUND:
    CMP CL,65
    JGE UPPER_CASE_UPPER_BOUND 
    JMP SPECIAL                
    
LOWER_CASE_LOWER_BOUND:
    CMP CL,97
    JGE LOWER_CASE_UPPER_BOUND
    JMP SPECIAL

DIGIT_UPPER_BOUND:
    CMP CL,57
    JG UPPER_CASE_LOWER_BOUND 
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    JMP EXIT 

UPPER_CASE_UPPER_BOUND: 
    CMP CL,90
    JG LOWER_CASE_LOWER_BOUND
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    JMP EXIT
    
LOWER_CASE_UPPER_BOUND:
    CMP CL,122
    JG SPECIAL
    LEA DX,MSG4
    MOV AH,9
    INT 21H
    JMP EXIT 
    

    
SPECIAL:
    LEA DX,MSG5
    MOV AH,9
    INT 21H 
    
    
    
EXIT:
   MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
    
   DEC BL
   
   CMP BL,0
   JE STOP
   JMP START
   
   
   
STOP:  
   LEA DX,MSG7
   MOV AH,9
   INT 21H
   
   MOV AH,1
   INT 21H 
    
   MOV AH,4CH
   INT 21H
   MAIN ENDP
END MAIN
    


    
    