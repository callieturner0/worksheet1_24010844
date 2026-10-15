%include "asm_io.inc"     ; Include functions for input and output

segment .data
    ; Messages displayed to the user
    msg1 db "Enter the first number: ", 0
    msg5 db "Enter the second number: ", 0
    msg2 db "The sum of ", 0
    msg3 db " and ", 0
    msg4 db " is: ", 0

segment .bss
    ; Reserve space for the two numbers and their sum
    integer1 resd 1
    integer2 resd 1
    result   resd 1

segment .text
    global asm_main

asm_main:
    enter 0, 0
    pusha                   ; Save the CPU registers

    ; Ask the user for the first number
    mov eax, msg1
    call print_string
    call read_int
    mov [integer1], eax     ; Store the first number

    ; Ask the user for the second number
    mov eax, msg5
    call print_string
    call read_int
    mov [integer2], eax     ; Store the second number

    ; Add the two numbers together
    mov eax, [integer1]
    add eax, [integer2]
    mov [result], eax       ; Store the sum

    ; Display the calculation
    mov eax, msg2
    call print_string

    mov eax, [integer1]
    call print_int

    mov eax, msg3
    call print_string

    mov eax, [integer2]
    call print_int

    mov eax, msg4
    call print_string

    mov eax, [result]
    call print_int          ; Display the sum
    call print_nl           ; Start a new line

    popa                    ; Restore the saved registers
    mov eax, 0              ; Return status indicating success
    leave
    ret                     ; Return to the C driver