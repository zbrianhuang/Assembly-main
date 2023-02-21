;Author: Brian Huang
;Date: 2/20/23
;Purpose: Lab 5

%include "CPsub64.inc"

global _start

section .text

_start:



lea r15, [array]
mov r14, [r15]
mov rax,r14
mov r14, [r15+8]
add rax,r14
call WriteInt

;linebreak
mov rax,1
mov rdi,1
mov rsi,linebreak
mov rdx,linebreakLen
syscall

;exit
mov rax, 60
xor rdi, rdi
syscall


section .data
array: DQ 100,200,300,400,500
linebreak: db" ",0ah,0;linebreak 
linebreakLen:equ($-linebreak);linebreak len
addMsg: db "Element1 + Element 2= " ;message to display when adding elements 1 and 2
addMsgLen: equ($-addMsg)

