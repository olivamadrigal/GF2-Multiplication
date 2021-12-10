# GF2-Multiplication
GF(2^n) multiplication for IA 32 x86 NASM with n=9 as example

GF(2^n) multiplication for IA x86-64 architecture with n=29 as an example

# Example run:
32-bit version:

samira> nasm -f elf -g -F stabs gf2.asm -l gf2.lst

samira> gcc -m32 gf2.o -o gf2

samira> ./gf2

Result: f912

64-bit version:

samirita> nasm -f elf64 -l gf2.lst gf2.asm

samirita> gcc -o gf2 gf2.o

samirita> ./gf2

Result: 155cdbff5519200

# General Instructions:

Understand the algorithm

Follow the call stack closely

Careful attention to calling convetions and instructions...

For example shl <op1> <op2> required operands
  
mov [ebp+12],edx and not dl...
 
cmp a,b will compare the full contents of both registers... 
  
we compute accordingly
  
test as you go...
  
start with simple input test vectors, then scale up

# Evironment:

32-bit version: 
  
samira> nasm -v

NASM version 2.10.09 compiled on Dec 29 2013

samira> uname -a

Linux ubuntu 4.4.0-116-generic #140~14.04.1-Ubuntu SMP Fri Feb 16 09:25:20 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

IDE: TextEditor
  
64-bit version:

samirita> nasm -v

NASM version 2.15.05 compiled on Nov  3 2021

samirita> uname -a

Linux fedora 5.14.10-300.fc35.x86_64 #1 SMP Thu Oct 7 20:48:44 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux

# Quick References for instruction calling conventions:

https://www.cs.dartmouth.edu/~sergey/cs258/tiny-guide-to-x86-assembly.pdf

https://flint.cs.yale.edu/cs421/papers/x86-asm/asm.html

https://cs.lmu.edu/~ray/notes/nasmtutorial/ (for 64-bit registers with rax, rbx, etc.)

https://www.csee.umbc.edu/portal/help/nasm/ (excellent resource and examples for instruction conventions)
  
# Object code: 

You can find the equivalent program in C in this file: https://github.com/olivamadrigal/jenkins_pipeline/blob/main/gf2_9_mul.c

You can put that in new file with main, same test vectors, and create an object file:

samira> gcc -O -g -o main.c

Then do an object dump to see the machine code and assembly code from gcc compiler:
  
samirita> nasm -v

samira> objdump -d main.c

main.o:     file format elf64-x86-64

Disassembly of section .text:

(relative addr) // (object code in hex) // assembly ;)
  
0000000000000000 <main>:

and compare...
