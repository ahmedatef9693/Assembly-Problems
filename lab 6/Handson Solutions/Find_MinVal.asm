
INCLUDE Irvine32.inc
.DATA

strmsg1 byte " # Elements of Array: ",0
strmsg11 byte " Input Array: ",0
strmsg  byte " Min val = ",0

MaxElements EQU 20

ARR sdword MaxElements dup(?)

MinVal sdword 7fffffffh

.code
main PROC

; print msg to user
mov edx, offset strmsg1
call writestring                         

call Readdec    ; Reads the number of elements of the  Array
MOV ECX,EAX		; for the Loop counter
mov esi,offset Arr

call FindMinVal     ; Invoke MinVal Proc

mov edx,offset strmsg
call writestring


call writeint   ; as the MinVal returns in eax already

call crlf
exit
main ENDP

;Read an array & finds the Minimum Value in it
;takes length of the array in ecx, offset of array in esi
;returns the MinVal in eax

FindMinVal Proc

mov edx,offset strmsg11
call writestring

ReadArr:

call Readint
mov [esi],eax
cmp eax,MinVal
jge skip
mov MinVal,eax
skip:
add esi,4
loop ReadArr

mov eax,MinVal

ret
FindMinVal ENDP


END main