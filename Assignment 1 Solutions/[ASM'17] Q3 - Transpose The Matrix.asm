; Transpose a 3X3 matrix 

INCLUDE Irvine32.inc

.DATA
numElements EQU 9
arr DWORD numElements DUP (?)


.CODE
main PROC
	; Read array elements
	MOV ESI, OFFSET arr
	MOV EDI, OFFSET arr
	MOV ECX, numElements
	CALL readArr

	MOV ECX,3
	; Transpose array elements
	CALL TRANSPOSE_MATRIX

	MOV ECX,numElements
	;Display array elements
	CALL DISPLAY

	exit
main ENDP

;-----------------------------------------------------------------
;Read a DWORD array
;Recieves: 1. ESI contains the offset of the array
;		   2. ECX contains the length of the array to read
;-----------------------------------------------------------------
readArr PROC USES ESI EAX
	readA:
		CALL readdec
		MOV [ESI], EAX
		ADD ESI, 4
	LOOP readA 
ret
readArr ENDP
;-----------------------------------------------------------------
;Transpose a dword array elements
;Recieves: 1. ESI contains the offset of the array
;		   2. ECX contains number of elements
;-----------------------------------------------------------------
TRANSPOSE_MATRIX PROC USES EAX EBX ESI EDI
	XCHANGE:
	MOV EAX,[ESI]
	XCHG EAX,[EDI]
	MOV [ESI],EAX
	ADD ESI,TYPE ARR
	ADD EDI,TYPE ARR * 3
	LOOP XCHANGE

	ret
TRANSPOSE_MATRIX ENDP



;-----------------------------------------------------------------
;Print a DWORD array
;Recieves: 1. ESI contains the offset of the array
;		   2. ECX contains the length of the array to write
;-----------------------------------------------------------------
DISPLAY PROC USES ESI EAX
	writeA:
		MOV EAX, [ESI]
		CALL writedec

		MOV AL, ' '
		CALL writechar

		ADD ESI, 4
	LOOP writeA
	CALL CRLF
ret
DISPLAY ENDP

END main