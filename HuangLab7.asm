section .data
    prompt1 db "Enter first string: ", 0
    prompt2 db "Enter second string: ", 0
    result1 db "The strings are exactly the same", 0
    result2 db "The strings are the same up to index %d", 0
    result3 db "The strings are completely different", 0
    
section .bss
    string1 resb 255
    string2 resb 255

section .text
global main

main:
    ; prompt user for first string
    mov rax, 0x2000004 ; write syscall
    mov rdi, 1 ; stdout
    mov rsi, prompt1
    mov rdx, 20 ; length of prompt
    syscall
    
    ; read first string from user
    mov rax, 0x2000003 ; read syscall
    mov rdi, 0 ; stdin
    mov rsi, string1
    mov rdx, 255 ; max length
    syscall
    
    ; prompt user for second string
    mov rax, 0x2000004 ; write syscall
    mov rdi, 1 ; stdout
    mov rsi, prompt2
    mov rdx, 21 ; length of prompt
    syscall
    
    ; read second string from user
    mov rax, 0x2000003 ; read syscall
    mov rdi, 0 ; stdin
    mov rsi, string2
    mov rdx, 255 ; max length
    syscall
    
    ; compare strings
    xor rdi, rdi ; clear rdi
    mov rsi, string1
    mov rdx, string2
    call strcmp ; use the strcmp function from CPsub64.inc
    
    ; display result to console
    cmp rax, 0 ; check if strings are equal
    je strings_equal ; jump if equal
    jne strings_not_equal ; jump if not equal

strings_equal:
    ; print result1 to console
    mov rax, 0x2000004 ; write syscall
    mov rdi, 1 ; stdout
    mov rsi, result1
    mov rdx, 28 ; length of result1
    syscall
    jmp exit_program

strings_not_equal:
    ; check if strings are the same up to a certain index
    xor rbx, rbx ; clear rbx
    xor rcx, rcx ; clear rcx
    loop_compare:
        mov al, byte [string1+rbx]
        cmp al, byte [string2+rbx]
        jne strings_completely_different ; jump if completely different
        cmp al, 0 ; check if end of string
        je strings_same_up_to_index ; jump if end of string
        inc rbx ; increment index
        jmp loop_compare
        
    strings_same_up_to_index:
        ; print result2 to console
        mov rax, 0x2000004 ; write syscall
        mov rdi, 1 ; stdout
        mov rsi, result2
        mov rdx, 35 ; length of result2
        syscall
        ; print index to console
        mov rax, 0x2000004 ; write syscall
        mov rdi, 1 ; stdout
        mov rsi, rbx
        mov rdx, 1 ; length of index
        call print_integer ; use the print_integer macro from Macros_CPsub64.inc
        jmp exit_program
        
   
