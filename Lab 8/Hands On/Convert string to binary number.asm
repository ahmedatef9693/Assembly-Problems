INCLUDE Irvine32.inc
.DATA
	str1 byte "Enter a string: ",0
	str2 byte "The Binary Value =  ",0
	error_str byte "Invalid input !!",0

	Input_str byte 8 Dup(0), 0   
	result byte 0

.code
	main PROC

		mov edx, offset str1
		call writestring

		mov edx, offset Input_str
		mov ecx,9    ; you have to calculate the null terminating character
		call readstring

		mov ecx,8
		call calculate_Binary_value


		exit
	main ENDP


	;-----------------------------------------------------------------
	;Calculates the Binary value in a string
	;Recieves: 1. EDX contains the offset of the string
	;		   2. ECX contains the number of digits to calculate
	;-----------------------------------------------------------------
	calculate_Binary_value Proc

		L:
			mov al,[edx]
			sub al,'0'
			cmp al,0
			jne set_carry
			clc
			jmp rotate_left

			set_carry:
			cmp al,1
			jne error
			stc

			rotate_left:
			RCL result,1
			inc edx
		Loop L

		mov edx, offset str2
		call writestring
		movzx eax, result
		call writebin
		call crlf
		ret
		
		error:
		mov edx,offset error_str
		call writestring
		call crlf

		ret
	calculate_Binary_value ENDP



	END main