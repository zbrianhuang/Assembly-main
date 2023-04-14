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
dec rcx;ignore title program

mov rax,rcx
call WriteDec
call Crlf
mov r15,8
    print_args:
    
    push rdi
    push rsi
    
    
    
    add rsi,r15

    
    sub rsp,8
    
    mov rdi,[rsi]
    
    mov rax,rsi
    call WriteInt
    call Crlf


    call puts
    
    add rsp,8


    pop rsi
    
    pop rdi
    

    ;counter
    
    
    

    cmp rcx,1
    je exit
    dec rcx
    add r15,8
    jmp print_args
    
    exit:
    ret


section .data

blankLine: db ' ',0,0ah