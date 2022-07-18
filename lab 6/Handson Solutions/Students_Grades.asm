
INCLUDE Irvine32.inc
.DATA

SCORE byte  "Enter Student's Score:"
ErrorMSG  byte " ERROR: INVALID SCORE!"
EXCELLENTstr BYTE "EXCELLENT"
VeryGoodstr  byte "VeryGood"
Goodstr  byte "Good"
Fairstr byte "Fair"
Failstr byte "Fail"

.code
main PROC

mov edx,offset SCORE
call writestring


call ReadInt     ; returns entered integer in eax
cmp eax,90
jge ExcellentCheck

cmp eax,80							; this is the else part so we'll compare if its Greater than 80
jge VeryGoodCHECK

cmp eax,70									; at this point we know the score is less than 80 so check the others
jge GOOD

cmp eax,60
jge FAIR

cmp eax,0									; at this point we know it's less than 60 so it's fail but we have to make sure its not less than zero
jl  ERROR

mov edx,offset Fairstr			; if its not zero then its Fail
call writestring				; Prints msg on console
JMP ENDCHECK

excellentCheck:
cmp eax,100
jg Error ; IF Greater than 100 then print an error msg
mov edx,offset excellentstr
call writestring
JMP ENDCHECK   ; TO SKIP MOVING TO THE error part

veryGoodCHECK:
mov edx,offset VERYGOODstr
call writestring
JMP ENDCHECK

GOOD:
MOV EDX,offset Goodstr
call writestring
JMP ENDCHECK

Fair:
mov edx,offset Fairstr
call writestring
JMP ENDCHECK


Error:
mov edx,offset ErrorMSG
CALL writestring

ENDCHECK:
call crlf

	exit
main ENDP

END main