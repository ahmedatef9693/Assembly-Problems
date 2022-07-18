;Triangular Sequence
;Solution

INCLUDE Irvine32.inc

.DATA
num DWORD ?
tri DWORD 1
cnt DWORD 1

.CODE
main PROC
	;INPUT
	call readdec
	mov num, eax

	;CALCULATE AND DISPLAY TRI. SEQUENCE UP 'TIL Nth ELEMENT
	mov ecx, num
	findSeq:
		mov eax, tri
		call writedec
		
		mov al, ' '
		call writechar

		inc cnt
		mov ebx, cnt
		add tri, ebx
	LOOP findSeq

	exit
main ENDP

END main