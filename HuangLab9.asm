;Brian Huang
;4/13/23
;Lab 9

%include "CPsub64.inc"
%include "Macros_CPsub64.inc"
extern puts
global main

section .text

main:

;get the number of arguments
mov rcx,rdi
mov r14,rdi
dec r14
mov rax,rcx


;check if there are zero arguments
cmp r14,0
jne notZero
mov rdx,noArgs
call WriteString
call Crlf
jmp exit

notZero:
call WriteDec
call Crlf
mov r15,8
    print_args:;loop through each argument
    

    ;get arguments & print
    push rdi
    push rsi
    add rsi,r15
    sub rsp,8
    mov rdi,[rsi]
    call puts
    add rsp,8
    pop rsi
    pop rdi

   
    ;check if loop has looped enough times
    cmp r14,1
    je exit
    dec r14
    
    add r15,8
    jmp print_args
    
    exit:
    mov rdx,programCompleted
    call WriteString
    call Crlf
    ret


section .data
noArgs: db "There are no arguments",0,0ah
programCompleted: db "The program is completed",0,0ah
