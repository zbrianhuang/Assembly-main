;Author: Brian Huang
;Date: 2/20/23
;Purpose: Lab 5

%include "CPsub64.inc"

global main

section .text

main:



mov r8, 0 ;index
lea r15, [array]



;Addition Message
mov rax,1
mov rdi, 1
mov rsi, addMsg
mov rdx, addMsgLen
syscall


;Perform addition & print result
mov r14, [r15]
mov rax,r14
mov r8,  2
mov r14, [r15+8*r8]
add rax,r14
mov r9, rax     ;save result
call WriteInt

;linebreak
mov rax,1
mov rdi,1
mov rsi,linebreak
mov rdx,linebreakLen
syscall

;Subtraction Message
mov rax,1
mov rdi, 1
mov rsi, subMsg
mov rdx, subMsgLen
syscall




;Perform subtraction & print result
mov r8, 4
mov r14,[r15+8*r8]
mov rax,r9
sub rax,r14
call WriteInt

mov r10, rax ;save difference

;linebreak
mov rax,1
mov rdi,1
mov rsi,linebreak
mov rdx,linebreakLen
syscall

;Multiplication Message
mov rax, 1
mov rdi,1
mov rsi, mulMsg
mov rdx, mulMsgLen
syscall

;Perform Multiplication & print product
mov r14, r10
mov r8, 1
mov rax, [r15+8*r8]
imul r14
call WriteInt

;save product
mov r9,rax

;linebreak
mov rax,1
mov rdi,1
mov rsi,linebreak
mov rdx,linebreakLen
syscall

;Display Division Message
mov rax,1
mov rdi,1
mov rsi,divMsg
mov rdx,divMsgLen
syscall

;Perform Division
mov rax, r9
mov r8,3
mov r14, [r15+r8*8]
mov rdx,0   
idiv DWORD r14
call WriteInt


;store remainder
mov r15, rdx

;linebreak
mov rax,1
mov rdi,1
mov rsi,linebreak
mov rdx,linebreakLen
syscall


;Print Remainder Message
mov rax,1
mov rdi,1
mov rsi,modMsg
mov rdx,modMsgLen
syscall

;print remainder

mov rax,r15
    
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
array: DQ 500,400,300,200,100
linebreak: db" ",0ah,0;linebreak 
linebreakLen:equ($-linebreak);linebreak len
addMsg: db "Element1 + Element 3 = " ;message to display when adding elements 1 and 2
addMsgLen: equ($-addMsg)
subMsg: db "Element5 - Previous Result = " ;message to display when subtracting elements 1 and 2
subMsgLen: equ($-subMsg)
mulMsg: db "Previous Result * Element 2 = " ;message to display when multiplying elements 1 and 2
mulMsgLen: equ($-mulMsg)
divMsg: db "Previous Result /  Element 2 = " ;message to display when getting quotient
divMsgLen: equ($-divMsg)
modMsg: db "Remainder: "             ;Remainder
modMsgLen: equ($-modMsg)


;100+300=400
;500-400=100
;100*200=20000
;20000/200
