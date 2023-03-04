;Author: Brian Huang
;Date: 3/2/23
;Purpose: Lab 4

%include "CPsub64.inc"

global main

section .text
main: 

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



;perform calculations



movzx rdx, word [userInput]; if having trouble use movzx, WORD [input3]
cmp rdx, '+' ;2bh in hex
jz addition;equALS

cmp rdx, '-'
je subtraction

cmp rdx, '/'
je division

cmp rdx, '*'
je multiplication

subtraction:
sub r15,r14
jmp result

addition:

;do da addition
add r15,r14
jmp result

multiplication:
mov rax,r15
imul r14
mov r15,rax;save the result back to r15

jmp result

division:
mov rax,r15
mov rdx,0
idiv dword r14
mov r15,rax
jmp result

result:
;display answer 
mov rdx,resultMessage
call WriteString
mov rax,r13
call WriteInt
mov rdx,userInput
call WriteString
mov rax,r14
call WriteInt
mov rdx,equals
call WriteString

;result
mov rax,r15
call WriteInt
call Crlf




;Add the numbers together





;exit
mov rax, 60
xor rdi, rdi
syscall

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
equals:db '='
equalslen: equ($-equals)


section .bss
userInput: resb 255												;reserves 255 bytes