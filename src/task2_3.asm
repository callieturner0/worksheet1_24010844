%include "asm_io.inc"

segment .data
    start_msg db "Enter the starting number (1-100): ", 0
    end_msg db "Enter the ending number (1-100): ", 0
    error_msg db "Error: Invalid range. Enter numbers from 1 to 100, with the start no greater than the end.", 0
    result_msg db "The sum is: ", 0

segment .bss
    numbers resd 100
    start_num resd 1
    end_num resd 1
    total resd 1
    counter resd 1

segment .text
    global asm_main

asm_main:
    enter 0, 0
    pusha

    ; Fill the array with numbers 1 to 100
    mov dword [counter], 0

fill_array:
    mov eax, [counter]
    inc eax

    mov ebx, [counter]
    mov [numbers + ebx*4], eax

    inc dword [counter]
    cmp dword [counter], 100
    jl fill_array

    ; Ask for the starting number
    mov eax, start_msg
    call print_string
    call read_int
    mov [start_num], eax

    ; Ask for the ending number
    mov eax, end_msg
    call print_string
    call read_int
    mov [end_num], eax

    ; Validate the starting number
    mov eax, [start_num]
    cmp eax, 1
    jl show_error
    cmp eax, 100
    jg show_error

    ; Validate the ending number
    mov eax, [end_num]
    cmp eax, 1
    jl show_error
    cmp eax, 100
    jg show_error

    ; Check that the starting number is not greater than the ending number
    mov eax, [start_num]
    cmp eax, [end_num]
    jg show_error

    ; Initialise the sum
    mov dword [total], 0

    ; Convert the starting number to a zero-based array index
    mov eax, [start_num]
    dec eax
    mov [counter], eax

sum_loop:
    ; Read the current array element
    mov ebx, [counter]
    mov eax, [numbers + ebx*4]

    ; Add it to the total
    add [total], eax

    ; Move to the next array element
    inc dword [counter]

    ; Stop after adding the ending number
    mov eax, [counter]
    cmp eax, [end_num]
    jl sum_loop

    ; Display the result
    mov eax, result_msg
    call print_string

    mov eax, [total]
    call print_int
    call print_nl

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