;Brian Huang
;4/19/23
;Lab 10
;Macro prints out math expressions
%include "CPsub64.inc"
%include "Macros_CPsub64.inc"
%include "Lab10Macro.inc"

global main

section .text
main:

;retrieve arguments
push rsi
push rdi


add rsi,8
mov r15,[rsi]

add rsi,8
mov r12,[rsi]

add rsi,8
mov r14,[rsi]

pop rsi
pop rdi



;Convert Strings to Integers
mov rdx,r15
mov rcx,255
call ParseInteger64
mov r15,rax

mov rdx, r14
mov rcx,255
call ParseInteger64
mov r14,rax


;call math function
push rax
push rdx

call math

pop rax
pop rdx


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



movzx rdx, word [r12]
cmp rdx, '+' ;2bh in hex
je addition

cmp rdx, '-'
je subtraction

cmp rdx, '/'
je division

cmp rdx, '*'
je multiplication





subtraction:
mov r13,r15
sub r15,r14
print_exp resultMessage,r13,r12,r14,equals,r15;macro use
jmp result

addition:

;do da addition
mov r13,r15;save initial values
add r15,r14

print_exp resultMessage,r13,r12,r14,equals,r15

jmp result

multiplication:
mov r13,r15;save initial value
mov rax,r15
imul r14
mov r15,rax;save the result back to r15

print_exp resultMessage,r13,r12,r14,equals,r15
jmp result

division:
mov r13,r15 ;save inital input
mov rax,r15
mov rdx,0
idiv dword r14
mov r15,rax
mov r11,rdx

print_exp resultMessage,r13,r12,r14,equals,r15
;print remainder since its not included in macro
mov rdx,r
call WriteString
mov rax,r11
call WriteDec

jmp result

result:

call Crlf

;epilogue
pop rbx
pop rbp 
ret





section .data
resultMessage:db"Result:",0,0ah
equals:db '=',0,0ah
equalslen: equ($-equals)
r: db " remainder:",0

