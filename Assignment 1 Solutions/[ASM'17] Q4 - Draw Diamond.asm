; 4. Write an assembly program that takes a number n from the user and draws a diamond 
; shape of asterisks where the number of rows equals 2n – 1.

INCLUDE Irvine32.inc

.data
num DWORD ?
target DWORD ?
num_asts DWORD ?
num_spcs DWORD ?

.code
main PROC
	; Read num from user
	CALL readdec
	MOV num, eax

	; Set "target value"
	MOV eax, num
	MOV target, eax
	ADD target, eax
	DEC target

	; Draw diamond
	CALL drawDiamond
	
	exit
main ENDP

;--------------------------------------------------------
;	Prints a diamond of specific shape on console
;Recieves:	num = input number
;			target = max num of asterisks to print 
;					(in case num = 4, target = 7 as in example)
;Returns:	Prints on console
;--------------------------------------------------------
drawDiamond PROC
	; Draw first half of diamond

	MOV ebx, 0	; For spaces
	MOV edx, 1	; For stars
	MOV ecx, num
	firstHalf:
		PUSH ecx

			; Spaces start large then decrease in size
			MOV ecx, num
			SUB ecx, ebx
			Lspcs1:
				MOV al, ' '
				CALL writechar
			LOOP Lspcs1
			ADD ebx, 1		; Because we subtract this from ECX, so ECX can decrease by 1 in each iteration

			; Stars start with 1 then increase by 2
			MOV ecx, edx
			Lstrs1:
				MOV al, '*'
				CALL writechar
			LOOP Lstrs1
			ADD edx, 2		; Because each row increases by 2 in the number of asterisks in the first half

		CALL crlf
		POP ecx
	LOOP firstHalf

	; Draw second half of diamond
	MOV ebx, 2		; For spaces
	MOV edx, target ; For stars
	SUB edx, 2

	MOV ecx, num
	DEC ecx
	secHalf:
		PUSH ecx
		
			;Spaces
			MOV ecx, ebx
			Lspcs2:
				MOV al, ' '
				CALL writechar
			LOOP Lspcs2
			ADD ebx, 1	

			;Stars
			MOV ecx, edx
			Lstrs2:
				MOV al, '*'
				CALL writechar
			LOOP Lstrs2
			SUB edx, 2

			CALL crlf		
		POP ecx
	LOOP secHalf
	
	ret
drawDiamond ENDP

END main