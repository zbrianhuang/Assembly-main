%include "CPsub64.asm"

global _start

section .text
_start:
call DumpMem

;exit
mov rax, 60
xor rdi,rdi
syscall
section .data
