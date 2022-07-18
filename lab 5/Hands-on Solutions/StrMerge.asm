; Merge 2 smaller strings into 1 big string using stack

INCLUDE Irvine32.inc

.DATA

arr dword 5dup(?) 


.CODE
main PROC

mov ecx,5

l1:

call readint

loop l1

exit
main ENDP




	ret
mergeStrings ENDP

END main