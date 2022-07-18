
INCLUDE Irvine32.inc
.DATA

Msg1  byte "Enter a Number: ",0
Msg2 byte  "Multiplication Table: ",0
Num Dword ?

.code
main PROC

mov edx,offset msg1
call writestring

call Readdec
mov Num,eax     ; store the entered Number in Num Variable


mov edx,offset msg2
call writestring


; display MulTable separated by commas

call Writedec      ; prints the first element
mov ecx,8
L:
push eax
mov al,','
call writechar   ; prints the comma before printing the 2nd element
pop eax
add eax,Num
call writedec
loop L

call crlf


exit
main ENDP
END main