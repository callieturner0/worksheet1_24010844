%include "asm_io.inc"

segment .data
    array_size equ 100

segment .bss
    numbers resd 100
    total resd 1
    counter resd 1

segment .text
    global asm_main

asm_main:
    enter 0, 0
    pusha

    ; Initialise the first number
    mov dword [counter], 0
    mov dword [total], 0

    ; Fill the array with numbers 1 to 100
fill_array:
    mov eax, [counter]
    inc eax

    mov ebx, [counter]
    mov [numbers + ebx*4], eax

    inc dword [counter]

    cmp dword [counter], array_size
    jl fill_array

    ; Reset the counter before calculating the sum
    mov dword [counter], 0

    ; Add all array elements together
sum_array:
    mov ebx, [counter]
    mov eax, [numbers + ebx*4]
    add [total], eax

    inc dword [counter]

    cmp dword [counter], array_size
    jl sum_array

    ; Display the total
    mov eax, [total]
    call print_int
    call print_nl

    popa
    mov eax, 0
    leave
    ret