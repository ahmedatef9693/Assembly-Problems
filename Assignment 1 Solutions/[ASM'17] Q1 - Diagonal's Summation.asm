COMMENT &
Q1. Write an assembly program that reads a 3x3 DWORD array and print the summation of its diagonal. 
You can read the array as 9 signed integers in sequence.  
Sample input: 1 2 3 4 5 6 7 8 9 
Sample output: 15
&
INCLUDE IRVINE32.INC
.DATA

ARR DWORD 3 DUP(?, ?, ?)
.CODE

MAIN PROC

MOV ESI, OFFSET ARR
MOV ECX, LENGTHOF ARR
CALL READARRAY

MOV ECX, LENGTHOF ARR / 3
CALL SUMDIAGONAL
CALL WRITEDEC 
CALL CRLF



MAIN ENDP


SUMDIAGONAL PROC USES ESI ECX EBX

	MOV EAX, 0
	L1: 
	
		ADD EAX, [ESI]
		MOV EBX, TYPE ARR * TYPE ARR
		ADD ESI, EBX
	
	LOOP L1
	
	RET

SUMDIAGONAL ENDP

READARRAY PROC

	PUSHAD
	L1: 

		CALL READDEC
		MOV [ESI], EAX
		ADD ESI, TYPE ARR

	LOOP L1

	POPAD
	RET
READARRAY ENDP


END MAIN