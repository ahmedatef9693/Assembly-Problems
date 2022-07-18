INCLUDE Irvine32.inc
.DATA
prmptArraySize byte "Enter the array size: ",0
prmptEnterArray byte "Enter array elements: ",0
result_str byte "Cubic root of the array: ",0

array dword 10 dup(?) 
RESULT_ARRAY DWORD 10 DUP(?)
size_of_input_array dword ?

.code
main PROC

	mov edx, offset prmptArraySize
	call writestring

	call readint
	mov size_of_input_array, eax
	
	

	mov edx, offset prmptEnterArray
	call writestring
	mov esi, offset array
	mov ecx, size_of_input_array
	call read_array

	MOV EDI, OFFSET RESULT_ARRAY
	call GET_ARRAY_CUBIC_ROOT


	mov edx, offset result_str
	call writestring
	mov esi, offset RESULT_ARRAY
	mov ecx, size_of_input_array
	call display_array

	
	call crlf

	exit
main ENDP

;-----------------------------------------------------------------
;Reads an array of numbers from the user
;Recieves: 1. ESI contains the offset of the integer array
;		   2. ECX contains the number of integers
;-----------------------------------------------------------------
read_array Proc uses esi ecx
	L1:
		call readint
		mov [esi], eax
		add esi, 4
	Loop L1
	ret
read_array ENDP

;-----------------------------------------------------------------
;Displays an array of numbers
;Recieves: 1. ESI contains the offset of the integer array
;		   2. ECX contains the number of integers
;-----------------------------------------------------------------
display_array Proc uses esi ecx
	L1:
		mov eax, [esi]
		call WRITEDEC
		MOV AL, ' '
		CALL WRITECHAR
		add esi, 4
	Loop L1
	ret
display_array ENDP


;-----------------------------------------------------------------
;Displays an array of numbers
;Recieves: 1. ESI contains the offset of the integer array
;		   2. ECX contains the number of integers
;		   3. EDI CONTAINS THE OFFSET OF THE RESULT ARRAY
;-----------------------------------------------------------------
GET_ARRAY_CUBIC_ROOT Proc uses esi ecx EBX
	MOV EBX, 0

	L1:
		PUSH ECX
	    INC EBX
		mov eax, [esi]
		MOV ECX, 2
		L2:
			CDQ
			IDIV EBX
		LOOP L2

		POP ECX
		MOV [EDI], EAX
		add esi, 4
		ADD EDI, 4
	Loop L1
	ret
GET_ARRAY_CUBIC_ROOT ENDP

END main