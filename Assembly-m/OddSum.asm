;10783  
; [3, 9] is 3 + 5 + 7 + 9 = 24.

.model small
.stack 100h
.code
main proc
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    INT 21H
    MOV BH,AL  
    
    ;input 2 number  DONE
    ;work to do is to find odd & calculate sum     
    
    
    
      EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    END MAIN
    