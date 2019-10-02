;uva - 13025
include 'emu8086.inc'
.model small
.stack 100h
.data

.code

printn"May 29, 2013 Wednesday"

exit:
mov ah,4ch
int 21h
ret               ; return to operating system.
end  