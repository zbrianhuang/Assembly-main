;Brian Huang

;3/27/23

;mov str



%include "CPsub64.inc"

%include "Macros_CPsub64.inc"



GLOBAL main



section .text

main:

    





    ;display data before the mov

    MOV RCX,7

    MOV RAX,RCX

    CALL WriteInt

    CALL Crlf



    ;MOV RDX, SOURCEDATA

    ;CALL WriteString

    ;CALL Crlf

    ;MOV RDX, DESTINATIONDATA

    ;CALL WriteString

    ;CALL Crlf


    ;MOVS

    ;MOV RSI, SOURCEDATA

    ;MOV RDI, DESTINATIONDATA

    ;REP MOVSW 

    ;CMPS EXAMPLE
    MOV RCX,-1 ;ASSUMING THAT THEY ARE NOT EQUAL
    MOV R8,LSD
    MOV R9,LDD
    CMP R8,R9
    JE NOTEQUAL
    jmp hi
    NOTEQUAL:
        ;IF EQUAL LENGTH THEN COMPARE CHARACTER BY CHARACTER
        MOV RSI, SOURCEDATA
        MOV RDI, DESTINATIONDATA
        MOV RCX, LSD ;LEN OF STRING
        CLD
        REPE CMPSB 
        CALL DumpRegs
        MOV RDX,EQUALMSG
        CALL WriteString
        CALL Crlf
        JMP RESULTT
    hi:
        MOV RDX, NEQUALMSG
        CALL WriteString
    RESULTT:

    
    ;SCAS EXAMPLE
    MOV RDX, SOURCEDATA
    CALL StrLength ;MOVES THE STRING LENGTH TO RAX
    MOV R8,RAX ;STORE LENGTH OF STRING
    ;FIND "B"
    MOV RCX, RAX
    XOR RAX,RAX
    MOV RAX,  'B'
    MOV RDI, SOURCEDATA
    CLD 
    REPNE SCASB ;REPEAT UNTIL NOT EQUAL ONE BYTE AT A TIME
    
    CALL DumpRegs


    

    ;stos example
    xor rax,rax
    mov rax,'z'
    mov rdi,SOURCEDATA
    mov rcx,r8;r8 = len of string
    cld
    rep stosb
    call DumpRegs

    ;DISPLAY AFTER THE MOVE



    MOV RAX,RCX

    CALL WriteInt

    CALL Crlf



    MOV RDX, SOURCEDATA

    CALL WriteString

    CALL Crlf

    MOV RDX, DESTINATIONDATA

    CALL WriteString

    CALL Crlf


    
    Exit





section .data

SOURCEDATA: DB "Brian Huang",0,0ah
LSD:EQU($-SOURCEDATA)
DESTINATIONDATA: DB "Brian Huang",0,0ah
LDD:EQU($-DESTINATIONDATA)
EQUALMSG: DB "THE STRINGS ARE EQUAL",0,0ah
NEQUALMSG: DB "THE STRINGS ARE NOT EQUAL",0,0ah
