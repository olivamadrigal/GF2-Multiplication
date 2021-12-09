;;GF2MUL for GF(2^9) using simple shift and add
;;EXAMPLE: (1 0000 0101 [105h])(0 1111 1010 [0fah]) = (00 1111 1001 0001 0010= [0f912])

105h
0fah

	global main

	section .data
Result:	db "Result: %x",10, 0
end:	dw 0h
set:	dw 1
i:	db 8h
	
	section .text
extern printf
main:
nop	;//for gdb
push ebp
mov ebp,esp
push ebx
push esi
push edi 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	push eax	;;caller-save because we use these
	push ecx
	push edx
	mov ecx,105h	;;b=2h, simple test
	mov edx,0fah	;;a=3h,
	push edx	;;push parameters on stack
	push ecx
	sub esp,8	;;align 16B before a call
	call GF2MUL	;;pushes RET ADDR on stack
	add esp,20	
	sub esp,8	;;in this order...
	push eax	;;push returned value in this way
	push Result	;;since	printf, & extern funcs will look parameters right above RET ADDR
	call printf
	add esp,16
	pop edx
	pop ecx
	pop eax
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
pop edi
pop esi
pop ebx
mov esp,ebp
pop ebp
ret

;************************************************************;
; 		gf(2^9) mul of a x b = c in eax		     ;
;************************************************************;
; 
GF2MUL: 
push ebp
mov ebp,esp
push ebx
push esi
push edi

mov eax,0h 			;c(t)
mov ecx,9 			;count:9 to 1
mov edx,8 			;indexing from left to right
mov [ebp+12],edx 		;i=8

L1:
	mov [ebp+8],ecx 	;save ecx
	mov edx,1		; 
	mov ecx,[ebp+12]	;i
	shl edx,cl		;1 << i
	mov esi,edx		;mask
	and esi,[ebp+16]	;(0x1 << i) & b
	cmp esi,edx		;b_i set?
	jne UPDATE
SA:
	mov edx,[ebp+20]	;a
	shl edx,cl		;a<<i
	xor eax,edx		;c = c ^ (a<<i)
	
UPDATE:
	mov edx,[ebp+12]	;
	dec edx			;
	mov [ebp+12],edx	;i--
	mov ecx,[ebp+8]		;restore loop count
loop L1


pop edi
pop esi
pop ebx
mov esp,ebp
pop ebp
ret


