;Author Brian Huang
;Date 2/6/23
;Purpose in-class practice

%include "CPsub64.inc"		;access to functions written for this course

global _start 			;let the cpu know where the first instruction is

section .text			;where the source code belongs
_start: 				;label for the start of the program

;display a message
mov rax, 1			;setting up syscall to write/display the message
mov rdi, 1 			;point to the buffer where syscall places message data
mov rsi, message		;the address of the data
mov rdx, messageLength		;how much data to move
syscall				;execute

;add blank line for separation from text and cursor
mov rax, 1
mov rdi, 1
mov rsi, message
mov rdx, blankLength
syscall

;system exit
mov rax, 60			;setting up syscall to exit
xor rdi, rdi 			;zero out
syscall 			;perform exit


section .data
message: db 0ah,'Prof. Stoll is the greatest',0ah,0;	;double byte, string data
messageLength: equ($ - message) ;size of message
blankLine: db " ",0ah,0
blankLength: equ($-blankLine)