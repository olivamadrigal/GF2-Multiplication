# GF2-Multiplication
GF(2^n) multiplication in AI 32 x86 NASM with n=9 as example

# Example run:

samira> nasm -f elf -g -F stabs gf2.asm -l gf2.lst

samira> gcc -m32 gf2.o -o gf2

samira> ./gf2

Result: f912

samira> 

# Evironment:

samira> nasm -v

NASM version 2.10.09 compiled on Dec 29 2013

samira> uname -a

Linux ubuntu 4.4.0-116-generic #140~14.04.1-Ubuntu SMP Fri Feb 16 09:25:20 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

IDE: TextEditor

# Quick References for instruction calling conventions:

https://www.cs.dartmouth.edu/~sergey/cs258/tiny-guide-to-x86-assembly.pdf

https://flint.cs.yale.edu/cs421/papers/x86-asm/asm.html

https://cs.lmu.edu/~ray/notes/nasmtutorial/ (for 64-bit registers with rax, rbx, etc.)

