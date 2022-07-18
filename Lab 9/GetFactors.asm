INCLUDE Irvine32.inc

.data		
num				DWORD	?
factors			DWORD 1000 DUP(?)	;1000 is an assumption

strNumPrompt	BYTE	'Enter a number: ', 0
strRest			BYTE	'Factors: ', 0	

.code
main PROC

	MOV EDX, OFFSET strNumPrompt	
	CALL WriteString			

	CALL ReadInt	;EAX = number
	MOV ESI, OFFSET factors
	CALL GetFactors

	MOV ECX, EDI
	CALL DisplayArray
	
	exit
main ENDP
;------------------------------------------------------
;Gets factors of number and store it into an array
;Receives:ESI Contains the offset of the factors array 
;		  EAX Contains the number
;Returns: EDI Factors len
;-----------------------------------------------------
GetFactors PROC USES EAX ESI EDX ECX
	MOV EDI, 0			; Init cnt
	MOV ECX, EAX		; Copy the integer to loop cnt	
	L1:
		PUSH EAX		;Original number		
		MOV EDX, 0		;DIV Extention EDX:EAX/ECX

		DIV ECX
		
		CMP EDX, 0		;Compare the remainder
		JNE Skip
		
		MOV [ESI], ECX	;Copy the factor to the array
		ADD ESI, DWORD
		
		INC EDI
		Skip:

		POP EAX
	LOOP L1
	Ret 
GetFactors ENDP

;-----------------------------------------------
;Displays an integer array to console
;Receives:ESI Contains the offset of the array 
;		  ECX Contains the length of the array 
;----------------------------------------------
DisplayArray PROC USES ECX ESI

	L1:		
		MOV EAX, [ESI]		
		ADD ESI, DWORD	
		CALL WriteInt
		CALL CRLF			
	LOOP L1					

	RET
DisplayArray ENDP

END main