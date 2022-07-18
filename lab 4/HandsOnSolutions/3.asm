; Lab #5 Hands On Solution 
; Problem #3
; Rectangle of Stars each row has 5 * 

INCLUDE Irvine32.inc

.DATA

strMessage BYTE "Enter the number of rows : ",0

.CODE
main PROC

	MOV EDX, OFFSET strMessage
	CALL WriteString

	CALL ReadDec					;The decimal is read in EAX

	MOV ECX, EAX
	
	Outer:
		MOV EBX, ECX				;Backup the ECX 		
		Inner:
			MOV AL, '*'
			CALL WriteChar
		LOOP Inner
	
		CALL CRLF					
		MOV ECX, EBX				;Restor the ECX
	LOOP Outer

	exit
main ENDP

END main