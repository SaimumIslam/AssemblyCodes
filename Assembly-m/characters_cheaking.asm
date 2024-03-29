.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER A CHARACTER: $' 
MSG2 DB 'THIS IS A DIGIT $'     
MSG3 DB 'THIS IS A UPPR CAS CHARACTR $'
MSG4 DB 'THIS IS A LOWR CAS CHARACTR $'
MSG5 DB 'THIS IS A SPCIAL CHARACTR $'
.CODE

MAIN PROC
 
COD:   
    MOV AX,@DATA  ;INITIALISATION OF DATA SEGMENT
    MOV DS,AX
    
    
    LEA DX,MSG1   
    MOV AH,9      ;DISPLAY MSG1 WITH LOAD EFFECTIVE ADDRESS
    INT 21H
    
    
    MOV AH,1
    INT 21H       ;INPUT A CHARACTR
    MOV CL,AL
    
   
    MOV AH,2
    MOV DL,0AH
    INT 21H       ;NW LIN
    MOV DL,0DH
    INT 21H
    
DIGIT_LOWR_BOUND:            ;CHCKING FOR DIGIT IN TH LOWR BOUND
    CMP CL,48                
    JGE DIGIT_UPPR_BOUND     ; IF CL >= 48 THN  IT WILL JUMP DIGIT UPPR BOUND
    JMP SPCIAL               ; LS IT WILL JUMP TO SPCIAL
    
                             
                             
UPPRCAS_LOWR_BOUND:          ;CHCKING FOR UPPR CAS LOWR BOUND
    CMP CL,65
    JGE UPPRCAS_UPPR_BOUND   ;IF CL >= 65 THN IT WILL JUMP TO UPPR CAS UPPR BOUND
    JMP SPCIAL               ;LS JUMP TO SPCIAL

LOWRCAS_LOWR_BOUND:
    CMP CL,97
    JGE LOWRCAS_UPPR_BOUND
    JMP SPCIAL
    



DIGIT_UPPR_BOUND:
    CMP CL,57
    JG UPPRCAS_LOWR_BOUND
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    JMP EXIT            

UPPRCAS_UPPR_BOUND:
    CMP CL,90
    JG  LOWRCAS_LOWR_BOUND
    LEA DX,MSG3
    MOV AH,9
    INT 21H  
    JMP EXIT 

LOWRCAS_UPPR_BOUND:
    CMP CL,122
    JG SPCIAL        ;IF CL > 122 THN JUMP TO SPCIAL
    LEA DX,MSG4
    MOV AH,9         ;DISPLAY MSG4 FOR LOWR CAS UPPR BOUND CHARACTR
    INT 21H
    JMP EXIT     

SPCIAL:
    LEA DX,MSG5
    MOV AH,9         ;DISPLAY MSG5 FOR SPCIAL CHARACTR
    INT 21H      

EXIT:
    MOV AH,2
    MOV DL,0AH
    INT 21H          ;NW LIN
    MOV DL,0DH
    INT 21H
      
    JMP COD          ;JUMP TO COD LVL
    MOV AH,4CH
    INT 21H          ;EXIT
    MAIN ENDP
END MAIN