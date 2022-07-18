; 6. Binary Str to Dec (for more than 1 bit in the string)

INCLUDE Irvine32.inc

.data
binaryStr BYTE 32 DUP(?), 0
numBits DWORD ?
decVal DWORD ?

.code
main PROC
	; Read binary string
	MOV edx, offset binaryStr
	MOV ecx, lengthof binaryStr+1 ; +1 to make space for a termination char
	CALL readstring
	MOV numBits, eax

	; Make ESI point to end of the input binary string
	MOV esi, offset binaryStr
	ADD esi, numBits
	DEC esi
	
	MOV eax, 0		;=sum

	CALL binToDec

	; Write output decimal value to console
	MOV decVal, eax
	CALL writedec
	CALL crlf

	exit
main ENDP

;-------------------------------------------------------------
;	Converts a binary string to its equivalent decimal value
;	(assumes there is more than 1 bit in the input string)
;Recieves:	ESI = offset of binaryStr
;		EAX = sum to find decimal value in
;Returns:	EAX = equivalent decimal value
;-------------------------------------------------------------
binToDec PROC
	; Evaluate and add first bit (bit 0)
	MOVZX edx, byte ptr[esi]
	SUB edx, 30h	; converting the char to decimal
	ADD eax, edx	; 2^0 done
	DEC esi			; so decrement 1

	MOV ebx, 1		;index of current element, ie. start from index 1
	
	MOV ecx, numBits	
	DEC ecx			; because we already added bit at index=0
	L1:
		PUSH ecx

		; -------- Find 2^index --------
		MOV edx, 1		; = 2^index
		MOV ecx, ebx	; ebx = index
		find2PowInd:
			ADD edx, edx
		LOOP find2PowInd
		INC ebx

		; -------- Mul 2^index with bit 0/1 --------
		MOVZX edi, byte ptr[esi]	; get char
		SUB edi, 30h	; converting the char to decimal
	
		MOV ecx, edx	; edx = 2^index
		calcValAtIndex:
			ADD eax, edi 
		LOOP calcValAtIndex

		DEC esi
		POP ecx
	LOOP L1

	ret
binToDec ENDP

END main