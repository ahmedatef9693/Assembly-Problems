INCLUDE Irvine32.inc

.DATA
str1 byte 50 DUP (?)
strLen DWORD ?
isStr byte "String",0
isNum byte "Number",0
.CODE
main PROC
	; Read a String
	MOV EDX,OFFSET str1
	Mov ECX,LENGTHOF str1
	CALL READSTRING
	MOV strLen , EAX

	MOV ECX,EAX
	CALL isString

	exit
main ENDP


;-----------------------------------------------------------------
;Check if the input string is a string or a number
;Recieves: 1. EDX contains the offset of the string
;		   2. ECX contains the actual number of characters
;-----------------------------------------------------------------
isString PROC USES EDX ECX 
	L:
	MOV AL,[EDX]
	CMP AL,'1'
	JNAE isChar
	CMP AL,'9'
	JNBE isChar
	skip: INC EDX
	loop L
	CMP ECX,0
	JNE isChar
	MOV EDX,OFFSET isNum
	JMP next
	isChar:
	MOV EDX,offset isStr
	NEXT: CALL WRITESTRING
	CALL CRLF
	ret
isString ENDP


END main