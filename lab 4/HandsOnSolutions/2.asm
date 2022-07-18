; Lab #5 Hands On Solution 
; Problem #2
; Copy String in Reverse order

INCLUDE Irvine32.inc

.DATA
src  BYTE 'Hello',0
dest WORD LENGTHOF src DUP(?)

.CODE
main PROC
	MOV ESI, OFFSET src
	ADD ESI, LENGTHOF src - 2		;points to the last char

	MOV EDI, OFFSET dest

	MOV ECX, LENGTHOF src - 1		;We'll not copy the null termination character (0)
	
	L1:
		MOVZX AX, BYTE PTR[ESI]
		MOV WORD PTR [EDI], AX
		DEC ESI
		ADD EDI, 2
	LOOP L1

	MOV WORD PTR [EDI], 0			;Terminate the dest
	
	MOV EDI, OFFSET dest
	MOV ECX, LENGTHOF dest - 1
	L2:
		MOV AL, BYTE PTR [EDI]
		CALL WriteChar
		ADD EDI, 2
	LOOP L2
	CALL CRLF

	exit
main ENDP

END main