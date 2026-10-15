%include "asm_io.inc"

segment .data
    name_msg db "What is your name? ", 0
    number_msg db "How many times should I print the welcome message? ", 0
    welcome_msg db "Welcome, ", 0
    error_msg db "Error: Number must be greater than 50 and less than 100.", 0

segment .bss
    user_name resb 100
    user_number resd 1
    counter resd 1

segment .text
    global asm_main

asm_main:
    enter 0, 0
    pusha

    ; Ask for the user's name
    mov eax, name_msg
    call print_string

    ; Read and store the name
    mov edi, user_name
    mov ecx, 99

read_name:
    call read_char
    cmp al, 10
    je name_finished
    cmp al, 13
    je name_finished
    mov [edi], al
    inc edi
    loop read_name

name_finished:
    mov byte [edi], 0

    ; Ask how many times to print the welcome message
    mov eax, number_msg
    call print_string
    call read_int
    mov [user_number], eax

    ; Check that the number is greater than 50
    cmp eax, 50
    jle show_error

    ; Check that the number is less than 100
    cmp eax, 100
    jge show_error

    ; Start the counter at zero
    mov dword [counter], 0

welcome_loop:
    mov eax, welcome_msg
    call print_string

    mov eax, user_name
    call print_string
    call print_nl

    inc dword [counter]

    mov eax, [counter]
    cmp eax, [user_number]
    jl welcome_loop

    jmp finished

show_error:
    mov eax, error_msg
    call print_string
    call print_nl

finished:
    popa
    mov eax, 0
    leave
    ret