
INCLUDE Irvine32.inc
.DATA

strmsg1 byte " # Elements of Array1: ",0
strmsg11 byte " Input Array1: ",0


strmsg2 byte " # Elements of Array2: ",0
strmsg22 byte "Input Array2: ",0

strConcat byte" Concatenated Array: ",0

MaxElements EQU 20

src1 byte MaxElements dup(?)
elements1 dword ?
src2 word MaxElements dup(?)
elements2 dword ?
dest dword MaxElements+MaxElements dup(?)


.code
main PROC

;for the First source Array

mov edx, offset strmsg1
call writestring                         

call Readdec    ; Reads the number of elements of the 1st Array
MOV ECX,EAX		; for the Loop counter
mov elements1,eax   ; store # of elements of the first array

mov edx, offset strmsg11
call writestring                         

mov esi, offset src1
mov edi,offset dest

;Read the elements in src1 Array & update the dest  

L1:
call Readdec
mov [esi],al			; put element in src1
mov [edi],eax			;put element in dest
inc esi
add edi,4
LOOP L1

; for the Second Source Array
;---------------------------------------------------------------------------------
mov edx, offset strmsg2
call writestring                         

call Readdec    ; Reads the number of elements of the 2nd Array
MOV ECX,EAX		; for the Loop counter
mov elements2,eax   ; store # of elements of the 2nd array


mov edx, offset strmsg22
call writestring                         

mov esi, offset src2

;Read the elements in src2 Array & update dest

L2:
call Readdec
mov [esi],ax
mov [edi],eax
add esi,2
add edi,4
LOOP L2


;Display elements in dest
mov edx,offset strConcat
call writestring

mov ecx, elements1
add ecx, elements2
mov edi,offset dest
disp:
mov eax,[edi]
call writedec

mov al,' '
call writechar
add edi,4
loop disp

call crlf
exit
main ENDP


END main