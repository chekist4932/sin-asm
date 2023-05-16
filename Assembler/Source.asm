.686
.model flat
.code

_bumble_sort proc

mainMark:

	xor edx, edx
	xor eax, eax

	dec dword ptr[esp+8]
	
	mov edx, dword ptr[esp+8]
	cmp edx, 0
	je endMark
	
	mov eax, dword ptr[esp+4]

	minorMark:

		xor ecx, ecx
		xor ebx, ebx

		mov ecx, dword ptr[eax]
		add eax, 4
		mov ebx, dword ptr[eax]
		
		cmp ecx, ebx
		jg lookMark
		jl nextMark

		lookMark:
		
			mov dword ptr[eax], ecx
			mov dword ptr[eax-4], ebx

			dec edx

			cmp edx, 0
			je mainMark
			jmp minorMark

		nextMark:

		dec edx

		cmp edx, 0
		jne minorMark
		je mainMark



endMark: 
	ret

_bumble_sort endp







_gen_array proc


lookAtMeBoy:

xor eax, eax
rdtsc ; целая часть в edx дробная часть в eax 
xor edx, edx

mov ecx, 100
div ecx ; делит значение в регистре eax, остаток в регистр edx

xor ecx, ecx
mov ecx, dword ptr[esp+4]

mov dword ptr[ecx], edx

add ecx, 4
mov dword ptr[esp+4], ecx

dec dword ptr[esp+8]


cmp dword ptr[esp+8], 0
jne lookAtMeBoy

ret


_gen_array endp


_sumper proc
mov eax,dword ptr[esp+4]
mov ebx,dword ptr[esp+8]

cmp eax, ebx
jge lookAtMe

XCHG eax, ebx


lookAtMe: 

xor edx, edx ; запись в ноль регистра остатка от деления

div ebx ; деление, авто запись в eax целой части

mov eax, ebx
mov ebx, edx

cmp edx, 0
jne lookAtMe


ret




_sumper endp



end