INCLUDE Irvine32.inc

.data

ARR_SIZE EQU 5							
arr1		SDWORD	ARR_SIZE dup(?)			
multiplier	SDWORD	?

strNumPrompt	BYTE	'Enter numbers: ', 0
strMultiPrompt	BYTE	'Enter a multiplier: ', 0	
strRest			BYTE	'Result = ', 0	

.code
main PROC

	MOV EDX, OFFSET strNumPrompt	
	CALL WriteString			

	MOV ECX, ARR_SIZE		;initialize loop counter ecx 
	MOV ESI, OFFSET arr1
	CALL GetArray

	MOV EDX, OFFSET strMultiPrompt	
	CALL WriteString
	CALL ReadInt ;EAX = Multiplier

	MOV EBX, EAX ; Set Multiplier
	CALL MulArray

	CALL DisplayArray
	
	exit
main ENDP

;-----------------------------------------------
;Multiplyies an integer array by a given multiplier
;Receives:ESI Contains the offset of the array 
;		  ECX Contains the length of the array 
;		  EBX Contains the multiplier
;----------------------------------------------
MulArray PROC USES ESI ECX EBX EDX
	L1:		
		MOV EAX, [ESI]	;Load array element to multiplicand	
		IMUL EBX		;result will be in EDX:EAX; we care of the lower half only for this problem
		MOV [ESI], EAX	;Store the lower half of the result in the array
		
		ADD ESI, DWORD					
	LOOP L1		

	RET 
MulArray ENDP

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

;-----------------------------------------------
;Reads an integer array from user
;Receives:ESI Contains the offset of the array 
;		  ECX Contains the length of the array 
;----------------------------------------------
GetArray PROC USES ECX ESI EAX

	L1:
		CALL ReadInt		;take a signed integer from user 
		MOV [ESI], EAX		;store this integer in the array 
		ADD ESI, DWORD		;slide ESI to point to the next item		
	LOOP L1					;loop till ecx == 0

	RET
GetArray ENDP

END main
