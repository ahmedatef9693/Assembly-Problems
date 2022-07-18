INCLUDE Irvine32.inc

.DATA
str1 byte 50 DUP (?)
strLen DWORD ?
vowels byte 'a','e','o','u','i','A','E','O','U','I'
newString byte lengthof str1 dup(?)
.CODE
main PROC
	; Read a String
	MOV EDX,OFFSET str1
	Mov ECX,LENGTHOF str1
	CALL READSTRING
	MOV strLen , EAX

	MOV ECX,EAX
	MOV EDI,OFFSET newString
	CALL TRIM_VOWELS
	MOV EDX,OFFSET newString
	Call writeString
	CALL CRLF

	exit
main ENDP


;-----------------------------------------------------------------
;Remove Vowel Characters from string
;Recieves: 1. EDX contains the offset of the string
;		   2. ECX contains the actual number of characters
;-----------------------------------------------------------------
TRIM_VOWELS PROC USES EDX ECX ESI EDI
	StringCharacters:
		PUSH ECX
		MOV ESI,OFFSET Vowels
		MOV ECX,LENGTHOF Vowels
		MOV AL,[EDX]
		CheckVowel:
			CMP AL,[ESI]
			JE NextChar
			INC ESI
			Loop CheckVowel
		CMP ECX,0
		JNE NextChar
		MOV [EDI],AL
		INC EDI
		NextChar:
		INC EDX
		POP ECX
	LOOP StringCharacters
	
	MOV BYTE PTR [EDI],0
	ret
TRIM_VOWELS ENDP


END main