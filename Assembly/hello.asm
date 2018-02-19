.data
firstByte db 78 ;define byte somewhere in RAM
firstWord dw ? ;? to uninitialized variable
firstReal real4 89.5

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
	mov r11d, 1 ;op on 32bit reg zeroes the rest of the 64bit
	ret
RegTest endp

ByteTest proc
	ret
ByteTest endp
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