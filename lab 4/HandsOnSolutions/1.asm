INCLUDE Irvine32.inc
.data
arr1 DWORD 10,20,30,40,50

.code
main proc
MOV ESI,OFFSET arr1
MOV ECX, LENGTHOF arr1
L:
MOV EAX,[ESI]
ADD EAX,EAX
MOV [ESI],EAX
ADD ESI,TYPE ARR1
LOOP L

MOV ESI,OFFSET arr1
MOV ECX, LENGTHOF arr1
Display:
MOV EAX,[ESI]
CALL WriteDec
ADD ESI,4
CALL CRLF
LOOP Display
exit
main endp
END main