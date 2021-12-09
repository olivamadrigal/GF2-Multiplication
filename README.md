# GF2-Multiplication
GF(2^n) multiplication in AI 32 x86 NASM with n=9 as example

Example run:

samira> nasm -f elf -g -F stabs gf2.asm -l gf2.lst

samira> gcc -m32 gf2.o -o gf2

samira> ./gf2

Result: f912

samira> 
