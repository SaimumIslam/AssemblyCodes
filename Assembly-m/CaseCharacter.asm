.MODEL SMALL
.STACK 100H
.DATA
 MSG1 DB 'ENTER A CHARACTER : $'
 MSG2 DB 'THIS IS A DIGIT! $'
 MSG3 DB 'THIS IS A UPPER CASE ALPHABET! $'
 MSG4 DB 'THIS IS A LOWER CASE ALPHABET! $'
 MSG5 DB 'THIS IS A SPECIAL CHARACTER! $' 
 MSG6 DB 'ENTER THE TEST CASE : $'  
 MSG7 DB 'PRESS ANY KEY TO EXIT OR CONTINUE.... $'
.CODE

MAIN PROC
    MOV AX,@DATA  ; initialisation of data segmant
    MOV DS,AX
    
    LEA DX,MSG6
    MOV AH,9      ; display of msg6 string
    INT 21H
                
    MOV AH,1      ; input the test case
    INT 21H
    
    MOV BL,AL     ; BL = AL
    SUB BL,48     ; Test Case: BL = BL-48
    
    MOV AH,2
    MOV DL,0AH
    INT 21H       ; new line
    MOV DL,0DH
    INT 21H
    
START:
    LEA DX,MSG1
    MOV AH,9      ; display of msg1 string 
    INT 21H
    
    MOV AH,1
    INT 21H       ; input the character
    MOV CL,AL     ; CL = AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H       ; new line
    MOV DL,0DH
    INT 21H

DIGIT_LOWER_BOUND:    
    CMP CL,48
    JGE DIGIT_UPPER_BOUND        ; if CL >= 48 then goto DIGIT_UPPER_BOUND
    JMP SPECIAL                  ; else jmp to SPECIAL

UPPER_CASE_LOWER_BOUND:
    CMP CL,65
    JGE UPPER_CASE_UPPER_BOUND   ; if CL>=65 then go to UPPER_CASE_UPPER_BOUND
    JMP SPECIAL                  ; else goto SPECIAL

LOWER_CASE_LOWER_BOUND:
    CMP CL,97                    ; IF CL>=97 then go to  LOWER_CASE_UPPER_BOUND
    JGE LOWER_CASE_UPPER_BOUND
    JMP SPECIAL                  ; else jmp to SPECIAL
    
DIGIT_UPPER_BOUND:
    CMP CL,57                    
    JG UPPER_CASE_LOWER_BOUND    ; if CL>57 then goto UPPER_CASE_LOWER_BOUND
    
    LEA DX,MSG2
    MOV AH,9          ; else  display msg2 string 
    INT 21H  
    JMP STOP          ; jump to stop

UPPER_CASE_UPPER_BOUND:
    CMP CL,90
    JG LOWER_CASE_LOWER_BOUND    ; if CL > 90 then goto LOWER_CASE_LOWER_BOUND 
    
    LEA DX,MSG3
    MOV AH,9          ; else display msg3 string 
    INT 21H
    JMP STOP
    
LOWER_CASE_UPPER_BOUND:
    CMP CL,122
    JG SPECIAL
                       ; if CL > 122 then goto SPECIAL
    LEA DX,MSG4
    MOV AH,9         ; else display msg4 string
    INT 21H
    JMP STOP
          
    
SPECIAL:
    LEA DX,MSG5
    MOV AH,9      ; display msg5 string 
    INT 21H    
    
STOP:
     MOV AH,2
     MOV DL,0AH
     INT 21H       ; new line
     MOV DL,0DH
     INT 21H
     
     DEC BL        ; BL = BL -1
     CMP BL,0       
     JE EXIT       ; if BL = 0 then jmpto EXIT
     JMP START     ; else jump to START

EXIT:
     MOV AH,2
     MOV DL,0AH
     INT 21H       ; new line
     MOV DL,0DH
     INT 21H
    
    LEA DX,MSG7
    MOV AH,9       ; display msg7 string
    INT 21H   
    
    MOV AH,1       ; input the last key to exit
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN


