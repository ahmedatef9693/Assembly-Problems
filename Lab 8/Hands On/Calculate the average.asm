

INCLUDE Irvine32.inc
.DATA
str1 byte "Enter the array size: ",0
str2 byte "Enter the array:  ",0
result_str byte "The average =  ",0
bonus_error byte "Invalid input size !!",0

array dword 64 dup(?) 
size_of_input_array dword ?

.code
main PROC

	mov edx, offset str1
	call writestring

	call readint
	mov size_of_input_array, eax
	
	;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	call Bonus_check
	cmp ecx, 0
	je continue
	mov edx, offset bonus_error
	call writestring 
	call crlf
	exit
	continue:
	;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	mov edx, offset str2
	call writestring
	mov esi, offset array
	mov ecx, size_of_input_array
	call read_array

	call calculate_average

	mov edx, offset result_str
	call writestring
	call writeint
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
;Calculates the average of given numbers
;Recieves: 1. ESI contains the offset of the integer array
;		   2. ECX contains the number of integers
;Output:   EAX contains the average
;-----------------------------------------------------------------
calculate_average Proc

call calculate_summation

	L2:
		SHR eax, 1
		SHR ecx,1
		cmp ecx,1
	jne L2

ret
calculate_average ENDP


;-----------------------------------------------------------------
;Calculates the summation of given numbers
;Recieves: 1. ESI contains the offset of the integer array
;		   2. ECX contains the number of integers
;Output:   EAX contains the summation
;-----------------------------------------------------------------
calculate_summation Proc uses esi ecx
	mov eax,0
	L2:
		add eax,[esi]
		add esi,4
		Loop L2

	ret
calculate_summation ENDP


;-----------------------------------------------------------------
;Calculates whether a number is a power of 2 or not
;Recieves: 1. EAX contains the number
;output:   ECX contains 0 if the number is a power of 2 or 1 otherwise
;-----------------------------------------------------------------
Bonus_check proc

	mov ecx,32
	mov ebx, 0
	L3:
		shl eax,1
		jnc next_bit
		inc ebx
		next_bit:
	Loop L3

	cmp ebx, 1
	je _true
	mov ecx,1
	ret
	_true:
	mov ecx, 0
	ret
Bonus_check endp

END main