

INCLUDE Irvine32.inc
.DATA
str1 byte "Enter the array: ",0
str2 byte "Even or Odd (E/O):  ",0
even_str byte "Summation of Even numbers =  ",0
odd_str byte "Summation of Odd numbers =  ",0

array dword 10 dup(?) 

.code
main PROC

	mov edx, offset str1
	call writestring

	mov esi, offset array
	mov ecx, 10
	call read_array

	mov edx, offset str2
	call writestring
	call readchar

	mov esi, offset array
	mov ecx, 10

	cmp al,'E'
	je even_no
	call calculate_odd_summation
	mov edx, offset odd_str
	call writestring
	call writeint
	call crlf
	exit

	even_no:
	call calculate_even_summation
	mov edx, offset even_str
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
read_array Proc
	L1:
		call readint
		mov [esi], eax
		add esi, 4
	Loop L1
	ret
read_array ENDP


;-----------------------------------------------------------------
;Calculates the summation of even numbers
;Recieves: 1. ESI contains the offset of the integer array
;		   2. ECX contains the number of integers
;Output:   EAX contains the summation
;-----------------------------------------------------------------
calculate_even_summation Proc
	mov eax,0
	L2:
		mov ebx, [esi]
		SHR ebx, 1
		jc next
		add eax,[esi]
		next:
		add esi,4
	Loop L2

	ret
calculate_even_summation ENDP

;-----------------------------------------------------------------
;Calculates the summation of odd numbers
;Recieves: 1. ESI contains the offset of the integer array
;		   2. ECX contains the number of integers
;Output:   EAX contains the summation
;-----------------------------------------------------------------
calculate_odd_summation Proc
	mov eax,0
	L2:
		mov ebx, [esi]
		SHR ebx, 1
		jnc next
		add eax,[esi]
		next:
		add esi,4
	Loop L2

	ret
calculate_odd_summation ENDP

END main