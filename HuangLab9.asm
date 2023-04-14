;Brian Huang
;4/13/23
;Lab 9

%include "CPsub64.inc"
%include "Macros_CPsub64.inc"
extern puts
global main

section .text

main:

mov r14,rdi
mov rcx,rdi
dec rcx;ignore title program
mov r15,0
    print_args:
    
    push rdi
    push rsi
    
    
    
    add rsp,r15
    sub rsp,8
    
    mov rdi,[rsi]
    call puts
    
    add rsp,8


    pop rsi
    pop rdi
    

    counter
    
    
    

    cmp rcx,1
    je exit
    dec rcx
    add r15,8
    jmp print_args
    
    exit:
    ret


section .data

blankLine: db ' ',0,0ah