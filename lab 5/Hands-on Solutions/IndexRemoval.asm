; Remove index from an array using the stack

INCLUDE Irvine32.inc

.DATA
numElem EQU 10
arr DWORD numElem DUP (?)
index DWORD ?
sizeOfArr DWORD ?

.CODE
main PROC
	; Read array elements
	MOV ESI, OFFSET arr
	MOV ECX, numElem
	CALL readArr

	; Read 0-based index to remove
	CALL readdec
	MOV index, EAX

	; Remove index from array using stack
	MOV ESI, OFFSET arr
	MOV sizeOfArr, SIZEOF arr
	CALL removeInd

	; Print modified array
	MOV ESI, OFFSET arr
	MOV ECX, numElem
	DEC ECX				; because array size has now decreased by 1
	CALL writeArr

	exit
main ENDP

;-----------------------------------------------------------------
;Remove a specific index from a DWORD array. 
;Size of array is constant in the "numElem" symbolic const
;Recieves: 1. ESI contains the offset of the array
;		   2. INDEX contains 0-based index to remove from array
;		   3. SIZEOFARR contains "SIZEOF arr"
;-----------------------------------------------------------------
removeInd PROC
	MOV EDI, ESI		; save original array offset

	; Step 1: Push in stack all elements BEFORE this index
	MOV ECX, index
	pushBefore:
		PUSH DWORD PTR [ESI]
		ADD ESI, 4
	LOOP pushBefore

	; Step 2: Push in stack all elements AFTER this index
	ADD ESI, 4			; ESI left the previous loop pointing at the index,
						; so make it point to the element after and continue
	MOV ECX, numElem 
	SUB ECX, index
	DEC ECX
	pushAfter:
		PUSH DWORD PTR [ESI]
		ADD ESI, 4
	LOOP pushAfter

	; -----------------------------------------------------------------------------------

	; Pop new array into old array in REVERSE
	MOV ESI, EDI
	ADD ESI, sizeOfArr
	SUB ESI, 8			; (-4) to make ESI point to the last DWORD position
						; (-4) again because array size has now decreased 1

	MOV ECX, numElem
	DEC ECX				; because we have now removed 1 element
	popNew:
		POP DWORD PTR [ESI]
		SUB ESI, 4
	LOOP popNew

	ret
removeInd ENDP

;-----------------------------------------------------------------
;Read a DWORD array
;Recieves: 1. ESI contains the offset of the array
;		   2. ECX contains the length of the array to read
;-----------------------------------------------------------------
readArr PROC
	readA:
		CALL readdec
		MOV [ESI], EAX
		ADD ESI, 4
	LOOP readA 
ret
readArr ENDP

;-----------------------------------------------------------------
;Print a DWORD array
;Recieves: 1. ESI contains the offset of the array
;		   2. ECX contains the length of the array to write
;-----------------------------------------------------------------
writeArr PROC
	writeA:
		MOV EAX, [ESI]
		CALL writedec

		MOV AL, ' '
		CALL writechar

		ADD ESI, 4
	LOOP writeA
ret
writeArr ENDP

END main