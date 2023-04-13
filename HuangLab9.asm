;Brian Huang
;4/13/23
;Lab 9

%include "CPsub64.inc"
%include "Macros_CPsub64.inc"
extern puts
global main

section .text

main:

mov rcx,rdi
mov r15,8
    print_args:

    
    

    ;counter
    
    
    mov rax,rcx
    call WriteInt
    loop print_args
    
ret


section .data

blankLine: db ' ',0,0ah