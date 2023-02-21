;Author: Brian Huang
;Date: 2/15/23
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





;resuable code
;print the second message
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

;print third message
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



;end of reusable code


call DumpMem


;Add the numbers together
mov rax,r14
add rax,r15
call WriteDec

;Print Subtraction Message
mov rax,1
mov rdi,1
mov rsi, lineBreak
mov rdx, lineBreakLen
syscall


;Print Subtraction Message
mov rax,1
mov rdi,1
mov rsi, subMessage
mov rdx, subMessageLen
syscall


;print the second message
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

;print third message
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

;subtract and print result
mov rax,r15
sub rax,r14
call WriteInt ;negative numbers are included 

; print blank line

mov rax,1
mov rdi,1
mov rsi, lineBreak
mov rdx, lineBreakLen
syscall

;print the multiplication message
mov rax,1
mov rdi,1
mov rsi,mulMessage
mov rdx, mulMessageLen
syscall


;print the second message
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

;print third message
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

;multiply and print result
mov rax,r14
mul r15
call WriteInt

;lineBreak
mov rax, 1;
mov rdi, 1;
mov rsi, lineBreak;
mov rdx, lineBreakLen;
syscall

;print division message
mov rax,1
mov rdi,1
mov rsi, divMessage
mov rdx, divMessageLen
syscall

;print the second message
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

;print third message
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

;Dump Registers
call DumpRegs


;convert Integer to string
mov rdx,userInput
mov rcx, 255
call ParseInteger64

;save the number
mov r14,rax


;divide number and print result
mov rax,r15
mov rdx,0
idiv DWORD r14

call WriteInt


;exit
mov rax, 60
xor rdi, rdi
syscall

section .data
addMessage: db "You will be asked for two numbers to add.",0ah	;first message
addMessageLen: equ($-addMessage) 								;get length of firstMessage
subMessage: db "You will be asked for two numbers to subtract.(Minuend will be the first input, Subtrahend will be second input)",0ah 
subMessageLen: equ($-subMessage)
mulMessage: db "You will be asked for two numbers to multiply.",0ah ;multiplication message
mulMessageLen: equ($-mulMessage)								;get the length of the multiplication message
divMessage: db "You will be asked for two numbers to divide. (Dividend first, Divisor second)", 0ah; division Message
divMessageLen: equ($-divMessage)									;getLength of Division Message
secondMessage: db "Please enter the first number",0ah 				;second message
secondMessageLen: equ($-secondMessage)								;get length of secondMessage
thirdMessage: db "Please enter the second number",0ah			;third message
thirdMessageLen:equ($-thirdMessage)								;get the length of the third message
lineBreak: db "",0ah
lineBreakLen: equ($-lineBreak)



section .bss
userInput: resb 255												;reserves 255 bytes
