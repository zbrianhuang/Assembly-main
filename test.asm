;Brian Huang
;3/30/23
;Lab 7

%include "CPsub64.inc"
%include "Macros_CPsub64.inc"
global main

section .text

main:


strLoop:
        
        cmpsb
        jne exitLoop
        inc rdx

        loop strLoop
exitLoop:
mov rdx,rax
call DumpRegs
