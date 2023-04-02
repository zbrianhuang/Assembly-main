;Brian Huang
;3/30/23
;Lab 7

%include "CPsub64.inc"
%include "Macros_CPsub64.inc"
global main

section .text

main:
mov rdx, msg1
call WriteString

section .data
msg1: db 'Please enter the first string',0,0ah
msg2: db 'Please enter the second string',0,0ah

section .bss
userInput: resb 255