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

# Object code: 

You can find the equivalent program in C in this file: https://github.com/olivamadrigal/jenkins_pipeline/blob/main/gf2_9_mul.c

You can put that in new file with main, same test vector, and create an object file:

samira> gcc -O -g -o main.c

Then do an object dump to see the machine code and assembly code from gcc:

samira> objdump -d main.c

main.o:     file format elf64-x86-64


Disassembly of section .text:

(relative addr) // (object code in hex) // assembly ;)
0000000000000000 <main>:

and compare...
  
