INCLUDE Irvine32.inc

.DATA
	MAXLEN EQU 20
	src BYTE MAXLEN DUP(?), 0
	dest BYTE MAXLEN DUP(?), 0

.CODE

main PROC
	MOV EDX, OFFSET src			;buffer to read in it
	MOV ECX, MAXLEN	
	CALL ReadString					;EAX = Number of read characters

	MOV ECX, EAX
	MOV ESI, EDX			
	MOV EDI, offset dest				
	MOV EAX, ECX				;tmp backup for ECX

	L1:
		MOVZX EBX, BYTE PTR [ESI]
		PUSH EBX
		INC ESI
	LOOP L1

	MOV ECX, EAX				;restore ECX value that was stored in EAX

	L2:
		POP EBX
		MOV BYTE PTR[EDI], BL
		INC EDI
	LOOP L2

	; Print reversed string
	MOV EDX, offset dest
	CALL WriteString
	CALL CRLF

	exit
main ENDP

END main