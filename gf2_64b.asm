;;64-bit version GF2MUL multiplication of elements in GF(2^n) using simple shift and add
;;with n=29, two elements of max degree d=28 at 29bits => max product of deg(56) at 57bits
;;
;;initial super simple case: b=2h,a=3h,c=6h
;;scale up:b=105h,a=0fah
;;for 64-bit displacement is at rsp + or - 8 (as opposed to 4 with 32-bit)
;;
;;how to run it:
;;nasm -f elf64 -l gf2.lst gf2.asm
;;gcc -o gf2 gf2.o
;;./gf2
;;
;;test with 2h,3h =>6h
;;test with 105h,0fah =>f912
;;test with elements in GF(2^9)
;;1FFFFFFF, 1FF2B600 => 0x155cdbff5519200

	global main
	extern printf

	section .data
Result:	db "Result: %Lx",10, 0

	section .text
	

main:
nop	;//for gdb
push rbp
mov rbp,rsp
push rbx
push rsi
push rdi 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	push rax
	push rcx
	push rdx
	mov rcx,1fffffffh
	mov rdx,1ff2b600h
	push rdx
	push rcx
	sub rsp,16
	call 	GF2MUL	
	add rsp,32
	mov	rdi, Result	; format for printf	
	mov 	rsi, rax	; printf will look for params in rsi...
	mov	rax,0		; specify no xmm 128-bit registers
        call    printf		; Call C function
        pop rdx
        pop rcx
        pop rax
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
pop rdi
pop rsi
pop rbx
mov rsp,rbp
pop rbp
ret

;************************************************************;
; 		gf(2^29) mul of a x b = c in rax	     ;
;************************************************************;
 
GF2MUL: 
push rbp
mov rbp,rsp
push rbx
push rsi
push rdi

mov rax,0h 			;c(t)
mov rcx,29 			;count:29 to 1
mov rdx,28 			;indexing from left to right
mov [rbp+24],rdx 		;i=28

L1:
	mov [rbp+16],rcx 	;save ecx
	mov rdx,1		; 
	mov rcx,[rbp+24]	;i
	shl rdx,cl		;1 << i
	mov rsi,rdx		;mask
	and rsi,[rbp+32]	;(0x1 << i) & b
	cmp rsi,rdx		;b_i set?
	jne UPDATE
SA:
	mov rdx,[rbp+40]	;a
	shl rdx,cl		;a<<i
	xor rax,rdx		;c = c ^ (a<<i)
	
UPDATE:
	mov rdx,[rbp+24]	;
	dec rdx			;
	mov [rbp+24],rdx	;i--
	mov rcx,[rbp+16]	;restore loop count
loop L1

pop rdi
pop rsi
pop rbx
mov rsp,rbp
pop rbp
ret

