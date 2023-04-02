;Brian Huang
;3/30/23
;Lab 7

%include "CPsub64.inc"
%include "Macros_CPsub64.inc"
global main

section .text

main:
;print msg 1 and get input and save
mov rdx, msg1
call WriteString
call Crlf
mov rdx,userInput1
mov rcx,255
call ReadString

mov r15,[userInput1]

;print msg 2, get input and save
mov rdx, msg2
call WriteString
call Crlf
mov rdx,userInput2
mov rcx,255
call ReadString


;check if strings are equal
mov rsi, userInput1
mov rdi, userInput2




mov rcx,255
cld
repe cmpsb

jne notEqual

mov rdx,equalstr
call WriteString
call Crlf
jmp finish

notEqual:

;get str length
    mov rsi, userInput1
    mov rdi, userInput2
    mov rdx,userInput1
    call StrLength
    mov r15,rax

    cld
    xor rdx,rdx
    mov rcx,r15
    cmpsb
    jne wrong;check if the strings are completely different
    mov rcx,r15;counter
    
    inc rdx;inc becacuse cmpsb was used
    inc rdx;inc to offset the fact that rdx starts at 0
    strLoop:;loop through each character
        
        cmpsb
        jne exitLoop
        inc rdx

        loop strLoop



    ;completely unequal
    wrong:
    mov rdx,notequalstr
    call WriteString
    call Crlf

    jmp finish

        

    exitLoop:
    mov r8,rdx
    mov rdx, almostequalstr
    mov rax,r8
    
    call WriteString 
    call WriteDec

    jmp finish
finish:
Exit


section .data
msg1: db 'Please enter the first string',0,0ah
msg2: db 'Please enter the second string',0,0ah
equalstr: db 'The two strings are exactly the same',0,0ah
notequalstr: db 'The two strings are completely different',0,0ah
almostequalstr: db 'The strings are equal until character #',0,0ah
section .bss
userInput1: resb 255
userInput2: resb 255