;question <1>
;--------------
INCLUDE Irvine32.inc
.data
arr Dword 3 Dup(0,0,0)
.code
main PROC

mov edi , offset arr
mov ecx , 9

cin:
call readint
mov [edi],eax
add edi , 4
loop cin

mov ecx , 3
mov edx , 0
mov edi , offset arr
addition:
add edx , [edi]
add edi , 16
loop addition

mov eax , edx
call writedec

CALL CRLF
    
	exit
main ENDP

END main

;question<2>
;-------------
include irvine32.inc
.data

next byte 1d
.code

main proc

call readint
mov ecx,eax
mov eax,0
start:

movzx ebx ,byte ptr next
add eax,ebx
inc next

call writeint

loop start


	exit
main endp

end main

////////////////////////////////////////////////////////////////////////////////////////////////////////////
;question <3>
;--------------
include irvine32.inc
.data
 arr byte 3 dup (3 dup (?))
.code
main PROC
mov esi, offset arr

mov ecx, 9

first:
call readint
mov [esi], eax
add esi,1
loop first

mov eax,0
mov edi, offset arr
mov ecx , 3

second:
movzx ebx,byte ptr[edi]
mov eax,ebx
call writeint
add edi,3
loop second

mov eax,0
mov edi, offset arr+1
mov ecx , 3

third:
movzx ebx,byte ptr[edi]
mov eax,ebx
call writeint
add edi,3
loop third

mov eax,0
mov edi, offset arr+2
mov ecx , 3

fourth:
movzx ebx,byte ptr[edi]
mov eax,ebx
call writeint
add edi,3
loop fourth

call crlf
	exit

main ENDP

END main
///////////////////////////////////////////////////////////////////////////////////////////////////
;question <5>
;-----------

INCLUDE Irvine32.inc
.data

.code
main PROC
mov ebx , 0
call readint
mov ecx , 9
myloop:
add  ebx , eax
push eax
push ebx
mov eax , ebx
call writedec
pop ebx 
pop eax
push eax
mov al  , ','
call writechar
pop eax
loop myloop

call crlf
	exit
main ENDP

END main
-------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////////
;question <7>
;--------------
include irvine32.inc
.data
str1 byte "enter how many items for first array then enter them :"

arr1 byte ?
arr2 dword ?
dest dword ?
str2 byte "enter how many items for second array then enter them :"

.code
main proc

mov edx,offset str1

call writestring
call readint
mov esi,offset arr1
mov edi,offset arr2
mov ecx,eax

L1:

call readint
mov [esi],al

inc esi

loop L1


mov edx,offset str2
call writestring
call readint

mov ecx,eax
mov ebx,eax                      ;size 2nd array


L2:

call readint
mov [edi], eax
add edi,4
loop L2

mov edi,offset dest
mov ecx,lengthof arr1

L3:
movzx eax,byte ptr[esi]
mov [edi],eax
inc esi
add edi,4
;call writeint
loop L3

mov esi,offset arr2
mov ecx,lengthof arr2
L4:

mov eax,[esi]
mov [edi],eax
add esi,4
add edi,4
loop L4


;L5:


;loop L5
	exit
main endp
end main