.686
.model flat
.code

_sin_taylor_asm proc

xor ebx, ebx
xor ecx, ecx
mov dword ptr[esp-4], 2 ; const = 2 in [esp-4]
mov ebx, dword ptr[esp+8]
mov ecx, 1 ; count_iter


finit
fld dword ptr[esp+4]			; st1 = x_in_rad
fldz							; st0 = 0 (sum) 


whileMark:

	xor eax, eax
	
	fadd ST(0), ST(1)				; sum: st0 + st1
	fld1							; st0 = 1; st1 = sum ; st2 = x_in_rad

	; eax --> 2 * ecx * (2 * ecx + 1):
			mov eax, ecx					; eax = ecx 
			mul dword ptr[esp-4]			; eax = 2 * ecx

			mov dword ptr[esp-8], eax		; eax in [esp-8]

			add eax, 1						; eax += 1

			mul dword ptr[esp-8]			; eax *= [esp-8]
			mov dword ptr[esp-8], eax		; eax in [esp-8]


			; st0 --> st2 * (-1) * st2 * st2
			fmul ST(0), ST(2)
			fmul ST(0), ST(2)
			fchs							; -x^2 in st0
			fmul ST(0), ST(2)				; x * -x^2
			fild dword ptr[esp-8]			; numerator in stack
			fxch ST(1)						; st0 = denominator | st1 = numerator | st2 = sum | st3 = x_in_rad
			fdiv ST(0), ST(1)				; st0 = new x_in_rad | st1 = numerator | st2 = sum | st3 = x_in_rad
			
			fxch ST(3)						; st0 = old x_in_rad | st1 = numerator | st2 = sum | st3 = new x_in_rad
			fstp dword ptr[esp-12]			; pop old x_in_rad
			fstp dword ptr[esp-12]			; pop numeartor ==> st0 = sum | st1 = new x_in_rad
			add ecx, 1						; counter_iter += 1

			cmp ecx, ebx
				jb whileMark	; ecx < ebx | ebx = n
				je endMark		; ecx = ebx


endMark:
	ret


_sin_taylor_asm endp




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