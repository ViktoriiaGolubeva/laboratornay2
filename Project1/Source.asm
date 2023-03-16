.686
.model flat,stdcall
.stack 100h
.data
X dw 00000h 
Y dw 0B3D1h
Q dw 088BDh
ms dw 00000h, 0B3D1h, 088BDh
.code
ExitProcess PROTO STDCALL :DWORD
Start:
xor eax,eax
xor ebx,ebx
xor ecx,ecx
xor edx,edx
;task1 
mov cx, 3
mov bx,0
let:
mov ax, ms[bx]
imul ax, 4
mov ms[bx], ax
inc bx
inc bx
loop let
;task2
mov dx, ms[0]
add dx, ms[1]
sub dx, ms[2]
xor eax,eax
xor ecx,ecx
mov cx,dx
xor edx,edx
mov dx,21
cmp cx,dx
JG ElsePart
mov ax, dx
OR ax,00FF0h

JNLE EndOfIf
ElsePart:
 mov ax, cx
 ADD ax, 1028
 
EndOfIf:

;task3
xor edx,edx
mov dx,ax
xor eax,eax
mov ax,0
cmp dx,ax
JG ElsePart1
xor ecx,ecx
mov cx,dx
add cx, 03ch
JNLE EndOfIf1
ElsePart1:
 xor ecx,ecx
mov cx,dx
add cx, 2
EndOfIf1:

exit:
Invoke ExitProcess,1
End Start