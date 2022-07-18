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


	; Prepare procedure registers
	MOV ECX, EAX
	MOV ESI, EDX			
	MOV EDI, offset dest				
	CALL RevString

	MOV EDX, offset dest
	CALL WriteString
	CALL CRLF

	exit
main ENDP

;-----------------------------------------------
;Reverses a given string
;Recieves: ESI Contains the offset of the source string 
;		   EDI Contains the offset of the destination string
;          ECX Contains the source string char count 
;----------------------------------------------
RevString PROC
	
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

ret	; don't forget!
RevString ENDP

END main