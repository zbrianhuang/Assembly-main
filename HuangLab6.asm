;Author: Brian Huang
;Date: 3/26/23
;Purpose: Lab 6

%include "CPsub64.inc"
%include "Macros_CPsub64.inc"
global main

section .text
main: 


start:
;print the first message
mov rax,1
mov rdi,1
mov rsi,addMessage
mov rdx,addMessageLen
syscall




;print second msg
mov rax,1
mov rdi,1
mov rsi,secondMessage
mov rdx,secondMessageLen
syscall

;get Input
mov rdx, 255
mov rcx, userInput
mov rbx, 0
mov rax, 3
int 80h

;convert Integer to string
mov rdx, userInput
mov rcx, 255
call ParseInteger64

;save the result
mov r15,rax


;duplicate so that this number is saved after calculations
mov r13,r15

;print message asking for second input
mov rax, 1
mov rdi,1
mov rsi, thirdMessage
mov rdx, thirdMessageLen
syscall

;get second input
mov rdx,255
mov rcx, userInput
mov rbx,0
mov rax,3
int 80h

;convert Integer to string
mov rdx,userInput
mov rcx, 255
call ParseInteger64

;save the number
mov r14,rax

;print operator message
mov rax,1
mov rdi,1
mov rsi,operatorMsg
mov rdx,operatorMsgLen
syscall

;get operatoor input
mov rdx,userInput
mov rcx,255
call ReadString


push rax
push rdx


call math


pop rax
pop rdx

;continue?
mov rdx, continue
call WriteString
call Crlf
mov rdx,userInput
mov rcx,255
call ReadString
movzx rdx, word [userInput];
cmp rdx,'y'
je start



;exit
mov rax, 60
xor rdi, rdi
syscall


;math function
math:

;prologue
push rbp
mov rbp,rsp;set pointer to current top on the stack
push rbx


;perform calculations



movzx rdx, word [userInput]
cmp rdx, '+' ;2bh in hex
je addition;equALS

cmp rdx, '-'
je subtraction

cmp rdx, '/'
je division

cmp rdx, '*'
je multiplication





subtraction:
sub r15,r14
mov rdx,resultMessage
call WriteString
mov rax,r13
call WriteDec
mov rdx,userInput
call WriteString
mov rax,r14
call WriteDec
mov rdx,equals
call WriteString
mov rax,r15
call WriteInt
jmp result

addition:

;do da addition
add r15,r14
mov rdx,resultMessage
call WriteString
mov rax,r13
call WriteDec
mov rdx,userInput
call WriteString
mov rax,r14
call WriteDec
mov rdx,equals
call WriteString
mov rax,r15
call WriteInt
jmp result

multiplication:
mov rax,r15
imul r14
mov r15,rax;save the result back to r15
mov rdx,resultMessage
call WriteString
mov rax,r13
call WriteDec
mov rdx,userInput
call WriteString
mov rax,r14
call WriteDec
mov rdx,equals
call WriteString
mov rax,r15
call WriteInt
jmp result

division:
mov rax,r15
mov rdx,0
idiv dword r14
mov r15,rax
mov r12,rdx
mov rdx,resultMessage
call WriteString
mov rax,r13
call WriteDec
mov rdx,userInput
call WriteString
mov rax,r14
call WriteDec
mov rdx,equals
call WriteString
mov rax,r15
call WriteInt
mov rdx,r
call WriteString
mov rax,r12
call WriteDec

jmp result

result:
;display answer 

;result


call Crlf

;epilogue
pop rbx
pop rbp 
ret



;get Input

section .data
addMessage: db "You will be asked for two numbers and an operator.",0ah	;first message
addMessageLen: equ($-addMessage) 								;get length of firstMessage									;getLength of Division Message
secondMessage: db "Please enter the first number",0ah 				;second message
secondMessageLen: equ($-secondMessage)								;get length of secondMessage
thirdMessage: db "Please enter the second number",0ah			;third message
thirdMessageLen:equ($-thirdMessage)								;get the length of the third message
lineBreak: db "",0ah
lineBreakLen: equ($-lineBreak)
operatorMsg: db "Please enter an arithmetic operator",0,0ah
operatorMsgLen: equ($-operatorMsg)
resultMessage:db"Result:",0,0ah
equals:db '=',0,0ah
equalslen: equ($-equals)
continue: db "Continue? y/n",0,0ah

y: db  "y",0
r: db " remainder:",0
section .bss
userInput: resb 255												;reserves 255 bytes
