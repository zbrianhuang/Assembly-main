;Brian Huang
;4/19/23
;Lab 10

%include "CPsub64.inc"
%include "Macros_CPsub64.inc"

%macro print_exp 6
mov rdx,%1
call WriteString
mov rax,%2
call WriteDec
mov rdx,%3
call WriteString
mov rax,%4
call WriteDec
mov rdx,%5
call WriteString
mov rax,%6
call WriteInt
%endmacro