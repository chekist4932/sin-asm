.686
.model flat
.code

_sin_taylor proc

; dword ptr[esp+8]			; epsilon 

mov dword ptr[esp-4], 2 ; const = 2 in [esp-4]
mov dword ptr[esp-8], 1 ; numerator initial
finit
fld dword ptr[esp+4]			; st1 = x_in_rad
fldz							; st0 = 0 (sum) 


mov ecx, 1 ; count_iter

whileMark:
 xor eax, eax
 xor edx, edx
 xor ebx, ebx
 ; sum: st0 + st2
	fadd ST(0), ST(1)
	; fxch ST(1)
 ; edx --> 2 * ecx * (2 * ecx + 1):
	mov eax, ecx				; eax = ecx 
	mul dword ptr[esp-4]        ; eax = 2 * ecx

	mov dword ptr[esp-12], eax   ; eax in [esp-8]

	add eax, 1					; eax += 1

	mul dword ptr[esp-12]		; eax *= [esp-8]
	mov dword ptr[esp-12], eax
	
	;fild dword ptr[esp-12]		; st4


;	
;	
; st3 --> st1 * (-1) * st1 * st1
; st4 --> st3 / edx
; add ecx, 1
; cmp abs(st4)
; 


ret



_sin_taylor endp


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