.data
firstByte db 78 ;define byte somewhere in RAM
firstWord dw ? ;? to uninitialized variable
firstReal real4 89.5
firstQWord sqword 0

.code
SomeFunction proc
	mov ax, -1 
	mov al,  0
	ret 
SomeFunction endp

RegTest proc
	mov rax, -1
	mov al, 5
	mov ax, 17
	mov eax, 1

	mov r11, -10
	mov r11b, 50
	mov r11w, 66
	mov r11d, 1                    ;op on 32bit reg zeroes the rest of the 64bit
	ret
RegTest endp

ByteTest proc
	mov al, firstByte               ;mov the value of firstByte into al
									;ASM has no type safety
									
	mov eax, real4 ptr [firstReal] ;another way to move a value into an address

									;these byte will be executed like machine code
	;db 45, 78, 19, 23				 adds to 64bits - is very exact

	ret
ByteTest endp

MovTest proc
	mov rax, 89
	mov cx, ax
	mov firstByte, cl ; address to memory
	mov al, firstByte ;memory to address 
					  ;no memory to memory 

	lea rax, firstByte ;load pointer into a register
						;Pointers are 64bit so entire reg is used

	mov byte ptr[rax], 7 ;move 7 into whatever rax points to (mem write)

	ret
MovTest endp

MathTest proc
	mov rax, 5
	mov rcx, 12
	add rax, rcx ;get 17 store in  rax

	xor rcx, rcx ; zero rcx
	mov rax, 2147483648   ;add rcx, 2147483648 64bit add doesn't work as intended (signed bit), results in teh two's complement of thsi number
	add rcx, rax
	mov firstQWord, rcx

	mov al, 255 ;unsigned overflow byte can't go past 255
	inc al      ;carry flag isn't set with inc, used add

	mov al, 0
	dec al ;underflow just like above carry flag is unaffected

	ret
MathTest endp
end

;Changing bx
;push rbx
;change bs
;pop rbx

;Data Types
;Integer
;byte, word, dword, qword
;
;Floating point
;real4, real8, real10
;IEEE754 floating point type
;real4: single precision float (32-bits) | 1 sign bit, 8 bit exponent, 23 bit mantissa
;real8: double precision float (64-bits) | 1 sign bit, 11 bit exponent, 52 bit mantissa
;real10: extended precision float (80-bits - Only used in x87 FPU) | 1 sign bit, 15 bit exponent, 64 bit mantissa

;SIMD Pointers
;xmmword, ymmword, (not supported - AVX512 needed)zmmword
;SIMD packed data
;xmmword: 128 bits
;ymmword: 256 bits
;zmmword: 512 bits

;Some ops have different instructions depending on the sign
;signed used IDIV and IMUL
;unsigned used DIV and MUL

;Two's Complement
;Used when performing signed integer arithmetic
;most significant bit is the sign bit
;positive if 0
;negative if 1