;Author Brian Huang
;Date 2/8/23
;Purpose Lab 3


%include "CPsub64.inc"											;access to functions written for this course

global main	

section .text

main:

;first call to create blank line
mov rax,1												;setting up syscall to write/display the message
mov rdi,1												;point to the buffer where syscall places message data
mov rsi, linebreak											;the address of the data
mov rdx, linebreakLength										;how much data to move
syscall													;execute

;second call to print message
mov rax, 1												;setting up syscall to write/display the message
mov rdi, 1 												;point to the buffer where syscall places message data
mov rsi, message											;the address of the data
mov rdx, messageLength											;how much data to move
syscall													;execute

;final call to print another blank line
mov rax,1												;setting up syscall to write/display the message
mov rdi,1												;point to the buffer where syscall places message data
mov rsi, linebreak											;the address of the data
mov rdx, linebreakLength										;how much data to move
syscall													;execute

;exit the program
mov rax, 60												;setting up syscall to exit
xor rdi, rdi 												;zero out
syscall 												;perform exit


section .data
message: db "Today I have conquered my first Assembly program",0ah, "I can now do anything!"		;Create message variable
messageLength: equ($-message)										;Get the Length of the message
linebreak: db " ",0ah											;Create the variable for linebreak
linebreakLength: equ($-linebreak)									;Get the Length of the line break variable