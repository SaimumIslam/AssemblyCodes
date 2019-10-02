.MODEL SMALL
.STACK 100H
.DATA
 MAX DB ?
 MID DB ?
 MIN DB ? 
.CODE     

MAIN PROC 
    MOV AX,@DATA        ; initialisation of data segment
    MOV DS,AX
    
    MOV AH,1            ; input function
    INT 21H 
    MOV CL,AL           ; CL = 1st number
    
    INT 21H             
    MOV BL,AL           ; BL = 2nd number
    
    INT 21H
    MOV CH,AL           ; CH = 3rd number
    
CHECK_CL_1:    
    CMP CL,BL           ; checking CL as max
    JL CHECK_BL_1       ; if CL < BL then jumpto CHECK_BL_1
    CMP CL,CH           ; else CL > BL 
    JL CHECK_BL_1       ; if CL < CH then jumpto CHECK_BL_1
    
    MOV MAX,CL          ; else MAX = CL
    
    CMP BL,CH           ; checking MID & MIN
    JL CHECK_CL_2       ; if BL < CH then jumpto CHECK_CL_2 
    
    MOV MID,BL          ; else MID = BL
    MOV MIN,CH          ; MIN = CH
    JMP PRINT
CHECK_CL_2:             ; else checking MID & MIN where MAX = CL
    MOV MID,CH          
    MOV MIN,BL
    JMP PRINT 


CHECK_BL_1:             ; checking BL as max
    CMP BL,CH
    JL CHECK_CH_1       ; if BL < CH thn jumpto CHECK_CH_1
    
    MOV MAX,BL          ; else MAX = BL
    
    CMP CL,CH           ; checking MID & MIN
    JL CHECK_BL_2       ; if CL < CH thn jumpto CHECK_BL_2
    MOV MID,CL
    MOV MIN,CH
    JMP PRINT
CHECK_BL_2:             ; else checking MID & MIN where MAX = BL
    MOV MID,CH          
    MOV MIN,CL 
    JMP PRINT
    
    
CHECK_CH_1:             ; checking CH as max
    MOV MAX,CH
              
    CMP CL,BL           ; checking MID & MIN where MAx = CH
    JL CHECK_CH_2       ; IF CL < BL then jumpto CHECK_CH_2
    MOV MID,CL
    MOV MIN,BL
    JMP PRINT
CHECK_CH_2:             ; else checking MID & MIN where MAX = CH
    MOV MID,BL
    MOV MIN,CL
    JMP PRINT
    


PRINT: 
     MOV AH,2
     MOV DL,0AH
     INT 21H            ; new line
     MOV DL,0DH
     INT 21H
     
     MOV AH,2
     MOV DL,MAX
     INT 21H            ; display the max
                 
     MOV DL,MID
     INT 21H            ; display the mid
     
     MOV DL,MIN 
     INT 21H            ; display the min
    
    