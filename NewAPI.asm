;Brian Huang
;2/27/23
;practicing new APIs

%include "Macros_CPsub64.inc"
%include "CPsub64.inc"

global main

section .text

main:

;inital msg
mov rdx, openingMessage
call WriteString;
call Crlf
;print first input msg
mov rdx, firstNumberMessage
call WriteString
call Crlf

;get the 1st number
mov rdx,input1
mov rcx,255
call ReadString

;convert to number

mov rdx,input1
mov rcx, rax
call ParseInteger64
mov r8,rax

;print 2nd input msg
mov rdx,secondNumberMessage
call WriteString
call Crlf

;get the 2nd number
mov rdx,input2
mov rcx,255
call ReadString

;convert to number

mov rdx,input2
mov rcx, rax
call ParseInteger64
mov r9,rax

;message for 3rd input
mov rdx,thirdMessage
call WriteString
call Crlf

;add to variable
mov rdx,input3
mov rcx,255
call ReadString
mov r10, rax


;dump mem
mov rsi,input3
mov rbx,255
call DumpMem

;check the symbol
mov rdx, [input3]; if having trouble use movzx, WORD [input3]
cmp rdx, '+' ;2bh in hex
je addition;equALS

cmp rdx, '-'
je subtraction
call DumpRegs

subtraction:
sub r9,r8
jmp result

addition:

;do da addition
add r8,r9
jmp result

result:
;display answer 
mov rdx,resultMessage
call WriteString
mov rax,r9
call WriteInt
call Crlf

;sysexit
call Exit

section .data
openingMessage: db "Let's do a little math." ,0,0ah
firstNumberMessage: db "Enter the first number",0,0ah
secondNumberMessage: db "Enter the second number", 0,0ah
thirdMessage: db "Enter the math symbol" ,0,0ah
resultMessage: db "The result is",0,0ah

section .bss
input1: resb 255
input2: resb 255
input3: resb 255
